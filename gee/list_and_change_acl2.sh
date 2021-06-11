folder="projects/earthengine-legacy/assets/projects/GLANCE/RESULTS/CLASSIFICATION/VERSION_1/AF"

#for f in $(earthengine --no-use_cloud_api ls $folder); do 
for f in $(earthengine ls $folder); do 
    fname=$(basename "$f")
	earthengine acl ch -u allUsers:R  $f
done

