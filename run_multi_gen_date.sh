#!/bin/bash

# Executes gen_date_file.sh and places the output in the corresponding image folder.
# It is easier to keep the filde in the image folder because it can be used
# by all of the models (e.g. FIT1, etc) without having to duplicate the file.

scn_path=/projectnb/landsat/projects/Colombia/images/
script=/projectnb/landsat/users/parevalo/yatsm/scripts/gen_date_file.sh

for DIR in $scn_path/*/ ; do
	cd ${DIR}
	path=${DIR:4:1}
	row=${DIR:6:2}
	$script /images $path$row_input.csv
done


