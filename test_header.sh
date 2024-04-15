#!/bin/bash
# test script for LAStools
# run by invoking ./test_header.sh
LASPATH="C:/LAStools/bin/"

INDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"

INFILE_BASE="2023-0280FA-Sandwich_lidar_-20231221-100303"

TEMP_DIR="tiles"

#OUTFILE="2023-028-FA_Sandwich_Ricoh_SfM_ptCloud_UTM19N_NAVD88_5cm_opt.laz"

NUM_CORES=8
STEP=0.05
TILE_SIZE=512

# This does not work yet
"${LASPATH}lasinfo64" -i "${INDIR}${INFILE_BASE}.laz" -no_check -set_GUID F794F8A4-A23E-421E-A134-ACF7754E1C54 -o "${INDIR}${INFILE_BASE}_GUID.laz"