#!/bin/bash
source colors.sh

for makefile in `find -name "makefile"`; do
  test=$(dirname $makefile)

  echo -e "${LIGHTGREEN}*${NOCOLOR} compilling ${GREEN}$test${NOCOLOR} benchmark"

  make all -C ./$test | sed -e 's/^/\t/' # indent make's output
done
