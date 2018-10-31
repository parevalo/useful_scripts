#!/bin/bash -l

# Execute move folders for all scenes that go back to the 80's

scn_list="004061 005058 007060 007061" #004058 006059 006060

scr=/usr3/graduate/parevalo/Scripts/useful_scripts/file_mgmt/movefolders.sh 
basepath=/projectnb/landsat/projects/Colombia/images
splitdate=1997001

for s in $scn_list; do
    pre=$basepath/$s/images/old_period
    post=$basepath/$s/images/recent_period
    $scr $s $splitdate $pre $post

done


