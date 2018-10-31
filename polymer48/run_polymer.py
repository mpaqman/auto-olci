#!/usr/bin/env python
# must be in the directory polymer is installed in

import sys
import time
import os
from polymer.main import run_atm_corr, Level1, Level2
from polymer.level2 import default_datasets
from glob import glob

INDIR = sys.argv[1]
OUTDIR = sys.argv[2]

print(INDIR)

tic=time.clock()

for filename in glob(INDIR + 'S3A*.SEN3'):
	# level2 filename determined from level1 name, if outdir is not provided it will go to the same folder as level1
#	run_atm_corr(Level1(filename), Level2(outdir=OUTDIR, 
#		fmt='netcdf4', datasets=default_datasets+['SPM']),
#		multiprocessing=-1)
	print(filename)

toc=time.clock()
print('Processing time: (seconds)')
print(toc-tic)
print("all good")
