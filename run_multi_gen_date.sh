#!/bin/bash
#$ -V
#$ -j y

# Executes gen_date_file.sh and places the output in the corresponding image folder.
# It is easier to keep the output file in the image folder because it can be used
# by all of the models (e.g. FIT1, etc) without having to duplicate it.

scn_path=/projectnb/landsat/projects/Colombia/images
script=/projectnb/landsat/users/parevalo/yatsm/scripts/gen_date_file.sh

for DIR in $scn_path/*/ ; do
	cd ${DIR}
	pr=$(echo ${DIR} | awk -F'/' '{ print $7 }') # Get folder name with P-R
	path=${pr:2:1}
	row=${pr:4:2}
	output=$path$row"_input.csv"
	if [ -f $output ]; then
		echo "File already exists in ${DIR}"

	else
		echo "Creating file in ${DIR}"
		$script images $output
	fi	
done


