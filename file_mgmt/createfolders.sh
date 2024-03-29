#!/bin/bash
#$ -V
#$ -j y
#$ -N createfolders

# sjdnfsjdfkdsn
if [ $# -lt 2 ]; then
    echo "Error - please specify the image directory that stores all the scenes
	and the name of the subfolder (and nested subfolders) to create in each of them. Usage:"
    echo "    $0 <directory> <subfolder>"
    exit 1
fi

for DIR in $1/*/ ; do
    if [ -d ${DIR}$2 ]; then
        echo "Folder $2 already exists in ${DIR}"

    else
        mkdir -p "${DIR}$2"
        echo "Folder $2  created in ${DIR}"
		 
    fi
done
