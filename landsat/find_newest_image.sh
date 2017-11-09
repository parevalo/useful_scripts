#!/bin/bash

# This script is written to find the most recent landsat image present in the
# scene list submitted to the LEDAPS website. These files have a naming pattern
# like this: p007r059.txt. This is done in order to figure out which dates
# need to be searched for in order to get the most up to date data. The txt 
# file HAS to be updated in order to get a single file with the entire list of
# images.

scn_path=/projectnb/landsat/projects/Colombia/images

for DIR in $scn_path/*/ ; do
    cd ${DIR}
    echo $DIR
    grep -Eo '[0-9]+' p*.txt | sort -rn | head -n 1
done
