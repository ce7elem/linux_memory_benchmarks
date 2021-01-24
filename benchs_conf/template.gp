set term png size 1900,1000 enhanced font "Hack Nerd Pro,10"

set grid

set auto x

set key left top

set title title_

set xlabel xlabel_
set ylabel ylabel_

set style data histogram
set style fill solid border -1
set boxwidth 0.9

set xtic rotate by -45 scale 0

set multiplot layout 2, 2 rowsfirst

set yrange [0:150]

plot dat_src_ u 2:xtic(1) t "Intel Core i7-6700HQ"

unset multiplot
