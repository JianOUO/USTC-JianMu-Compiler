# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t0, $t1, $t0
	st.b $t0, $fp, -25
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -25
	bnez $t0, .max_label3
	b .max_label4
.max_label3:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	b max_exit
.max_label4:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	b max_exit
max_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	xor $t3, $t0, $t1
	sltui $t3, $t3, 1
	or $t0, $t2, $t3
	st.b $t0, $fp, -25
# br i1 %op2, label %label3, label %label4
	ld.b $t0, $fp, -25
	bnez $t0, .knapsack_label3
	b .knapsack_label4
.knapsack_label3:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label4:
# %op5 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t0, $t0, $t1
	sltui $t0, $t0, 1
	st.b $t0, $fp, -26
# br i1 %op5, label %label6, label %label7
	ld.b $t0, $fp, -26
	bnez $t0, .knapsack_label6
	b .knapsack_label7
.knapsack_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	b knapsack_exit
.knapsack_label7:
# %op8 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -30
# %op9 = add i32 %op8, %arg1
	ld.w $t0, $fp, -30
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op10 = icmp slt i32 %op9, 0
	ld.w $t0, $fp, -34
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -35
# br i1 %op10, label %label11, label %label12
	ld.b $t0, $fp, -35
	bnez $t0, .knapsack_label11
	b .knapsack_label12
.knapsack_label11:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label12
	b .knapsack_label12
.knapsack_label12:
# %op13 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op9
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -34
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -43
# %op14 = load i32, i32* %op13
	ld.d $t0, $fp, -43
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -47
# %op15 = icmp sge i32 %op14, 0
	ld.w $t0, $fp, -47
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	slti $t0, $t0, 1
	st.b $t0, $fp, -48
# br i1 %op15, label %label16, label %label20
	ld.b $t0, $fp, -48
	bnez $t0, .knapsack_label16
	b .knapsack_label20
.knapsack_label16:
# %op17 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op18 = add i32 %op17, %arg1
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op19 = icmp slt i32 %op18, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -57
# br i1 %op19, label %label23, label %label24
	ld.b $t0, $fp, -57
	bnez $t0, .knapsack_label23
	b .knapsack_label24
.knapsack_label20:
# %op21 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -61
# %op22 = icmp slt i32 %op21, 0
	ld.w $t0, $fp, -61
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -62
# br i1 %op22, label %label27, label %label28
	ld.b $t0, $fp, -62
	bnez $t0, .knapsack_label27
	b .knapsack_label28
.knapsack_label23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label24
	b .knapsack_label24
.knapsack_label24:
# %op25 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op18
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -56
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -70
# %op26 = load i32, i32* %op25
	ld.d $t0, $fp, -70
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -74
# ret i32 %op26
	ld.w $a0, $fp, -74
	b knapsack_exit
.knapsack_label27:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label28
	b .knapsack_label28
.knapsack_label28:
# %op29 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op21
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -61
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -82
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -82
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -86
# %op31 = icmp slt i32 %arg1, %op30
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -86
	slt $t0, $t0, $t1
	st.b $t0, $fp, -87
# br i1 %op31, label %label32, label %label35
	ld.b $t0, $fp, -87
	bnez $t0, .knapsack_label32
	b .knapsack_label35
.knapsack_label32:
# %op33 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -91
# %op34 = call i32 @knapsack(i32 %op33, i32 %arg1)
	ld.w $a0, $fp, -91
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -95
# br label %label40
	ld.w $a0, $fp, -95
	st.w $a0, $fp, -112
	b .knapsack_label40
.knapsack_label35:
# %op36 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -99
# %op37 = call i32 @knapsack(i32 %op36, i32 %arg1)
	ld.w $a0, $fp, -99
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -103
# %op38 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -107
# %op39 = icmp slt i32 %op38, 0
	ld.w $t0, $fp, -107
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -108
# br i1 %op39, label %label45, label %label46
	ld.b $t0, $fp, -108
	bnez $t0, .knapsack_label45
	b .knapsack_label46
.knapsack_label40:
# %op41 = phi i32 [ %op34, %label32 ], [ %op59, %label53 ]
# %op42 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op43 = add i32 %op42, %arg1
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op44 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op43
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -120
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -128
# store i32 %op41, i32* %op44
	ld.d $t0, $fp, -128
	ld.w $t1, $fp, -112
	st.w $t1, $t0, 0
# ret i32 %op41
	ld.w $a0, $fp, -112
	b knapsack_exit
.knapsack_label45:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label46
	b .knapsack_label46
.knapsack_label46:
# %op47 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op38
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -107
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -136
# %op48 = load i32, i32* %op47
	ld.d $t0, $fp, -136
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -140
# %op49 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -144
# %op50 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op51 = icmp slt i32 %op50, 0
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 0
	slt $t0, $t0, $t1
	st.b $t0, $fp, -149
# br i1 %op51, label %label52, label %label53
	ld.b $t0, $fp, -149
	bnez $t0, .knapsack_label52
	b .knapsack_label53
.knapsack_label52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label53
	b .knapsack_label53
.knapsack_label53:
# %op54 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op50
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -148
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -157
# %op55 = load i32, i32* %op54
	ld.d $t0, $fp, -157
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -161
# %op56 = sub i32 %arg1, %op55
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -161
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -165
# %op57 = call i32 @knapsack(i32 %op49, i32 %op56)
	ld.w $a0, $fp, -144
	ld.w $a1, $fp, -165
	bl knapsack
	st.w $a0, $fp, -169
# %op58 = add i32 %op57, %op48
	ld.w $t0, $fp, -169
	ld.w $t1, $fp, -140
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -173
# %op59 = call i32 @max(i32 %op37, i32 %op58)
	ld.w $a0, $fp, -103
	ld.w $a1, $fp, -173
	bl max
	st.w $a0, $fp, -177
# br label %label40
	ld.w $a0, $fp, -177
	st.w $a0, $fp, -112
	b .knapsack_label40
knapsack_exit:
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
	addi.d $sp, $sp, -144
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -24
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 1
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -32
# store i32 2, i32* %op1
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 2
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -40
# store i32 6, i32* %op2
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 3
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -48
# store i32 5, i32* %op3
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -56
# store i32 4, i32* %op4
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op5 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 0
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -64
# store i32 6, i32* %op5
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op6 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 1
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -72
# store i32 3, i32* %op6
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op7 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 2
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -80
# store i32 5, i32* %op7
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op8 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 3
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -88
# store i32 4, i32* %op8
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op9 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 20
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	addi.w $t2, $zero, 4
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -96
# store i32 6, i32* %op9
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label21
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -129
	b .main_label21
.main_label10:
# %op11 = phi i32 [ %op16, %label13 ], [ %op22, %label21 ]
# %op12 = icmp slt i32 %op11, 66
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 66
	slt $t0, $t0, $t1
	st.b $t0, $fp, -101
# br i1 %op12, label %label13, label %label17
	ld.b $t0, $fp, -101
	bnez $t0, .main_label13
	b .main_label17
.main_label13:
# %op14 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op11
	la.local $t0, dp
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 264
	mul.d $t1, $t1, $t2
	add.d $t0, $t0, $t1
	ld.w $t2, $fp, -100
	addi.d $t3, $zero, 4
	mul.d $t2, $t2, $t3
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -109
# store i32 %op15, i32* %op14
	ld.d $t0, $fp, -109
	ld.w $t1, $fp, -133
	st.w $t1, $t0, 0
# %op16 = add i32 %op11, 1
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -113
# br label %label10
	ld.w $a0, $fp, -113
	st.w $a0, $fp, -100
	b .main_label10
.main_label17:
# %op18 = load i32, i32* @n
	la.local $t0, n
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -117
# %op19 = load i32, i32* @m
	la.local $t0, m
	ld.w $t0, $t0, 0
	st.w $t0, $fp, -121
# %op20 = call i32 @knapsack(i32 %op18, i32 %op19)
	ld.w $a0, $fp, -117
	ld.w $a1, $fp, -121
	bl knapsack
	st.w $a0, $fp, -125
# call void @output(i32 %op20)
	ld.w $a0, $fp, -125
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
.main_label21:
# %op22 = phi i32 [ 0, %label_entry ]
# %op15 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -133
# br label %label10
	ld.w $a0, $fp, -129
	st.w $a0, $fp, -100
	b .main_label10
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
