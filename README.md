# Measuring/Evaluating the performance of a computer system using benchmarks

## Compilation
Simply run the `./compile_all.sh` script, it will compile all benchmarks for you.

## Run the benchmarks
The `./run_benchs.sh` script run all the benchs previously compiled (it may take a few moment).
It generates a `.dat` file for each benchmark in it's directory, containing the perfs.

## Generate charts
The `./gen_charts.sh` script generates a chart for each `.dat` generated with the previous cammand.

## Configuration
Options for each graph/benchmarks (such as graph title, labels.. and arguments for each benchmark) can be found in the `./benchs_conf` folder, each benchmark should have a config file.
