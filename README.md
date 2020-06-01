# rv8_prof
A simplistic RISCV profiler based on the rv8 ISA simulator.

rv8_prof attempts at creating a low-level execution profile, based on the count of the ASM instructions that refers to a specific function. This should be roughly equivalent to the number of clock cycles required for execution, assuming 1 cycle per instruction. It should be relatively easy to extend the script to weight the different instruction execution time for the number of cycles required by a specific RISCV implementation. Also, this method is unaware of the dependency graph, so what is reported should match the 'self' time of the function as opposed to the total execution time (ie a function that takes a long time but just calls a lower level fucntion will not show up).

rv8_prof is based on the rv8 ISA simulator ( https://github.com/rv8-io/rv8 ).

# See Also:
- gprof2dot: https://github.com/ghtdak/gprof2dot/blob/master/tests/json/memtrail.leaked.json
- flamegraph: https://github.com/brendangregg/FlameGraph
