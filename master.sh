#!/bin/bash 

# Login credentials are stored in credentials file so that this script can be pushed to github
username=$(grep username ./credentials | awk -F"'" '{print $2}')
password=$(grep password ./credentials | awk -F"'" '{print $2}')

# set dates here so I can edit them during testing
DAY=$(date +%d)
MONTH=$(date +%m)
YEAR=$(date +%Y)

YEAR=2017
# change to today - 1 test this!

#TODO
# handle holes in data
# 2 scripts: daily time critical & historical non time critical

## This only works for old data... (non time-critical)

# line from Andrea to download data
# arguments are documented in EUMetsat's docs
###./dhusget.sh -u $username -p $password -m Sentinel-3 -i OLCI -c -129,52.6:-123.7,48.5 -l 100 -N 5 -o product -F filename:S3A_OL_1*EFR*NT* -S

###unzip "./L1/$YEAR/$MONTH/$DAY/*" -d ./L1/$YEAR/$MONTH/$DAY

mkdir ./L2/$YEAR/$MONTH/$DAY -p

source activate auto-olci

python polymer48/run_polymer.py ./L1/$YEAR/$MONTH/$DAY/ ./L2/$YEAR/$MONTH/$DAY/
