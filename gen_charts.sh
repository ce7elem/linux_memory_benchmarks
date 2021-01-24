#!/bin/bash
source colors.sh

function getbenchParameters() {
  # load parameters for the bench
  bench=`echo $1 | sed -r 's/_[^_]*$//g'`
  source ./benchs_conf/$bench.conf

  #build the final string of parameters
  res=""
  for key in "title_" "xlabel_" "ylabel_"; do
    res="$res ; $key='${!key}'"
  done;

  echo $res
}

# main
for dat_file in `find -name "*.dat"`; do
  bench=$(basename $dat_file)
  bench="${bench%%.*}"

  echo -e "${LIGHTGREEN}*${NOCOLOR} found ${ORANGE}$dat_file${NOCOLOR}, generating ${GREEN}$bench${NOCOLOR} chart"
  args=$(getbenchParameters $bench)

  gnuplot -e "dat_src_='$dat_file'; $args" ./benchs_conf/template.gp 2> sed -e 's/^/\t/' > charts/$bench.png

done;
