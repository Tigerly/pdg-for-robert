; ModuleID = 'indirectCall.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"p() = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
entry:
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @goo() #0 {
entry:
  ret i32 2
}

; Function Attrs: nounwind uwtable
define float @test(i32 %a, float %b) #0 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca float, align 4
  store i32 %a, i32* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  ret float 3.000000e+00
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32 ()*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  %0 = load i32* %x, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 ()* @foo, i32 ()** %p, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i32 ()* @goo, i32 ()** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32 ()** %p, align 8
  %call = call i32 %1()
  %2 = load i32 ()** %p, align 8
  %call1 = call i32 %2()
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %call1)
  %call3 = call float @test(i32 2, float 0x40091EB860000000)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
