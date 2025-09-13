; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/loop/loop-2.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  br label %label0
label0:                                                ; preds = %label_entry, %label31
  %op1 = phi i32 [ 0, %label_entry ], [ %op32, %label31 ]
  %op2 = phi i32 [ %op8, %label31 ], [ undef, %label_entry ]
  %op3 = icmp slt i32 %op1, 10000000
  br i1 %op3, label %label4, label %label5
label4:                                                ; preds = %label0
  br label %label6
label5:                                                ; preds = %label0
  call void @output(i32 %op2)
  ret void
label6:                                                ; preds = %label4, %label10
  %op7 = phi i32 [ 0, %label4 ], [ %op30, %label10 ]
  %op8 = phi i32 [ %op2, %label4 ], [ %op29, %label10 ]
  %op9 = icmp slt i32 %op7, 2
  br i1 %op9, label %label10, label %label31
label10:                                                ; preds = %label6
  %op11 = mul i32 2, 2
  %op12 = mul i32 %op11, 2
  %op13 = mul i32 %op12, 2
  %op14 = mul i32 %op13, 2
  %op15 = mul i32 %op14, 2
  %op16 = mul i32 %op15, 2
  %op17 = mul i32 %op16, 2
  %op18 = mul i32 %op17, 2
  %op19 = mul i32 %op18, 2
  %op20 = sdiv i32 %op19, 2
  %op21 = sdiv i32 %op20, 2
  %op22 = sdiv i32 %op21, 2
  %op23 = sdiv i32 %op22, 2
  %op24 = sdiv i32 %op23, 2
  %op25 = sdiv i32 %op24, 2
  %op26 = sdiv i32 %op25, 2
  %op27 = sdiv i32 %op26, 2
  %op28 = sdiv i32 %op27, 2
  %op29 = sdiv i32 %op28, 2
  %op30 = add i32 %op7, 1
  br label %label6
label31:                                                ; preds = %label6
  %op32 = add i32 %op1, 1
  br label %label0
}
