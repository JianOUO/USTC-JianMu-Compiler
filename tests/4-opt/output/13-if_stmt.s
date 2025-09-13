	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp ne i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	xor $t0, $t0, $t1
	sltui $t0, $t0, 1
	slti $t0, $t0, 1
	st.b $t0, $fp, -17
# br i1 %op0, label %label1, label %label2
	ld.b $t0, $fp, -17
	bnez $t0, .main_label1
	b .main_label2
.main_label1:
# br label %label2
	b .main_label2
.main_label2:
# ret void
	addi.d $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
