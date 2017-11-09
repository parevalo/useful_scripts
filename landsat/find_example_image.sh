#!/bin/bash
# Script to find the first Landsat 7 folder in an image folder
# This is used to replace the example image in the scripts for each scene

img=$(find . -maxdepth 1 -type d -name "*LE7*" | head -1 )
# An alternative would be:
#img=$(find . -maxdepth 1 -type d -regextype posix-extended -regex "./LE7.*" | head -1 )
echo $(basename $img)
echo $(basename $img)_stack

## ADD SECTION TO OUTPUT EXTENT TO A FILE, IN ORDER TO BE USED FOR RASTERIZING
