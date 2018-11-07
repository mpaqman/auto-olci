#!/bin/bash 

# Login credentials are stored in extrenal credentials file so that this script can be pushed to github
username=$(grep username ./credentials | awk -F"'" '{print $2}')
password=$(grep password ./credentials | awk -F"'" '{print $2}')

# Start and end in the following format: 'YYYY-MM-DD'
DATE_START='2017-07-24'
DATE_END='2017-07-24'

# Coordinates as 'lon1,lat1:lon2,lat2'. E.g. COORDS='-139,47:-121.5,59.5'
COORDS='-139,47:-121.5,59.5'

# DATE_ITER iterates through the dates
DATE_ROLL=$DATE_START

while [ "$(date -d "$DATE_ROLL" +%Y%m%d)" -le "$(date -d "$DATE_END" +%Y%m%d)" ]; do
	# set YEAR, MONTH & DAY based off DATE_ROLL
	YEAR=$(date -d "$DATE_ROLL" '+%Y')
	MONTH=$(date -d "$DATE_ROLL" '+%m')
	DAY=$(date -d "$DATE_ROLL" '+%d')

	# we want level 1 radiances at full resolution (EFR)
	# arguments are documented in EUMetsat's docs
	./dhusget.sh -u $username -p $password -m Sentinel-3 -i OLCI -c $COORDS -l 100 -N 5 -o 'product' -F filename:S3A_OL_1*EFR*NT* -O ./files/$YEAR/$MONTH/$DAY -S $YEAR'-'$MONTH'-'$DAY'T00:00:00.000Z' -E $YEAR'-'$MONTH'-'$DAY'T23:59:59.000Z'

	unzip "./files/$YEAR/$MONTH/$DAY/*" -d ./files/$YEAR/$MONTH/$DAY

	source activate poly3

	python run_polymer.py ./files/$YEAR/$MONTH/$DAY/

	# Move forward one day
	DATE_ROLL=$(date -d "$DATE_ROLL + 1 day")
done
