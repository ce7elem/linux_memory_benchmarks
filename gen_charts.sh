#!/bin/bash
source colors.sh


function cleanCSV() {
  for f in `find $1 -name "*.dat"`; do
    cat $f | cut -d';' -f1,9 > $f.cleaned
  done
}

# main
for bench in `find . -name "makefile"`; do

  bench=$(dirname $bench)
  benchname=$(basename $bench)

  echo -e "${LIGHTGREEN}*${NOCOLOR} found ${ORANGE}$bench${NOCOLOR}, generating ${GREEN}$bench${NOCOLOR} chart"

  cleanCSV $bench

  gnuplot -e "title_='$benchname' ; dir_='$bench' ; bench_='$bench'" ./template.gp > charts/$bench.png

done;
