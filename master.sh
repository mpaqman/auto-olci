#!/bin/bash 

# Login credentials are stored in credentials file so that this script can be pushed to github
username=$(grep username ./credentials | awk -F"'" '{print $2}')
password=$(grep password ./credentials | awk -F"'" '{print $2}')

# $CMD_PATH'/'$ROOT_CMD $OPTIONS -S $YEAR'-'$MONTH'-'$DAY'T00:00:00.000Z' -E $YEAR'-'$MONTH'-'$DAY'T23:59:59.000Z' -O $OUT_DIR -Z $prod
 ./echo_args.sh -u $username -p $password -m Sentinel-3 -i OLCI -c -129,52.6:-123.7,48.5 -l 100 -N 5 -o product -F filename:S3A_OL_1*WFR*NT* -S `date +%Y-%m-%d`T00:00:00.000Z -E -S `date +%Y-%m-%d`T23:59:59.000Z -O ./L1/`date +%Y/%m/%d`

#get_data_CODA_merrick output: -u mpaqman -p eyeInTheSky1998 -i OLCI -c -125,47:-123,52 -n 1 -l 100 -N 5 -o product -F filename:S3A_OL_1*EFR*NT* -S 2016-07-02T00:00:00.000Z -E 2016-07-02T23:59:59.000Z -O /home/spectral/Documents/auto-olchi/downloaded/OLCI/2016/07/02/ -Z All
