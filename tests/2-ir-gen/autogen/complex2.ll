; ModuleID = 'cminus'
source_filename = "/home/jian/2024ustc-jianmu-compiler/tests/2-ir-gen/autogen/testcases/lv3/complex2.cminus"

@x = global [10 x float] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @minloc(float* %arg0, float %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca float*
  store float* %arg0, float** %op3
  %op4 = alloca float
  store float %arg1, float* %op4
  %op5 = alloca i32
  store i32 %arg2, i32* %op5
  %op6 = alloca i32
  %op7 = alloca i32
  %op8 = alloca i32
  %op9 = load float, float* %op4
  %op10 = fptosi float %op9 to i32
  store i32 %op10, i32* %op8
  %op11 = load float, float* %op4
  %op12 = fptosi float %op11 to i32
  %op13 = icmp slt i32 %op12, 0
  br i1 %op13, label %label14, label %label15
label14:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label15
label15:                                                ; preds = %label_entry, %label14
  %op16 = load float*, float** %op3
  %op17 = getelementptr float, float* %op16, i32 %op12
  %op18 = load float, float* %op17
  %op19 = fptosi float %op18 to i32
  store i32 %op19, i32* %op7
  %op20 = load float, float* %op4
  %op21 = sitofp i32 1 to float
  %op22 = fadd float %op20, %op21
  %op23 = fptosi float %op22 to i32
  store i32 %op23, i32* %op6
  br label %label24
label24:                                                ; preds = %label15, %label44
  %op25 = load i32, i32* %op6
  %op26 = load i32, i32* %op5
  %op27 = icmp slt i32 %op25, %op26
  br i1 %op27, label %label28, label %label31
label28:                                                ; preds = %label24
  %op29 = load i32, i32* %op6
  %op30 = icmp slt i32 %op29, 0
  br i1 %op30, label %label33, label %label34
label31:                                                ; preds = %label24
  %op32 = load i32, i32* %op8
  ret i32 %op32
label33:                                                ; preds = %label28
  call void @neg_idx_except()
  br label %label34
label34:                                                ; preds = %label28, %label33
  %op35 = load float*, float** %op3
  %op36 = getelementptr float, float* %op35, i32 %op29
  %op37 = load float, float* %op36
  %op38 = load i32, i32* %op7
  %op39 = sitofp i32 %op38 to float
  %op40 = fcmp ult float %op37, %op39
  br i1 %op40, label %label41, label %label44
label41:                                                ; preds = %label34
  %op42 = load i32, i32* %op6
  %op43 = icmp slt i32 %op42, 0
  br i1 %op43, label %label47, label %label48
label44:                                                ; preds = %label34, %label48
  %op45 = load i32, i32* %op6
  %op46 = add i32 %op45, 1
  store i32 %op46, i32* %op6
  br label %label24
label47:                                                ; preds = %label41
  call void @neg_idx_except()
  br label %label48
label48:                                                ; preds = %label41, %label47
  %op49 = load float*, float** %op3
  %op50 = getelementptr float, float* %op49, i32 %op42
  %op51 = load float, float* %op50
  %op52 = fptosi float %op51 to i32
  store i32 %op52, i32* %op7
  %op53 = load i32, i32* %op6
  store i32 %op53, i32* %op8
  br label %label44
}
define void @sort(float* %arg0, i32 %arg1, float %arg2) {
label_entry:
  %op3 = alloca float*
  store float* %arg0, float** %op3
  %op4 = alloca i32
  store i32 %arg1, i32* %op4
  %op5 = alloca float
  store float %arg2, float* %op5
  %op6 = alloca i32
  %op7 = alloca i32
  %op8 = load i32, i32* %op4
  store i32 %op8, i32* %op6
  br label %label9
label9:                                                ; preds = %label_entry, %label39
  %op10 = load i32, i32* %op6
  %op11 = load float, float* %op5
  %op12 = sitofp i32 1 to float
  %op13 = fsub float %op11, %op12
  %op14 = sitofp i32 %op10 to float
  %op15 = fcmp ult float %op14, %op13
  br i1 %op15, label %label16, label %label26
label16:                                                ; preds = %label9
  %op17 = alloca i32
  %op18 = load float*, float** %op3
  %op19 = load i32, i32* %op6
  %op20 = sitofp i32 %op19 to float
  %op21 = load float, float* %op5
  %op22 = fptosi float %op21 to i32
  %op23 = call i32 @minloc(float* %op18, float %op20, i32 %op22)
  store i32 %op23, i32* %op7
  %op24 = load i32, i32* %op7
  %op25 = icmp slt i32 %op24, 0
  br i1 %op25, label %label27, label %label28
label26:                                                ; preds = %label9
  ret void
label27:                                                ; preds = %label16
  call void @neg_idx_except()
  br label %label28
label28:                                                ; preds = %label16, %label27
  %op29 = load float*, float** %op3
  %op30 = getelementptr float, float* %op29, i32 %op24
  %op31 = load float, float* %op30
  %op32 = fptosi float %op31 to i32
  store i32 %op32, i32* %op17
  %op33 = load i32, i32* %op7
  %op34 = load float*, float** %op3
  %op35 = getelementptr float, float* %op34, i32 %op33
  %op36 = load i32, i32* %op6
  %op37 = icmp slt i32 %op36, 0
  br i1 %op37, label %label38, label %label39
label38:                                                ; preds = %label28
  call void @neg_idx_except()
  br label %label39
label39:                                                ; preds = %label28, %label38
  %op40 = load float*, float** %op3
  %op41 = getelementptr float, float* %op40, i32 %op36
  %op42 = load float, float* %op41
  store float %op42, float* %op35
  %op43 = load i32, i32* %op6
  %op44 = load float*, float** %op3
  %op45 = getelementptr float, float* %op44, i32 %op43
  %op46 = load i32, i32* %op17
  %op47 = sitofp i32 %op46 to float
  store float %op47, float* %op45
  %op48 = load i32, i32* %op6
  %op49 = add i32 %op48, 1
  store i32 %op49, i32* %op6
  br label %label9
}
define void @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  br label %label1
label1:                                                ; preds = %label_entry, %label4
  %op2 = load i32, i32* %op0
  %op3 = icmp slt i32 %op2, 10
  br i1 %op3, label %label4, label %label11
label4:                                                ; preds = %label1
  %op5 = load i32, i32* %op0
  %op6 = getelementptr [10 x float], [10 x float]* @x, i32 0, i32 %op5
  %op7 = call i32 @input()
  %op8 = sitofp i32 %op7 to float
  store float %op8, float* %op6
  %op9 = load i32, i32* %op0
  %op10 = add i32 %op9, 1
  store i32 %op10, i32* %op0
  br label %label1
label11:                                                ; preds = %label1
  %op12 = getelementptr [10 x float], [10 x float]* @x, i32 0, i32 0
  %op13 = sitofp i32 10 to float
  call void @sort(float* %op12, i32 0, float %op13)
  store i32 0, i32* %op0
  br label %label14
label14:                                                ; preds = %label11, %label22
  %op15 = load i32, i32* %op0
  %op16 = icmp slt i32 %op15, 10
  br i1 %op16, label %label17, label %label20
label17:                                                ; preds = %label14
  %op18 = load i32, i32* %op0
  %op19 = icmp slt i32 %op18, 0
  br i1 %op19, label %label21, label %label22
label20:                                                ; preds = %label14
  ret void
label21:                                                ; preds = %label17
  call void @neg_idx_except()
  br label %label22
label22:                                                ; preds = %label17, %label21
  %op23 = getelementptr [10 x float], [10 x float]* @x, i32 0, i32 %op18
  %op24 = load float, float* %op23
  %op25 = fptosi float %op24 to i32
  call void @output(i32 %op25)
  %op26 = load i32, i32* %op0
  %op27 = add i32 %op26, 1
  store i32 %op27, i32* %op0
  br label %label14
}
