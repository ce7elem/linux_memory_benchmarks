set term png size 1000,500 enhanced font "Consolas,10"

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


set yrange [0:100]

set title "Intel core i7-6700HQ, benchmark {/:Bold ".title_." }"

print "no ext = ".no_ext_

#if (exists('no_ext_')) {
if (no_ext_ != 1) {
	plot	dir_."/".bench_."_SSE_AVX_L1.dat.cleaned" u 2:xtic(1) t "L1" lt rgb "#81a1c1",\
			dir_."/".bench_."_SSE_AVX_L2.dat.cleaned" u 2:xtic(1) t "L2" lt rgb "#ebcb8b",\
      		dir_."/".bench_."_SSE_AVX_L3.dat.cleaned" u 2:xtic(1) t "L3" lt rgb "#bf616a"
} else {
	plot	dir_."/".bench_."_L1.dat.cleaned" u 2:xtic(1) t "L1" lt rgb "#81a1c1",\
			dir_."/".bench_."_L2.dat.cleaned" u 2:xtic(1) t "L2" lt rgb "#ebcb8b",\
      		dir_."/".bench_."_L3.dat.cleaned" u 2:xtic(1) t "L3" lt rgb "#bf616a"	
}

unset multiplot
