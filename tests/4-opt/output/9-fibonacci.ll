; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/9-fibonacci.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @fibonacci(i32 %arg0) {
label_entry:
  %op1 = icmp eq i32 %arg0, 0
  br i1 %op1, label %label2, label %label3
label2:                                                ; preds = %label_entry
  ret i32 0
label3:                                                ; preds = %label_entry
  %op4 = icmp eq i32 %arg0, 1
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label3
  ret i32 1
label6:                                                ; preds = %label3
  %op7 = sub i32 %arg0, 2
  %op8 = call i32 @fibonacci(i32 %op7)
  %op9 = sub i32 %arg0, 1
  %op10 = call i32 @fibonacci(i32 %op9)
  %op11 = add i32 %op10, %op8
  ret i32 %op11
}
define i32 @main() {
label_entry:
  br label %label0
label0:                                                ; preds = %label_entry, %label3
  %op1 = phi i32 [ 0, %label_entry ], [ %op5, %label3 ]
  %op2 = icmp slt i32 %op1, 10
  br i1 %op2, label %label3, label %label6
label3:                                                ; preds = %label0
  %op4 = call i32 @fibonacci(i32 %op1)
  call void @output(i32 %op4)
  %op5 = add i32 %op1, 1
  br label %label0
label6:                                                ; preds = %label0
  ret i32 0
}
