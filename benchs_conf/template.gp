set term png size 1900,1000 enhanced font "Hack Nerd Pro,10"

set grid

set auto x

set key left top

set multiplot layout 1,2 title "Intel Core i7-6700HQ bandwidth (in GiB/s) for the '".title_."' benchmark"

set xlabel xlabel_
set ylabel ylabel_

set style data histogram
set style fill solid border -1
set boxwidth 0.9

set xtic rotate by -45 scale 0

set multiplot layout 2, 2 rowsfirst

set yrange [0:150]

set title "L1 cache"
plot dir_.bench."_L1.dat" u 2:xtic(1) t "Intel Core i7-6700HQ"

set title "L2 cache"
plot dir_.bench."_L2.dat" u 2:xtic(1) t "Intel Core i7-6700HQ"

set title "L3 cache"
plot dir_.bench."_L3.dat" u 2:xtic(1) t "Intel Core i7-6700HQ"

unset multiplot
