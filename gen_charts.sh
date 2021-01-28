#!/bin/bash
source colors.sh

# main
for bench in `find . -name "makefile"`; do

  bench=$(dirname $bench)

  echo -e "${LIGHTGREEN}*${NOCOLOR} found ${ORANGE}$bench${NOCOLOR}, generating ${GREEN}$bench${NOCOLOR} chart"
  args=$(getbenchParameters $bench)

  gnuplot -e  ./benchs_conf/${bench}.gp 2> sed -e 's/^/\t/' > charts/$bench.png

done;
