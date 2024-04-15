#!/bin/bash
# test script for LAStools
# run by invoking ./test_bare_earth.sh

# Based on https://github.com/LAStools/LAStools/blob/master/example_batch_scripts/huge_las_file_extract_ground_points_only.bat
LASPATH="C:/LAStools/bin/"

INDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"

INFILE_BASE="2023-0280FA-Sandwich_lidar_-20231221-100303"

TEMP_DIR1="temp_tiles"

#OUTFILE="2023-028-FA_Sandwich_Ricoh_SfM_ptCloud_UTM19N_NAVD88_5cm_opt.laz"

NUM_CORES=8
STEP=0.25
TILE_SIZE=512


# clobber any existing files in the temp folders
rm -rf temp_tiles
rm -rf temp_tiles_denoised

# make temporary directories for tiles
mkdir -p temp_tiles
mkdir -p temp_tiles_denoised

# tile....with TILE_SIZE=512, there are about 11 files with up to 500 MB each
# have not tested adding buffers or making tiles smaller
"${LASPATH}lastile64" -i "${INDIR}${INFILE_BASE}.laz" \
    -v -tile_size ${TILE_SIZE} \
    -o "temp_tiles/tile" -olaz

# run lasnoise on all temporary tiles on multiple cores while
# aggressively filtering noise points in an attempt to get as
# many erroneous points below the ground as possible. wrong
# classification of points above the grounds as noise does not
# matter here.
"${LASPATH}lasnoise64" -i "temp_tiles/tile*.laz" \
  -step_xy 0.25 -step_z 0.25 -classify_as 7 -v -lowest -odir temp_tiles_denoised -olaz \
  -cores ${NUM_CORES}

rm -rf temp_tiles_thinned
mkdir -p temp_tiles_thinned

:: run lasthin on all temporary tiles on multiple cores to mark
:: the point closest to the fifth (5th) lowest percentile in each
:: .25 meter by .25 meter cell with temporary classification code 6
"${LASPATH}lasthin64" -i "temp_tiles_denoised/tile*.laz" \
  -ignore_class 7 -step 0.25 -percentile 0.05 -classify_as 6 -v -odir temp_tiles_thinned -olaz \
  -cores ${NUM_CORES}

rm -rf temp_tiles_ground
mkdir -p temp_tiles_ground
"${LASPATH}lasground_new64" -i "temp_tiles_thinned/tile*.laz" \
  -ignore_class 7 0 -step 0.25 -town -ultra_fine -v  -odir temp_tiles_ground -olaz \
  -cores ${NUM_CORES}

"${LASPATH}lasmerge64" -i "temp_files_ground/tile*.laz" \
   -v  \
   -o "${OUTDIR}${INFILE_BASE}_ground.laz"


# remove temp dir
# rm -rf  ${TEMP_DIR}


