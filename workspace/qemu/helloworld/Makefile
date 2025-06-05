# interface uses Linux syscalls
# why is it useful?
# --- Debugging and profiling at the application level
# --- early validation of your Linux-user software on RISC-V

# 32 bits 
gcc32:
	riscv64-unknown-elf-gcc -g -O0 -march=rv32i -mabi=ilp32 main.c -o main

qemu32:
	qemu-riscv32-static main

# debug
qemudbg:
	qemu-riscv32-static -g 1234 main

# connect debug
gdbconn:
	riscv64-unknown-elf-gdb main -ex "target remote :1234"

# 64 bits
gcc64:
	riscv64-unknown-elf-gcc -g -march=rv64imac -mabi=lp64 main.c -o main

qemu64:
	qemu-riscv64-static main

clean:
	rm -f *.diss *.o main