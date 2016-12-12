; ModuleID = 'foo.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"my annotation\00", section "llvm.metadata"
@.str1 = private unnamed_addr constant [6 x i8] c"foo.c\00", section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %param) #0 {
entry:
  %param.addr = alloca i32, align 4
  %var = alloca i32, align 4
  store i32 %param, i32* %param.addr, align 4
  %var1 = bitcast i32* %var to i8*
  call void @llvm.var.annotation(i8* %var1, i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 2)
  %0 = load i32* %param.addr, align 4
  store i32 %0, i32* %var, align 4
  %1 = load i32* %var, align 4
  ret i32 %1
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
