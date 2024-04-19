#!/bin/bash

LASPATH="C:/LAStools/bin/"

if(false)
    then
    INDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
    INFILE_BASE="2023-0280FA-Sandwich_lidar_-20231221-100303"
    OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/lidar/"
    echo "processing Decenber survey"
fi
if(true)
    then
    INDIR="D:/crs/proj/2024_Sandwich_Surveys/2024_TownNeckBeach/"
    INFILE_BASE="2024_TNB_ym_ptCloud_UTM19N_NAVD88"
    OUTDIR="D:/crs/proj/2024_Sandwich_Surveys/2024_TownNeckBeach/"
    echo "processing April survey"
fi

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -lowest \
   -o "${OUTDIR}${INFILE_BASE}_lowest.tif"

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -average \
   -o "${OUTDIR}${INFILE_BASE}_average.tif"

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -highest \
   -o "${OUTDIR}${INFILE_BASE}_highest.tif"

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -std \
   -o "${OUTDIR}${INFILE_BASE}_std.tif"

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -counter_32bit \
   -o "${OUTDIR}${INFILE_BASE}_counter32.tif"

"${LASPATH}lasgrid64" -i "${INDIR}${INFILE_BASE}.laz" \
   -v  -step 0.25 -mem 2000 -intensity_avg \
   -o "${OUTDIR}${INFILE_BASE}_intensity_avg.tif" \