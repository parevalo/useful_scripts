#!/bin/bash

folder="/mnt/c/Users/paulo/Downloads"
cd $folder

for f in $(find ./ -maxdepth 1 -name "*.csv"); do 
	fname=$(basename "$f" .csv)
	echo "Upload job for $fname"
	earthengine upload table \
	 --asset_id=users/parevalo_bu/biomass/glas/$fname \
	 gs://gee_biomass/$fname".csv" 
done 

