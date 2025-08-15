; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv1/idx_float.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  store i32 1024, i32* %op1
  %op2 = fptosi float 0x3fb99999a0000000 to i32
  %op3 = icmp slt i32 %op2, 0
  br i1 %op3, label %label4, label %label5
label4:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label5
label5:                                                ; preds = %label_entry, %label4
  %op6 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op2
  %op7 = load i32, i32* %op6
  call void @output(i32 %op7)
  ret void
}
