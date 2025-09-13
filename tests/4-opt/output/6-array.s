	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -72
# store i32 11, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -80
# store i32 22, i32* %op2
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 9
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -88
# store i32 33, i32* %op3
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op4 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -89
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -89
	bnez $t0, .main_label5
	b .main_label6
.main_label5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label6
	b .main_label6
.main_label6:
# %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -97
# %op8 = load i32, i32* %op7
	ld.d $t0, $fp, -97
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -101
# call void @output(i32 %op8)
	ld.w $a0, $fp, -101
	bl output
# %op9 = icmp slt i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -102
# br i1 %op9, label %label10, label %label11
	ld.b $t0, $fp, -102
	bnez $t0, .main_label10
	b .main_label11
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label11
	b .main_label11
.main_label11:
# %op12 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -110
# %op13 = load i32, i32* %op12
	ld.d $t0, $fp, -110
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -114
# call void @output(i32 %op13)
	ld.w $a0, $fp, -114
	bl output
# %op14 = icmp slt i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -115
# br i1 %op14, label %label15, label %label16
	ld.b $t0, $fp, -115
	bnez $t0, .main_label15
	b .main_label16
.main_label15:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label16
	b .main_label16
.main_label16:
# %op17 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 9
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -123
# %op18 = load i32, i32* %op17
	ld.d $t0, $fp, -123
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -127
# call void @output(i32 %op18)
	ld.w $a0, $fp, -127
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
