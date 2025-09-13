; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/functional-cases/13-complex.cminus"

@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@w = global [5 x i32] zeroinitializer
@v = global [5 x i32] zeroinitializer
@dp = global [66 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @max(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sgt i32 %arg0, %arg1
  br i1 %op2, label %label3, label %label4
label3:                                                ; preds = %label_entry
  ret i32 %arg0
label4:                                                ; preds = %label_entry
  ret i32 %arg1
}
define i32 @knapsack(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sle i32 %arg1, 0
  br i1 %op2, label %label3, label %label4
label3:                                                ; preds = %label_entry
  ret i32 0
label4:                                                ; preds = %label_entry
  %op5 = icmp eq i32 %arg0, 0
  br i1 %op5, label %label6, label %label7
label6:                                                ; preds = %label4
  ret i32 0
label7:                                                ; preds = %label4
  %op8 = mul i32 %arg0, 11
  %op9 = add i32 %op8, %arg1
  %op10 = icmp slt i32 %op9, 0
  br i1 %op10, label %label11, label %label12
label11:                                                ; preds = %label7
  call void @neg_idx_except()
  br label %label12
label12:                                                ; preds = %label7, %label11
  %op13 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op9
  %op14 = load i32, i32* %op13
  %op15 = icmp sge i32 %op14, 0
  br i1 %op15, label %label16, label %label20
label16:                                                ; preds = %label12
  %op17 = mul i32 %arg0, 11
  %op18 = add i32 %op17, %arg1
  %op19 = icmp slt i32 %op18, 0
  br i1 %op19, label %label23, label %label24
label20:                                                ; preds = %label12
  %op21 = sub i32 %arg0, 1
  %op22 = icmp slt i32 %op21, 0
  br i1 %op22, label %label27, label %label28
label23:                                                ; preds = %label16
  call void @neg_idx_except()
  br label %label24
label24:                                                ; preds = %label16, %label23
  %op25 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op18
  %op26 = load i32, i32* %op25
  ret i32 %op26
label27:                                                ; preds = %label20
  call void @neg_idx_except()
  br label %label28
label28:                                                ; preds = %label20, %label27
  %op29 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op21
  %op30 = load i32, i32* %op29
  %op31 = icmp slt i32 %arg1, %op30
  br i1 %op31, label %label32, label %label35
label32:                                                ; preds = %label28
  %op33 = sub i32 %arg0, 1
  %op34 = call i32 @knapsack(i32 %op33, i32 %arg1)
  br label %label40
label35:                                                ; preds = %label28
  %op36 = sub i32 %arg0, 1
  %op37 = call i32 @knapsack(i32 %op36, i32 %arg1)
  %op38 = sub i32 %arg0, 1
  %op39 = icmp slt i32 %op38, 0
  br i1 %op39, label %label45, label %label46
label40:                                                ; preds = %label32, %label53
  %op41 = phi i32 [ %op34, %label32 ], [ %op59, %label53 ]
  %op42 = mul i32 %arg0, 11
  %op43 = add i32 %op42, %arg1
  %op44 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op43
  store i32 %op41, i32* %op44
  ret i32 %op41
label45:                                                ; preds = %label35
  call void @neg_idx_except()
  br label %label46
label46:                                                ; preds = %label35, %label45
  %op47 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op38
  %op48 = load i32, i32* %op47
  %op49 = sub i32 %arg0, 1
  %op50 = sub i32 %arg0, 1
  %op51 = icmp slt i32 %op50, 0
  br i1 %op51, label %label52, label %label53
label52:                                                ; preds = %label46
  call void @neg_idx_except()
  br label %label53
label53:                                                ; preds = %label46, %label52
  %op54 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op50
  %op55 = load i32, i32* %op54
  %op56 = sub i32 %arg1, %op55
  %op57 = call i32 @knapsack(i32 %op49, i32 %op56)
  %op58 = add i32 %op57, %op48
  %op59 = call i32 @max(i32 %op37, i32 %op58)
  br label %label40
}
define i32 @main() {
label_entry:
  store i32 5, i32* @n
  store i32 10, i32* @m
  %op0 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
  store i32 2, i32* %op0
  %op1 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
  store i32 2, i32* %op1
  %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
  store i32 6, i32* %op2
  %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
  store i32 5, i32* %op3
  %op4 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
  store i32 4, i32* %op4
  %op5 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
  store i32 6, i32* %op5
  %op6 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
  store i32 3, i32* %op6
  %op7 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
  store i32 5, i32* %op7
  %op8 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
  store i32 4, i32* %op8
  %op9 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
  store i32 6, i32* %op9
  br label %label21
label10:                                                ; preds = %label13, %label21
  %op11 = phi i32 [ %op16, %label13 ], [ %op22, %label21 ]
  %op12 = icmp slt i32 %op11, 66
  br i1 %op12, label %label13, label %label17
label13:                                                ; preds = %label10
  %op14 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op11
  store i32 %op15, i32* %op14
  %op16 = add i32 %op11, 1
  br label %label10
label17:                                                ; preds = %label10
  %op18 = load i32, i32* @n
  %op19 = load i32, i32* @m
  %op20 = call i32 @knapsack(i32 %op18, i32 %op19)
  call void @output(i32 %op20)
  ret i32 0
label21:                                                ; preds = %label_entry
  %op22 = phi i32 [ 0, %label_entry ]
  %op15 = sub i32 0, 1
  br label %label10
}
