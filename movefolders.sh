#!/bin/bash
# Script to move image folders to another place when the Landsat date is
# older than any arbitrary date

scene=009060
datetest=1996247

cd /projectnb/landsat/projects/Colombia/images/$scene/images

for archive in $(ls -d L*); do
    date=${archive:9:7}
    if [ $date -lt $datetest ]; then
        echo "Moving $(basename $archive) to ../img_old "  
        mv $archive ../img_old
    else
        echo "Folder $archive is newer than $datetest"
    fi
done

echo "Done!"
