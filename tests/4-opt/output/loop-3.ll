; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/loop/loop-3.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  br label %label0
label0:                                                ; preds = %label_entry, %label11
  %op1 = phi i32 [ %op7, %label11 ], [ undef, %label_entry ]
  %op2 = phi i32 [ 0, %label_entry ], [ %op12, %label11 ]
  %op3 = icmp slt i32 %op2, 1000000
  br i1 %op3, label %label4, label %label5
label4:                                                ; preds = %label0
  br label %label6
label5:                                                ; preds = %label0
  call void @output(i32 %op1)
  ret void
label6:                                                ; preds = %label4, %label18
  %op7 = phi i32 [ %op1, %label4 ], [ %op14, %label18 ]
  %op8 = phi i32 [ 0, %label4 ], [ %op19, %label18 ]
  %op9 = icmp slt i32 %op8, 2
  br i1 %op9, label %label10, label %label11
label10:                                                ; preds = %label6
  br label %label13
label11:                                                ; preds = %label6
  %op12 = add i32 %op2, 1
  br label %label0
label13:                                                ; preds = %label10, %label25
  %op14 = phi i32 [ %op7, %label10 ], [ %op21, %label25 ]
  %op15 = phi i32 [ 0, %label10 ], [ %op26, %label25 ]
  %op16 = icmp slt i32 %op15, 2
  br i1 %op16, label %label17, label %label18
label17:                                                ; preds = %label13
  br label %label20
label18:                                                ; preds = %label13
  %op19 = add i32 %op8, 1
  br label %label6
label20:                                                ; preds = %label17, %label32
  %op21 = phi i32 [ %op14, %label17 ], [ %op28, %label32 ]
  %op22 = phi i32 [ 0, %label17 ], [ %op33, %label32 ]
  %op23 = icmp slt i32 %op22, 2
  br i1 %op23, label %label24, label %label25
label24:                                                ; preds = %label20
  br label %label27
label25:                                                ; preds = %label20
  %op26 = add i32 %op15, 1
  br label %label13
label27:                                                ; preds = %label24, %label59
  %op28 = phi i32 [ %op21, %label24 ], [ %op35, %label59 ]
  %op29 = phi i32 [ 0, %label24 ], [ %op60, %label59 ]
  %op30 = icmp slt i32 %op29, 2
  br i1 %op30, label %label31, label %label32
label31:                                                ; preds = %label27
  br label %label34
label32:                                                ; preds = %label27
  %op33 = add i32 %op22, 1
  br label %label20
label34:                                                ; preds = %label31, %label38
  %op35 = phi i32 [ %op28, %label31 ], [ %op57, %label38 ]
  %op36 = phi i32 [ 0, %label31 ], [ %op58, %label38 ]
  %op37 = icmp slt i32 %op36, 2
  br i1 %op37, label %label38, label %label59
label38:                                                ; preds = %label34
  %op39 = mul i32 2, 2
  %op40 = mul i32 %op39, 2
  %op41 = mul i32 %op40, 2
  %op42 = mul i32 %op41, 2
  %op43 = mul i32 %op42, 2
  %op44 = mul i32 %op43, 2
  %op45 = mul i32 %op44, 2
  %op46 = mul i32 %op45, 2
  %op47 = mul i32 %op46, 2
  %op48 = sdiv i32 %op47, 2
  %op49 = sdiv i32 %op48, 2
  %op50 = sdiv i32 %op49, 2
  %op51 = sdiv i32 %op50, 2
  %op52 = sdiv i32 %op51, 2
  %op53 = sdiv i32 %op52, 2
  %op54 = sdiv i32 %op53, 2
  %op55 = sdiv i32 %op54, 2
  %op56 = sdiv i32 %op55, 2
  %op57 = sdiv i32 %op56, 2
  %op58 = add i32 %op36, 1
  br label %label34
label59:                                                ; preds = %label34
  %op60 = add i32 %op29, 1
  br label %label27
}
