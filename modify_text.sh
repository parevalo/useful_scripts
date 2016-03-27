#!/bin/bash
#$ -V
#$ -j y

# This script is written to modify all of the text files used
# during the yatsm workflow, in order to change the path/rows for input/output
# folders and things like that

scn_path=/projectnb/landsat/projects/Colombia/images
#scn_path=/usr3/graduate/parevalo/test

for DIR in $scn_path/*/ ; do
	cd ${DIR}Results/FIT1
	pr=$(basename ${DIR})
		
	# Get long and short P-R (e.g. 007058 and 758)
	path=${pr:0:3}
	row=${pr:3:3}
	
	pt=${path:2:1}
	rw=${row:1:2}

	# Rename yaml files
	rename 758 $pt$rw *.yaml
	
	# Replace P-R in the config file and all the scripts
	# r (use extended regexp)  MUST precede i(in place edits) in the sed 
	# expression.
	
	sed -ri "s/[0-9]{6}/$path$row/g" $pt$rw"_FIT1.yaml" *.sh
	sed -ri "s/[0-9]{3}_/$pt$rw"_"/g" $pt$rw"_FIT1.yaml" *.sh
	sed -ri "s/_[0-9]{3}\b/"_"$pt$rw/g" *.sh

done
