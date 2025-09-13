; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/6-array.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  store i32 11, i32* %op1
  %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  store i32 22, i32* %op2
  %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  store i32 33, i32* %op3
  %op4 = icmp slt i32 0, 0
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label6
label6:                                                ; preds = %label_entry, %label5
  %op7 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op8 = load i32, i32* %op7
  call void @output(i32 %op8)
  %op9 = icmp slt i32 4, 0
  br i1 %op9, label %label10, label %label11
label10:                                                ; preds = %label6
  call void @neg_idx_except()
  br label %label11
label11:                                                ; preds = %label6, %label10
  %op12 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
  %op13 = load i32, i32* %op12
  call void @output(i32 %op13)
  %op14 = icmp slt i32 9, 0
  br i1 %op14, label %label15, label %label16
label15:                                                ; preds = %label11
  call void @neg_idx_except()
  br label %label16
label16:                                                ; preds = %label11, %label15
  %op17 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
  %op18 = load i32, i32* %op17
  call void @output(i32 %op18)
  ret i32 0
}
