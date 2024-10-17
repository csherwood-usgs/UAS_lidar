#!/bin/bash

# Three-step proceedure to classify top of veg

LASPATH="C:/LAStools/bin/"
# Slow, low lidar
INFILE_BASE="2024-028-FA_Oct_Sandwich_YSMP_lidar_small_UTM19N_NAVD88_scan25"
OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/Veg_lidar/"
INDIR="D:/crs/proj/2024_Sandwich_Surveys/Sandwich/Veg_lidar/"

echo "infile base:"
echo ${INFILE_BASE}

# lasground has already been computed
# compute heights
<< block_comment
OPT="_hgt"
INPATH="${INDIR}${INFILE_BASE}_ang25_step5.laz"
OUTPATH="${OUTDIR}${INFILE_BASE}_ang25_step5${OPT}.laz"
echo "lasheight"
echo ${INPATH}
"${LASPATH}lasheight64" -i "${INPATH}" \
   -v \
   -inside 376330 4624355 377470 4625335 \
   -olaz -o "${OUTPATH}"

"${LASPATH}lasinfo" -i ${OUTPATH} \
        -compute_density \
        -odir ${OUTDIR} -otxt
block_comment

# use the heights to calc a veg class
OPT="_veg_class"
INPATH="${INDIR}${INFILE_BASE}_ang25_step5_hgt.laz"
OUTPATH="${OUTDIR}${INFILE_BASE}_ang25_step5_hgt${OPT}.laz"
echo "lasclassify"
echo ${INPATH}
"${LASPATH}lasclassify64" -i "${INPATH}" \
   -v  -planar 0.1 -ground_offset 0.35 -small_trees\
   -inside 376330 4624355 377470 4625335 \
   -olaz -o "${OUTPATH}"

"${LASPATH}lasinfo" -i ${OUTPATH} \
        -compute_density \
        -odir ${OUTDIR} -otxt
