set term png size 1900,1000 enhanced font "Hack Nerd Pro,10"

set grid

set auto x

set key left top

set xlabel "Benchmark variants"
set ylabel "Bandwidth in GiB/s (higher is better)"

#overwrite
if (exists("xlabel_")) set xlabel xlabel_

set terminal png enhanced background rgb "#dddddd"

set style data histogram
set style fill solid border -1
set boxwidth 0.9

set xtic rotate by -45 scale 0

set multiplot layout 2, 2 rowsfirst

set yrange [0:150]

#if (exists('no_ext_')) {
if (no_ext_ != 1) {
  set title "L1 cache"
  plot dir_."/".bench_."_SSE_AVX_L1.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#81a1c1"

  set title "L2 cache"
  plot dir_."/".bench_."_SSE_AVX_L2.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#ebcb8b"

  set title "L3 cache"
  plot dir_."/".bench_."_SSE_AVX_L3.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#bf616a"
} else {
  set title "L1 cache"
  plot dir_."/".bench_."_L1.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#81a1c1"

  set title "L2 cache"
  plot dir_."/".bench_."_L2.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#ebcb8b"

  set title "L3 cache"
  plot dir_."/".bench_."_L3.dat.cleaned" u 2:xtic(1) t "Intel Core i7-6700HQ" lt rgb "#bf616a"
}
unset multiplot
