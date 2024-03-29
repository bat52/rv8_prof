# rv8_prof
A simplistic RISCV profiler based on the rv8 ISA simulator.

rv8_prof attempts at creating a low-level execution profile, based on the count of the ASM instructions that refers to a specific function. This should be roughly equivalent to the number of clock cycles required for execution, assuming 1 cycle per instruction. It should be relatively easy to extend the script to weight the different instruction execution time for the number of cycles required by a specific RISCV implementation. Also, this method is unaware of the dependency graph, so what is reported should match the 'self' time of the function as opposed to the total execution time (ie a function that takes a long time but just calls a lower level fucntion will not show up).

rv8_prof is based on the rv8 ISA simulator ( https://github.com/rv8-io/rv8 ).

rv8_prof generates a pie chart output, based on the "Unix Pie" method ( http://xed.ch/b/2016/1217.html).

# Use
    CC=riscv32-unknown-elf-gcc # riscv compile from your toolchain
    EXE=hello
    $(CC) -o $(EXE) hello.c

    # execute and profile
    ./rv8_prof.sh $(EXE)

    # browse text output
    less $(EXE).profile.txt

    # .svg pie chart output
    ls $(EXE).profile.svg

# Example

An example is provided, under the folder ./example.
Execute, with the following command:

    cd ./example
    make

# See Also:
- gprof2dot: https://github.com/ghtdak/gprof2dot/blob/master/tests/json/memtrail.leaked.json
- flamegraph: https://github.com/brendangregg/FlameGraph
- poor man's profiler: https://poormansprofiler.org/
- flamegraph from poor man's profiler http://www.jwhitham.org/2015/03/why-is-this-taking-so-long-poor-mans.html
