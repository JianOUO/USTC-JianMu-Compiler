; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/4-opt/testcases/loop/loop-4.cminus"

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
label6:                                                ; preds = %label4, %label19
  %op7 = phi i32 [ %op1, %label4 ], [ %op14, %label19 ]
  %op8 = phi i32 [ 0, %label4 ], [ %op20, %label19 ]
  %op9 = icmp slt i32 %op8, 2
  br i1 %op9, label %label10, label %label11
label10:                                                ; preds = %label6
  br label %label13
label11:                                                ; preds = %label6
  %op12 = add i32 %op2, 1
  br label %label0
label13:                                                ; preds = %label10, %label27
  %op14 = phi i32 [ %op7, %label10 ], [ %op22, %label27 ]
  %op15 = phi i32 [ %op8, %label10 ], [ %op23, %label27 ]
  %op16 = phi i32 [ 0, %label10 ], [ %op28, %label27 ]
  %op17 = icmp slt i32 %op16, 2
  br i1 %op17, label %label18, label %label19
label18:                                                ; preds = %label13
  br label %label21
label19:                                                ; preds = %label13
  %op20 = add i32 %op15, 1
  br label %label6
label21:                                                ; preds = %label18, %label35
  %op22 = phi i32 [ %op14, %label18 ], [ %op30, %label35 ]
  %op23 = phi i32 [ %op15, %label18 ], [ %op31, %label35 ]
  %op24 = phi i32 [ 0, %label18 ], [ %op36, %label35 ]
  %op25 = icmp slt i32 %op24, 2
  br i1 %op25, label %label26, label %label27
label26:                                                ; preds = %label21
  br label %label29
label27:                                                ; preds = %label21
  %op28 = add i32 %op16, 1
  br label %label13
label29:                                                ; preds = %label26, %label44
  %op30 = phi i32 [ %op22, %label26 ], [ %op38, %label44 ]
  %op31 = phi i32 [ %op23, %label26 ], [ %op39, %label44 ]
  %op32 = phi i32 [ 0, %label26 ], [ %op45, %label44 ]
  %op33 = icmp slt i32 %op32, 2
  br i1 %op33, label %label34, label %label35
label34:                                                ; preds = %label29
  br label %label37
label35:                                                ; preds = %label29
  %op36 = add i32 %op24, 1
  br label %label21
label37:                                                ; preds = %label34, %label48
  %op38 = phi i32 [ %op30, %label34 ], [ %op68, %label48 ]
  %op39 = phi i32 [ %op31, %label34 ], [ %op49, %label48 ]
  %op40 = phi i32 [ 0, %label34 ], [ %op69, %label48 ]
  %op41 = icmp slt i32 %op40, 2
  br i1 %op41, label %label42, label %label44
label42:                                                ; preds = %label37
  %op43 = icmp sgt i32 2, 1
  br i1 %op43, label %label46, label %label48
label44:                                                ; preds = %label37
  %op45 = add i32 %op32, 1
  br label %label29
label46:                                                ; preds = %label42
  %op47 = add i32 %op39, 1
  br label %label48
label48:                                                ; preds = %label42, %label46
  %op49 = phi i32 [ %op39, %label42 ], [ %op47, %label46 ]
  %op50 = mul i32 2, 2
  %op51 = mul i32 %op50, 2
  %op52 = mul i32 %op51, 2
  %op53 = mul i32 %op52, 2
  %op54 = mul i32 %op53, 2
  %op55 = mul i32 %op54, 2
  %op56 = mul i32 %op55, 2
  %op57 = mul i32 %op56, 2
  %op58 = mul i32 %op57, 2
  %op59 = sdiv i32 %op58, 2
  %op60 = sdiv i32 %op59, 2
  %op61 = sdiv i32 %op60, 2
  %op62 = sdiv i32 %op61, 2
  %op63 = sdiv i32 %op62, 2
  %op64 = sdiv i32 %op63, 2
  %op65 = sdiv i32 %op64, 2
  %op66 = sdiv i32 %op65, 2
  %op67 = sdiv i32 %op66, 2
  %op68 = sdiv i32 %op67, 2
  %op69 = add i32 %op40, 1
  br label %label37
}
