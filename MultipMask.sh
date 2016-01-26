module load gdal/1.11.1

cd /projectnb/landsat/projects/Colombia/Mosaics/

for yr in $(seq -w 00 12); do
    qsub -j y -V -b y -N mask$yr  gdal_calc.py -A mosaic_20$yr.tif -B nodata_00-12_byte.tif --calc="A*B" --outfile=mosaic_20$yr-masked.tif --type='UInt16' --NoDataValue=0
done
