#!/bin/bash
#$ -V
#$ -j y

# This is a generic script to copy the starting files or folders into any specific
# FIT subfolder inside all of the scene folders. The copy function won't
# overwrite any existing files.
#

if [ $# -lt 2 ]; then
	echo "Error - please specify the files/folders to copy and the desired
	destination subfolder inside the scene folder. Usage: "
	echo "	$0 <files> <subfolder>"
	exit 1
fi

origin="/projectnb/landsat/projects/Colombia/workflow"
destination="/usr3/graduate/parevalo/test"
#destination="/projectnb/landsat/projects/Colombia/images"

for DIR in $destination/*/ ; do
	cd ${DIR}
	if [ -d ${DIR}$2 ]; then
		# Do not overwrite, be verbose, recursive
		cp -n -v -r $origin/$1 $2 
	else
		mkdir -p "${DIR}$2"
		echo "Subfolder $2 has been created in ${DIR}"
		cp -n -v -r $origin/$1 $2
		echo "Files created in ${DIR}$2"
	fi
done   
