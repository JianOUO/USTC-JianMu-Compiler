	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
.main_label_entry:
# br label %label89
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -178
	b .main_label89
.main_label0:
# %op1 = phi i32 [ %op7, %label11 ], [ undef, %label89 ]
# %op2 = phi i32 [ %op12, %label11 ], [ %op90, %label89 ]
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
# br label %label86
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -170
	ld.w $a0, $fp, -20
	st.w $a0, $fp, -174
	b .main_label86
.main_label5:
# call void @output(i32 %op1)
	ld.w $a0, $fp, -20
	bl output
# ret void
	addi.d $a0, $zero, 0
	b main_exit
.main_label6:
# %op7 = phi i32 [ %op14, %label19 ], [ %op88, %label86 ]
# %op8 = phi i32 [ %op20, %label19 ], [ %op87, %label86 ]
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
# br label %label82
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -158
	ld.w $a0, $fp, -33
	st.w $a0, $fp, -162
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -166
	b .main_label82
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
# %op14 = phi i32 [ %op22, %label27 ], [ %op85, %label82 ]
# %op15 = phi i32 [ %op23, %label27 ], [ %op84, %label82 ]
# %op16 = phi i32 [ %op28, %label27 ], [ %op83, %label82 ]
# %op17 = icmp slt i32 %op16, 2
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -51
# br i1 %op17, label %label18, label %label19
	ld.b $t0, $fp, -51
	bnez $t0, .main_label18
	b .main_label19
.main_label18:
# br label %label78
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -146
	ld.w $a0, $fp, -46
	st.w $a0, $fp, -150
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -154
	b .main_label78
.main_label19:
# %op20 = add i32 %op15, 1
	ld.w $t0, $fp, -46
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -55
# br label %label6
	ld.w $a0, $fp, -42
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -55
	st.w $a0, $fp, -33
	b .main_label6
.main_label21:
# %op22 = phi i32 [ %op30, %label35 ], [ %op81, %label78 ]
# %op23 = phi i32 [ %op31, %label35 ], [ %op80, %label78 ]
# %op24 = phi i32 [ %op36, %label35 ], [ %op79, %label78 ]
# %op25 = icmp slt i32 %op24, 2
	ld.w $t0, $fp, -67
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -68
# br i1 %op25, label %label26, label %label27
	ld.b $t0, $fp, -68
	bnez $t0, .main_label26
	b .main_label27
.main_label26:
# br label %label74
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -134
	ld.w $a0, $fp, -63
	st.w $a0, $fp, -138
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -142
	b .main_label74
.main_label27:
# %op28 = add i32 %op16, 1
	ld.w $t0, $fp, -50
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# br label %label13
	ld.w $a0, $fp, -59
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -63
	st.w $a0, $fp, -46
	ld.w $a0, $fp, -72
	st.w $a0, $fp, -50
	b .main_label13
.main_label29:
# %op30 = phi i32 [ %op38, %label44 ], [ %op77, %label74 ]
# %op31 = phi i32 [ %op39, %label44 ], [ %op76, %label74 ]
# %op32 = phi i32 [ %op45, %label44 ], [ %op75, %label74 ]
# %op33 = icmp slt i32 %op32, 2
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -85
# br i1 %op33, label %label34, label %label35
	ld.b $t0, $fp, -85
	bnez $t0, .main_label34
	b .main_label35
.main_label34:
# br label %label70
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -122
	ld.w $a0, $fp, -80
	st.w $a0, $fp, -126
	ld.w $a0, $fp, -76
	st.w $a0, $fp, -130
	b .main_label70
.main_label35:
# %op36 = add i32 %op24, 1
	ld.w $t0, $fp, -67
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -89
# br label %label21
	ld.w $a0, $fp, -76
	st.w $a0, $fp, -59
	ld.w $a0, $fp, -80
	st.w $a0, $fp, -63
	ld.w $a0, $fp, -89
	st.w $a0, $fp, -67
	b .main_label21
.main_label37:
# %op38 = phi i32 [ %op68, %label48 ], [ %op73, %label70 ]
# %op39 = phi i32 [ %op49, %label48 ], [ %op72, %label70 ]
# %op40 = phi i32 [ %op69, %label48 ], [ %op71, %label70 ]
# %op41 = icmp slt i32 %op40, 2
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 2
	slt $t0, $t0, $t1
	st.b $t0, $fp, -102
# br i1 %op41, label %label42, label %label44
	ld.b $t0, $fp, -102
	bnez $t0, .main_label42
	b .main_label44
.main_label42:
# br i1 %op43, label %label46, label %label48
	ld.w $a0, $fp, -97
	st.w $a0, $fp, -114
	ld.b $t0, $fp, -179
	bnez $t0, .main_label46
	b .main_label48
.main_label44:
# %op45 = add i32 %op32, 1
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -106
# br label %label29
	ld.w $a0, $fp, -93
	st.w $a0, $fp, -76
	ld.w $a0, $fp, -97
	st.w $a0, $fp, -80
	ld.w $a0, $fp, -106
	st.w $a0, $fp, -84
	b .main_label29
.main_label46:
# %op47 = add i32 %op39, 1
	ld.w $t0, $fp, -97
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -110
# br label %label48
	ld.w $a0, $fp, -110
	st.w $a0, $fp, -114
	b .main_label48
.main_label48:
# %op49 = phi i32 [ %op39, %label42 ], [ %op47, %label46 ]
# %op69 = add i32 %op40, 1
	ld.w $t0, $fp, -101
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -118
# br label %label37
	ld.w $a0, $fp, -255
	st.w $a0, $fp, -93
	ld.w $a0, $fp, -114
	st.w $a0, $fp, -97
	ld.w $a0, $fp, -118
	st.w $a0, $fp, -101
	b .main_label37
.main_label70:
# %op71 = phi i32 [ 0, %label34 ]
# %op72 = phi i32 [ %op31, %label34 ]
# %op73 = phi i32 [ %op30, %label34 ]
# br label %label37
	ld.w $a0, $fp, -130
	st.w $a0, $fp, -93
	ld.w $a0, $fp, -126
	st.w $a0, $fp, -97
	ld.w $a0, $fp, -122
	st.w $a0, $fp, -101
	b .main_label37
.main_label74:
# %op75 = phi i32 [ 0, %label26 ]
# %op76 = phi i32 [ %op23, %label26 ]
# %op77 = phi i32 [ %op22, %label26 ]
# br label %label29
	ld.w $a0, $fp, -142
	st.w $a0, $fp, -76
	ld.w $a0, $fp, -138
	st.w $a0, $fp, -80
	ld.w $a0, $fp, -134
	st.w $a0, $fp, -84
	b .main_label29
.main_label78:
# %op79 = phi i32 [ 0, %label18 ]
# %op80 = phi i32 [ %op15, %label18 ]
# %op81 = phi i32 [ %op14, %label18 ]
# br label %label21
	ld.w $a0, $fp, -154
	st.w $a0, $fp, -59
	ld.w $a0, $fp, -150
	st.w $a0, $fp, -63
	ld.w $a0, $fp, -146
	st.w $a0, $fp, -67
	b .main_label21
.main_label82:
# %op83 = phi i32 [ 0, %label10 ]
# %op84 = phi i32 [ %op8, %label10 ]
# %op85 = phi i32 [ %op7, %label10 ]
# br label %label13
	ld.w $a0, $fp, -166
	st.w $a0, $fp, -42
	ld.w $a0, $fp, -162
	st.w $a0, $fp, -46
	ld.w $a0, $fp, -158
	st.w $a0, $fp, -50
	b .main_label13
.main_label86:
# %op87 = phi i32 [ 0, %label4 ]
# %op88 = phi i32 [ %op1, %label4 ]
# br label %label6
	ld.w $a0, $fp, -174
	st.w $a0, $fp, -29
	ld.w $a0, $fp, -170
	st.w $a0, $fp, -33
	b .main_label6
.main_label89:
# %op90 = phi i32 [ 0, %label_entry ]
# %op43 = icmp sgt i32 2, 1
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 1
	slt $t0, $t1, $t0
	st.b $t0, $fp, -179
# %op50 = mul i32 2, 2
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -183
# %op51 = mul i32 %op50, 2
	ld.w $t0, $fp, -183
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -187
# %op52 = mul i32 %op51, 2
	ld.w $t0, $fp, -187
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -191
# %op53 = mul i32 %op52, 2
	ld.w $t0, $fp, -191
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -195
# %op54 = mul i32 %op53, 2
	ld.w $t0, $fp, -195
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -199
# %op55 = mul i32 %op54, 2
	ld.w $t0, $fp, -199
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -203
# %op56 = mul i32 %op55, 2
	ld.w $t0, $fp, -203
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -207
# %op57 = mul i32 %op56, 2
	ld.w $t0, $fp, -207
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -211
# %op58 = mul i32 %op57, 2
	ld.w $t0, $fp, -211
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -215
# %op59 = sdiv i32 %op58, 2
	ld.w $t0, $fp, -215
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -219
# %op60 = sdiv i32 %op59, 2
	ld.w $t0, $fp, -219
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -223
# %op61 = sdiv i32 %op60, 2
	ld.w $t0, $fp, -223
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -227
# %op62 = sdiv i32 %op61, 2
	ld.w $t0, $fp, -227
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -231
# %op63 = sdiv i32 %op62, 2
	ld.w $t0, $fp, -231
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -235
# %op64 = sdiv i32 %op63, 2
	ld.w $t0, $fp, -235
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -239
# %op65 = sdiv i32 %op64, 2
	ld.w $t0, $fp, -239
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -243
# %op66 = sdiv i32 %op65, 2
	ld.w $t0, $fp, -243
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -247
# %op67 = sdiv i32 %op66, 2
	ld.w $t0, $fp, -247
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -251
# %op68 = sdiv i32 %op67, 2
	ld.w $t0, $fp, -251
	addi.w $t1, $zero, 2
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -255
# br label %label0
	ld.w $a0, $fp, -178
	st.w $a0, $fp, -24
	b .main_label0
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
