#!/bin/bash
# test scripts for LAStools
# run by invoking ./test.sh
LASPATH="C:/LAStools/bin/"

INDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"

INFILE="2023-028-FA_Sandwich_Ricoh_SfM_ptCloud_UTM19N_NAVD88_5cm.laz"
OUTFILE="2023-028-FA_Sandwich_Ricoh_SfM_ptCloud_UTM19N_NAVD88_5cm_opt.laz"

"${LASPATH}lasoptimize64" -cores 8 -v \
-i "${INDIR}${INFILE}" \
-o "${OUTDIR}${OUTFILE}"