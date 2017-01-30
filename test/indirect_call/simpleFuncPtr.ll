; ModuleID = 'simpleFuncPtr.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%f %s\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"Wikipedia\00", align 1

; Function Attrs: nounwind uwtable
define double @cm_to_inches(double %cm) #0 {
entry:
  %cm.addr = alloca double, align 8
  store double %cm, double* %cm.addr, align 8
  %0 = load double* %cm.addr, align 8
  %div = fdiv double %0, 2.540000e+00
  ret double %div
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %func1 = alloca double (double)*, align 8
  %func2 = alloca i8* (i8*, i32)*, align 8
  store i32 0, i32* %retval
  store double (double)* @cm_to_inches, double (double)** %func1, align 8
  store i8* (i8*, i32)* @strchr, i8* (i8*, i32)** %func2, align 8
  %0 = load double (double)** %func1, align 8
  %call = call double %0(double 1.500000e+01)
  %1 = load i8* (i8*, i32)** %func2, align 8
  %call1 = call i8* %1(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 112)
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), double %call, i8* %call1)
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i8* @strchr(i8*, i32) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
