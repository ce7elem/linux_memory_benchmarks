#!/bin/bash
source colors.sh

# main
for bench in `find . -name "makefile"`; do

  bench=$(dirname $bench)

  echo -e "${LIGHTGREEN}*${NOCOLOR} found ${ORANGE}$bench${NOCOLOR}, generating ${GREEN}$bench${NOCOLOR} chart"

  gnuplot -e "title_=$bench ; dir_=$bench ; bench_=$bench" ./benchs_conf/template.gp > charts/$bench.png

done;
