#!/bin/bash
#$ -V
#$ -l h_rt=48:00:00
#$ -N delete
#$ -j y

### This is a script to remove unnecessary log files from the logs folder or
# the Class folders

#find ./ -name 'c*nrb*' -exec rm {} -v \;
find ./ -name 'mapC*' -exec rm {} -v \;
find ./ -name 'mapD*' -exec rm {} -v \;
find ./ -name 'ClassM1C*' -exec rm {} -v \;
find ./ -name 'ClassM1D*' -exec rm {} -v \;
