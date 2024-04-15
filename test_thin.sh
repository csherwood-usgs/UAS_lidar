#!/bin/bash
# test script for LAStools
# run by invoking ./test_thin.sh
LASPATH="C:/LAStools/bin/"

INDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"

INFILE_BASE="2023-0280FA-Sandwich_lidar_-20231221-100303"

TEMP_DIR="tiles"

#OUTFILE="2023-028-FA_Sandwich_Ricoh_SfM_ptCloud_UTM19N_NAVD88_5cm_opt.laz"

NUM_CORES=8
STEP=0.05
TILE_SIZE=512

# Info
#"${LASPATH}lasinfo64" -i "${INDIR}${INFILE_BASE}.las" -no_check

# Zip .las file to .laz (7.9 GB to 1 GB)
#"${LASPATH}laszip64" -i "${INDIR}${INFILE_BASE}" -v

# Info
#"${LASPATH}lasinfo64" -i "${INDIR}${INFILE_BASE}.laz" -v -no_check

# this will do spatial optimization and create a .lax file
#"${LASPATH}lasindex64" -i "${INDIR}${INFILE_BASE}.laz" -v

# clobber any existing files in the temp foldr#
# rm -rf ${TEMP_DIR}

# make a temporary directory for tiles
mkdir -p ${TEMP_DIR}

# tile....with TILE_SIZE=512, there are about 11 files with up to 500 MB each
# have not tests adding buffers or making tiles smaller
"${LASPATH}lastile64" -i "${INDIR}${INFILE_BASE}.laz" \
    -v -tile_size ${TILE_SIZE} \
    -o "${TEMP_DIR}/tile" -olaz

"${LASPATH}lasthin64" -i "${TEMP_DIR}/tile*.laz" \
  -step ${STEP} -v -lowest -odix _thinned -olaz \
  -cores ${NUM_CORES}

"${LASPATH}lasmerge64" -i "${TEMP_DIR}/tile*_thinned.laz" \
   -v  \
   -o "${OUTDIR}${INFILE_BASE}_005_lowest.laz"





# remove temp dir
# rm -rf  ${TEMP_DIR}


