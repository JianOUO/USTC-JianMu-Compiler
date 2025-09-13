	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# br label %label1
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -28
	b .main_label1
.main_label1:
# %op2 = phi i32 [ 0, %label_entry ], [ %op31, %label5 ]
# %op3 = phi i32 [ 0, %label_entry ], [ %op30, %label5 ]
# %op4 = icmp slt i32 %op2, %op0
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -20
	slt $t0, $t0, $t1
	st.b $t0, $fp, -29
# br i1 %op4, label %label5, label %label32
	ld.b $t0, $fp, -29
	bnez $t0, .main_label5
	b .main_label32
.main_label5:
# %op6 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -33
# %op7 = fmul float %op6, 0x4002aa9940000000
	fld.s $ft0, $fp, -33
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -37
# %op8 = fmul float %op7, 0x4011781d80000000
	fld.s $ft0, $fp, -37
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -41
# %op9 = fmul float %op8, 0x401962ac40000000
	fld.s $ft0, $fp, -41
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -45
# %op10 = fptosi float %op9 to i32
	fld.s $ft0, $fp, -45
	ftintrz.w.s $ft1, $ft0
	fst.s $ft1, $fp, -49
# %op11 = mul i32 %op10, %op10
	ld.w $t0, $fp, -49
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -53
# %op12 = mul i32 %op11, %op10
	ld.w $t0, $fp, -53
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -57
# %op13 = mul i32 %op12, %op10
	ld.w $t0, $fp, -57
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op14 = mul i32 %op13, %op10
	ld.w $t0, $fp, -61
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -65
# %op15 = mul i32 %op14, %op10
	ld.w $t0, $fp, -65
	ld.w $t1, $fp, -49
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -69
# %op16 = mul i32 %op15, %op15
	ld.w $t0, $fp, -69
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op17 = mul i32 %op16, %op15
	ld.w $t0, $fp, -73
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# %op18 = mul i32 %op17, %op15
	ld.w $t0, $fp, -77
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# %op19 = mul i32 %op18, %op15
	ld.w $t0, $fp, -81
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -85
# %op20 = mul i32 %op19, %op15
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -69
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# %op21 = mul i32 %op20, %op20
	ld.w $t0, $fp, -89
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -93
# %op22 = mul i32 %op21, %op20
	ld.w $t0, $fp, -93
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -97
# %op23 = mul i32 %op22, %op20
	ld.w $t0, $fp, -97
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -101
# %op24 = mul i32 %op23, %op20
	ld.w $t0, $fp, -101
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -105
# %op25 = mul i32 %op24, %op20
	ld.w $t0, $fp, -105
	ld.w $t1, $fp, -89
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -109
# %op26 = mul i32 %op25, %op25
	ld.w $t0, $fp, -109
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -113
# %op27 = mul i32 %op26, %op25
	ld.w $t0, $fp, -113
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -117
# %op28 = mul i32 %op27, %op25
	ld.w $t0, $fp, -117
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -121
# %op29 = mul i32 %op28, %op25
	ld.w $t0, $fp, -121
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -125
# %op30 = mul i32 %op29, %op25
	ld.w $t0, $fp, -125
	ld.w $t1, $fp, -109
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -129
# %op31 = add i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -133
# br label %label1
	ld.w $a0, $fp, -133
	st.w $a0, $fp, -24
	ld.w $a0, $fp, -129
	st.w $a0, $fp, -28
	b .main_label1
.main_label32:
# call void @output(i32 %op3)
	ld.w $a0, $fp, -28
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
