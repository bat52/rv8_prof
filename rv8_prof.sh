#/usr/bin/bash
# author: Marco Merlin, marcomerli @ gmail.com
# license:  

EXE=$1
DUMP=$EXE.txt
PROFILE=$EXE.profile.txt

# based on rv8 RISC-V simulator for x86-64
# https://github.com/rv8-io/rv8

# execute program with rv8 jit and dump instructions 
rv-jit -l -S $EXE > $DUMP

# extract symbol names from dump, and count line (instructions) occurencies
# awk '{print $1}' $DUMP : print first column 
# cut -f1 -d"+"          : remove instrunction offset followed by +
# sort                   : sort by function name
# uniq -c                : count number of entries per each function name
# sort -u -n -b -r -k1   : sort by first column (count number)
awk '{print $1}' $DUMP | cut -f1 -d"+" | sort | uniq -c | sort -u -n -b -r -k1 | awk {'printf("%s\t%10s\n", $2,$1)'}> $PROFILE

# remove dump
rm $DUMP

# print top 30 entries
head -n 30 $PROFILE

# generate pie graph
cat $PROFILE | awk '{print $2,$1}' | ./pie.sh > $EXE.profile.svg

