#!/bin/bash
source colors.sh

# environment

CORE_ID=3 # the core id on which the bench is executed
#cpupower -c $CORE_ID frequency-set -f 3.50GHz --governor performance

REPETITION=1000

  # 2**10 = Ki ; 2**10**2 = Mi
declare -A BENCH_ITERATIONS
BENCH_ITERATIONS["L1"]=$((128 * 2**10))
BENCH_ITERATIONS["L2"]=$((1 * 2**10**2))
BENCH_ITERATIONS["L3"]=$((6 * 2**10**2))
# subroutines

function run(){
  local exe=$1
  local bench=$(basename $exe)
  local bench_dir=$(dirname $exe)

  echo -e "${LIGHTGREEN}*${NOCOLOR} running bench ${GREEN}$bench${NOCOLOR}"

  for iteration in ${BENCH_ITERATIONS[@]}; do
    local size=${BENCH_ITERATIONS[$iteration]}

    # run the bench
    echo -e "\t${GREEN}>${NOCOLOR}${LIGHTGRAY} \
taskset -c $CORE_ID $exe $size $REPETITION > $bench_dir/${bench}_${iteration}.dat \
${NOCOLOR}"
  done
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
