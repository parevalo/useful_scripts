#!/bin/bash
#$ -V
#$ -j y

# This script is written to modify all of the text files used
# during the yatsm workflow, in order to change the path/rows for input/output
# folders and things like that

#scn_path=/projectnb/landsat/projects/Colombia/images
scn_path=/usr3/graduate/parevalo/test

for DIR in $scn_path/*/ ; do
	cd ${DIR}Results/FIT1
	pr=$(basename ${DIR})
		
	# Get long and short P-R (e.g. 007058 and 758)
	path=${pr:0:3}
	row=${pr:3:3}
	
	pt=${path:2:1}
	rw=${row:1:2}
	
	# Replace P-R in the config file and all the scripts
	sed -i "s/007058/$path$row/g" 758_FIT1.yaml *.sh
#	sed -i 's/758/$p$r/' $p$r_"FIT1.yaml" *.sh
	
#	sed -i -r "s/^[0]\d{5}/$path$row/g" 758_FIT1.yaml
	sed -i "s/758/$pt$rw/g" *.sh 758_FIT1.yaml
done
