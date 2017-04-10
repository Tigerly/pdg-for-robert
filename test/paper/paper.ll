; ModuleID = 'paper.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Welcome %s!\0A\00", align 1
@key = common global i8* null, align 8
@i = common global i32 0, align 4
@ciphertext = common global i8* null, align 8
@.str1 = private unnamed_addr constant [17 x i8] c"Enter username: \00", align 1
@.str2 = private unnamed_addr constant [5 x i8] c"%19s\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"Enter text: \00", align 1
@.str4 = private unnamed_addr constant [7 x i8] c"%1023s\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str6 = private unnamed_addr constant [8 x i8] c"paper.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (i8** @key to i8*), i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0), i32 4 }], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @greeter(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  store i8* %str, i8** %str.addr, align 8
  %0 = load i8** %str.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i8* %0)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @initkey(i8* %username, i32 %sz) #0 {
entry:
  %username.addr = alloca i8*, align 8
  %sz.addr = alloca i32, align 4
  store i8* %username, i8** %username.addr, align 8
  store i32 %sz, i32* %sz.addr, align 4
  %0 = load i32* %sz.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias i8* @malloc(i64 %conv) #3
  store i8* %call, i8** @key, align 8
  store i32 0, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* @i, align 4
  %2 = load i32* %sz.addr, align 4
  %cmp = icmp ult i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* @i, align 4
  %idxprom = zext i32 %3 to i64
  %4 = load i8** @key, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %idxprom
  store i8 97, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32* @i, align 4
  %inc = add i32 %5, 1
  store i32 %inc, i32* @i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind uwtable
define void @encrypt(i8* %plaintext, i32 %sz) #0 {
entry:
  %plaintext.addr = alloca i8*, align 8
  %sz.addr = alloca i32, align 4
  store i8* %plaintext, i8** %plaintext.addr, align 8
  store i32 %sz, i32* %sz.addr, align 4
  %0 = load i32* %sz.addr, align 4
  %conv = sext i32 %0 to i64
  %call = call noalias i8* @malloc(i64 %conv) #3
  store i8* %call, i8** @ciphertext, align 8
  store i32 0, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* @i, align 4
  %2 = load i32* %sz.addr, align 4
  %cmp = icmp ult i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* @i, align 4
  %idxprom = zext i32 %3 to i64
  %4 = load i8** %plaintext.addr, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %idxprom
  %5 = load i8* %arrayidx, align 1
  %conv2 = sext i8 %5 to i32
  %6 = load i32* @i, align 4
  %idxprom3 = zext i32 %6 to i64
  %7 = load i8** @key, align 8
  %arrayidx4 = getelementptr inbounds i8* %7, i64 %idxprom3
  %8 = load i8* %arrayidx4, align 1
  %conv5 = sext i8 %8 to i32
  %xor = xor i32 %conv2, %conv5
  %conv6 = trunc i32 %xor to i8
  %9 = load i32* @i, align 4
  %idxprom7 = zext i32 %9 to i64
  %10 = load i8** @ciphertext, align 8
  %arrayidx8 = getelementptr inbounds i8* %10, i64 %idxprom7
  store i8 %conv6, i8* %arrayidx8, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32* @i, align 4
  %inc = add i32 %11, 1
  store i32 %inc, i32* @i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define void @main() #0 {
entry:
  %username = alloca [20 x i8], align 16
  %text = alloca [1024 x i8], align 16
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str1, i32 0, i32 0))
  %arraydecay = getelementptr inbounds [20 x i8]* %username, i32 0, i32 0
  %call1 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0), i8* %arraydecay)
  %arraydecay2 = getelementptr inbounds [20 x i8]* %username, i32 0, i32 0
  call void @greeter(i8* %arraydecay2)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0))
  %arraydecay4 = getelementptr inbounds [1024 x i8]* %text, i32 0, i32 0
  %call5 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([7 x i8]* @.str4, i32 0, i32 0), i8* %arraydecay4)
  %arraydecay6 = getelementptr inbounds [20 x i8]* %username, i32 0, i32 0
  %arraydecay7 = getelementptr inbounds [1024 x i8]* %text, i32 0, i32 0
  %call8 = call i64 @strlen(i8* %arraydecay7)
  %conv = trunc i64 %call8 to i32
  call void @initkey(i8* %arraydecay6, i32 %conv)
  %arraydecay9 = getelementptr inbounds [1024 x i8]* %text, i32 0, i32 0
  %arraydecay10 = getelementptr inbounds [1024 x i8]* %text, i32 0, i32 0
  %call11 = call i64 @strlen(i8* %arraydecay10)
  %conv12 = trunc i64 %call11 to i32
  call void @encrypt(i8* %arraydecay9, i32 %conv12)
  ret void
}

declare i32 @__isoc99_scanf(i8*, ...) #1

declare i64 @strlen(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
