#!/bin/bash

# functions & env overwrite for the memcpy benchmark

function custom_cleanCSV() {
	echo plz
  for f in `find $1 -name "*.dat"`; do
    cat $f | sed -n 2,34p | cut -d',' -f1,4 > $f.cleaned 
  done
}

xlabel="Iteration"
no_extention=1
