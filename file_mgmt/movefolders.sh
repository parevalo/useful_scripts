#!/bin/bash

# Script to move image folders to subfolders depending on whether
# their date is older or newer than an arbitrary date

if [ $# -ne 4 ]; then
    echo "Must specify four arguments. Aborted."
    exit 1
fi

scene=$1
datetest=$2
folder1=$3
folder2=$4

cd /projectnb/landsat/projects/Colombia/images/$scene/images

# Check if folders exist and create them if not
if [ -d $folder1 ]; then
    echo "Existing first folder will be used"
else
    echo "Destination folder 1 does not exist. Creating..."
    mkdir $folder1
fi

if [ -d $folder2 ]; then
    echo "Existing second folder will be used"
else
    echo "Destination folder 2 does not exist. Creating..."
    mkdir $folder2
fi

# Move files
for archive in $(ls -d L*); do
    date=${archive:9:7}
    if [ $date -lt $datetest ]; then
        echo "Folder $archive is older than $datetest. Moving to $folder1"
        mv $archive $folder1
    else
        echo "Folder $archive is newer than $datetest. Moving to $folder2"
        mv $archive $folder2
    fi
done

echo "Done!"

