
## Instructions

### Compilation

Simply run the `./compile_all.sh` script, it will compile all the benchmarks for you.

*USAGE :*
	`./compile_all.sh` : build all benchmarks in the current directory
	`./compile_all.sh [-c | --clean]` : clean all builds (_ie_ remove the executables)


### Run the benchmarks

The `./run_benchs.sh` script run all the benchs previously compiled (it may take a few moment).
It generates a `.dat` file for each benchmark in it's directory, containing the perfs.

*USAGE :*
	`./run_bench.sh [BENCH_EXECUTABLE PATH]` : run only the executable passed in argument. Otherwise, all the benchmarks are run.

Each benchmark is run 3 times (for the `L1`, `L2`, `L3`and `DRAM` caches).

Be sure to configure the caches sizes according to you architecture at the top of the script. (cf. `lshw -C memory` command).
Also you may want to configure the core on witch the tests are performed (you may want a physical core id, cf `egrep -e "core id" -e ^physical /proc/cpuinfo | xargs -l2 echo | sort -u`).


### Generating charts

The `./gen_charts.sh` script generates a chart for each `.dat` generated with the previous cammand.

*How it works :*
For each subdirectory containing a benchmarck executable, it calls the `gnuplot` script `template.gp` with according arguments to generate chart for the benchmark (avaliable in the `./charts/` directory)
