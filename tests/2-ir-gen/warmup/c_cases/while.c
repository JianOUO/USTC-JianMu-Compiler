int main() {
    int a;
    int i;
    a = 10;
    i = 0;
    while (i < 10) {
        i = i + 1;
        a = a + i;
    }
    return a;
}
/*
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 10, i32* %1
  store i32 0, i32* %2
  br label %3

3:
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %5, 10
  br i1 %6, label %7, label %10

7:
  %8 = add i32 %5, 1
  %9 = add i32 %4, %8
  store i32 %8, i32* %2, align 4
  store i32 %9, i32* %1, align 4
  br label %3

10:
  ret i32 %4
}
*/
