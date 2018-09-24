#!/bin/bash -l

# Find first date match on the YATSM input csv files.
# This is the oldest date available in the TS.

scn_list="003058 003059 004057 004058 004059 004061 004062 005057 005058 \
          005059 005060 005061 006058 006059 006060 006061 007058 007059 \
          007060 007061 008058 008059 008060 009059 009060"

rootdir=/projectnb/landsat/projects/Colombia/images 
for s in $scn_list; do
    # Get path and row in short version
    pt=${s:2:1}
    rw=${s:4:2} 

    fpath=$rootdir/$s/$pt$rw"_input.csv"
    dt=$(cat $fpath | grep  -o '^[0-9]*' -m 2)
    echo $pt$rw $dt >> oldest_date.txt
done

