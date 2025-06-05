GCC = riscv64-unknown-elf-gcc

mlib:
	@echo '# -------------------------------'
	@echo '# ISAs supportadas no multi-lib: '
	@echo '# -------------------------------'
	@$(GCC) --print-multi-lib

# eg of modularity RV32
rv32all: rv32i rv32im rv32if rv32imf rv32ima rv32imac

rv32i:
	$(GCC) -march=rv32i_zicsr -mabi=ilp32 -O0 -S main.c -o main_rv32i_zicsr.s

rv32im:
	$(GCC) -march=rv32im -mabi=ilp32 -O0 -S main.c -o main_rv32im.s

rv32if:
	$(GCC) -march=rv32if -mabi=ilp32 -O0 -S main.c -o main_rv32if.s

rv32imf:
	$(GCC) -march=rv32imf -mabi=ilp32 -O0 -S main.c -o main_rv32imf.s

rv32ima:
	$(GCC) -march=rv32ima -mabi=ilp32 -O0 -S main.c -o main_rv32ima.s

rv32imac:
	$(GCC) -march=rv32imac -mabi=ilp32 -O0 -S main.c -o main_rv32imac.s

# eg of modularity RV64
rv64all: rv64i rv64im rv64if rv64imf rv64ima rv64imac

rv64i:
	$(GCC) -march=rv64i -mabi=lp64 -O0 -S main.c -o main_rv64i.s

rv64im:
	$(GCC) -march=rv64im -mabi=lp64 -O0 -S main.c -o main_rv64im.s

rv64if:
	$(GCC) -march=rv64if -mabi=lp64 -O0 -S main.c -o main_rv64if.s

rv64imf:
	$(GCC) -march=rv64imf -mabi=lp64 -O0 -S main.c -o main_rv64imf.s

rv64ima:
	$(GCC) -march=rv64ima -mabi=lp64 -O0 -S main.c -o main_rv64ima.s

rv64imac:
	$(GCC) -march=rv64imac -mabi=lp64 -O0 -S main.c -o main_rv64imac.s

# clean
clean:
	rm -f *.s