cd /projectnb/landsat/projects/Colombia/Mosaics
module load gdal/1.11.1

path1=/projectnb/landsat/projects/Colombia/images/008059/Results/FIT1/Class
path2=/projectnb/landsat/projects/Colombia/images/007059/Results/FIT3/Class
path3=/projectnb/landsat/projects/Colombia/images/006059/Results/FIT1/Class
path4=/projectnb/landsat/projects/Colombia/images/008060/Results/FIT1/Class
path5=/projectnb/landsat/projects/Colombia/images/007060/Results/FIT1/Class
path6=/projectnb/landsat/projects/Colombia/images/006060/Results/FIT1/Class


for yr in $(seq -w 0 12); do
  qsub -j y -V -N mos_20$yr -b y \
       gdal_merge.py -co BIGTIFF=YES -n 0 -a_nodata 0 -v -o mosaic_20$yr-aft.tif \
       $path1/Class_20$yr-01-01_mult_aft.tif $path2/Class_20$yr-01-01_mult_aft.tif \
       $path3/Class_20$yr-01-01_mult_aft.tif $path4/Class_20$yr-01-01_mult_aft.tif \
       $path5/Class_20$yr-01-01_mult_aft.tif $path6/Class_20$yr-01-01_mult_aft.tif
done
