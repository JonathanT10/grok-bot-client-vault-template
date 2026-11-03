#!/usr/bin/env bash
# check-no-client-data.sh: scan the generic template for client or real-world data
# that must never be committed (names, places, vendors, emails, phones, IPs, tokens).
#
# Run it before every commit and push, and again on every client copy you build.
#
# Usage: scripts/check-no-client-data.sh [options]
#   --denylist PATH     Denylist file (default: scripts/denylist.txt, or env DENYLIST_FILE).
#                       One term per line; '#' comments and blank lines are ignored.
#                         Term              case-insensitive whole-word match
#                         substr:Term       case-insensitive substring match
#                         re:REGEX          case-insensitive extended regex (keep to the
#                                           subset shared by grep -E, rg and git grep)
#   --path DIR          Directory to scan (default: the repo root).
#   --history           Also scan every commit's content (all refs) and every commit message.
#   --include-pdf DIR   Also scan the text of PDFs under DIR (needs pdftotext). Repeatable.
#   --no-patterns       Skip the built-in pattern checks (emails, phones, IPv4, tokens).
#   -h, --help          Show this help.
#
# Built-in pattern checks (allowed values in brackets):
#   email  [example.com / example.org / example.net and their subdomains; .example .test
#           .invalid .localhost domains]
#   phone  [555-0100..555-0199 fictional range; all-zero (000) 000-0000 placeholders]
#   ipv4   [192.0.2.x, 198.51.100.x, 203.0.113.x documentation ranges; 127.0.0.1; 0.0.0.0]
#   token  [none: sk-..., sk_live_..., ghp_/gho_/ghs_/ghu_/ghr_..., github_pat_..., xox?-...,
#           AKIA..., AIza..., PEM private key headers]
#
# Skipped: .git/, the denylist files (denylist.txt, denylist.example.txt, the --denylist file),
# this script itself, and binary files. Ignored-by-git files ARE scanned in the working tree.
#
# The real denylist holds real names, so it lives only on the provider's machine and is
# git-ignored. Never commit it. See scripts/denylist.example.txt for the format.
#
# Output: one "location:line: [kind] detail" line per finding, then a summary.
# Exit: 0 clean, 1 findings, 2 usage or setup error. Needs bash 4+; uses rg if present, else grep.
set -uo pipefail

if [[ -z "${BASH_VERSINFO:-}" || "${BASH_VERSINFO[0]}" -lt 4 ]]; then
  echo "check-no-client-data: bash 4+ required" >&2; exit 2
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
self_name="$(basename "${BASH_SOURCE[0]}")"

usage() { sed -n '2,/^set -uo/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'; }
die_usage() { echo "check-no-client-data: $*" >&2; echo "Try --help." >&2; exit 2; }

denylist="${DENYLIST_FILE:-}"
denylist_explicit=0; [[ -n "$denylist" ]] && denylist_explicit=1
scan_path="$repo_root"
do_history=0
do_patterns=1
pdf_dirs=()

while [[ $# -gt 0 ]]; do
  case "$1" in
    --denylist) [[ $# -ge 2 ]] || die_usage "--denylist needs a PATH"; denylist="$2"; denylist_explicit=1; shift 2 ;;
    --denylist=*) denylist="${1#*=}"; denylist_explicit=1; shift ;;
    --path) [[ $# -ge 2 ]] || die_usage "--path needs a DIR"; scan_path="$2"; shift 2 ;;
    --path=*) scan_path="${1#*=}"; shift ;;
    --history) do_history=1; shift ;;
    --include-pdf) [[ $# -ge 2 ]] || die_usage "--include-pdf needs a DIR"; pdf_dirs+=("$2"); shift 2 ;;
    --include-pdf=*) pdf_dirs+=("${1#*=}"); shift ;;
    --no-patterns) do_patterns=0; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die_usage "unknown option: $1" ;;
  esac
done

[[ -d "$scan_path" ]] || die_usage "--path is not a directory: $scan_path"
scan_path="$(cd "$scan_path" && pwd)"
[[ -z "$denylist" ]] && denylist="$script_dir/denylist.txt"
if [[ ! -f "$denylist" ]]; then
  if [[ $denylist_explicit -eq 1 ]]; then die_usage "denylist not found: $denylist"; fi
  echo "note: no denylist at $denylist; running pattern checks only (copy scripts/denylist.example.txt to start one)." >&2
  denylist=""
fi
for d in "${pdf_dirs[@]}"; do [[ -d "$d" ]] || die_usage "--include-pdf is not a directory: $d"; done
if [[ $do_history -eq 1 ]] && ! git -C "$scan_path" rev-parse --git-dir >/dev/null 2>&1; then
  die_usage "--history needs a git repo at $scan_path"
fi

use_rg=0; command -v rg >/dev/null 2>&1 && use_rg=1
tmp="$(mktemp -d "${TMPDIR:-/tmp}/check-no-client-data.XXXXXX")"
trap 'rm -rf "$tmp"' EXIT

# Files never scanned (basenames), plus the custom denylist if one was given.
skip_names=("denylist.txt" "denylist.example.txt" "$self_name")
[[ -n "$denylist" ]] && skip_names+=("$(basename "$denylist")")

# ---------------------------------------------------------------- rules
# Each rule: kind<TAB>mode<TAB>case<TAB>pattern<TAB>label
#   mode: word | fixed | regex     case: i (insensitive) | s (sensitive)
rules=()
if [[ -n "$denylist" ]]; then
  while IFS= read -r raw || [[ -n "$raw" ]]; do
    line="${raw%$'\r'}"
    line="${line#"${line%%[![:space:]]*}"}"; line="${line%"${line##*[![:space:]]}"}"
    [[ -z "$line" || "$line" == \#* ]] && continue
    case "$line" in
      substr:*) t="${line#substr:}"; [[ -n "$t" ]] && rules+=("denylist"$'\t'"fixed"$'\t'"i"$'\t'"$t"$'\t'"substr \"$t\"") ;;
      re:*)     t="${line#re:}";     [[ -n "$t" ]] && rules+=("denylist"$'\t'"regex"$'\t'"i"$'\t'"$t"$'\t'"re /$t/") ;;
      *)        rules+=("denylist"$'\t'"word"$'\t'"i"$'\t'"$line"$'\t'"\"$line\"") ;;
    esac
  done < "$denylist"
fi
n_terms=${#rules[@]}
if [[ $do_patterns -eq 1 ]]; then
  rules+=("email"$'\t'"regex"$'\t'"i"$'\t''[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}'$'\t'"email")
  rules+=("phone"$'\t'"regex"$'\t'"s"$'\t''(\+?1[ .-])?(\([0-9]{3}\) ?|\b[0-9]{3}[ .-])[0-9]{3}[ .-][0-9]{4}\b'$'\t'"phone")
  rules+=("phone"$'\t'"regex"$'\t'"s"$'\t''\+[0-9]{1,3}[ .-][0-9]{2,4}([ .-][0-9]{2,4}){2,4}\b'$'\t'"phone (intl)")
  rules+=("ipv4"$'\t'"regex"$'\t'"s"$'\t''\b([0-9]{1,3}\.){3}[0-9]{1,3}\b'$'\t'"ipv4")
  rules+=("token"$'\t'"regex"$'\t'"s"$'\t''\b(sk-[A-Za-z0-9_-]{16,}|sk_(live|test)_[A-Za-z0-9]{16,}|gh[pousr]_[A-Za-z0-9]{20,}|github_pat_[A-Za-z0-9_]{20,}|xox[abposr]-[A-Za-z0-9-]{10,}|AKIA[0-9A-Z]{16}|AIza[0-9A-Za-z_-]{35})'$'\t'"token")
  rules+=("token"$'\t'"regex"$'\t'"s"$'\t''-----BEGIN [A-Z ]*PRIVATE KEY-----'$'\t'"private key")
fi
[[ ${#rules[@]} -gt 0 ]] || { echo "check-no-client-data: nothing to check (no denylist and --no-patterns)" >&2; exit 2; }

# ---------------------------------------------------------------- allowlists
allowed() {  # kind match -> 0 if the match is a legitimate placeholder value
  local kind="$1" m="$2" lc
  lc="${m,,}"
  case "$kind" in
    email)
      local dom="${lc##*@}"
      [[ "$dom" =~ (^|\.)example\.(com|org|net)$ || "$dom" =~ \.(example|test|invalid|localhost)$ ]] && return 0 ;;
    phone)
      local digits="${m//[^0-9]/}"
      [[ "$digits" =~ ^0+$ ]] && return 0
      [[ "$digits" =~ 55501[0-9]{2}$ ]] && return 0 ;;
    ipv4)
      local IFS=. o; for o in $m; do (( 10#$o > 255 )) && return 0; done   # not an IP (version string etc.)
      [[ "$m" =~ ^(192\.0\.2|198\.51\.100|203\.0\.113)\. || "$m" == "127.0.0.1" || "$m" == "0.0.0.0" ]] && return 0 ;;
  esac
  return 1
}

# ---------------------------------------------------------------- searchers
# All searchers print "location:line:match".
search_dir() {  # dir mode case pattern
  local dir="$1" mode="$2" cs="$3" pat="$4" f=()
  [[ "$cs" == i ]] && f+=(-i)
  case "$mode" in word) f+=(-F -w) ;; fixed) f+=(-F) ;; esac
  if [[ $use_rg -eq 1 ]]; then
    local g=(-g '!.git'); local n; for n in "${skip_names[@]}"; do g+=(-g "!$n"); done
    (cd "$dir" && rg --no-config --hidden --no-ignore -n -o --no-heading --with-filename "${g[@]}" "${f[@]}" -e "$pat" . 2>/dev/null) | sed 's#^\./##'
  else
    [[ "$mode" == regex ]] && f+=(-E)
    local x=(--exclude-dir=.git); local n; for n in "${skip_names[@]}"; do x+=("--exclude=$n"); done
    (cd "$dir" && grep -rnoIH "${x[@]}" "${f[@]}" -e "$pat" . 2>/dev/null) | sed 's#^\./##'
  fi
}

search_history() {  # mode case pattern -> "rev:path:line:match"
  local mode="$1" cs="$2" pat="$3" f=(-n -I -o --no-color)
  [[ "$cs" == i ]] && f+=(-i)
  case "$mode" in word) f+=(-F -w) ;; fixed) f+=(-F) ;; regex) f+=(-E) ;; esac
  local ps=(-- .); local n; for n in "${skip_names[@]}"; do ps+=(":(exclude,glob)**/$n"); done
  git -C "$git_top" grep "${f[@]}" -e "$pat" "${revs[@]}" "${ps[@]}" 2>/dev/null
}

declare -A seen=()
findings=()
add_finding() {  # key line
  [[ -n "${seen[$1]:-}" ]] && return
  seen[$1]=1; findings+=("$2")
}

run_rules_on_dir() {  # dir prefix
  local dir="$1" prefix="$2" r kind mode cs pat label l file rest ln m
  for r in "${rules[@]}"; do
    IFS=$'\t' read -r kind mode cs pat label <<<"$r"
    while IFS= read -r l; do
      [[ -z "$l" ]] && continue
      file="${l%%:*}"; rest="${l#*:}"; ln="${rest%%:*}"; m="${rest#*:}"
      [[ "$kind" != denylist ]] && allowed "$kind" "$m" && continue
      add_finding "$prefix$file:$ln:$kind:$label:${m,,}" "$prefix$file:$ln: [$kind] $label (matched: $m)"
    done < <(search_dir "$dir" "$mode" "$cs" "$pat")
  done
}

# ---------------------------------------------------------------- scans
scanned=("working tree: $scan_path")
run_rules_on_dir "$scan_path" ""

if [[ $do_history -eq 1 ]]; then
  git_top="$(git -C "$scan_path" rev-parse --show-toplevel)"
  mapfile -t revs < <(git -C "$git_top" rev-list --all)
  scanned+=("history: ${#revs[@]} commits (content and messages)")
  if [[ ${#revs[@]} -gt 0 ]]; then
    for r in "${rules[@]}"; do
      IFS=$'\t' read -r kind mode cs pat label <<<"$r"
      while IFS= read -r l; do
        [[ -z "$l" ]] && continue
        rev="${l%%:*}"; rest="${l#*:}"; file="${rest%%:*}"; rest="${rest#*:}"; ln="${rest%%:*}"; m="${rest#*:}"
        [[ "$kind" != denylist ]] && allowed "$kind" "$m" && continue
        # One finding per path/line/match, reported at the first (newest) commit that has it.
        add_finding "hist:$file:$ln:$kind:$label:${m,,}" "history ${rev:0:7}:$file:$ln: [$kind] $label (matched: $m)"
      done < <(search_history "$mode" "$cs" "$pat")
    done
    mkdir -p "$tmp/msgs"
    for rev in "${revs[@]}"; do git -C "$git_top" log -1 --format=%B "$rev" > "$tmp/msgs/${rev:0:7}"; done
    run_rules_on_dir "$tmp/msgs" "commit-message "
  fi
fi

if [[ ${#pdf_dirs[@]} -gt 0 ]]; then
  if ! command -v pdftotext >/dev/null 2>&1; then
    echo "warning: pdftotext not found (install poppler-utils); PDFs not scanned." >&2
  else
    for d in "${pdf_dirs[@]}"; do
      d="$(cd "$d" && pwd)"; out="$tmp/pdf$RANDOM"; mkdir -p "$out"; count=0
      while IFS= read -r -d '' p; do
        rel="${p#"$d"/}"; mkdir -p "$out/$(dirname "$rel")"
        pdftotext -layout "$p" "$out/$rel" 2>/dev/null && count=$((count+1))
      done < <(find "$d" -type f -iname '*.pdf' -print0)
      scanned+=("pdf text: $count PDF(s) in $d")
      run_rules_on_dir "$out" "pdf $d/"
    done
  fi
fi

# ---------------------------------------------------------------- report
for f in "${findings[@]}"; do echo "$f"; done
echo "----"
for s in "${scanned[@]}"; do echo "scanned $s"; done
echo "denylist: ${denylist:-none} ($n_terms term(s)); pattern checks: $([[ $do_patterns -eq 1 ]] && echo on || echo off); search tool: $([[ $use_rg -eq 1 ]] && echo rg || echo grep)"
if [[ ${#findings[@]} -eq 0 ]]; then
  echo "OK: no client data found."
  exit 0
fi
echo "FOUND: ${#findings[@]} finding(s). Remove them before committing or shipping."
exit 1
