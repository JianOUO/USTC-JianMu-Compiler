	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -24
	b .main_label0
.main_label0:
# %op1 = phi i32 [ %op7, %label11 ], [ undef, %label_entry ]
# %op2 = phi i32 [ 0, %label_entry ], [ %op12, %label11 ]
# %op3 = icmp slt i32 %op2, 1000000
	ld.w $t0, $fp, -24
	lu12i.w $t1, 244
	ori $t1, $t1, 576
	slt $t0, $t0, $t1
	st.b $t0, $fp, -25
# br i1 %op3, label %label4, label %label5
	ld.b $t0, $fp, -25
	bnez $t0, .main_label4
	b .main_label5
.main_label4:
# br label %label6
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -29
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -33
	b .main_label6
.main_label5:
# call void @output(i32 %op1)
	ld.w $a0, $fp, -20
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
.main_label6:
# %op7 = phi i32 [ %op1, %label4 ], [ %op14, %label18 ]
# %op8 = phi i32 [ 0, %label4 ], [ %op19, %label18 ]
# %op9 = icmp slt i32 %op8, 2
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -34
# br i1 %op9, label %label10, label %label11
	ld.b $t0, $fp, -34
	bnez $t0, .main_label10
	b .main_label11
.main_label10:
# br label %label13
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -42
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -46
	b .main_label13
.main_label11:
# %op12 = add i32 %op2, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -38
# br label %label0
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -20
	ld.w $a0, $fp, -38
	st.w $a0, $fp, -24
	b .main_label0
.main_label13:
# %op14 = phi i32 [ %op7, %label10 ], [ %op21, %label25 ]
# %op15 = phi i32 [ 0, %label10 ], [ %op26, %label25 ]
# %op16 = icmp slt i32 %op15, 2
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -47
# br i1 %op16, label %label17, label %label18
	ld.b $t0, $fp, -47
	bnez $t0, .main_label17
	b .main_label18
.main_label17:
# br label %label20
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -55
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -59
	b .main_label20
.main_label18:
# %op19 = add i32 %op8, 1
	ld.w $t0, $fp, -33
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -51
# br label %label6
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -51
	st.w $a0, $fp, -33
	b .main_label6
.main_label20:
# %op21 = phi i32 [ %op14, %label17 ], [ %op28, %label32 ]
# %op22 = phi i32 [ 0, %label17 ], [ %op33, %label32 ]
# %op23 = icmp slt i32 %op22, 2
	ld.w $t0, $fp, -59
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -60
# br i1 %op23, label %label24, label %label25
	ld.b $t0, $fp, -60
	bnez $t0, .main_label24
	b .main_label25
.main_label24:
# br label %label27
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -68
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -72
	b .main_label27
.main_label25:
# %op26 = add i32 %op15, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# br label %label13
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -64
	st.w $a0, $fp, -46
	b .main_label13
.main_label27:
# %op28 = phi i32 [ %op21, %label24 ], [ %op35, %label59 ]
# %op29 = phi i32 [ 0, %label24 ], [ %op60, %label59 ]
# %op30 = icmp slt i32 %op29, 2
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -73
# br i1 %op30, label %label31, label %label32
	ld.b $t0, $fp, -73
	bnez $t0, .main_label31
	b .main_label32
.main_label31:
# br label %label34
	ld.w $a0, $fp, -68
	st.w $a0, $fp, -81
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -85
	b .main_label34
.main_label32:
# %op33 = add i32 %op22, 1
	ld.w $t0, $fp, -59
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -77
# br label %label20
	ld.w $a0, $fp, -68
	st.w $a0, $fp, -55
	ld.w $a0, $fp, -77
	st.w $a0, $fp, -59
	b .main_label20
.main_label34:
# %op35 = phi i32 [ %op28, %label31 ], [ %op57, %label38 ]
# %op36 = phi i32 [ 0, %label31 ], [ %op58, %label38 ]
# %op37 = icmp slt i32 %op36, 2
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -86
# br i1 %op37, label %label38, label %label59
	ld.b $t0, $fp, -86
	bnez $t0, .main_label38
	b .main_label59
.main_label38:
# %op39 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -90
# %op40 = mul i32 %op39, 2
	ld.w $t0, $fp, -90
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -94
# %op41 = mul i32 %op40, 2
	ld.w $t0, $fp, -94
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -98
# %op42 = mul i32 %op41, 2
	ld.w $t0, $fp, -98
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -102
# %op43 = mul i32 %op42, 2
	ld.w $t0, $fp, -102
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -106
# %op44 = mul i32 %op43, 2
	ld.w $t0, $fp, -106
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -110
# %op45 = mul i32 %op44, 2
	ld.w $t0, $fp, -110
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -114
# %op46 = mul i32 %op45, 2
	ld.w $t0, $fp, -114
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# %op47 = mul i32 %op46, 2
	ld.w $t0, $fp, -118
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -122
# %op48 = sdiv i32 %op47, 2
	ld.w $t0, $fp, -122
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -126
# %op49 = sdiv i32 %op48, 2
	ld.w $t0, $fp, -126
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -130
# %op50 = sdiv i32 %op49, 2
	ld.w $t0, $fp, -130
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -134
# %op51 = sdiv i32 %op50, 2
	ld.w $t0, $fp, -134
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -138
# %op52 = sdiv i32 %op51, 2
	ld.w $t0, $fp, -138
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -142
# %op53 = sdiv i32 %op52, 2
	ld.w $t0, $fp, -142
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -146
# %op54 = sdiv i32 %op53, 2
	ld.w $t0, $fp, -146
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -150
# %op55 = sdiv i32 %op54, 2
	ld.w $t0, $fp, -150
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -154
# %op56 = sdiv i32 %op55, 2
	ld.w $t0, $fp, -154
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -158
# %op57 = sdiv i32 %op56, 2
	ld.w $t0, $fp, -158
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -162
# %op58 = add i32 %op36, 1
	ld.w $t0, $fp, -85
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -166
# br label %label34
	ld.w $a0, $fp, -162
	st.w $a0, $fp, -81
	ld.w $a0, $fp, -166
	st.w $a0, $fp, -85
	b .main_label34
.main_label59:
# %op60 = add i32 %op29, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -170
# br label %label27
	ld.w $a0, $fp, -81
	st.w $a0, $fp, -68
	ld.w $a0, $fp, -170
	st.w $a0, $fp, -72
	b .main_label27
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
