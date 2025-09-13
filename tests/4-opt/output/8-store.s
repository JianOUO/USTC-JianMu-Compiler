	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = getelementptr i32, i32* %arg0, i32 %arg1
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -28
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -40
# store i32 %arg2, i32* %op3
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	b store_exit
store_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
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
# br label %label23
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -115
	b .main_label23
.main_label1:
# %op2 = phi i32 [ %op8, %label4 ], [ %op24, %label23 ]
# %op3 = icmp slt i32 %op2, 10
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 10
	slt $t0, $t0, $t1
	st.b $t0, $fp, -69
# br i1 %op3, label %label4, label %label9
	ld.b $t0, $fp, -69
	bnez $t0, .main_label4
	b .main_label9
.main_label4:
# %op6 = mul i32 %op2, 2
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -73
# %op7 = call i32 @store(i32* %op5, i32 %op2, i32 %op6)
	ld.d $a0, $fp, -123
	ld.w $a1, $fp, -68
	ld.w $a2, $fp, -73
	bl store
	st.w $a0, $fp, -77
# %op8 = add i32 %op2, 1
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -81
# br label %label1
	ld.w $a0, $fp, -81
	st.w $a0, $fp, -68
	b .main_label1
.main_label9:
# br label %label10
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -85
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -89
	b .main_label10
.main_label10:
# %op11 = phi i32 [ 0, %label9 ], [ %op21, %label18 ]
# %op12 = phi i32 [ 0, %label9 ], [ %op22, %label18 ]
# %op13 = icmp slt i32 %op12, 10
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 10
	slt $t0, $t0, $t1
	st.b $t0, $fp, -90
# br i1 %op13, label %label14, label %label16
	ld.b $t0, $fp, -90
	bnez $t0, .main_label14
	b .main_label16
.main_label14:
# %op15 = icmp slt i32 %op12, 0
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -91
# br i1 %op15, label %label17, label %label18
	ld.b $t0, $fp, -91
	bnez $t0, .main_label17
	b .main_label18
.main_label16:
# call void @output(i32 %op11)
	ld.w $a0, $fp, -85
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label18
	b .main_label18
.main_label18:
# %op19 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op12
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -89
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -99
# %op20 = load i32, i32* %op19
	ld.d $t0, $fp, -99
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -103
# %op21 = add i32 %op11, %op20
	ld.w $t0, $fp, -85
	ld.w $t1, $fp, -103
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op22 = add i32 %op12, 1
	ld.w $t0, $fp, -89
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -111
# br label %label10
	ld.w $a0, $fp, -107
	st.w $a0, $fp, -85
	ld.w $a0, $fp, -111
	st.w $a0, $fp, -89
	b .main_label10
.main_label23:
# %op24 = phi i32 [ 0, %label_entry ]
# %op5 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 40
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -123
# br label %label1
	ld.w $a0, $fp, -115
	st.w $a0, $fp, -68
	b .main_label1
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
