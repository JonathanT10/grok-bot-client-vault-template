#!/usr/bin/env bash
# time-savings-summary.sh: total net minutes saved from the time-savings log, honoring the
# rules in Reference/Time savings log.md. Read only; never edits the log.
#
# Usage: scripts/time-savings-summary.sh [--root DIR] [--from YYYY-MM-DD] [--to YYYY-MM-DD] [LOG.csv]
#   LOG.csv   default: "Reports/Time savings log.csv" under the vault root
#   --root    vault root that evidence_path is relative to (default: the repo root)
#   --from/--to  inclusive date range on the date column
#
# Rules: net = baseline_min - bot_run_min - review_min.
#   Excluded from totals (and listed with the reason): rows whose evidence_path is empty or does not
#   exist under the root; rows with do_not_sum = yes (overlaps another row); a repeated run_id;
#   rows with a bad date, a non-numeric minute value, or a baseline_source other than
#   "measured", "owner estimate", or "bot estimate".
#   Measured and estimated minutes are totalled separately; the grand total says how many
#   estimated rows it includes.
# CSV: one row per line, comma separated; quote a field with double quotes if it has a comma.
# Exit: 0 ok, 2 usage or file error.
set -euo pipefail
root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
from=""; to=""; log=""
die() { echo "time-savings-summary: $*" >&2; exit 2; }
while [[ $# -gt 0 ]]; do
  case "$1" in
    --root) root="${2:?--root needs a DIR}"; shift 2 ;;
    --from) from="${2:?--from needs a date}"; shift 2 ;;
    --to) to="${2:?--to needs a date}"; shift 2 ;;
    -h|--help) sed -n '2,/^set -euo/p' "${BASH_SOURCE[0]}" | sed '$d' | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) die "unknown option: $1" ;;
    *) log="$1"; shift ;;
  esac
done
[[ -d "$root" ]] || die "root is not a directory: $root"
[[ -z "$log" ]] && log="$root/Reports/Time savings log.csv"
[[ -f "$log" ]] || die "no log file: $log"
for d in "$from" "$to"; do [[ -z "$d" || "$d" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]] || die "bad date: $d"; done
expected='date,bot,task,run_id,baseline_min,baseline_source,bot_run_min,review_min,evidence_path,notes,do_not_sum'
header="$(head -1 "$log" | tr -d '\r')"
[[ "$header" == "$expected" ]] || die "unexpected header in $log (want: $expected)"

# Pass 1 (awk): parse and classify each row; emit fields separated by \x1f: line status reason date bot source net evidence
tail -n +2 "$log" | tr -d '\r' | awk -v from="$from" -v to="$to" '
function parse(s, a,   n, i, c, f, q) {
  n = 1; f = ""; q = 0
  for (i = 1; i <= length(s); i++) {
    c = substr(s, i, 1)
    if (q) { if (c == "\"") { if (substr(s, i+1, 1) == "\"") { f = f "\""; i++ } else q = 0 } else f = f c }
    else if (c == "\"") q = 1
    else if (c == ",") { a[n++] = f; f = "" }
    else f = f c
  }
  a[n] = f; return n
}
function num(x) { return x ~ /^[0-9]+(\.[0-9]+)?$/ }
{
  line = NR + 1
  if ($0 ~ /^[[:space:]]*$/) next
  delete a; n = parse($0, a)
  for (i = n + 1; i <= 11; i++) a[i] = ""
  d = a[1]; bot = a[2]; run = a[4]; b = a[5]; src = tolower(a[6]); r = a[7]; v = a[8]; ev = a[9]; dns = tolower(a[11])
  if (from != "" && d < from) next
  if (to != "" && d > to) next
  st = "ok"; why = ""
  if (n != 11) { st = "bad"; why = "expected 11 fields, got " n }
  else if (d !~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$/) { st = "bad"; why = "bad date" }
  else if (!num(b) || !num(r) || !num(v)) { st = "bad"; why = "minutes not numeric" }
  else if (src != "measured" && src != "owner estimate" && src != "bot estimate") { st = "bad"; why = "baseline_source not measured / owner estimate / bot estimate" }
  else if (run != "" && (run in seen)) { st = "excluded"; why = "duplicate run_id (first on line " seen[run] ")" }
  else if (dns == "yes") { st = "excluded"; why = "do_not_sum (overlap)" }
  if (run != "" && !(run in seen)) seen[run] = line
  net = (st == "bad") ? 0 : b - r - v
  printf "%d\037%s\037%s\037%s\037%s\037%s\037%s\037%s\n", line, st, why, d, bot, src, net, ev
}' > "${TMPDIR:-/tmp}/tss.$$"
trap 'rm -f "${TMPDIR:-/tmp}/tss.$$"' EXIT

# Pass 2 (bash): evidence must exist under the root; then total.
declare -A by_bot=()
measured=0; estimated=0; n_meas=0; n_est=0; n_ex=0; excluded_lines=()
while IFS=$'\x1f' read -r line st why d bot src net ev; do
  if [[ "$st" == ok ]]; then
    if [[ -z "$ev" ]]; then st=excluded; why="no evidence_path"
    elif [[ ! -e "$root/$ev" ]]; then st=excluded; why="evidence not found: $ev"; fi
  fi
  if [[ "$st" != ok ]]; then
    n_ex=$((n_ex+1)); excluded_lines+=("  line $line ($d, ${bot:-no bot}): $st, $why"); continue
  fi
  if [[ "$src" == measured ]]; then measured=$(awk -v a="$measured" -v b="$net" 'BEGIN{print a+b}'); n_meas=$((n_meas+1))
  else estimated=$(awk -v a="$estimated" -v b="$net" 'BEGIN{print a+b}'); n_est=$((n_est+1)); fi
  by_bot[$bot]=$(awk -v a="${by_bot[$bot]:-0}" -v b="$net" 'BEGIN{print a+b}')
done < "${TMPDIR:-/tmp}/tss.$$"

h() { awk -v m="$1" 'BEGIN{printf "%.1f h", m/60}'; }
total=$(awk -v a="$measured" -v b="$estimated" 'BEGIN{print a+b}')
echo "Time-savings summary: $log"
[[ -n "$from$to" ]] && echo "Range: ${from:-start} to ${to:-end}"
echo "Measured net:  $measured min ($(h "$measured")) from $n_meas row(s)"
echo "Estimated net: $estimated min ($(h "$estimated")) from $n_est row(s) (labelled estimate)"
echo "Total net:     $total min ($(h "$total")), includes $n_est estimated row(s)"
if [[ ${#by_bot[@]} -gt 0 ]]; then
  echo "By bot:"
  while IFS= read -r b; do echo "  $b: ${by_bot[$b]} min"; done < <(printf '%s\n' "${!by_bot[@]}" | sort)
fi
echo "Excluded from totals: $n_ex row(s)"
for l in "${excluded_lines[@]}"; do echo "$l"; done
exit 0
