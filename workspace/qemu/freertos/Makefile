freertos_compil:
	make -C FreeRTOS/FreeRTOS/Demo/RISC-V_RV32_QEMU_VIRT_GCC/build/gcc DEBUG=1 # debug symbols for gdb

available_riscv:
	ls FreeRTOS/FreeRTOS/Demo | grep -i riscv*

# Running 32 bits
run:
	qemu-system-riscv32 \
  -machine virt,aclint=on \
  -cpu rv32 \
  -m 128M \
  -nographic -serial mon:stdio \
  -bios none \
  -kernel FreeRTOS/FreeRTOS/Demo/RISC-V_RV32_QEMU_VIRT_GCC/build/gcc/output/RTOSDemo.elf

open_dgb:
	qemu-system-riscv32 -machine virt -bios none \
		-kernel FreeRTOS/FreeRTOS/Demo/RISC-V_RV32_QEMU_VIRT_GCC/build/gcc/output/RTOSDemo.elf \
		-nographic -S -s

entry:
	riscv64-unknown-elf-gdb FreeRTOS/FreeRTOS/Demo/RISC-V_RV32_QEMU_VIRT_GCC/build/gcc/output/RTOSDemo.elf

# on terminal directly
# riscv64-unknown-elf-gdb build/gcc/output/RTOSDemo.elf
# (gdb) target remote :1234
# (gdb) load          # not strictly needed, but good practice
# (gdb) break main
# (gdb) c

freertos_installation:
	git clone --recurse-submodules https://github.com/FreeRTOS/FreeRTOS.git
	ls FreeRTOS/Demo | grep -i riscv*

