%%bash

cd /projectnb/landsat/projects/Colombia/images/007059/images
n=$(find . -maxdepth 1 -name '*007059198[7-9]*' | wc -l)
i=1

for archive in $(find . -maxdepth 1 -name '*007059198[7-9]*'); do
    echo "<----- $i / $n: $(basename $archive)"
    mv $archive ../img90
    let i+=1
done

echo "Done!"
