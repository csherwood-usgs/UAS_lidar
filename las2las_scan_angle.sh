#!/bin/bash

LASPATH="C:/LAStools/bin/"
# Slow, low lidar
INFILE_BASE="2024-028-FA_Oct_Sandwich_YSMP_lidar_small_UTM19N_NAVD88"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/Veg_lidar/"
INDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/"

RUN="01"
OPT="_scan25"
INPATH="${INDIR}${INFILE_BASE}.laz"
echo ${INFILE_BASE}
echo ${INPATH}


OUTPATH="${OUTDIR}${INFILE_BASE}${OPT}.laz"
"${LASPATH}las2las64" -i "${INPATH}" \
   -v    -drop_abs_scan_angle_above 25 \
   -inside 376330 4624355 377470 4625335 \
   -olaz -o "${OUTPATH}"
   
"${LASPATH}lasinfo" -i ${OUTPATH} \
        -compute_density \
        -odir ${OUTDIR} -otxt
