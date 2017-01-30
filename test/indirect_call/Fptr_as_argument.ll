; ModuleID = 'Fptr_as_argument.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"sum(sin): %f\0A\00", align 1
@.str1 = private unnamed_addr constant [14 x i8] c"sum(cos): %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define double @compute_sum(double (double)* %funcp, double %lo, double %hi) #0 {
entry:
  %funcp.addr = alloca double (double)*, align 8
  %lo.addr = alloca double, align 8
  %hi.addr = alloca double, align 8
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  %x = alloca double, align 8
  %y = alloca double, align 8
  store double (double)* %funcp, double (double)** %funcp.addr, align 8
  store double %lo, double* %lo.addr, align 8
  store double %hi, double* %hi.addr, align 8
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp sle i32 %0, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %conv = sitofp i32 %1 to double
  %div = fdiv double %conv, 1.000000e+02
  %2 = load double* %hi.addr, align 8
  %3 = load double* %lo.addr, align 8
  %sub = fsub double %2, %3
  %mul = fmul double %div, %sub
  %4 = load double* %lo.addr, align 8
  %add = fadd double %mul, %4
  store double %add, double* %x, align 8
  %5 = load double (double)** %funcp.addr, align 8
  %6 = load double* %x, align 8
  %call = call double %5(double %6)
  store double %call, double* %y, align 8
  %7 = load double* %y, align 8
  %8 = load double* %sum, align 8
  %add1 = fadd double %8, %7
  store double %add1, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %10 = load double* %sum, align 8
  %div2 = fdiv double %10, 1.010000e+02
  ret double %div2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %fp = alloca double (double)*, align 8
  %sum = alloca double, align 8
  store i32 0, i32* %retval
  store double (double)* @sin, double (double)** %fp, align 8
  %0 = load double (double)** %fp, align 8
  %call = call double @compute_sum(double (double)* %0, double 0.000000e+00, double 1.000000e+00)
  store double %call, double* %sum, align 8
  %1 = load double* %sum, align 8
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), double %1)
  store double (double)* @cos, double (double)** %fp, align 8
  %2 = load double (double)** %fp, align 8
  %call2 = call double @compute_sum(double (double)* %2, double 0.000000e+00, double 1.000000e+00)
  store double %call2, double* %sum, align 8
  %3 = load double* %sum, align 8
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str1, i32 0, i32 0), double %3)
  ret i32 0
}

; Function Attrs: nounwind
declare double @sin(double) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare double @cos(double) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
