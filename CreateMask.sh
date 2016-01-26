#STILL DOESNT WORK

module load gdal/1.11.1

cd /projectnb/landsat/projects/Colombia/Mosaics/

r1=mosaic_2000.tif 
r2=mosaic_2001.tif 

qsub -j y -V -b y gdal_calc.py -A $r1 -B $r2 --calc="logical_or(A>0, B>0)" --outfile=test.tif --type='Byte' --NoDataValue=0

