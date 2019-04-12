set -e
last_cookie=""
cat_id=$2
start_date=$3
end_date=$4
for uid in `cat $1`
do
  curl -s "http://ads10v.itim.vn:9097/add/?start_date=$start_date&end_date=$end_date&cookie=$uid&visits_per_day=100&category=$cat_id"
done
echo "processed"

