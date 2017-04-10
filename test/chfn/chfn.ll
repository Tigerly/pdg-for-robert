; ModuleID = 'chfn.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [7 x i8] c"shadow\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external global %struct._IO_FILE*
@.str2 = private unnamed_addr constant [25 x i8] c"shadow cannot be opened\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"Username : \00", align 1
@stdin = external global %struct._IO_FILE*
@.str4 = private unnamed_addr constant [12 x i8] c"Password : \00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str6 = private unnamed_addr constant [7 x i8] c"chfn.c\00", section "llvm.metadata"
@.str7 = private unnamed_addr constant [4 x i8] c" : \00", align 1
@.str8 = private unnamed_addr constant [7 x i8] c"passwd\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"w+\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"Cannot open file passwd\0A\00", align 1
@.str11 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str12 = private unnamed_addr constant [16 x i8] c"Phone number : \00", align 1
@.str13 = private unnamed_addr constant [13 x i8] c"Phone number\00", align 1
@.str14 = private unnamed_addr constant [16 x i8] c"Authentication\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"Authentication failed\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @_auth(i8* %uname, i8* %passwd) #0 {
entry:
  %retval = alloca i32, align 4
  %uname.addr = alloca i8*, align 8
  %passwd.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %result = alloca i32, align 4
  %username = alloca [100 x i8], align 16
  %password = alloca [100 x i8], align 16
  %shadow = alloca %struct._IO_FILE*, align 8
  %ch = alloca i32, align 4
  %ch18 = alloca i32, align 4
  store i8* %uname, i8** %uname.addr, align 8
  store i8* %passwd, i8** %passwd.addr, align 8
  store i32 0, i32* %result, align 4
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %shadow, align 8
  %0 = load %struct._IO_FILE** %shadow, align 8
  %cmp = icmp eq %struct._IO_FILE* null, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0))
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %2 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %2, 99
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load %struct._IO_FILE** %shadow, align 8
  %call3 = call i32 @fgetc(%struct._IO_FILE* %3)
  store i32 %call3, i32* %ch, align 4
  %4 = load i32* %ch, align 4
  %idxprom = sext i32 %4 to i64
  %call4 = call i16** @__ctype_b_loc() #7
  %5 = load i16** %call4, align 8
  %arrayidx = getelementptr inbounds i16* %5, i64 %idxprom
  %6 = load i16* %arrayidx, align 2
  %conv = zext i16 %6 to i32
  %and = and i32 %conv, 8192
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then7, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %7 = load i32* %ch, align 4
  %cmp5 = icmp eq i32 -1, %7
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end8:                                          ; preds = %lor.lhs.false
  %8 = load i32* %ch, align 4
  %conv9 = trunc i32 %8 to i8
  %9 = load i32* %i, align 4
  %idxprom10 = sext i32 %9 to i64
  %arrayidx11 = getelementptr inbounds [100 x i8]* %username, i32 0, i64 %idxprom10
  store i8 %conv9, i8* %arrayidx11, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end8
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then7, %for.cond
  %11 = load i32* %i, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [100 x i8]* %username, i32 0, i64 %idxprom12
  store i8 0, i8* %arrayidx13, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc34, %for.end
  %12 = load i32* %i, align 4
  %cmp15 = icmp slt i32 %12, 99
  br i1 %cmp15, label %for.body17, label %for.end36

for.body17:                                       ; preds = %for.cond14
  %13 = load %struct._IO_FILE** %shadow, align 8
  %call19 = call i32 @fgetc(%struct._IO_FILE* %13)
  store i32 %call19, i32* %ch18, align 4
  %14 = load i32* %ch18, align 4
  %idxprom20 = sext i32 %14 to i64
  %call21 = call i16** @__ctype_b_loc() #7
  %15 = load i16** %call21, align 8
  %arrayidx22 = getelementptr inbounds i16* %15, i64 %idxprom20
  %16 = load i16* %arrayidx22, align 2
  %conv23 = zext i16 %16 to i32
  %and24 = and i32 %conv23, 8192
  %tobool25 = icmp ne i32 %and24, 0
  br i1 %tobool25, label %if.then29, label %lor.lhs.false26

lor.lhs.false26:                                  ; preds = %for.body17
  %17 = load i32* %ch18, align 4
  %cmp27 = icmp eq i32 -1, %17
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %lor.lhs.false26, %for.body17
  br label %for.end36

if.end30:                                         ; preds = %lor.lhs.false26
  %18 = load i32* %ch18, align 4
  %conv31 = trunc i32 %18 to i8
  %19 = load i32* %i, align 4
  %idxprom32 = sext i32 %19 to i64
  %arrayidx33 = getelementptr inbounds [100 x i8]* %password, i32 0, i64 %idxprom32
  store i8 %conv31, i8* %arrayidx33, align 1
  br label %for.inc34

for.inc34:                                        ; preds = %if.end30
  %20 = load i32* %i, align 4
  %inc35 = add nsw i32 %20, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond14

for.end36:                                        ; preds = %if.then29, %for.cond14
  %21 = load i32* %i, align 4
  %idxprom37 = sext i32 %21 to i64
  %arrayidx38 = getelementptr inbounds [100 x i8]* %password, i32 0, i64 %idxprom37
  store i8 0, i8* %arrayidx38, align 1
  %arraydecay = getelementptr inbounds [100 x i8]* %username, i32 0, i32 0
  %22 = load i8** %uname.addr, align 8
  %call39 = call i32 @strncmp(i8* %arraydecay, i8* %22, i64 100) #8
  %tobool40 = icmp ne i32 %call39, 0
  br i1 %tobool40, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %for.end36
  %arraydecay41 = getelementptr inbounds [100 x i8]* %password, i32 0, i32 0
  %23 = load i8** %passwd.addr, align 8
  %call42 = call i32 @strncmp(i8* %arraydecay41, i8* %23, i64 100) #8
  %tobool43 = icmp ne i32 %call42, 0
  %lnot = xor i1 %tobool43, true
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.end36
  %24 = phi i1 [ false, %for.end36 ], [ %lnot, %land.rhs ]
  %land.ext = zext i1 %24 to i32
  store i32 %land.ext, i32* %result, align 4
  %25 = load %struct._IO_FILE** %shadow, align 8
  %call44 = call i32 @fclose(%struct._IO_FILE* %25)
  %26 = load i32* %result, align 4
  store i32 %26, i32* %retval
  br label %return

return:                                           ; preds = %land.end, %if.then
  %27 = load i32* %retval
  ret i32 %27
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fgetc(%struct._IO_FILE*) #1

; Function Attrs: nounwind readnone
declare i16** @__ctype_b_loc() #2

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #3

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @auth() #0 {
entry:
  %i = alloca i32, align 4
  %username = alloca [100 x i8], align 16
  %password = alloca [100 x i8], align 16
  %ch = alloca i32, align 4
  %ch15 = alloca i32, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 99
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE** @stdin, align 8
  %call1 = call i32 @fgetc(%struct._IO_FILE* %1)
  store i32 %call1, i32* %ch, align 4
  %2 = load i32* %ch, align 4
  %idxprom = sext i32 %2 to i64
  %call2 = call i16** @__ctype_b_loc() #7
  %3 = load i16** %call2, align 8
  %arrayidx = getelementptr inbounds i16* %3, i64 %idxprom
  %4 = load i16* %arrayidx, align 2
  %conv = zext i16 %4 to i32
  %and = and i32 %conv, 8192
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load i32* %ch, align 4
  %cmp3 = icmp eq i32 -1, %5
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i32* %ch, align 4
  %conv5 = trunc i32 %6 to i8
  %7 = load i32* %i, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [100 x i8]* %username, i32 0, i64 %idxprom6
  store i8 %conv5, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load i32* %i, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [100 x i8]* %username, i32 0, i64 %idxprom8
  store i8 0, i8* %arrayidx9, align 1
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc31, %for.end
  %10 = load i32* %i, align 4
  %cmp12 = icmp slt i32 %10, 99
  br i1 %cmp12, label %for.body14, label %for.end33

for.body14:                                       ; preds = %for.cond11
  %11 = load %struct._IO_FILE** @stdin, align 8
  %call16 = call i32 @fgetc(%struct._IO_FILE* %11)
  store i32 %call16, i32* %ch15, align 4
  %12 = load i32* %ch15, align 4
  %idxprom17 = sext i32 %12 to i64
  %call18 = call i16** @__ctype_b_loc() #7
  %13 = load i16** %call18, align 8
  %arrayidx19 = getelementptr inbounds i16* %13, i64 %idxprom17
  %14 = load i16* %arrayidx19, align 2
  %conv20 = zext i16 %14 to i32
  %and21 = and i32 %conv20, 8192
  %tobool22 = icmp ne i32 %and21, 0
  br i1 %tobool22, label %if.then26, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %for.body14
  %15 = load i32* %ch15, align 4
  %cmp24 = icmp eq i32 -1, %15
  br i1 %cmp24, label %if.then26, label %if.end27

if.then26:                                        ; preds = %lor.lhs.false23, %for.body14
  br label %for.end33

if.end27:                                         ; preds = %lor.lhs.false23
  %16 = load i32* %ch15, align 4
  %conv28 = trunc i32 %16 to i8
  %17 = load i32* %i, align 4
  %idxprom29 = sext i32 %17 to i64
  %arrayidx30 = getelementptr inbounds [100 x i8]* %password, i32 0, i64 %idxprom29
  store i8 %conv28, i8* %arrayidx30, align 1
  br label %for.inc31

for.inc31:                                        ; preds = %if.end27
  %18 = load i32* %i, align 4
  %inc32 = add nsw i32 %18, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond11

for.end33:                                        ; preds = %if.then26, %for.cond11
  %19 = load i32* %i, align 4
  %idxprom34 = sext i32 %19 to i64
  %arrayidx35 = getelementptr inbounds [100 x i8]* %password, i32 0, i64 %idxprom34
  store i8 0, i8* %arrayidx35, align 1
  %arraydecay = getelementptr inbounds [100 x i8]* %username, i32 0, i32 0
  %arraydecay36 = getelementptr inbounds [100 x i8]* %password, i32 0, i32 0
  %call37 = call i32 @_auth(i8* %arraydecay, i8* %arraydecay36)
  ret i32 %call37
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @_changeFn(i8* %Item, i8* %Content) #0 {
entry:
  %Item.addr = alloca i8*, align 8
  %Content.addr = alloca i8*, align 8
  %entry1 = alloca i8*, align 8
  %size = alloca i32, align 4
  %fp = alloca %struct._IO_FILE*, align 8
  store i8* %Item, i8** %Item.addr, align 8
  store i8* %Content, i8** %Content.addr, align 8
  store i8* null, i8** %entry1, align 8
  store i32 0, i32* %size, align 4
  %fp2 = bitcast %struct._IO_FILE** %fp to i8*
  call void @llvm.var.annotation(i8* %fp2, i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str6, i32 0, i32 0), i32 93)
  store %struct._IO_FILE* null, %struct._IO_FILE** %fp, align 8
  %0 = load i8** %Item.addr, align 8
  %cmp = icmp eq i8* null, %0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8** %Content.addr, align 8
  %cmp3 = icmp eq i8* null, %1
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8** %Item.addr, align 8
  %call = call i64 @strlen(i8* %2) #8
  %add = add i64 %call, 3
  %3 = load i8** %Content.addr, align 8
  %call4 = call i64 @strlen(i8* %3) #8
  %add5 = add i64 %add, %call4
  %add6 = add i64 %add5, 1
  %conv = trunc i64 %add6 to i32
  store i32 %conv, i32* %size, align 4
  %4 = load i8** %Item.addr, align 8
  %call7 = call i64 @strlen(i8* %4) #8
  %add8 = add i64 %call7, 3
  %5 = load i8** %Content.addr, align 8
  %call9 = call i64 @strlen(i8* %5) #8
  %add10 = add i64 %add8, %call9
  %add11 = add i64 %add10, 1
  %call12 = call noalias i8* @malloc(i64 %add11) #4
  store i8* %call12, i8** %entry1, align 8
  %6 = load i8** %entry1, align 8
  %cmp13 = icmp eq i8* null, %6
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end
  br label %return

if.end16:                                         ; preds = %if.end
  %7 = load i8** %entry1, align 8
  %8 = load i32* %size, align 4
  %conv17 = zext i32 %8 to i64
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %conv17, i32 1, i1 false)
  %9 = load i8** %entry1, align 8
  %10 = load i8** %Item.addr, align 8
  %call18 = call i8* @strcpy(i8* %9, i8* %10) #4
  store i8* %call18, i8** %entry1, align 8
  %11 = load i8** %entry1, align 8
  %call19 = call i8* @strcat(i8* %11, i8* getelementptr inbounds ([4 x i8]* @.str7, i32 0, i32 0)) #4
  store i8* %call19, i8** %entry1, align 8
  %12 = load i8** %entry1, align 8
  %13 = load i8** %Content.addr, align 8
  %call20 = call i8* @strcat(i8* %12, i8* %13) #4
  store i8* %call20, i8** %entry1, align 8
  %call21 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([7 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str9, i32 0, i32 0))
  store %struct._IO_FILE* %call21, %struct._IO_FILE** %fp, align 8
  %14 = load %struct._IO_FILE** %fp, align 8
  %cmp22 = icmp eq %struct._IO_FILE* null, %14
  br i1 %cmp22, label %if.then24, label %if.end26

if.then24:                                        ; preds = %if.end16
  %15 = load %struct._IO_FILE** @stderr, align 8
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([25 x i8]* @.str10, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

if.end26:                                         ; preds = %if.end16
  %16 = load %struct._IO_FILE** %fp, align 8
  %17 = load i8** %entry1, align 8
  %call27 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([4 x i8]* @.str11, i32 0, i32 0), i8* %17)
  %18 = load %struct._IO_FILE** %fp, align 8
  %call28 = call i32 @fclose(%struct._IO_FILE* %18)
  br label %return

return:                                           ; preds = %if.end26, %if.then15, %if.then
  ret void
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #4

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #5

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #5

; Function Attrs: nounwind
declare i8* @strcat(i8*, i8*) #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) #6

; Function Attrs: nounwind uwtable
define void @changeFn() #0 {
entry:
  %i = alloca i32, align 4
  %buf = alloca [100 x i8], align 16
  %ch = alloca i32, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str12, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 99
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load %struct._IO_FILE** @stdin, align 8
  %call1 = call i32 @fgetc(%struct._IO_FILE* %1)
  store i32 %call1, i32* %ch, align 4
  %2 = load i32* %ch, align 4
  %idxprom = sext i32 %2 to i64
  %call2 = call i16** @__ctype_b_loc() #7
  %3 = load i16** %call2, align 8
  %arrayidx = getelementptr inbounds i16* %3, i64 %idxprom
  %4 = load i16* %arrayidx, align 2
  %conv = zext i16 %4 to i32
  %and = and i32 %conv, 8192
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %5 = load i32* %ch, align 4
  %cmp3 = icmp eq i32 -1, %5
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  br label %for.end

if.end:                                           ; preds = %lor.lhs.false
  %6 = load i32* %ch, align 4
  %conv5 = trunc i32 %6 to i8
  %7 = load i32* %i, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [100 x i8]* %buf, i32 0, i64 %idxprom6
  store i8 %conv5, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %8 = load i32* %i, align 4
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %if.then, %for.cond
  %9 = load i32* %i, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [100 x i8]* %buf, i32 0, i64 %idxprom8
  store i8 0, i8* %arrayidx9, align 1
  %arraydecay = getelementptr inbounds [100 x i8]* %buf, i32 0, i32 0
  call void @_changeFn(i8* getelementptr inbounds ([13 x i8]* @.str13, i32 0, i32 0), i8* %arraydecay)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str14, i32 0, i32 0))
  %call1 = call i32 @auth()
  %tobool = icmp ne i32 %call1, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = load %struct._IO_FILE** @stderr, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0))
  call void @exit(i32 1) #9
  unreachable

if.end:                                           ; preds = %entry
  call void @changeFn()
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readnone }
attributes #8 = { nounwind readonly }
attributes #9 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
