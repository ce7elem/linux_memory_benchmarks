#!/bin/bash
source colors.sh


function cleanCSV() {
  for f in `find $1 -name "*.dat"`; do
    cat $f | cut -d';' -f1,9 | sed "s/\_/\\\\\\\\\\\_/g"  > $f.cleaned # yes, 11 \ to escape the _
  done
}

# main
for bench in `find . -name "makefile"`; do

  bench=$(dirname $bench)
  benchname=$(basename $bench)
  no_extention=0

  echo -e "${LIGHTGREEN}*${NOCOLOR} found ${ORANGE}$bench${NOCOLOR}, generating ${GREEN}$benchname${NOCOLOR} chart"

    # load custom `cleanCSV` function if needed
  if [ -f ./custom_benchmark_scripts/$bench.sh ]; then
    source ./custom_benchmark_scripts/$bench.sh
    custom_cleanCSV $bench
  else
    cleanCSV $bench
  fi

  gnuplot -e "title_='$benchname' ; dir_='$bench' ; bench_='$bench' ; xlabel_='$xlabel' ; no_ext_='$no_extention'" ./template.gp > charts/$bench.png
  gnuplot -e "title_='$benchname' ; dir_='$bench' ; bench_='$bench' ; xlabel_='$xlabel' ; no_ext_='$no_extention'" ./template_agg.gp > charts/${bench}_agg.png

done;
