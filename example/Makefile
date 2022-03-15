
CC=/opt/riscv/bin/riscv32-unknown-elf-gcc
EXE=hello
CFLAGS=-I.

all: profile

compile: $(EXE)
	$(CC) -o $(EXE) hello.c

profile: compile
	cp ../rv8_prof.sh ../pie.sh ./
	./rv8_prof.sh $(EXE)

clean:
	rm $(EXE) *.sh *.svg *.txt

		
