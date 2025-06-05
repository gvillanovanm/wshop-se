li x1, 1
li x2, 0xdeadbeef
add x3, x2, x1
addi a0 x0 1        # print_int ecall
addi a1 x0 42       # integer 42
ecall

li a0, 0x100 # matrix
li a1, 0x00020004
li a2, 0x00FF0000
ecall
