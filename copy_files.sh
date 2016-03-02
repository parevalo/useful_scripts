#!/bin/bash
#$ -V
#$ -j y

# This is a generic script to copy files or folders into any specific
# FIT subfolder inside all of the scene folders. The copy function won't
# overwrite any existing file.
#

if [ $# -lt 2 ]; then
	echo "Error - please specify the files/folders to copy and the desired
	destination subfolder inside the scene folder. Usage: "
	echo "	$0 <files> <subfolder>"
	exit 1
fi

parent="/usr3/graduate/parevalo/test"
current="/projectnb/landsat/projects/Colombia/workflow"

# Do not overwrite, be verbose, recursive
for DIR in $parent/*/ ; do
	cd ${DIR}
	if [ -d ${DIR}$2 ]; then
		cp -n -v -r $current/$1 $2
		echo "Files created in ${DIR}$2"
	else
		echo "$current$1"
		mkdir -p "${DIR}$2"
		echo "Subfolder $2 has been created in ${DIR}"
		cp -u -v -r $current/$1 $2
		echo "Files created in ${DIR}$2"
	fi
done   
