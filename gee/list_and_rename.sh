folder1="projects/earthengine-legacy/assets/projects/GLANCE/RESULTS/CLASSIFICATION/TESTING/Paraguay_Bolivia/19"
folder2="projects/earthengine-legacy/assets/projects/GLANCE/RESULTS/CLASSIFICATION/TESTING/Paraguay_Bolivia/"

for f in $(earthengine --no-use_cloud_api ls $folder1); do 
    fname=$(basename "$f")
	earthengine mv $f $folder2$fname"_trial35"
done
