	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 3
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -72
# store i32 1234, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 1234
	st.w $t1, $t0, 0
# %op2 = icmp slt i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -73
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -73
	bnez $t0, .main_label3
	b .main_label4
.main_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label4
	b .main_label4
.main_label4:
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 3
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -81
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -81
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -85
# ret i32 %op6
	ld.w $a0, $fp, -85
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
