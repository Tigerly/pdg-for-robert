; ModuleID = 'foo.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@gv = global i32 5, align 4
@gv_s = global i32 2017, align 4
@.str = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str1 = private unnamed_addr constant [6 x i8] c"foo.c\00", section "llvm.metadata"
@pi = global float 0x40091EB860000000, align 4
@gtest_2 = global i32 2015, align 4
@gtest_3 = global i32 2014, align 4
@.str2 = private unnamed_addr constant [22 x i8] c"Run procedure foo()!\0A\00", align 1
@gtest_1 = common global i32* null, align 8
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.global.annotations = appending global [6 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (i32* @gv_s to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 5 }, { i8*, i8*, i8*, i32 } { i8* bitcast (float* @pi to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 7 }, { i8*, i8*, i8*, i32 } { i8* bitcast (i32* @gtest_2 to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 12 }, { i8*, i8*, i8*, i32 } { i8* bitcast (i32* @gtest_3 to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 14 }, { i8*, i8*, i8*, i32 } { i8* bitcast (void ()* @foo to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 17 }, { i8*, i8*, i8*, i32 } { i8* bitcast (i32** @gtest_1 to i8*), i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 10 }], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @foo() #0 {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %trivial = alloca i32, align 4
  %var = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* @gv, align 4
  store i32 %0, i32* %trivial, align 4
  %var1 = bitcast i32* %var to i8*
  call void @llvm.var.annotation(i8* %var1, i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 26)
  %1 = load i32* @gv_s, align 4
  store i32 %1, i32* %var, align 4
  %2 = load i32* %var, align 4
  %conv = sitofp i32 %2 to float
  %3 = load float* @pi, align 4
  %add = fadd float %conv, %3
  %conv2 = fptosi float %add to i32
  store i32 %conv2, i32* %var, align 4
  store i32* %trivial, i32** @gtest_1, align 8
  %4 = load i32** @gtest_1, align 8
  %5 = load i32* %4, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i32 0, i32 0), i32 %5)
  call void @foo()
  %6 = load i32* %var, align 4
  ret i32 %6
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
