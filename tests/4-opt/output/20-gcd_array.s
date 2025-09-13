# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	xor $t0, $t0, $t1
	sltui $t0, $t0, 1
	st.b $t0, $fp, -25
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -25
	bnez $t0, .gcd_label3
	b .gcd_label4
.gcd_label3:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b gcd_exit
.gcd_label4:
# %op5 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# %op6 = mul i32 %op5, %arg1
	ld.w $t0, $fp, -29
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -33
# %op7 = sub i32 %arg0, %op6
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -33
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -37
# %op8 = call i32 @gcd(i32 %arg1, i32 %op7)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -37
	bl gcd
	st.w $a0, $fp, -41
# ret i32 %op8
	ld.w $a0, $fp, -41
	b gcd_exit
gcd_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -33
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -33
	bnez $t0, .funArray_label3
	b .funArray_label4
.funArray_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label4
	b .funArray_label4
.funArray_label4:
# %op5 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -41
# %op6 = load i32, i32* %op5
	ld.d $t0, $fp, -41
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -45
# %op7 = icmp slt i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -46
# br i1 %op7, label %label8, label %label9
	ld.b $t0, $fp, -46
	bnez $t0, .funArray_label8
	b .funArray_label9
.funArray_label8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label9
	b .funArray_label9
.funArray_label9:
# %op10 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 0
	addi.d $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -54
# %op11 = load i32, i32* %op10
	ld.d $t0, $fp, -54
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -58
# %op12 = icmp slt i32 %op6, %op11
	ld.w $t0, $fp, -45
	ld.w $t1, $fp, -58
	slt $t0, $t0, $t1
	st.b $t0, $fp, -59
# br i1 %op12, label %label13, label %label14
	ld.w $a0, $fp, -58
	st.w $a0, $fp, -63
	ld.w $a0, $fp, -45
	st.w $a0, $fp, -67
	ld.b $t0, $fp, -59
	bnez $t0, .funArray_label13
	b .funArray_label14
.funArray_label13:
# br label %label14
	ld.w $a0, $fp, -45
	st.w $a0, $fp, -63
	ld.w $a0, $fp, -58
	st.w $a0, $fp, -67
	b .funArray_label14
.funArray_label14:
# %op15 = phi i32 [ %op11, %label9 ], [ %op6, %label13 ]
# %op16 = phi i32 [ %op6, %label9 ], [ %op11, %label13 ]
# %op17 = call i32 @gcd(i32 %op16, i32 %op15)
	ld.w $a0, $fp, -67
	ld.w $a1, $fp, -63
	bl gcd
	st.w $a0, $fp, -71
# ret i32 %op17
	ld.w $a0, $fp, -71
	b funArray_exit
funArray_exit:
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
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -24
# store i32 90, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op1 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -32
# store i32 18, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op2 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -40
# %op3 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -48
# %op4 = call i32 @funArray(i32* %op2, i32* %op3)
	ld.d $a0, $fp, -40
	ld.d $a1, $fp, -48
	bl funArray
	st.w $a0, $fp, -52
# ret i32 %op4
	ld.w $a0, $fp, -52
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
