#!/bin/bash
#$ -V
#$ -l h_rt=48:00:00
#$ -N del_stacks
#$ -j y

### This is a script to remove unnecessary files from image stack folders. Since
#### the file names often change, just copy the format and add in whatever other
#### files are necessary to remove. Also, check the list first to make sure you do
#### not want any of these files!!!!

find ./ -name 'L*stack*' -exec rm {} -v \;
