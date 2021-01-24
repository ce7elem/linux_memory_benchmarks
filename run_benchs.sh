#!/bin/bash
source colors.sh

# environment

CORE_ID=3 # the core id on which the bench is executed
cpupower -c $CORE_ID frequency-set -f 3.50GHz --governor performance


# subroutines

function run(){
  local exe=$1
  local bench=$(basename $exe)
  local bench_dir=$(dirname $exe)

  echo -e "${LIGHTGREEN}*${NOCOLOR} running bench ${GREEN}$bench${NOCOLOR}"

  # fetching benchmark params
  source ./benchs_conf/$bench.conf 2>/dev/null

  [ $? == 0 ] && for iteration in ${bench_iterations[@]}; do
    local size=${bench[$iteration,"size"]}
    local kern_repetition=${bench[$iteration,"kern_repetition"]}

    # run the bench
    echo -e "\t${GREEN}>${NOCOLOR}${LIGHTGRAY} \
taskset -c $CORE_ID $exe $size $kern_repetition | cut -d';' -f1,9 > $bench_dir/${bench}_${iteration}.dat \
${NOCOLOR}"
  done \
    || echo -e "\t${RED}x${NOCOLOR} ${ORANGE} Passing, no config file @./bench_conf/$bench.conf"


}


# main 
if [ ! -z "$1" ]; then
  run $1

else 
  echo -e "${GREEN} Running full tests ${NOCOLOR}"
  for executable in `find . -executable -type f ! -name "*.*"`; do
    run $executable
  done

fi
