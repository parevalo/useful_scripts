cd /projectnb/landsat/projects/Colombia/images/008060/Results/FIT1
path=/projectnb/landsat/projects/Colombia/images/

for i in $(seq -w 006 008); do
	for j in $(seq -w 059 060); do
		cp Multimap.sh $path$i$j/Results/FIT1
	done
done

