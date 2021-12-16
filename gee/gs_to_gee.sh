#!/bin/bash

folder="/mnt/c/Users/paulo/Downloads/mlongo_gbc_2016_maps"
cd $folder

for f in $(find ./ -maxdepth 1 -name "*.tif"); do 
	fname=$(basename "$f" .tif)
	echo "Upload job for $fname"
	earthengine upload image \
	 --asset_id=users/parevalo_bu/biomass/longo_2016/$fname \
	 gs://gee_biomass/$fname".tif" 
done 

