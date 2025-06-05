## Default configuration
gcc_default:
	@riscv64-unknown-elf-gcc -g -o main main.c
	@riscv64-unknown-elf-objdump -d main > main.dis

sim:
	@spike pk main

sim_dbg:
	@spike -d --log=exec.log pk main

sim_help:
	@spike -h

## Custom configuration: rv64imac/lp64;@march=rv64imac@mabi=lp64
gcc_imac:
	@riscv64-unknown-elf-gcc -march=rv64imac -mabi=lp64 -o main main.c
	@riscv64-unknown-elf-objdump -d main > main.dis

## Custom configuration 2: rv64imafdc/lp64d;@march=rv64imafdc@mabi=lp64d
gcc_g:
	@riscv64-unknown-elf-gcc -march=rv64imafdc -mabi=lp64d -o main main.c

## Utils
readelf_all:
	@riscv64-unknown-elf-readelf main -a
	@riscv64-unknown-elf-readelf main -a | grep -i tag_riscv 

readelf_sections:
	@riscv64-unknown-elf-readelf -S main
	
# NOTE:
# pk : for 32 bits we need the 32b toolchain, because, pk is not multilib