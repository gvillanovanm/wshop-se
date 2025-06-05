
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	call	scan_led_matrix
	li	a5,0
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra

scan_led_matrix:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	zero,-20(s0)
	j	.L4
.L7:
	sw	zero,-24(s0)
	j	.L5
.L6:
	lw	a5,-20(s0)
	slli	a4,a5,16
	lw	a5,-24(s0)
	slli	a5,a5,16
	srli	a5,a5,16
	or	a5,a4,a5
	sw	a5,-28(s0)
	lw	a5,-28(s0)
 #APP
# 20 "blinky.c" 1
	li   a0, 0x100       
mv   a1, a5          
li   a2, 0x00FF0000  
ecall                

# 0 "" 2
 #NO_APP
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L5:
	lw	a4,-24(s0)
	li	a5,7
	ble	a4,a5,.L6
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L4:
	lw	a4,-20(s0)
	li	a5,7
	ble	a4,a5,.L7
	nop
	nop
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
