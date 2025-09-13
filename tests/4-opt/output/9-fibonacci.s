	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	xor $t0, $t0, $t1
	sltui $t0, $t0, 1
	st.b $t0, $fp, -21
# br i1 %op1, label %label2, label %label3
	ld.b $t0, $fp, -21
	bnez $t0, .fibonacci_label2
	b .fibonacci_label3
.fibonacci_label2:
# ret i32 0
	addi.w $a0, $zero, 0
	b fibonacci_exit
.fibonacci_label3:
# %op4 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	xor $t0, $t0, $t1
	sltui $t0, $t0, 1
	st.b $t0, $fp, -22
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -22
	bnez $t0, .fibonacci_label5
	b .fibonacci_label6
.fibonacci_label5:
# ret i32 1
	addi.w $a0, $zero, 1
	b fibonacci_exit
.fibonacci_label6:
# %op7 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -26
# %op8 = call i32 @fibonacci(i32 %op7)
	ld.w $a0, $fp, -26
	bl fibonacci
	st.w $a0, $fp, -30
# %op9 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -34
# %op10 = call i32 @fibonacci(i32 %op9)
	ld.w $a0, $fp, -34
	bl fibonacci
	st.w $a0, $fp, -38
# %op11 = add i32 %op10, %op8
	ld.w $t0, $fp, -38
	ld.w $t1, $fp, -30
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -42
# ret i32 %op11
	ld.w $a0, $fp, -42
	b fibonacci_exit
fibonacci_exit:
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
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label0
	addi.w $a0, $zero, 0
	st.w $a0, $fp, -20
	b .main_label0
.main_label0:
# %op1 = phi i32 [ 0, %label_entry ], [ %op5, %label3 ]
# %op2 = icmp slt i32 %op1, 10
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 10
	slt $t0, $t0, $t1
	st.b $t0, $fp, -21
# br i1 %op2, label %label3, label %label6
	ld.b $t0, $fp, -21
	bnez $t0, .main_label3
	b .main_label6
.main_label3:
# %op4 = call i32 @fibonacci(i32 %op1)
	ld.w $a0, $fp, -20
	bl fibonacci
	st.w $a0, $fp, -25
# call void @output(i32 %op4)
	ld.w $a0, $fp, -25
	bl output
# %op5 = add i32 %op1, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -29
# br label %label0
	ld.w $a0, $fp, -29
	st.w $a0, $fp, -20
	b .main_label0
.main_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	b main_exit
main_exit:
	addi.d $sp, $fp, 0
	ld.d $fp, $sp, -16
	ld.d $ra, $sp, -8
	jr $ra
