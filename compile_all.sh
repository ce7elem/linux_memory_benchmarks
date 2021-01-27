#!/bin/bash
source colors.sh

PARAMS=""

while (( "$#" )); do
  case "$1" in
    -c|--clean)
      CLEAN=0
      shift
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      PARAMS="$PARAMS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"


for makefile in `find . -name "makefile"`; do
  test=$(dirname $makefile)

  if [[ $CLEAN == 0 ]]; then
    echo -e "${LIGHTGREEN}*${NOCOLOR} cleaning ${GREEN}$test${NOCOLOR} benchmark"
    make clean -C ./$test | sed -e 's/^/\t/' # indent make's output
  else
    echo -e "${LIGHTGREEN}*${NOCOLOR} compilling ${GREEN}$test${NOCOLOR} benchmark"
    make all -C ./$test | sed -e 's/^/\t/' # indent make's output
  fi

done
