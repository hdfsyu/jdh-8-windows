CC=gcc
LD=gcc
HXDP=xxd

CCFLAGS=-std=c11 -O0 -g -Wall -Wextra -Wpedantic -Wstrict-aliasing -IC:/cdevlibs/include/ -v
CCFLAGS+=-Wno-pointer-arith -Wno-unused-parameter
CCFLAGS+=-Wno-gnu-zero-variadic-macro-arguments
LDFLAGS=

EMULD=-LC:/cdevlibs/lib -lmingw32 -lsdl2main -lsdl2 -lws2_32
ASMLD=
TESTLD=

BUILTIN_MACROS_ASM=asm/macros.asm
BUILTIN_MACROS_C=asm/builtin_macros.c

EMU_SRC=$(wildcard emu/*.c)
EMU_OBJ=$(EMU_SRC:.c=.o)
EMU_WIN_SRC=$(wildcard emu/win/*.c)
EMU_WIN_OBJ=$(EMU_WIN_SRC:.c=.o)

ASM_SRC=$(wildcard asm/*.c)
ASM_OBJ=$(ASM_SRC:.c=.o)

TEST_SRC=$(wildcard test/*.c)
TEST_OBJ=$(TEST_SRC:.c=.o)
TEST_OBJ+=emu/libemu.o

EMU=bin/emu
ASM=bin/asm
TEST=bin/test

all: emu asm test

clean:
	rm -f ./bin/*
	rmdir ./bin
	rm -f ./**/*.o

%.o: %.c
	$(CC) -o $@ -c $< $(CCFLAGS)

dirs:
	if not exist bin mkdir bin

emu: dirs $(EMU_OBJ) $(EMU_WIN_OBJ)
	$(LD) -o $(EMU) $(LDFLAGS) $(filter %.o, $^) $(EMULD)

builtin_macros:
	$(HXDP) -i $(BUILTIN_MACROS_ASM) > $(BUILTIN_MACROS_C)

asm: dirs builtin_macros $(ASM_OBJ)
	$(LD) -o $(ASM) $(ASMLD) $(LDFLAGS) $(filter %.o, $^) $(BUILTIN_MACROS_O)

test: dirs asm $(TEST_OBJ)
	$(LD) -o $(TEST) $(TESTLD) $(LDFLAGS) $(filter %.o, $^)