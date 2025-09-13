	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# br label %label0
	addi.w $a0, $zero, 1
	st.w $a0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 1, %label_entry ], [ %op32, %label31 ]
# %op2 = phi i32 [ %op8, %label31 ], [ undef, %label_entry ]
# %op3 = icmp slt i32 %op1, 10000
	ld.w $t0, $fp, -20
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op3, label %label4, label %label5
	ld.b $t0, $fp, -25
	bnez $t0, .main_label4
	b .main_label5
.main_label4:
# br label %label6
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -24
	st.w $a0, $fp, -33
	b .main_label6
.main_label5:
# call void @output(i32 %op2)
	ld.w $a0, $fp, -24
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
.main_label6:
# %op7 = phi i32 [ 0, %label4 ], [ %op30, %label10 ]
# %op8 = phi i32 [ %op2, %label4 ], [ %op29, %label10 ]
# %op9 = icmp slt i32 %op7, 10000
	ld.w $t0, $fp, -29
	lu12i.w $t1, 2
	ori $t1, $t1, 1808
	slt $t0, $t0, $t1
	st.b $t0, $fp, -34
# br i1 %op9, label %label10, label %label31
	ld.b $t0, $fp, -34
	bnez $t0, .main_label10
	b .main_label31
.main_label10:
# %op11 = mul i32 %op1, %op1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# %op12 = mul i32 %op11, %op1
	ld.w $t0, $fp, -38
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# %op13 = mul i32 %op12, %op1
	ld.w $t0, $fp, -42
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -46
# %op14 = mul i32 %op13, %op1
	ld.w $t0, $fp, -46
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -50
# %op15 = mul i32 %op14, %op1
	ld.w $t0, $fp, -50
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -54
# %op16 = mul i32 %op15, %op1
	ld.w $t0, $fp, -54
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -58
# %op17 = mul i32 %op16, %op1
	ld.w $t0, $fp, -58
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -62
# %op18 = mul i32 %op17, %op1
	ld.w $t0, $fp, -62
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -66
# %op19 = mul i32 %op18, %op1
	ld.w $t0, $fp, -66
	ld.w $t1, $fp, -20
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -70
# %op20 = sdiv i32 %op19, %op1
	ld.w $t0, $fp, -70
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -74
# %op21 = sdiv i32 %op20, %op1
	ld.w $t0, $fp, -74
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -78
# %op22 = sdiv i32 %op21, %op1
	ld.w $t0, $fp, -78
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -82
# %op23 = sdiv i32 %op22, %op1
	ld.w $t0, $fp, -82
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -86
# %op24 = sdiv i32 %op23, %op1
	ld.w $t0, $fp, -86
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -90
# %op25 = sdiv i32 %op24, %op1
	ld.w $t0, $fp, -90
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# %op26 = sdiv i32 %op25, %op1
	ld.w $t0, $fp, -94
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -98
# %op27 = sdiv i32 %op26, %op1
	ld.w $t0, $fp, -98
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -102
# %op28 = sdiv i32 %op27, %op1
	ld.w $t0, $fp, -102
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -106
# %op29 = sdiv i32 %op28, %op1
	ld.w $t0, $fp, -106
	ld.w $t1, $fp, -20
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -110
# %op30 = add i32 %op7, 1
	ld.w $t0, $fp, -29
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# br label %label6
	ld.w $a0, $fp, -114
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -110
	st.w $a0, $fp, -33
	b .main_label6
.main_label31:
# %op32 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# br label %label0
	ld.w $a0, $fp, -118
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -24
	b .main_label0
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
