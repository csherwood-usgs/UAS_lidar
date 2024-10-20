#!/bin/bash

LASPATH="C:/LAStools/bin/"
# Slow, low lidar
INFILE_BASE="2024-028-FA_Oct_Sandwich_YSMP_lidar_small_UTM19N_NAVD88"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/Veg_lidar/"
INDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/"

RUN="01"
OPT="_"
INPATH="${INDIR}${INFILE_BASE}.laz"
OUTPATH="${OUTDIR}${INFILE_BASE}${OPT}.tif"
echo ${INFILE_BASE}
echo ${INPATH}


"${LASPATH}lasinfo" -i ${INPATH} \
        -compute_density \
        -odir ${OUTDIR} -otxt


"${LASPATH}lasgrid64" -i "${INPATH}" \
   -v  -step 0.25 -mem 2000 -mean -keep_class 2 \
   -inside 376330 4624355 377470 4625335 \
   -target_epsg 26919 -vertical_navd88 \
   -otif -populate -o "${OUTPATH}"

