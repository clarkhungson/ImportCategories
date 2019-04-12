set -e
# put uid file in working_dir
working_dir="/home/thson/import-categories/"

# inputs
cookie="cookie_30days.csv"
category=16071
start_date=20190409
end_date=20190430
# ----------

uid_dir=$working_dir"uid/"$cookie"/"
log_dir=$working_dir"log/"$cookie"/"
mkdir $uid_dir
mkdir $log_dir
#cat $cookie | tr -d $'\r' > $cookie
cp $cookie $uid_dir

cd $uid_dir
split -n 9 $cookie
cd $working_dir

files=$(ls $uid_dir | grep "xa")
for file in $files;
do
   ./upload_cats.sh $uid_dir$file $category $start_date $end_date > $log_dir$file.log &
done
wait

echo "Finish!"

