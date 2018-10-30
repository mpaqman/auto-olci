#!/usr/bin/env python

import sys
import time
from polymer.main import run_atm_corr, Level1, Level2
from polymer.level2 import default_datasets
from glob import glob

YEAR = sys.argsv[1]
MONTH = sys.argsv[2]
DAY = sys.argsv[3]


#tic=time.clock()


#for filename in glob('/home/spectral/Documents/merrick/from_fernanda/downloaded/L1/S3A*.SEN3'):
#    run_atm_corr(Level1(filename), Level2(outdir='/home/spectral/Documents/merrick/from_fernanda/downloaded/L2_polymer/',  # level2 filename determined from #level1 name, if outdir is not provided it will go to the same folder as level1
#                        fmt='netcdf4', datasets=default_datasets+['SPM']),
#                 multiprocessing=-1)

#toc=time.clock()
#print('Processing time: (seconds)')
#print(toc-tic)
print("all good")
