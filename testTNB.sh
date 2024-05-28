#!/bin/bash

LASPATH="C:/LAStools/bin/"
INDIR="F:/TownNeckBeach_Testing/"
OUTDIR="F:/TownNeckBeach_Testing/"

RUN="3"
OPT="_test"
INFILE_BASE="TNB_CLASSIFY_${RUN}"
INPATH="${INDIR}${INFILE_BASE}.laz"
OUTPATH="${OUTDIR}${INFILE_BASE}${OPT}.tif"
echo ${INFILE_BASE}
echo ${INPATH}

"${LASPATH}lasgrid64" -i "${INPATH}" \
   -v  -step 0.25 -mem 2000 -mean -keep_class 2 \
   -inside 376330 4624355 377470 4625335 \
   -target_epsg 26919 -vertical_navd88 \
   -otif -populate -o "${OUTPATH}"
