#
#
# === SIMPLE C MAKEFILE ===
#
# SOURCE - https://github.com/Saturn7569/helpful-scripts/
# VERSION - 0.1.0
# AUTHOR - Saturn7569
#
# == NOTE ==
# 	The compiling should work on all operating systems, however the
# 	clean rule uses POSIX commands and will not work on windows
#
#

# Put all your C files here
CFILES=$(wildcard src/*.c)

# Convert our C files to object files
# You can replace this wildcard but this should automatically get all of the C files
OFILES=$(CFILES:.c=.o)

# Your C compiler and linker
CC=gcc
LD=gcc

# Flags for the compiler
CCFLAGS=-Wall -Wextra
LDFLAGS=

CCFLAGS_DEBUG=-DDEBUG
CCFLAGS_RELEASE=-DRELEASE -O2

LDFLAGS_DEBUG=
LDFLAGS_RELEASE=

# Name your executable
EXE=namehere

.PHONY: all debug release clean

# The all rule compiles debug by default
all: debug

debug: CCFLAGS += $(CCFLAGS_DEBUG)
debug: LDFLAGS += $(LDFLAGS_DEBUG)
debug: $(OFILES)
	@echo " [LD] $(EXE)"
	@$(CC) -o $(EXE) $(OFILES) $(LDFLAGS)

release: CCFLAGS += $(CCFLAGS_RELEASE)
release: LDFLAGS += $(LDFLAGS_RELEASE)
release: $(OFILES)
	@echo " [LD] $(EXE)"
	@$(CC) -o $(EXE) $(OFILES) $(LDFLAGS)

clean:
	@echo " [RM] $(EXE)"
	@rm -rf $(EXE) $(OFILES)

%.o: %.c
	@echo " [CC] $<"
	@gcc -c $(CCFLAGS) -o $@ $<
