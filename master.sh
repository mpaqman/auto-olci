#!/bin/bash 

# Login credentials are stored in credentials file so that this script can be pushed to github
username=$(grep username ./credentials | awk -F"'" '{print $2}')
password=$(grep password ./credentials | awk -F"'" '{print $2}')

# set dates here so I can edit them during testing
DAY=$(date +%d)
MONTH=$(date +%m)
YEAR=$(date +%Y)

YEAR=2017

## This only works for old data... (non time-critical)

# line from Andrea to download data
#$CMD_PATH'/'$ROOT_CMD $OPTIONS -S $YEAR'-'$MONTH'-'$DAY'T00:00:00.000Z' -E $YEAR'-'$MONTH'-'$DAY'T23:59:59.000Z' -O $OUT_DIR -Z $prod
###./dhusget.sh -u $username -p $password -m Sentinel-3 -i OLCI -c -129,52.6:-123.7,48.5 -l 100 -N 5 -o product -F filename:S3A_OL_1*EFR*NT* -S $YEAR"-"$MONTH"-"$DAY'T00:00:00.000Z' -E $YEAR'-'$MONTH'-'$DAY'T23:59:59.000Z' -O ./L1/$YEAR/$MONTH/$DAY

###unzip "./L1/$YEAR/$MONTH/$DAY/*" -d ./L1/$YEAR/$MONTH/$DAY

source activate auto-olci

#python run_polymer.py $YEAR $MONTH $DAY
