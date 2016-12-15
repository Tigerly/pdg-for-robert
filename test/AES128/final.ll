; ModuleID = 'final.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@state = internal global [4 x [4 x i8]]* null, align 8
@Key = internal global i8* null, align 8
@Iv = internal global i8* null, align 8
@rsbox = internal constant [256 x i8] c"R\09j\D506\A58\BF@\A3\9E\81\F3\D7\FB|\E39\82\9B/\FF\874\8ECD\C4\DE\E9\CBT{\942\A6\C2#=\EEL\95\0BB\FA\C3N\08.\A1f(\D9$\B2v[\A2Im\8B\D1%r\F8\F6d\86h\98\16\D4\A4\5C\CC]e\B6\92lpHP\FD\ED\B9\DA^\15FW\A7\8D\9D\84\90\D8\AB\00\8C\BC\D3\0A\F7\E4X\05\B8\B3E\06\D0,\1E\8F\CA?\0F\02\C1\AF\BD\03\01\13\8Ak:\91\11AOg\DC\EA\97\F2\CF\CE\F0\B4\E6s\96\ACt\22\E7\AD5\85\E2\F97\E8\1Cu\DFnG\F1\1Aq\1D)\C5\89o\B7b\0E\AA\18\BE\1B\FCV>K\C6\D2y \9A\DB\C0\FEx\CDZ\F4\1F\DD\A83\88\07\C71\B1\12\10Y'\80\EC_`Q\7F\A9\19\B5J\0D-\E5z\9F\93\C9\9C\EF\A0\E0;M\AE*\F5\B0\C8\EB\BB<\83S\99a\17+\04~\BAw\D6&\E1i\14cU!\0C}", align 16
@RoundKey = internal global [176 x i8] zeroinitializer, align 16
@sbox = internal constant [256 x i8] c"c|w{\F2ko\C50\01g+\FE\D7\ABv\CA\82\C9}\FAYG\F0\AD\D4\A2\AF\9C\A4r\C0\B7\FD\93&6?\F7\CC4\A5\E5\F1q\D81\15\04\C7#\C3\18\96\05\9A\07\12\80\E2\EB'\B2u\09\83,\1A\1BnZ\A0R;\D6\B3)\E3/\84S\D1\00\ED \FC\B1[j\CB\BE9JLX\CF\D0\EF\AA\FBCM3\85E\F9\02\7FP<\9F\A8Q\A3@\8F\92\9D8\F5\BC\B6\DA!\10\FF\F3\D2\CD\0C\13\EC_\97D\17\C4\A7~=d]\19s`\81O\DC\22*\90\88F\EE\B8\14\DE^\0B\DB\E02:\0AI\06$\5C\C2\D3\ACb\91\95\E4y\E7\C87m\8D\D5N\A9lV\F4\EAez\AE\08\BAx%.\1C\A6\B4\C6\E8\DDt\1FK\BD\8B\8Ap>\B5fH\03\F6\0Ea5W\B9\86\C1\1D\9E\E1\F8\98\11i\D9\8E\94\9B\1E\87\E9\CEU(\DF\8C\A1\89\0D\BF\E6BhA\99-\0F\B0T\BB\16", align 16
@Rcon = internal constant [255 x i8] c"\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB\8D\01\02\04\08\10 @\80\1B6l\D8\ABM\9A/^\BCc\C6\975j\D4\B3}\FA\EF\C5\919r\E4\D3\BDa\C2\9F%J\943f\CC\83\1D:t\E8\CB", align 16
@.str = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str1 = private unnamed_addr constant [7 x i8] c"test.c\00", section "llvm.metadata"
@test_encrypt_ecb_verbose.key = private unnamed_addr constant [16 x i8] c"+~\15\16(\AE\D2\A6\AB\F7\15\88\09\CFO<", align 16
@test_encrypt_ecb_verbose.plain_text = private unnamed_addr constant [64 x i8] c"k\C1\BE\E2.@\9F\96\E9=~\11s\93\17*\AE-\8AW\1E\03\AC\9C\9E\B7o\ACE\AF\8EQ0\C8\1CF\A3\5C\E4\11\E5\FB\C1\19\1A\0AR\EF\F6\9F$E\DFO\9B\17\AD+A{\E6l7\10", align 16
@.str2 = private unnamed_addr constant [23 x i8] c"ECB encrypt verbose:\0A\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"plain text:\0A\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"key:\0A\00", align 1
@.str6 = private unnamed_addr constant [13 x i8] c"ciphertext:\0A\00", align 1
@.str7 = private unnamed_addr constant [8 x i8] c"Plain:\0A\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"%.2x\00", align 1

; Function Attrs: nounwind uwtable
define void @AES128_ECB_encrypt(i8* %input, i8* %key, i8* %output) #0 {
entry:
  %input.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %output.addr = alloca i8*, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store i8* %output, i8** %output.addr, align 8
  %0 = load i8** %output.addr, align 8
  %1 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %0, i8* %1)
  %2 = load i8** %output.addr, align 8
  %3 = bitcast i8* %2 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %3, [4 x [4 x i8]]** @state, align 8
  %4 = load i8** %key.addr, align 8
  store i8* %4, i8** @Key, align 8
  call void @KeyExpansion()
  call void @Cipher()
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @BlockCopy(i8* %output, i8* %input) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %i = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8* %i, align 1
  %idxprom = zext i8 %1 to i64
  %2 = load i8** %input.addr, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %4 = load i8* %i, align 1
  %idxprom2 = zext i8 %4 to i64
  %5 = load i8** %output.addr, align 8
  %arrayidx3 = getelementptr inbounds i8* %5, i64 %idxprom2
  store i8 %3, i8* %arrayidx3, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i8* %i, align 1
  %inc = add i8 %6, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @KeyExpansion() #0 {
entry:
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %tempa = alloca [4 x i8], align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp ult i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %mul = mul i32 %1, 4
  %add = add i32 %mul, 0
  %idxprom = zext i32 %add to i64
  %2 = load i8** @Key, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %4 = load i32* %i, align 4
  %mul1 = mul i32 %4, 4
  %add2 = add i32 %mul1, 0
  %idxprom3 = zext i32 %add2 to i64
  %arrayidx4 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom3
  store i8 %3, i8* %arrayidx4, align 1
  %5 = load i32* %i, align 4
  %mul5 = mul i32 %5, 4
  %add6 = add i32 %mul5, 1
  %idxprom7 = zext i32 %add6 to i64
  %6 = load i8** @Key, align 8
  %arrayidx8 = getelementptr inbounds i8* %6, i64 %idxprom7
  %7 = load i8* %arrayidx8, align 1
  %8 = load i32* %i, align 4
  %mul9 = mul i32 %8, 4
  %add10 = add i32 %mul9, 1
  %idxprom11 = zext i32 %add10 to i64
  %arrayidx12 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom11
  store i8 %7, i8* %arrayidx12, align 1
  %9 = load i32* %i, align 4
  %mul13 = mul i32 %9, 4
  %add14 = add i32 %mul13, 2
  %idxprom15 = zext i32 %add14 to i64
  %10 = load i8** @Key, align 8
  %arrayidx16 = getelementptr inbounds i8* %10, i64 %idxprom15
  %11 = load i8* %arrayidx16, align 1
  %12 = load i32* %i, align 4
  %mul17 = mul i32 %12, 4
  %add18 = add i32 %mul17, 2
  %idxprom19 = zext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom19
  store i8 %11, i8* %arrayidx20, align 1
  %13 = load i32* %i, align 4
  %mul21 = mul i32 %13, 4
  %add22 = add i32 %mul21, 3
  %idxprom23 = zext i32 %add22 to i64
  %14 = load i8** @Key, align 8
  %arrayidx24 = getelementptr inbounds i8* %14, i64 %idxprom23
  %15 = load i8* %arrayidx24, align 1
  %16 = load i32* %i, align 4
  %mul25 = mul i32 %16, 4
  %add26 = add i32 %mul25, 3
  %idxprom27 = zext i32 %add26 to i64
  %arrayidx28 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom27
  store i8 %15, i8* %arrayidx28, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %17 = load i32* %i, align 4
  %inc = add i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %for.cond29

for.cond29:                                       ; preds = %for.inc128, %for.end
  %18 = load i32* %i, align 4
  %cmp30 = icmp ult i32 %18, 44
  br i1 %cmp30, label %for.body31, label %for.end130

for.body31:                                       ; preds = %for.cond29
  store i32 0, i32* %j, align 4
  br label %for.cond32

for.cond32:                                       ; preds = %for.inc41, %for.body31
  %19 = load i32* %j, align 4
  %cmp33 = icmp ult i32 %19, 4
  br i1 %cmp33, label %for.body34, label %for.end43

for.body34:                                       ; preds = %for.cond32
  %20 = load i32* %i, align 4
  %sub = sub i32 %20, 1
  %mul35 = mul i32 %sub, 4
  %21 = load i32* %j, align 4
  %add36 = add i32 %mul35, %21
  %idxprom37 = zext i32 %add36 to i64
  %arrayidx38 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom37
  %22 = load i8* %arrayidx38, align 1
  %23 = load i32* %j, align 4
  %idxprom39 = zext i32 %23 to i64
  %arrayidx40 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 %idxprom39
  store i8 %22, i8* %arrayidx40, align 1
  br label %for.inc41

for.inc41:                                        ; preds = %for.body34
  %24 = load i32* %j, align 4
  %inc42 = add i32 %24, 1
  store i32 %inc42, i32* %j, align 4
  br label %for.cond32

for.end43:                                        ; preds = %for.cond32
  %25 = load i32* %i, align 4
  %rem = urem i32 %25, 4
  %cmp44 = icmp eq i32 %rem, 0
  br i1 %cmp44, label %if.then, label %if.else

if.then:                                          ; preds = %for.end43
  %arrayidx45 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  %26 = load i8* %arrayidx45, align 1
  %conv = zext i8 %26 to i32
  store i32 %conv, i32* %k, align 4
  %arrayidx46 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 1
  %27 = load i8* %arrayidx46, align 1
  %arrayidx47 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  store i8 %27, i8* %arrayidx47, align 1
  %arrayidx48 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 2
  %28 = load i8* %arrayidx48, align 1
  %arrayidx49 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 1
  store i8 %28, i8* %arrayidx49, align 1
  %arrayidx50 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 3
  %29 = load i8* %arrayidx50, align 1
  %arrayidx51 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 2
  store i8 %29, i8* %arrayidx51, align 1
  %30 = load i32* %k, align 4
  %conv52 = trunc i32 %30 to i8
  %arrayidx53 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 3
  store i8 %conv52, i8* %arrayidx53, align 1
  %arrayidx54 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  %31 = load i8* %arrayidx54, align 1
  %call = call zeroext i8 @getSBoxValue(i8 zeroext %31)
  %arrayidx55 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  store i8 %call, i8* %arrayidx55, align 1
  %arrayidx56 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 1
  %32 = load i8* %arrayidx56, align 1
  %call57 = call zeroext i8 @getSBoxValue(i8 zeroext %32)
  %arrayidx58 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 1
  store i8 %call57, i8* %arrayidx58, align 1
  %arrayidx59 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 2
  %33 = load i8* %arrayidx59, align 1
  %call60 = call zeroext i8 @getSBoxValue(i8 zeroext %33)
  %arrayidx61 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 2
  store i8 %call60, i8* %arrayidx61, align 1
  %arrayidx62 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 3
  %34 = load i8* %arrayidx62, align 1
  %call63 = call zeroext i8 @getSBoxValue(i8 zeroext %34)
  %arrayidx64 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 3
  store i8 %call63, i8* %arrayidx64, align 1
  %arrayidx65 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  %35 = load i8* %arrayidx65, align 1
  %conv66 = zext i8 %35 to i32
  %36 = load i32* %i, align 4
  %div = udiv i32 %36, 4
  %idxprom67 = zext i32 %div to i64
  %arrayidx68 = getelementptr inbounds [255 x i8]* @Rcon, i32 0, i64 %idxprom67
  %37 = load i8* %arrayidx68, align 1
  %conv69 = zext i8 %37 to i32
  %xor = xor i32 %conv66, %conv69
  %conv70 = trunc i32 %xor to i8
  %arrayidx71 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  store i8 %conv70, i8* %arrayidx71, align 1
  br label %if.end

if.else:                                          ; preds = %for.end43
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %38 = load i32* %i, align 4
  %sub72 = sub i32 %38, 4
  %mul73 = mul i32 %sub72, 4
  %add74 = add i32 %mul73, 0
  %idxprom75 = zext i32 %add74 to i64
  %arrayidx76 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom75
  %39 = load i8* %arrayidx76, align 1
  %conv77 = zext i8 %39 to i32
  %arrayidx78 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 0
  %40 = load i8* %arrayidx78, align 1
  %conv79 = zext i8 %40 to i32
  %xor80 = xor i32 %conv77, %conv79
  %conv81 = trunc i32 %xor80 to i8
  %41 = load i32* %i, align 4
  %mul82 = mul i32 %41, 4
  %add83 = add i32 %mul82, 0
  %idxprom84 = zext i32 %add83 to i64
  %arrayidx85 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom84
  store i8 %conv81, i8* %arrayidx85, align 1
  %42 = load i32* %i, align 4
  %sub86 = sub i32 %42, 4
  %mul87 = mul i32 %sub86, 4
  %add88 = add i32 %mul87, 1
  %idxprom89 = zext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom89
  %43 = load i8* %arrayidx90, align 1
  %conv91 = zext i8 %43 to i32
  %arrayidx92 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 1
  %44 = load i8* %arrayidx92, align 1
  %conv93 = zext i8 %44 to i32
  %xor94 = xor i32 %conv91, %conv93
  %conv95 = trunc i32 %xor94 to i8
  %45 = load i32* %i, align 4
  %mul96 = mul i32 %45, 4
  %add97 = add i32 %mul96, 1
  %idxprom98 = zext i32 %add97 to i64
  %arrayidx99 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom98
  store i8 %conv95, i8* %arrayidx99, align 1
  %46 = load i32* %i, align 4
  %sub100 = sub i32 %46, 4
  %mul101 = mul i32 %sub100, 4
  %add102 = add i32 %mul101, 2
  %idxprom103 = zext i32 %add102 to i64
  %arrayidx104 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom103
  %47 = load i8* %arrayidx104, align 1
  %conv105 = zext i8 %47 to i32
  %arrayidx106 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 2
  %48 = load i8* %arrayidx106, align 1
  %conv107 = zext i8 %48 to i32
  %xor108 = xor i32 %conv105, %conv107
  %conv109 = trunc i32 %xor108 to i8
  %49 = load i32* %i, align 4
  %mul110 = mul i32 %49, 4
  %add111 = add i32 %mul110, 2
  %idxprom112 = zext i32 %add111 to i64
  %arrayidx113 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom112
  store i8 %conv109, i8* %arrayidx113, align 1
  %50 = load i32* %i, align 4
  %sub114 = sub i32 %50, 4
  %mul115 = mul i32 %sub114, 4
  %add116 = add i32 %mul115, 3
  %idxprom117 = zext i32 %add116 to i64
  %arrayidx118 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom117
  %51 = load i8* %arrayidx118, align 1
  %conv119 = zext i8 %51 to i32
  %arrayidx120 = getelementptr inbounds [4 x i8]* %tempa, i32 0, i64 3
  %52 = load i8* %arrayidx120, align 1
  %conv121 = zext i8 %52 to i32
  %xor122 = xor i32 %conv119, %conv121
  %conv123 = trunc i32 %xor122 to i8
  %53 = load i32* %i, align 4
  %mul124 = mul i32 %53, 4
  %add125 = add i32 %mul124, 3
  %idxprom126 = zext i32 %add125 to i64
  %arrayidx127 = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom126
  store i8 %conv123, i8* %arrayidx127, align 1
  br label %for.inc128

for.inc128:                                       ; preds = %if.end
  %54 = load i32* %i, align 4
  %inc129 = add i32 %54, 1
  store i32 %inc129, i32* %i, align 4
  br label %for.cond29

for.end130:                                       ; preds = %for.cond29
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @Cipher() #0 {
entry:
  %round = alloca i8, align 1
  store i8 0, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext 0)
  store i8 1, i8* %round, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %round, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @SubBytes()
  call void @ShiftRows()
  call void @MixColumns()
  %1 = load i8* %round, align 1
  call void @AddRoundKey(i8 zeroext %1)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i8* %round, align 1
  %inc = add i8 %2, 1
  store i8 %inc, i8* %round, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @SubBytes()
  call void @ShiftRows()
  call void @AddRoundKey(i8 zeroext 10)
  ret void
}

; Function Attrs: nounwind uwtable
define void @AES128_ECB_decrypt(i8* %input, i8* %key, i8* %output) #0 {
entry:
  %input.addr = alloca i8*, align 8
  %key.addr = alloca i8*, align 8
  %output.addr = alloca i8*, align 8
  store i8* %input, i8** %input.addr, align 8
  store i8* %key, i8** %key.addr, align 8
  store i8* %output, i8** %output.addr, align 8
  %0 = load i8** %output.addr, align 8
  %1 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %0, i8* %1)
  %2 = load i8** %output.addr, align 8
  %3 = bitcast i8* %2 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %3, [4 x [4 x i8]]** @state, align 8
  %4 = load i8** %key.addr, align 8
  store i8* %4, i8** @Key, align 8
  call void @KeyExpansion()
  call void @InvCipher()
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @InvCipher() #0 {
entry:
  %round = alloca i8, align 1
  store i8 0, i8* %round, align 1
  call void @AddRoundKey(i8 zeroext 10)
  store i8 9, i8* %round, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %round, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp sgt i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  call void @InvShiftRows()
  call void @InvSubBytes()
  %1 = load i8* %round, align 1
  call void @AddRoundKey(i8 zeroext %1)
  call void @InvMixColumns()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i8* %round, align 1
  %dec = add i8 %2, -1
  store i8 %dec, i8* %round, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @InvShiftRows()
  call void @InvSubBytes()
  call void @AddRoundKey(i8 zeroext 0)
  ret void
}

; Function Attrs: nounwind uwtable
define void @AES128_CBC_encrypt_buffer(i8* %output, i8* %input, i32 %length, i8* %key, i8* %iv) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %key.addr = alloca i8*, align 8
  %iv.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %remainders = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8* %key, i8** %key.addr, align 8
  store i8* %iv, i8** %iv.addr, align 8
  %0 = load i32* %length.addr, align 4
  %rem = urem i32 %0, 16
  %conv = trunc i32 %rem to i8
  store i8 %conv, i8* %remainders, align 1
  %1 = load i8** %output.addr, align 8
  %2 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %1, i8* %2)
  %3 = load i8** %output.addr, align 8
  %4 = bitcast i8* %3 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %4, [4 x [4 x i8]]** @state, align 8
  %5 = load i8** %key.addr, align 8
  %cmp = icmp ne i8* null, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i8** %key.addr, align 8
  store i8* %6, i8** @Key, align 8
  call void @KeyExpansion()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8** %iv.addr, align 8
  %cmp2 = icmp ne i8* %7, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i8** %iv.addr, align 8
  store i8* %8, i8** @Iv, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %9 = load i64* %i, align 8
  %10 = load i32* %length.addr, align 4
  %conv6 = zext i32 %10 to i64
  %cmp7 = icmp ult i64 %9, %conv6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8** %input.addr, align 8
  call void @XorWithIv(i8* %11)
  %12 = load i8** %output.addr, align 8
  %13 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %12, i8* %13)
  %14 = load i8** %output.addr, align 8
  %15 = bitcast i8* %14 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %15, [4 x [4 x i8]]** @state, align 8
  call void @Cipher()
  %16 = load i8** %output.addr, align 8
  store i8* %16, i8** @Iv, align 8
  %17 = load i8** %input.addr, align 8
  %add.ptr = getelementptr inbounds i8* %17, i64 16
  store i8* %add.ptr, i8** %input.addr, align 8
  %18 = load i8** %output.addr, align 8
  %add.ptr9 = getelementptr inbounds i8* %18, i64 16
  store i8* %add.ptr9, i8** %output.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i64* %i, align 8
  %add = add i64 %19, 16
  store i64 %add, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8* %remainders, align 1
  %tobool = icmp ne i8 %20, 0
  br i1 %tobool, label %if.then10, label %if.end15

if.then10:                                        ; preds = %for.end
  %21 = load i8** %output.addr, align 8
  %22 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %21, i8* %22)
  %23 = load i8** %output.addr, align 8
  %24 = load i8* %remainders, align 1
  %conv11 = zext i8 %24 to i32
  %idx.ext = sext i32 %conv11 to i64
  %add.ptr12 = getelementptr inbounds i8* %23, i64 %idx.ext
  %25 = load i8* %remainders, align 1
  %conv13 = zext i8 %25 to i32
  %sub = sub nsw i32 16, %conv13
  %conv14 = sext i32 %sub to i64
  call void @llvm.memset.p0i8.i64(i8* %add.ptr12, i8 0, i64 %conv14, i32 1, i1 false)
  %26 = load i8** %output.addr, align 8
  %27 = bitcast i8* %26 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %27, [4 x [4 x i8]]** @state, align 8
  call void @Cipher()
  br label %if.end15

if.end15:                                         ; preds = %if.then10, %for.end
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @XorWithIv(i8* %buf) #0 {
entry:
  %buf.addr = alloca i8*, align 8
  %i = alloca i8, align 1
  store i8* %buf, i8** %buf.addr, align 8
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8* %i, align 1
  %idxprom = zext i8 %1 to i64
  %2 = load i8** @Iv, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %conv2 = zext i8 %3 to i32
  %4 = load i8* %i, align 1
  %idxprom3 = zext i8 %4 to i64
  %5 = load i8** %buf.addr, align 8
  %arrayidx4 = getelementptr inbounds i8* %5, i64 %idxprom3
  %6 = load i8* %arrayidx4, align 1
  %conv5 = zext i8 %6 to i32
  %xor = xor i32 %conv5, %conv2
  %conv6 = trunc i32 %xor to i8
  store i8 %conv6, i8* %arrayidx4, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i8* %i, align 1
  %inc = add i8 %7, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @AES128_CBC_decrypt_buffer(i8* %output, i8* %input, i32 %length, i8* %key, i8* %iv) #0 {
entry:
  %output.addr = alloca i8*, align 8
  %input.addr = alloca i8*, align 8
  %length.addr = alloca i32, align 4
  %key.addr = alloca i8*, align 8
  %iv.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %remainders = alloca i8, align 1
  store i8* %output, i8** %output.addr, align 8
  store i8* %input, i8** %input.addr, align 8
  store i32 %length, i32* %length.addr, align 4
  store i8* %key, i8** %key.addr, align 8
  store i8* %iv, i8** %iv.addr, align 8
  %0 = load i32* %length.addr, align 4
  %rem = urem i32 %0, 16
  %conv = trunc i32 %rem to i8
  store i8 %conv, i8* %remainders, align 1
  %1 = load i8** %output.addr, align 8
  %2 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %1, i8* %2)
  %3 = load i8** %output.addr, align 8
  %4 = bitcast i8* %3 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %4, [4 x [4 x i8]]** @state, align 8
  %5 = load i8** %key.addr, align 8
  %cmp = icmp ne i8* null, %5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %6 = load i8** %key.addr, align 8
  store i8* %6, i8** @Key, align 8
  call void @KeyExpansion()
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %7 = load i8** %iv.addr, align 8
  %cmp2 = icmp ne i8* %7, null
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  %8 = load i8** %iv.addr, align 8
  store i8* %8, i8** @Iv, align 8
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.end
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end5
  %9 = load i64* %i, align 8
  %10 = load i32* %length.addr, align 4
  %conv6 = zext i32 %10 to i64
  %cmp7 = icmp ult i64 %9, %conv6
  br i1 %cmp7, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %11 = load i8** %output.addr, align 8
  %12 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %11, i8* %12)
  %13 = load i8** %output.addr, align 8
  %14 = bitcast i8* %13 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %14, [4 x [4 x i8]]** @state, align 8
  call void @InvCipher()
  %15 = load i8** %output.addr, align 8
  call void @XorWithIv(i8* %15)
  %16 = load i8** %input.addr, align 8
  store i8* %16, i8** @Iv, align 8
  %17 = load i8** %input.addr, align 8
  %add.ptr = getelementptr inbounds i8* %17, i64 16
  store i8* %add.ptr, i8** %input.addr, align 8
  %18 = load i8** %output.addr, align 8
  %add.ptr9 = getelementptr inbounds i8* %18, i64 16
  store i8* %add.ptr9, i8** %output.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %19 = load i64* %i, align 8
  %add = add i64 %19, 16
  store i64 %add, i64* %i, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %20 = load i8* %remainders, align 1
  %tobool = icmp ne i8 %20, 0
  br i1 %tobool, label %if.then10, label %if.end15

if.then10:                                        ; preds = %for.end
  %21 = load i8** %output.addr, align 8
  %22 = load i8** %input.addr, align 8
  call void @BlockCopy(i8* %21, i8* %22)
  %23 = load i8** %output.addr, align 8
  %24 = load i8* %remainders, align 1
  %conv11 = zext i8 %24 to i32
  %idx.ext = sext i32 %conv11 to i64
  %add.ptr12 = getelementptr inbounds i8* %23, i64 %idx.ext
  %25 = load i8* %remainders, align 1
  %conv13 = zext i8 %25 to i32
  %sub = sub nsw i32 16, %conv13
  %conv14 = sext i32 %sub to i64
  call void @llvm.memset.p0i8.i64(i8* %add.ptr12, i8 0, i64 %conv14, i32 1, i1 false)
  %26 = load i8** %output.addr, align 8
  %27 = bitcast i8* %26 to [4 x [4 x i8]]*
  store [4 x [4 x i8]]* %27, [4 x [4 x i8]]** @state, align 8
  call void @InvCipher()
  br label %if.end15

if.end15:                                         ; preds = %if.then10, %for.end
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @AddRoundKey(i8 zeroext %round) #0 {
entry:
  %round.addr = alloca i8, align 1
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 %round, i8* %round.addr, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc20, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end22

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load i8* %round.addr, align 1
  %conv7 = zext i8 %2 to i32
  %mul = mul nsw i32 %conv7, 4
  %mul8 = mul nsw i32 %mul, 4
  %3 = load i8* %i, align 1
  %conv9 = zext i8 %3 to i32
  %mul10 = mul nsw i32 %conv9, 4
  %add = add nsw i32 %mul8, %mul10
  %4 = load i8* %j, align 1
  %conv11 = zext i8 %4 to i32
  %add12 = add nsw i32 %add, %conv11
  %idxprom = sext i32 %add12 to i64
  %arrayidx = getelementptr inbounds [176 x i8]* @RoundKey, i32 0, i64 %idxprom
  %5 = load i8* %arrayidx, align 1
  %conv13 = zext i8 %5 to i32
  %6 = load i8* %j, align 1
  %idxprom14 = zext i8 %6 to i64
  %7 = load i8* %i, align 1
  %idxprom15 = zext i8 %7 to i64
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx16 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 %idxprom15
  %arrayidx17 = getelementptr inbounds [4 x i8]* %arrayidx16, i32 0, i64 %idxprom14
  %9 = load i8* %arrayidx17, align 1
  %conv18 = zext i8 %9 to i32
  %xor = xor i32 %conv18, %conv13
  %conv19 = trunc i32 %xor to i8
  store i8 %conv19, i8* %arrayidx17, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %10 = load i8* %j, align 1
  %inc = add i8 %10, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc20

for.inc20:                                        ; preds = %for.end
  %11 = load i8* %i, align 1
  %inc21 = add i8 %11, 1
  store i8 %inc21, i8* %i, align 1
  br label %for.cond

for.end22:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @InvShiftRows() #0 {
entry:
  %temp = alloca i8, align 1
  %0 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %0, i32 0, i64 3
  %arrayidx1 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 1
  %1 = load i8* %arrayidx1, align 1
  store i8 %1, i8* %temp, align 1
  %2 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx2 = getelementptr inbounds [4 x [4 x i8]]* %2, i32 0, i64 2
  %arrayidx3 = getelementptr inbounds [4 x i8]* %arrayidx2, i32 0, i64 1
  %3 = load i8* %arrayidx3, align 1
  %4 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]]* %4, i32 0, i64 3
  %arrayidx5 = getelementptr inbounds [4 x i8]* %arrayidx4, i32 0, i64 1
  store i8 %3, i8* %arrayidx5, align 1
  %5 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]]* %5, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [4 x i8]* %arrayidx6, i32 0, i64 1
  %6 = load i8* %arrayidx7, align 1
  %7 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]]* %7, i32 0, i64 2
  %arrayidx9 = getelementptr inbounds [4 x i8]* %arrayidx8, i32 0, i64 1
  store i8 %6, i8* %arrayidx9, align 1
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 0
  %arrayidx11 = getelementptr inbounds [4 x i8]* %arrayidx10, i32 0, i64 1
  %9 = load i8* %arrayidx11, align 1
  %10 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]]* %10, i32 0, i64 1
  %arrayidx13 = getelementptr inbounds [4 x i8]* %arrayidx12, i32 0, i64 1
  store i8 %9, i8* %arrayidx13, align 1
  %11 = load i8* %temp, align 1
  %12 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx14 = getelementptr inbounds [4 x [4 x i8]]* %12, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [4 x i8]* %arrayidx14, i32 0, i64 1
  store i8 %11, i8* %arrayidx15, align 1
  %13 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx16 = getelementptr inbounds [4 x [4 x i8]]* %13, i32 0, i64 0
  %arrayidx17 = getelementptr inbounds [4 x i8]* %arrayidx16, i32 0, i64 2
  %14 = load i8* %arrayidx17, align 1
  store i8 %14, i8* %temp, align 1
  %15 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx18 = getelementptr inbounds [4 x [4 x i8]]* %15, i32 0, i64 2
  %arrayidx19 = getelementptr inbounds [4 x i8]* %arrayidx18, i32 0, i64 2
  %16 = load i8* %arrayidx19, align 1
  %17 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx20 = getelementptr inbounds [4 x [4 x i8]]* %17, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [4 x i8]* %arrayidx20, i32 0, i64 2
  store i8 %16, i8* %arrayidx21, align 1
  %18 = load i8* %temp, align 1
  %19 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx22 = getelementptr inbounds [4 x [4 x i8]]* %19, i32 0, i64 2
  %arrayidx23 = getelementptr inbounds [4 x i8]* %arrayidx22, i32 0, i64 2
  store i8 %18, i8* %arrayidx23, align 1
  %20 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx24 = getelementptr inbounds [4 x [4 x i8]]* %20, i32 0, i64 1
  %arrayidx25 = getelementptr inbounds [4 x i8]* %arrayidx24, i32 0, i64 2
  %21 = load i8* %arrayidx25, align 1
  store i8 %21, i8* %temp, align 1
  %22 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx26 = getelementptr inbounds [4 x [4 x i8]]* %22, i32 0, i64 3
  %arrayidx27 = getelementptr inbounds [4 x i8]* %arrayidx26, i32 0, i64 2
  %23 = load i8* %arrayidx27, align 1
  %24 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx28 = getelementptr inbounds [4 x [4 x i8]]* %24, i32 0, i64 1
  %arrayidx29 = getelementptr inbounds [4 x i8]* %arrayidx28, i32 0, i64 2
  store i8 %23, i8* %arrayidx29, align 1
  %25 = load i8* %temp, align 1
  %26 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx30 = getelementptr inbounds [4 x [4 x i8]]* %26, i32 0, i64 3
  %arrayidx31 = getelementptr inbounds [4 x i8]* %arrayidx30, i32 0, i64 2
  store i8 %25, i8* %arrayidx31, align 1
  %27 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx32 = getelementptr inbounds [4 x [4 x i8]]* %27, i32 0, i64 0
  %arrayidx33 = getelementptr inbounds [4 x i8]* %arrayidx32, i32 0, i64 3
  %28 = load i8* %arrayidx33, align 1
  store i8 %28, i8* %temp, align 1
  %29 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx34 = getelementptr inbounds [4 x [4 x i8]]* %29, i32 0, i64 1
  %arrayidx35 = getelementptr inbounds [4 x i8]* %arrayidx34, i32 0, i64 3
  %30 = load i8* %arrayidx35, align 1
  %31 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]]* %31, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [4 x i8]* %arrayidx36, i32 0, i64 3
  store i8 %30, i8* %arrayidx37, align 1
  %32 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx38 = getelementptr inbounds [4 x [4 x i8]]* %32, i32 0, i64 2
  %arrayidx39 = getelementptr inbounds [4 x i8]* %arrayidx38, i32 0, i64 3
  %33 = load i8* %arrayidx39, align 1
  %34 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx40 = getelementptr inbounds [4 x [4 x i8]]* %34, i32 0, i64 1
  %arrayidx41 = getelementptr inbounds [4 x i8]* %arrayidx40, i32 0, i64 3
  store i8 %33, i8* %arrayidx41, align 1
  %35 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]]* %35, i32 0, i64 3
  %arrayidx43 = getelementptr inbounds [4 x i8]* %arrayidx42, i32 0, i64 3
  %36 = load i8* %arrayidx43, align 1
  %37 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx44 = getelementptr inbounds [4 x [4 x i8]]* %37, i32 0, i64 2
  %arrayidx45 = getelementptr inbounds [4 x i8]* %arrayidx44, i32 0, i64 3
  store i8 %36, i8* %arrayidx45, align 1
  %38 = load i8* %temp, align 1
  %39 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]]* %39, i32 0, i64 3
  %arrayidx47 = getelementptr inbounds [4 x i8]* %arrayidx46, i32 0, i64 3
  store i8 %38, i8* %arrayidx47, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @InvSubBytes() #0 {
entry:
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %3 = load i8* %j, align 1
  %idxprom7 = zext i8 %3 to i64
  %4 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %4, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 %idxprom
  %5 = load i8* %arrayidx8, align 1
  %call = call zeroext i8 @getSBoxInvert(i8 zeroext %5)
  %6 = load i8* %i, align 1
  %idxprom9 = zext i8 %6 to i64
  %7 = load i8* %j, align 1
  %idxprom10 = zext i8 %7 to i64
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx11 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [4 x i8]* %arrayidx11, i32 0, i64 %idxprom9
  store i8 %call, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i8* %j, align 1
  %inc = add i8 %9, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %10 = load i8* %i, align 1
  %inc14 = add i8 %10, 1
  store i8 %inc14, i8* %i, align 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @InvMixColumns() #0 {
entry:
  %i = alloca i32, align 4
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  %d = alloca i8, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %2, i32 0, i64 %idxprom
  %arrayidx1 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 0
  %3 = load i8* %arrayidx1, align 1
  store i8 %3, i8* %a, align 1
  %4 = load i32* %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %5 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx3 = getelementptr inbounds [4 x [4 x i8]]* %5, i32 0, i64 %idxprom2
  %arrayidx4 = getelementptr inbounds [4 x i8]* %arrayidx3, i32 0, i64 1
  %6 = load i8* %arrayidx4, align 1
  store i8 %6, i8* %b, align 1
  %7 = load i32* %i, align 4
  %idxprom5 = sext i32 %7 to i64
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 %idxprom5
  %arrayidx7 = getelementptr inbounds [4 x i8]* %arrayidx6, i32 0, i64 2
  %9 = load i8* %arrayidx7, align 1
  store i8 %9, i8* %c, align 1
  %10 = load i32* %i, align 4
  %idxprom8 = sext i32 %10 to i64
  %11 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx9 = getelementptr inbounds [4 x [4 x i8]]* %11, i32 0, i64 %idxprom8
  %arrayidx10 = getelementptr inbounds [4 x i8]* %arrayidx9, i32 0, i64 3
  %12 = load i8* %arrayidx10, align 1
  store i8 %12, i8* %d, align 1
  %13 = load i8* %a, align 1
  %conv = zext i8 %13 to i32
  %mul = mul nsw i32 0, %conv
  %14 = load i8* %a, align 1
  %call = call zeroext i8 @xtime(i8 zeroext %14)
  %conv11 = zext i8 %call to i32
  %mul12 = mul nsw i32 1, %conv11
  %xor = xor i32 %mul, %mul12
  %15 = load i8* %a, align 1
  %call13 = call zeroext i8 @xtime(i8 zeroext %15)
  %call14 = call zeroext i8 @xtime(i8 zeroext %call13)
  %conv15 = zext i8 %call14 to i32
  %mul16 = mul nsw i32 1, %conv15
  %xor17 = xor i32 %xor, %mul16
  %16 = load i8* %a, align 1
  %call18 = call zeroext i8 @xtime(i8 zeroext %16)
  %call19 = call zeroext i8 @xtime(i8 zeroext %call18)
  %call20 = call zeroext i8 @xtime(i8 zeroext %call19)
  %conv21 = zext i8 %call20 to i32
  %mul22 = mul nsw i32 1, %conv21
  %xor23 = xor i32 %xor17, %mul22
  %17 = load i8* %a, align 1
  %call24 = call zeroext i8 @xtime(i8 zeroext %17)
  %call25 = call zeroext i8 @xtime(i8 zeroext %call24)
  %call26 = call zeroext i8 @xtime(i8 zeroext %call25)
  %call27 = call zeroext i8 @xtime(i8 zeroext %call26)
  %conv28 = zext i8 %call27 to i32
  %mul29 = mul nsw i32 0, %conv28
  %xor30 = xor i32 %xor23, %mul29
  %18 = load i8* %b, align 1
  %conv31 = zext i8 %18 to i32
  %mul32 = mul nsw i32 1, %conv31
  %19 = load i8* %b, align 1
  %call33 = call zeroext i8 @xtime(i8 zeroext %19)
  %conv34 = zext i8 %call33 to i32
  %mul35 = mul nsw i32 1, %conv34
  %xor36 = xor i32 %mul32, %mul35
  %20 = load i8* %b, align 1
  %call37 = call zeroext i8 @xtime(i8 zeroext %20)
  %call38 = call zeroext i8 @xtime(i8 zeroext %call37)
  %conv39 = zext i8 %call38 to i32
  %mul40 = mul nsw i32 0, %conv39
  %xor41 = xor i32 %xor36, %mul40
  %21 = load i8* %b, align 1
  %call42 = call zeroext i8 @xtime(i8 zeroext %21)
  %call43 = call zeroext i8 @xtime(i8 zeroext %call42)
  %call44 = call zeroext i8 @xtime(i8 zeroext %call43)
  %conv45 = zext i8 %call44 to i32
  %mul46 = mul nsw i32 1, %conv45
  %xor47 = xor i32 %xor41, %mul46
  %22 = load i8* %b, align 1
  %call48 = call zeroext i8 @xtime(i8 zeroext %22)
  %call49 = call zeroext i8 @xtime(i8 zeroext %call48)
  %call50 = call zeroext i8 @xtime(i8 zeroext %call49)
  %call51 = call zeroext i8 @xtime(i8 zeroext %call50)
  %conv52 = zext i8 %call51 to i32
  %mul53 = mul nsw i32 0, %conv52
  %xor54 = xor i32 %xor47, %mul53
  %xor55 = xor i32 %xor30, %xor54
  %23 = load i8* %c, align 1
  %conv56 = zext i8 %23 to i32
  %mul57 = mul nsw i32 1, %conv56
  %24 = load i8* %c, align 1
  %call58 = call zeroext i8 @xtime(i8 zeroext %24)
  %conv59 = zext i8 %call58 to i32
  %mul60 = mul nsw i32 0, %conv59
  %xor61 = xor i32 %mul57, %mul60
  %25 = load i8* %c, align 1
  %call62 = call zeroext i8 @xtime(i8 zeroext %25)
  %call63 = call zeroext i8 @xtime(i8 zeroext %call62)
  %conv64 = zext i8 %call63 to i32
  %mul65 = mul nsw i32 1, %conv64
  %xor66 = xor i32 %xor61, %mul65
  %26 = load i8* %c, align 1
  %call67 = call zeroext i8 @xtime(i8 zeroext %26)
  %call68 = call zeroext i8 @xtime(i8 zeroext %call67)
  %call69 = call zeroext i8 @xtime(i8 zeroext %call68)
  %conv70 = zext i8 %call69 to i32
  %mul71 = mul nsw i32 1, %conv70
  %xor72 = xor i32 %xor66, %mul71
  %27 = load i8* %c, align 1
  %call73 = call zeroext i8 @xtime(i8 zeroext %27)
  %call74 = call zeroext i8 @xtime(i8 zeroext %call73)
  %call75 = call zeroext i8 @xtime(i8 zeroext %call74)
  %call76 = call zeroext i8 @xtime(i8 zeroext %call75)
  %conv77 = zext i8 %call76 to i32
  %mul78 = mul nsw i32 0, %conv77
  %xor79 = xor i32 %xor72, %mul78
  %xor80 = xor i32 %xor55, %xor79
  %28 = load i8* %d, align 1
  %conv81 = zext i8 %28 to i32
  %mul82 = mul nsw i32 1, %conv81
  %29 = load i8* %d, align 1
  %call83 = call zeroext i8 @xtime(i8 zeroext %29)
  %conv84 = zext i8 %call83 to i32
  %mul85 = mul nsw i32 0, %conv84
  %xor86 = xor i32 %mul82, %mul85
  %30 = load i8* %d, align 1
  %call87 = call zeroext i8 @xtime(i8 zeroext %30)
  %call88 = call zeroext i8 @xtime(i8 zeroext %call87)
  %conv89 = zext i8 %call88 to i32
  %mul90 = mul nsw i32 0, %conv89
  %xor91 = xor i32 %xor86, %mul90
  %31 = load i8* %d, align 1
  %call92 = call zeroext i8 @xtime(i8 zeroext %31)
  %call93 = call zeroext i8 @xtime(i8 zeroext %call92)
  %call94 = call zeroext i8 @xtime(i8 zeroext %call93)
  %conv95 = zext i8 %call94 to i32
  %mul96 = mul nsw i32 1, %conv95
  %xor97 = xor i32 %xor91, %mul96
  %32 = load i8* %d, align 1
  %call98 = call zeroext i8 @xtime(i8 zeroext %32)
  %call99 = call zeroext i8 @xtime(i8 zeroext %call98)
  %call100 = call zeroext i8 @xtime(i8 zeroext %call99)
  %call101 = call zeroext i8 @xtime(i8 zeroext %call100)
  %conv102 = zext i8 %call101 to i32
  %mul103 = mul nsw i32 0, %conv102
  %xor104 = xor i32 %xor97, %mul103
  %xor105 = xor i32 %xor80, %xor104
  %conv106 = trunc i32 %xor105 to i8
  %33 = load i32* %i, align 4
  %idxprom107 = sext i32 %33 to i64
  %34 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx108 = getelementptr inbounds [4 x [4 x i8]]* %34, i32 0, i64 %idxprom107
  %arrayidx109 = getelementptr inbounds [4 x i8]* %arrayidx108, i32 0, i64 0
  store i8 %conv106, i8* %arrayidx109, align 1
  %35 = load i8* %a, align 1
  %conv110 = zext i8 %35 to i32
  %mul111 = mul nsw i32 1, %conv110
  %36 = load i8* %a, align 1
  %call112 = call zeroext i8 @xtime(i8 zeroext %36)
  %conv113 = zext i8 %call112 to i32
  %mul114 = mul nsw i32 0, %conv113
  %xor115 = xor i32 %mul111, %mul114
  %37 = load i8* %a, align 1
  %call116 = call zeroext i8 @xtime(i8 zeroext %37)
  %call117 = call zeroext i8 @xtime(i8 zeroext %call116)
  %conv118 = zext i8 %call117 to i32
  %mul119 = mul nsw i32 0, %conv118
  %xor120 = xor i32 %xor115, %mul119
  %38 = load i8* %a, align 1
  %call121 = call zeroext i8 @xtime(i8 zeroext %38)
  %call122 = call zeroext i8 @xtime(i8 zeroext %call121)
  %call123 = call zeroext i8 @xtime(i8 zeroext %call122)
  %conv124 = zext i8 %call123 to i32
  %mul125 = mul nsw i32 1, %conv124
  %xor126 = xor i32 %xor120, %mul125
  %39 = load i8* %a, align 1
  %call127 = call zeroext i8 @xtime(i8 zeroext %39)
  %call128 = call zeroext i8 @xtime(i8 zeroext %call127)
  %call129 = call zeroext i8 @xtime(i8 zeroext %call128)
  %call130 = call zeroext i8 @xtime(i8 zeroext %call129)
  %conv131 = zext i8 %call130 to i32
  %mul132 = mul nsw i32 0, %conv131
  %xor133 = xor i32 %xor126, %mul132
  %40 = load i8* %b, align 1
  %conv134 = zext i8 %40 to i32
  %mul135 = mul nsw i32 0, %conv134
  %41 = load i8* %b, align 1
  %call136 = call zeroext i8 @xtime(i8 zeroext %41)
  %conv137 = zext i8 %call136 to i32
  %mul138 = mul nsw i32 1, %conv137
  %xor139 = xor i32 %mul135, %mul138
  %42 = load i8* %b, align 1
  %call140 = call zeroext i8 @xtime(i8 zeroext %42)
  %call141 = call zeroext i8 @xtime(i8 zeroext %call140)
  %conv142 = zext i8 %call141 to i32
  %mul143 = mul nsw i32 1, %conv142
  %xor144 = xor i32 %xor139, %mul143
  %43 = load i8* %b, align 1
  %call145 = call zeroext i8 @xtime(i8 zeroext %43)
  %call146 = call zeroext i8 @xtime(i8 zeroext %call145)
  %call147 = call zeroext i8 @xtime(i8 zeroext %call146)
  %conv148 = zext i8 %call147 to i32
  %mul149 = mul nsw i32 1, %conv148
  %xor150 = xor i32 %xor144, %mul149
  %44 = load i8* %b, align 1
  %call151 = call zeroext i8 @xtime(i8 zeroext %44)
  %call152 = call zeroext i8 @xtime(i8 zeroext %call151)
  %call153 = call zeroext i8 @xtime(i8 zeroext %call152)
  %call154 = call zeroext i8 @xtime(i8 zeroext %call153)
  %conv155 = zext i8 %call154 to i32
  %mul156 = mul nsw i32 0, %conv155
  %xor157 = xor i32 %xor150, %mul156
  %xor158 = xor i32 %xor133, %xor157
  %45 = load i8* %c, align 1
  %conv159 = zext i8 %45 to i32
  %mul160 = mul nsw i32 1, %conv159
  %46 = load i8* %c, align 1
  %call161 = call zeroext i8 @xtime(i8 zeroext %46)
  %conv162 = zext i8 %call161 to i32
  %mul163 = mul nsw i32 1, %conv162
  %xor164 = xor i32 %mul160, %mul163
  %47 = load i8* %c, align 1
  %call165 = call zeroext i8 @xtime(i8 zeroext %47)
  %call166 = call zeroext i8 @xtime(i8 zeroext %call165)
  %conv167 = zext i8 %call166 to i32
  %mul168 = mul nsw i32 0, %conv167
  %xor169 = xor i32 %xor164, %mul168
  %48 = load i8* %c, align 1
  %call170 = call zeroext i8 @xtime(i8 zeroext %48)
  %call171 = call zeroext i8 @xtime(i8 zeroext %call170)
  %call172 = call zeroext i8 @xtime(i8 zeroext %call171)
  %conv173 = zext i8 %call172 to i32
  %mul174 = mul nsw i32 1, %conv173
  %xor175 = xor i32 %xor169, %mul174
  %49 = load i8* %c, align 1
  %call176 = call zeroext i8 @xtime(i8 zeroext %49)
  %call177 = call zeroext i8 @xtime(i8 zeroext %call176)
  %call178 = call zeroext i8 @xtime(i8 zeroext %call177)
  %call179 = call zeroext i8 @xtime(i8 zeroext %call178)
  %conv180 = zext i8 %call179 to i32
  %mul181 = mul nsw i32 0, %conv180
  %xor182 = xor i32 %xor175, %mul181
  %xor183 = xor i32 %xor158, %xor182
  %50 = load i8* %d, align 1
  %conv184 = zext i8 %50 to i32
  %mul185 = mul nsw i32 1, %conv184
  %51 = load i8* %d, align 1
  %call186 = call zeroext i8 @xtime(i8 zeroext %51)
  %conv187 = zext i8 %call186 to i32
  %mul188 = mul nsw i32 0, %conv187
  %xor189 = xor i32 %mul185, %mul188
  %52 = load i8* %d, align 1
  %call190 = call zeroext i8 @xtime(i8 zeroext %52)
  %call191 = call zeroext i8 @xtime(i8 zeroext %call190)
  %conv192 = zext i8 %call191 to i32
  %mul193 = mul nsw i32 1, %conv192
  %xor194 = xor i32 %xor189, %mul193
  %53 = load i8* %d, align 1
  %call195 = call zeroext i8 @xtime(i8 zeroext %53)
  %call196 = call zeroext i8 @xtime(i8 zeroext %call195)
  %call197 = call zeroext i8 @xtime(i8 zeroext %call196)
  %conv198 = zext i8 %call197 to i32
  %mul199 = mul nsw i32 1, %conv198
  %xor200 = xor i32 %xor194, %mul199
  %54 = load i8* %d, align 1
  %call201 = call zeroext i8 @xtime(i8 zeroext %54)
  %call202 = call zeroext i8 @xtime(i8 zeroext %call201)
  %call203 = call zeroext i8 @xtime(i8 zeroext %call202)
  %call204 = call zeroext i8 @xtime(i8 zeroext %call203)
  %conv205 = zext i8 %call204 to i32
  %mul206 = mul nsw i32 0, %conv205
  %xor207 = xor i32 %xor200, %mul206
  %xor208 = xor i32 %xor183, %xor207
  %conv209 = trunc i32 %xor208 to i8
  %55 = load i32* %i, align 4
  %idxprom210 = sext i32 %55 to i64
  %56 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx211 = getelementptr inbounds [4 x [4 x i8]]* %56, i32 0, i64 %idxprom210
  %arrayidx212 = getelementptr inbounds [4 x i8]* %arrayidx211, i32 0, i64 1
  store i8 %conv209, i8* %arrayidx212, align 1
  %57 = load i8* %a, align 1
  %conv213 = zext i8 %57 to i32
  %mul214 = mul nsw i32 1, %conv213
  %58 = load i8* %a, align 1
  %call215 = call zeroext i8 @xtime(i8 zeroext %58)
  %conv216 = zext i8 %call215 to i32
  %mul217 = mul nsw i32 0, %conv216
  %xor218 = xor i32 %mul214, %mul217
  %59 = load i8* %a, align 1
  %call219 = call zeroext i8 @xtime(i8 zeroext %59)
  %call220 = call zeroext i8 @xtime(i8 zeroext %call219)
  %conv221 = zext i8 %call220 to i32
  %mul222 = mul nsw i32 1, %conv221
  %xor223 = xor i32 %xor218, %mul222
  %60 = load i8* %a, align 1
  %call224 = call zeroext i8 @xtime(i8 zeroext %60)
  %call225 = call zeroext i8 @xtime(i8 zeroext %call224)
  %call226 = call zeroext i8 @xtime(i8 zeroext %call225)
  %conv227 = zext i8 %call226 to i32
  %mul228 = mul nsw i32 1, %conv227
  %xor229 = xor i32 %xor223, %mul228
  %61 = load i8* %a, align 1
  %call230 = call zeroext i8 @xtime(i8 zeroext %61)
  %call231 = call zeroext i8 @xtime(i8 zeroext %call230)
  %call232 = call zeroext i8 @xtime(i8 zeroext %call231)
  %call233 = call zeroext i8 @xtime(i8 zeroext %call232)
  %conv234 = zext i8 %call233 to i32
  %mul235 = mul nsw i32 0, %conv234
  %xor236 = xor i32 %xor229, %mul235
  %62 = load i8* %b, align 1
  %conv237 = zext i8 %62 to i32
  %mul238 = mul nsw i32 1, %conv237
  %63 = load i8* %b, align 1
  %call239 = call zeroext i8 @xtime(i8 zeroext %63)
  %conv240 = zext i8 %call239 to i32
  %mul241 = mul nsw i32 0, %conv240
  %xor242 = xor i32 %mul238, %mul241
  %64 = load i8* %b, align 1
  %call243 = call zeroext i8 @xtime(i8 zeroext %64)
  %call244 = call zeroext i8 @xtime(i8 zeroext %call243)
  %conv245 = zext i8 %call244 to i32
  %mul246 = mul nsw i32 0, %conv245
  %xor247 = xor i32 %xor242, %mul246
  %65 = load i8* %b, align 1
  %call248 = call zeroext i8 @xtime(i8 zeroext %65)
  %call249 = call zeroext i8 @xtime(i8 zeroext %call248)
  %call250 = call zeroext i8 @xtime(i8 zeroext %call249)
  %conv251 = zext i8 %call250 to i32
  %mul252 = mul nsw i32 1, %conv251
  %xor253 = xor i32 %xor247, %mul252
  %66 = load i8* %b, align 1
  %call254 = call zeroext i8 @xtime(i8 zeroext %66)
  %call255 = call zeroext i8 @xtime(i8 zeroext %call254)
  %call256 = call zeroext i8 @xtime(i8 zeroext %call255)
  %call257 = call zeroext i8 @xtime(i8 zeroext %call256)
  %conv258 = zext i8 %call257 to i32
  %mul259 = mul nsw i32 0, %conv258
  %xor260 = xor i32 %xor253, %mul259
  %xor261 = xor i32 %xor236, %xor260
  %67 = load i8* %c, align 1
  %conv262 = zext i8 %67 to i32
  %mul263 = mul nsw i32 0, %conv262
  %68 = load i8* %c, align 1
  %call264 = call zeroext i8 @xtime(i8 zeroext %68)
  %conv265 = zext i8 %call264 to i32
  %mul266 = mul nsw i32 1, %conv265
  %xor267 = xor i32 %mul263, %mul266
  %69 = load i8* %c, align 1
  %call268 = call zeroext i8 @xtime(i8 zeroext %69)
  %call269 = call zeroext i8 @xtime(i8 zeroext %call268)
  %conv270 = zext i8 %call269 to i32
  %mul271 = mul nsw i32 1, %conv270
  %xor272 = xor i32 %xor267, %mul271
  %70 = load i8* %c, align 1
  %call273 = call zeroext i8 @xtime(i8 zeroext %70)
  %call274 = call zeroext i8 @xtime(i8 zeroext %call273)
  %call275 = call zeroext i8 @xtime(i8 zeroext %call274)
  %conv276 = zext i8 %call275 to i32
  %mul277 = mul nsw i32 1, %conv276
  %xor278 = xor i32 %xor272, %mul277
  %71 = load i8* %c, align 1
  %call279 = call zeroext i8 @xtime(i8 zeroext %71)
  %call280 = call zeroext i8 @xtime(i8 zeroext %call279)
  %call281 = call zeroext i8 @xtime(i8 zeroext %call280)
  %call282 = call zeroext i8 @xtime(i8 zeroext %call281)
  %conv283 = zext i8 %call282 to i32
  %mul284 = mul nsw i32 0, %conv283
  %xor285 = xor i32 %xor278, %mul284
  %xor286 = xor i32 %xor261, %xor285
  %72 = load i8* %d, align 1
  %conv287 = zext i8 %72 to i32
  %mul288 = mul nsw i32 1, %conv287
  %73 = load i8* %d, align 1
  %call289 = call zeroext i8 @xtime(i8 zeroext %73)
  %conv290 = zext i8 %call289 to i32
  %mul291 = mul nsw i32 1, %conv290
  %xor292 = xor i32 %mul288, %mul291
  %74 = load i8* %d, align 1
  %call293 = call zeroext i8 @xtime(i8 zeroext %74)
  %call294 = call zeroext i8 @xtime(i8 zeroext %call293)
  %conv295 = zext i8 %call294 to i32
  %mul296 = mul nsw i32 0, %conv295
  %xor297 = xor i32 %xor292, %mul296
  %75 = load i8* %d, align 1
  %call298 = call zeroext i8 @xtime(i8 zeroext %75)
  %call299 = call zeroext i8 @xtime(i8 zeroext %call298)
  %call300 = call zeroext i8 @xtime(i8 zeroext %call299)
  %conv301 = zext i8 %call300 to i32
  %mul302 = mul nsw i32 1, %conv301
  %xor303 = xor i32 %xor297, %mul302
  %76 = load i8* %d, align 1
  %call304 = call zeroext i8 @xtime(i8 zeroext %76)
  %call305 = call zeroext i8 @xtime(i8 zeroext %call304)
  %call306 = call zeroext i8 @xtime(i8 zeroext %call305)
  %call307 = call zeroext i8 @xtime(i8 zeroext %call306)
  %conv308 = zext i8 %call307 to i32
  %mul309 = mul nsw i32 0, %conv308
  %xor310 = xor i32 %xor303, %mul309
  %xor311 = xor i32 %xor286, %xor310
  %conv312 = trunc i32 %xor311 to i8
  %77 = load i32* %i, align 4
  %idxprom313 = sext i32 %77 to i64
  %78 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx314 = getelementptr inbounds [4 x [4 x i8]]* %78, i32 0, i64 %idxprom313
  %arrayidx315 = getelementptr inbounds [4 x i8]* %arrayidx314, i32 0, i64 2
  store i8 %conv312, i8* %arrayidx315, align 1
  %79 = load i8* %a, align 1
  %conv316 = zext i8 %79 to i32
  %mul317 = mul nsw i32 1, %conv316
  %80 = load i8* %a, align 1
  %call318 = call zeroext i8 @xtime(i8 zeroext %80)
  %conv319 = zext i8 %call318 to i32
  %mul320 = mul nsw i32 1, %conv319
  %xor321 = xor i32 %mul317, %mul320
  %81 = load i8* %a, align 1
  %call322 = call zeroext i8 @xtime(i8 zeroext %81)
  %call323 = call zeroext i8 @xtime(i8 zeroext %call322)
  %conv324 = zext i8 %call323 to i32
  %mul325 = mul nsw i32 0, %conv324
  %xor326 = xor i32 %xor321, %mul325
  %82 = load i8* %a, align 1
  %call327 = call zeroext i8 @xtime(i8 zeroext %82)
  %call328 = call zeroext i8 @xtime(i8 zeroext %call327)
  %call329 = call zeroext i8 @xtime(i8 zeroext %call328)
  %conv330 = zext i8 %call329 to i32
  %mul331 = mul nsw i32 1, %conv330
  %xor332 = xor i32 %xor326, %mul331
  %83 = load i8* %a, align 1
  %call333 = call zeroext i8 @xtime(i8 zeroext %83)
  %call334 = call zeroext i8 @xtime(i8 zeroext %call333)
  %call335 = call zeroext i8 @xtime(i8 zeroext %call334)
  %call336 = call zeroext i8 @xtime(i8 zeroext %call335)
  %conv337 = zext i8 %call336 to i32
  %mul338 = mul nsw i32 0, %conv337
  %xor339 = xor i32 %xor332, %mul338
  %84 = load i8* %b, align 1
  %conv340 = zext i8 %84 to i32
  %mul341 = mul nsw i32 1, %conv340
  %85 = load i8* %b, align 1
  %call342 = call zeroext i8 @xtime(i8 zeroext %85)
  %conv343 = zext i8 %call342 to i32
  %mul344 = mul nsw i32 0, %conv343
  %xor345 = xor i32 %mul341, %mul344
  %86 = load i8* %b, align 1
  %call346 = call zeroext i8 @xtime(i8 zeroext %86)
  %call347 = call zeroext i8 @xtime(i8 zeroext %call346)
  %conv348 = zext i8 %call347 to i32
  %mul349 = mul nsw i32 1, %conv348
  %xor350 = xor i32 %xor345, %mul349
  %87 = load i8* %b, align 1
  %call351 = call zeroext i8 @xtime(i8 zeroext %87)
  %call352 = call zeroext i8 @xtime(i8 zeroext %call351)
  %call353 = call zeroext i8 @xtime(i8 zeroext %call352)
  %conv354 = zext i8 %call353 to i32
  %mul355 = mul nsw i32 1, %conv354
  %xor356 = xor i32 %xor350, %mul355
  %88 = load i8* %b, align 1
  %call357 = call zeroext i8 @xtime(i8 zeroext %88)
  %call358 = call zeroext i8 @xtime(i8 zeroext %call357)
  %call359 = call zeroext i8 @xtime(i8 zeroext %call358)
  %call360 = call zeroext i8 @xtime(i8 zeroext %call359)
  %conv361 = zext i8 %call360 to i32
  %mul362 = mul nsw i32 0, %conv361
  %xor363 = xor i32 %xor356, %mul362
  %xor364 = xor i32 %xor339, %xor363
  %89 = load i8* %c, align 1
  %conv365 = zext i8 %89 to i32
  %mul366 = mul nsw i32 1, %conv365
  %90 = load i8* %c, align 1
  %call367 = call zeroext i8 @xtime(i8 zeroext %90)
  %conv368 = zext i8 %call367 to i32
  %mul369 = mul nsw i32 0, %conv368
  %xor370 = xor i32 %mul366, %mul369
  %91 = load i8* %c, align 1
  %call371 = call zeroext i8 @xtime(i8 zeroext %91)
  %call372 = call zeroext i8 @xtime(i8 zeroext %call371)
  %conv373 = zext i8 %call372 to i32
  %mul374 = mul nsw i32 0, %conv373
  %xor375 = xor i32 %xor370, %mul374
  %92 = load i8* %c, align 1
  %call376 = call zeroext i8 @xtime(i8 zeroext %92)
  %call377 = call zeroext i8 @xtime(i8 zeroext %call376)
  %call378 = call zeroext i8 @xtime(i8 zeroext %call377)
  %conv379 = zext i8 %call378 to i32
  %mul380 = mul nsw i32 1, %conv379
  %xor381 = xor i32 %xor375, %mul380
  %93 = load i8* %c, align 1
  %call382 = call zeroext i8 @xtime(i8 zeroext %93)
  %call383 = call zeroext i8 @xtime(i8 zeroext %call382)
  %call384 = call zeroext i8 @xtime(i8 zeroext %call383)
  %call385 = call zeroext i8 @xtime(i8 zeroext %call384)
  %conv386 = zext i8 %call385 to i32
  %mul387 = mul nsw i32 0, %conv386
  %xor388 = xor i32 %xor381, %mul387
  %xor389 = xor i32 %xor364, %xor388
  %94 = load i8* %d, align 1
  %conv390 = zext i8 %94 to i32
  %mul391 = mul nsw i32 0, %conv390
  %95 = load i8* %d, align 1
  %call392 = call zeroext i8 @xtime(i8 zeroext %95)
  %conv393 = zext i8 %call392 to i32
  %mul394 = mul nsw i32 1, %conv393
  %xor395 = xor i32 %mul391, %mul394
  %96 = load i8* %d, align 1
  %call396 = call zeroext i8 @xtime(i8 zeroext %96)
  %call397 = call zeroext i8 @xtime(i8 zeroext %call396)
  %conv398 = zext i8 %call397 to i32
  %mul399 = mul nsw i32 1, %conv398
  %xor400 = xor i32 %xor395, %mul399
  %97 = load i8* %d, align 1
  %call401 = call zeroext i8 @xtime(i8 zeroext %97)
  %call402 = call zeroext i8 @xtime(i8 zeroext %call401)
  %call403 = call zeroext i8 @xtime(i8 zeroext %call402)
  %conv404 = zext i8 %call403 to i32
  %mul405 = mul nsw i32 1, %conv404
  %xor406 = xor i32 %xor400, %mul405
  %98 = load i8* %d, align 1
  %call407 = call zeroext i8 @xtime(i8 zeroext %98)
  %call408 = call zeroext i8 @xtime(i8 zeroext %call407)
  %call409 = call zeroext i8 @xtime(i8 zeroext %call408)
  %call410 = call zeroext i8 @xtime(i8 zeroext %call409)
  %conv411 = zext i8 %call410 to i32
  %mul412 = mul nsw i32 0, %conv411
  %xor413 = xor i32 %xor406, %mul412
  %xor414 = xor i32 %xor389, %xor413
  %conv415 = trunc i32 %xor414 to i8
  %99 = load i32* %i, align 4
  %idxprom416 = sext i32 %99 to i64
  %100 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx417 = getelementptr inbounds [4 x [4 x i8]]* %100, i32 0, i64 %idxprom416
  %arrayidx418 = getelementptr inbounds [4 x i8]* %arrayidx417, i32 0, i64 3
  store i8 %conv415, i8* %arrayidx418, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %101 = load i32* %i, align 4
  %inc = add nsw i32 %101, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @xtime(i8 zeroext %x) #0 {
entry:
  %x.addr = alloca i8, align 1
  store i8 %x, i8* %x.addr, align 1
  %0 = load i8* %x.addr, align 1
  %conv = zext i8 %0 to i32
  %shl = shl i32 %conv, 1
  %1 = load i8* %x.addr, align 1
  %conv1 = zext i8 %1 to i32
  %shr = ashr i32 %conv1, 7
  %and = and i32 %shr, 1
  %mul = mul nsw i32 %and, 27
  %xor = xor i32 %shl, %mul
  %conv2 = trunc i32 %xor to i8
  ret i8 %conv2
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @getSBoxInvert(i8 zeroext %num) #0 {
entry:
  %num.addr = alloca i8, align 1
  store i8 %num, i8* %num.addr, align 1
  %0 = load i8* %num.addr, align 1
  %idxprom = zext i8 %0 to i64
  %arrayidx = getelementptr inbounds [256 x i8]* @rsbox, i32 0, i64 %idxprom
  %1 = load i8* %arrayidx, align 1
  ret i8 %1
}

; Function Attrs: nounwind uwtable
define internal void @SubBytes() #0 {
entry:
  %i = alloca i8, align 1
  %j = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc13, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end15

for.body:                                         ; preds = %for.cond
  store i8 0, i8* %j, align 1
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %1 = load i8* %j, align 1
  %conv3 = zext i8 %1 to i32
  %cmp4 = icmp slt i32 %conv3, 4
  br i1 %cmp4, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond2
  %2 = load i8* %i, align 1
  %idxprom = zext i8 %2 to i64
  %3 = load i8* %j, align 1
  %idxprom7 = zext i8 %3 to i64
  %4 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %4, i32 0, i64 %idxprom7
  %arrayidx8 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 %idxprom
  %5 = load i8* %arrayidx8, align 1
  %call = call zeroext i8 @getSBoxValue(i8 zeroext %5)
  %6 = load i8* %i, align 1
  %idxprom9 = zext i8 %6 to i64
  %7 = load i8* %j, align 1
  %idxprom10 = zext i8 %7 to i64
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx11 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 %idxprom10
  %arrayidx12 = getelementptr inbounds [4 x i8]* %arrayidx11, i32 0, i64 %idxprom9
  store i8 %call, i8* %arrayidx12, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %9 = load i8* %j, align 1
  %inc = add i8 %9, 1
  store i8 %inc, i8* %j, align 1
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc13

for.inc13:                                        ; preds = %for.end
  %10 = load i8* %i, align 1
  %inc14 = add i8 %10, 1
  store i8 %inc14, i8* %i, align 1
  br label %for.cond

for.end15:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @ShiftRows() #0 {
entry:
  %temp = alloca i8, align 1
  %0 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %0, i32 0, i64 0
  %arrayidx1 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 1
  %1 = load i8* %arrayidx1, align 1
  store i8 %1, i8* %temp, align 1
  %2 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx2 = getelementptr inbounds [4 x [4 x i8]]* %2, i32 0, i64 1
  %arrayidx3 = getelementptr inbounds [4 x i8]* %arrayidx2, i32 0, i64 1
  %3 = load i8* %arrayidx3, align 1
  %4 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]]* %4, i32 0, i64 0
  %arrayidx5 = getelementptr inbounds [4 x i8]* %arrayidx4, i32 0, i64 1
  store i8 %3, i8* %arrayidx5, align 1
  %5 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx6 = getelementptr inbounds [4 x [4 x i8]]* %5, i32 0, i64 2
  %arrayidx7 = getelementptr inbounds [4 x i8]* %arrayidx6, i32 0, i64 1
  %6 = load i8* %arrayidx7, align 1
  %7 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]]* %7, i32 0, i64 1
  %arrayidx9 = getelementptr inbounds [4 x i8]* %arrayidx8, i32 0, i64 1
  store i8 %6, i8* %arrayidx9, align 1
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx10 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 3
  %arrayidx11 = getelementptr inbounds [4 x i8]* %arrayidx10, i32 0, i64 1
  %9 = load i8* %arrayidx11, align 1
  %10 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]]* %10, i32 0, i64 2
  %arrayidx13 = getelementptr inbounds [4 x i8]* %arrayidx12, i32 0, i64 1
  store i8 %9, i8* %arrayidx13, align 1
  %11 = load i8* %temp, align 1
  %12 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx14 = getelementptr inbounds [4 x [4 x i8]]* %12, i32 0, i64 3
  %arrayidx15 = getelementptr inbounds [4 x i8]* %arrayidx14, i32 0, i64 1
  store i8 %11, i8* %arrayidx15, align 1
  %13 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx16 = getelementptr inbounds [4 x [4 x i8]]* %13, i32 0, i64 0
  %arrayidx17 = getelementptr inbounds [4 x i8]* %arrayidx16, i32 0, i64 2
  %14 = load i8* %arrayidx17, align 1
  store i8 %14, i8* %temp, align 1
  %15 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx18 = getelementptr inbounds [4 x [4 x i8]]* %15, i32 0, i64 2
  %arrayidx19 = getelementptr inbounds [4 x i8]* %arrayidx18, i32 0, i64 2
  %16 = load i8* %arrayidx19, align 1
  %17 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx20 = getelementptr inbounds [4 x [4 x i8]]* %17, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [4 x i8]* %arrayidx20, i32 0, i64 2
  store i8 %16, i8* %arrayidx21, align 1
  %18 = load i8* %temp, align 1
  %19 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx22 = getelementptr inbounds [4 x [4 x i8]]* %19, i32 0, i64 2
  %arrayidx23 = getelementptr inbounds [4 x i8]* %arrayidx22, i32 0, i64 2
  store i8 %18, i8* %arrayidx23, align 1
  %20 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx24 = getelementptr inbounds [4 x [4 x i8]]* %20, i32 0, i64 1
  %arrayidx25 = getelementptr inbounds [4 x i8]* %arrayidx24, i32 0, i64 2
  %21 = load i8* %arrayidx25, align 1
  store i8 %21, i8* %temp, align 1
  %22 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx26 = getelementptr inbounds [4 x [4 x i8]]* %22, i32 0, i64 3
  %arrayidx27 = getelementptr inbounds [4 x i8]* %arrayidx26, i32 0, i64 2
  %23 = load i8* %arrayidx27, align 1
  %24 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx28 = getelementptr inbounds [4 x [4 x i8]]* %24, i32 0, i64 1
  %arrayidx29 = getelementptr inbounds [4 x i8]* %arrayidx28, i32 0, i64 2
  store i8 %23, i8* %arrayidx29, align 1
  %25 = load i8* %temp, align 1
  %26 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx30 = getelementptr inbounds [4 x [4 x i8]]* %26, i32 0, i64 3
  %arrayidx31 = getelementptr inbounds [4 x i8]* %arrayidx30, i32 0, i64 2
  store i8 %25, i8* %arrayidx31, align 1
  %27 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx32 = getelementptr inbounds [4 x [4 x i8]]* %27, i32 0, i64 0
  %arrayidx33 = getelementptr inbounds [4 x i8]* %arrayidx32, i32 0, i64 3
  %28 = load i8* %arrayidx33, align 1
  store i8 %28, i8* %temp, align 1
  %29 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx34 = getelementptr inbounds [4 x [4 x i8]]* %29, i32 0, i64 3
  %arrayidx35 = getelementptr inbounds [4 x i8]* %arrayidx34, i32 0, i64 3
  %30 = load i8* %arrayidx35, align 1
  %31 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]]* %31, i32 0, i64 0
  %arrayidx37 = getelementptr inbounds [4 x i8]* %arrayidx36, i32 0, i64 3
  store i8 %30, i8* %arrayidx37, align 1
  %32 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx38 = getelementptr inbounds [4 x [4 x i8]]* %32, i32 0, i64 2
  %arrayidx39 = getelementptr inbounds [4 x i8]* %arrayidx38, i32 0, i64 3
  %33 = load i8* %arrayidx39, align 1
  %34 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx40 = getelementptr inbounds [4 x [4 x i8]]* %34, i32 0, i64 3
  %arrayidx41 = getelementptr inbounds [4 x i8]* %arrayidx40, i32 0, i64 3
  store i8 %33, i8* %arrayidx41, align 1
  %35 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]]* %35, i32 0, i64 1
  %arrayidx43 = getelementptr inbounds [4 x i8]* %arrayidx42, i32 0, i64 3
  %36 = load i8* %arrayidx43, align 1
  %37 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx44 = getelementptr inbounds [4 x [4 x i8]]* %37, i32 0, i64 2
  %arrayidx45 = getelementptr inbounds [4 x i8]* %arrayidx44, i32 0, i64 3
  store i8 %36, i8* %arrayidx45, align 1
  %38 = load i8* %temp, align 1
  %39 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]]* %39, i32 0, i64 1
  %arrayidx47 = getelementptr inbounds [4 x i8]* %arrayidx46, i32 0, i64 3
  store i8 %38, i8* %arrayidx47, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MixColumns() #0 {
entry:
  %i = alloca i8, align 1
  %Tmp = alloca i8, align 1
  %Tm = alloca i8, align 1
  %t = alloca i8, align 1
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8* %i, align 1
  %idxprom = zext i8 %1 to i64
  %2 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx = getelementptr inbounds [4 x [4 x i8]]* %2, i32 0, i64 %idxprom
  %arrayidx2 = getelementptr inbounds [4 x i8]* %arrayidx, i32 0, i64 0
  %3 = load i8* %arrayidx2, align 1
  store i8 %3, i8* %t, align 1
  %4 = load i8* %i, align 1
  %idxprom3 = zext i8 %4 to i64
  %5 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx4 = getelementptr inbounds [4 x [4 x i8]]* %5, i32 0, i64 %idxprom3
  %arrayidx5 = getelementptr inbounds [4 x i8]* %arrayidx4, i32 0, i64 0
  %6 = load i8* %arrayidx5, align 1
  %conv6 = zext i8 %6 to i32
  %7 = load i8* %i, align 1
  %idxprom7 = zext i8 %7 to i64
  %8 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx8 = getelementptr inbounds [4 x [4 x i8]]* %8, i32 0, i64 %idxprom7
  %arrayidx9 = getelementptr inbounds [4 x i8]* %arrayidx8, i32 0, i64 1
  %9 = load i8* %arrayidx9, align 1
  %conv10 = zext i8 %9 to i32
  %xor = xor i32 %conv6, %conv10
  %10 = load i8* %i, align 1
  %idxprom11 = zext i8 %10 to i64
  %11 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx12 = getelementptr inbounds [4 x [4 x i8]]* %11, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [4 x i8]* %arrayidx12, i32 0, i64 2
  %12 = load i8* %arrayidx13, align 1
  %conv14 = zext i8 %12 to i32
  %xor15 = xor i32 %xor, %conv14
  %13 = load i8* %i, align 1
  %idxprom16 = zext i8 %13 to i64
  %14 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx17 = getelementptr inbounds [4 x [4 x i8]]* %14, i32 0, i64 %idxprom16
  %arrayidx18 = getelementptr inbounds [4 x i8]* %arrayidx17, i32 0, i64 3
  %15 = load i8* %arrayidx18, align 1
  %conv19 = zext i8 %15 to i32
  %xor20 = xor i32 %xor15, %conv19
  %conv21 = trunc i32 %xor20 to i8
  store i8 %conv21, i8* %Tmp, align 1
  %16 = load i8* %i, align 1
  %idxprom22 = zext i8 %16 to i64
  %17 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx23 = getelementptr inbounds [4 x [4 x i8]]* %17, i32 0, i64 %idxprom22
  %arrayidx24 = getelementptr inbounds [4 x i8]* %arrayidx23, i32 0, i64 0
  %18 = load i8* %arrayidx24, align 1
  %conv25 = zext i8 %18 to i32
  %19 = load i8* %i, align 1
  %idxprom26 = zext i8 %19 to i64
  %20 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx27 = getelementptr inbounds [4 x [4 x i8]]* %20, i32 0, i64 %idxprom26
  %arrayidx28 = getelementptr inbounds [4 x i8]* %arrayidx27, i32 0, i64 1
  %21 = load i8* %arrayidx28, align 1
  %conv29 = zext i8 %21 to i32
  %xor30 = xor i32 %conv25, %conv29
  %conv31 = trunc i32 %xor30 to i8
  store i8 %conv31, i8* %Tm, align 1
  %22 = load i8* %Tm, align 1
  %call = call zeroext i8 @xtime(i8 zeroext %22)
  store i8 %call, i8* %Tm, align 1
  %23 = load i8* %Tm, align 1
  %conv32 = zext i8 %23 to i32
  %24 = load i8* %Tmp, align 1
  %conv33 = zext i8 %24 to i32
  %xor34 = xor i32 %conv32, %conv33
  %25 = load i8* %i, align 1
  %idxprom35 = zext i8 %25 to i64
  %26 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx36 = getelementptr inbounds [4 x [4 x i8]]* %26, i32 0, i64 %idxprom35
  %arrayidx37 = getelementptr inbounds [4 x i8]* %arrayidx36, i32 0, i64 0
  %27 = load i8* %arrayidx37, align 1
  %conv38 = zext i8 %27 to i32
  %xor39 = xor i32 %conv38, %xor34
  %conv40 = trunc i32 %xor39 to i8
  store i8 %conv40, i8* %arrayidx37, align 1
  %28 = load i8* %i, align 1
  %idxprom41 = zext i8 %28 to i64
  %29 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx42 = getelementptr inbounds [4 x [4 x i8]]* %29, i32 0, i64 %idxprom41
  %arrayidx43 = getelementptr inbounds [4 x i8]* %arrayidx42, i32 0, i64 1
  %30 = load i8* %arrayidx43, align 1
  %conv44 = zext i8 %30 to i32
  %31 = load i8* %i, align 1
  %idxprom45 = zext i8 %31 to i64
  %32 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx46 = getelementptr inbounds [4 x [4 x i8]]* %32, i32 0, i64 %idxprom45
  %arrayidx47 = getelementptr inbounds [4 x i8]* %arrayidx46, i32 0, i64 2
  %33 = load i8* %arrayidx47, align 1
  %conv48 = zext i8 %33 to i32
  %xor49 = xor i32 %conv44, %conv48
  %conv50 = trunc i32 %xor49 to i8
  store i8 %conv50, i8* %Tm, align 1
  %34 = load i8* %Tm, align 1
  %call51 = call zeroext i8 @xtime(i8 zeroext %34)
  store i8 %call51, i8* %Tm, align 1
  %35 = load i8* %Tm, align 1
  %conv52 = zext i8 %35 to i32
  %36 = load i8* %Tmp, align 1
  %conv53 = zext i8 %36 to i32
  %xor54 = xor i32 %conv52, %conv53
  %37 = load i8* %i, align 1
  %idxprom55 = zext i8 %37 to i64
  %38 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx56 = getelementptr inbounds [4 x [4 x i8]]* %38, i32 0, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [4 x i8]* %arrayidx56, i32 0, i64 1
  %39 = load i8* %arrayidx57, align 1
  %conv58 = zext i8 %39 to i32
  %xor59 = xor i32 %conv58, %xor54
  %conv60 = trunc i32 %xor59 to i8
  store i8 %conv60, i8* %arrayidx57, align 1
  %40 = load i8* %i, align 1
  %idxprom61 = zext i8 %40 to i64
  %41 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx62 = getelementptr inbounds [4 x [4 x i8]]* %41, i32 0, i64 %idxprom61
  %arrayidx63 = getelementptr inbounds [4 x i8]* %arrayidx62, i32 0, i64 2
  %42 = load i8* %arrayidx63, align 1
  %conv64 = zext i8 %42 to i32
  %43 = load i8* %i, align 1
  %idxprom65 = zext i8 %43 to i64
  %44 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx66 = getelementptr inbounds [4 x [4 x i8]]* %44, i32 0, i64 %idxprom65
  %arrayidx67 = getelementptr inbounds [4 x i8]* %arrayidx66, i32 0, i64 3
  %45 = load i8* %arrayidx67, align 1
  %conv68 = zext i8 %45 to i32
  %xor69 = xor i32 %conv64, %conv68
  %conv70 = trunc i32 %xor69 to i8
  store i8 %conv70, i8* %Tm, align 1
  %46 = load i8* %Tm, align 1
  %call71 = call zeroext i8 @xtime(i8 zeroext %46)
  store i8 %call71, i8* %Tm, align 1
  %47 = load i8* %Tm, align 1
  %conv72 = zext i8 %47 to i32
  %48 = load i8* %Tmp, align 1
  %conv73 = zext i8 %48 to i32
  %xor74 = xor i32 %conv72, %conv73
  %49 = load i8* %i, align 1
  %idxprom75 = zext i8 %49 to i64
  %50 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx76 = getelementptr inbounds [4 x [4 x i8]]* %50, i32 0, i64 %idxprom75
  %arrayidx77 = getelementptr inbounds [4 x i8]* %arrayidx76, i32 0, i64 2
  %51 = load i8* %arrayidx77, align 1
  %conv78 = zext i8 %51 to i32
  %xor79 = xor i32 %conv78, %xor74
  %conv80 = trunc i32 %xor79 to i8
  store i8 %conv80, i8* %arrayidx77, align 1
  %52 = load i8* %i, align 1
  %idxprom81 = zext i8 %52 to i64
  %53 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx82 = getelementptr inbounds [4 x [4 x i8]]* %53, i32 0, i64 %idxprom81
  %arrayidx83 = getelementptr inbounds [4 x i8]* %arrayidx82, i32 0, i64 3
  %54 = load i8* %arrayidx83, align 1
  %conv84 = zext i8 %54 to i32
  %55 = load i8* %t, align 1
  %conv85 = zext i8 %55 to i32
  %xor86 = xor i32 %conv84, %conv85
  %conv87 = trunc i32 %xor86 to i8
  store i8 %conv87, i8* %Tm, align 1
  %56 = load i8* %Tm, align 1
  %call88 = call zeroext i8 @xtime(i8 zeroext %56)
  store i8 %call88, i8* %Tm, align 1
  %57 = load i8* %Tm, align 1
  %conv89 = zext i8 %57 to i32
  %58 = load i8* %Tmp, align 1
  %conv90 = zext i8 %58 to i32
  %xor91 = xor i32 %conv89, %conv90
  %59 = load i8* %i, align 1
  %idxprom92 = zext i8 %59 to i64
  %60 = load [4 x [4 x i8]]** @state, align 8
  %arrayidx93 = getelementptr inbounds [4 x [4 x i8]]* %60, i32 0, i64 %idxprom92
  %arrayidx94 = getelementptr inbounds [4 x i8]* %arrayidx93, i32 0, i64 3
  %61 = load i8* %arrayidx94, align 1
  %conv95 = zext i8 %61 to i32
  %xor96 = xor i32 %conv95, %xor91
  %conv97 = trunc i32 %xor96 to i8
  store i8 %conv97, i8* %arrayidx94, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %62 = load i8* %i, align 1
  %inc = add i8 %62, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal zeroext i8 @getSBoxValue(i8 zeroext %num) #0 {
entry:
  %num.addr = alloca i8, align 1
  store i8 %num, i8* %num.addr, align 1
  %0 = load i8* %num.addr, align 1
  %idxprom = zext i8 %0 to i64
  %arrayidx = getelementptr inbounds [256 x i8]* @sbox, i32 0, i64 %idxprom
  %1 = load i8* %arrayidx, align 1
  ret i8 %1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test_encrypt_ecb_verbose()
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.var.annotation(i8*, i8*, i8*, i32) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal void @test_encrypt_ecb_verbose() #0 {
entry:
  %i = alloca i8, align 1
  %buf = alloca [64 x i8], align 16
  %buf2 = alloca [64 x i8], align 16
  %key = alloca [16 x i8], align 16
  %plain_text = alloca [64 x i8], align 16
  %key1 = bitcast [16 x i8]* %key to i8*
  call void @llvm.var.annotation(i8* %key1, i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str1, i32 0, i32 0), i32 50)
  %0 = bitcast [16 x i8]* %key to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([16 x i8]* @test_encrypt_ecb_verbose.key, i32 0, i32 0), i64 16, i32 16, i1 false)
  %1 = bitcast [64 x i8]* %plain_text to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* getelementptr inbounds ([64 x i8]* @test_encrypt_ecb_verbose.plain_text, i32 0, i32 0), i64 64, i32 16, i1 false)
  %2 = bitcast [64 x i8]* %buf to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 64, i32 16, i1 false)
  %3 = bitcast [64 x i8]* %buf2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %3, i8 0, i64 64, i32 16, i1 false)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i32 0, i32 0))
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i8* %i, align 1
  %conv = zext i8 %4 to i32
  %cmp = icmp slt i32 %conv, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay = getelementptr inbounds [64 x i8]* %plain_text, i32 0, i32 0
  %5 = load i8* %i, align 1
  %conv4 = zext i8 %5 to i32
  %mul = mul nsw i32 %conv4, 16
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8* %arraydecay, i64 %idx.ext
  call void @phex(i8* %add.ptr)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i8* %i, align 1
  %inc = add i8 %6, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0))
  %arraydecay7 = getelementptr inbounds [16 x i8]* %key, i32 0, i32 0
  call void @phex(i8* %arraydecay7)
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str6, i32 0, i32 0))
  store i8 0, i8* %i, align 1
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc31, %for.end
  %7 = load i8* %i, align 1
  %conv11 = zext i8 %7 to i32
  %cmp12 = icmp slt i32 %conv11, 4
  br i1 %cmp12, label %for.body14, label %for.end33

for.body14:                                       ; preds = %for.cond10
  %arraydecay15 = getelementptr inbounds [64 x i8]* %plain_text, i32 0, i32 0
  %8 = load i8* %i, align 1
  %conv16 = zext i8 %8 to i32
  %mul17 = mul nsw i32 %conv16, 16
  %idx.ext18 = sext i32 %mul17 to i64
  %add.ptr19 = getelementptr inbounds i8* %arraydecay15, i64 %idx.ext18
  %arraydecay20 = getelementptr inbounds [16 x i8]* %key, i32 0, i32 0
  %arraydecay21 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %9 = load i8* %i, align 1
  %conv22 = zext i8 %9 to i32
  %mul23 = mul nsw i32 %conv22, 16
  %idx.ext24 = sext i32 %mul23 to i64
  %add.ptr25 = getelementptr inbounds i8* %arraydecay21, i64 %idx.ext24
  call void @AES128_ECB_encrypt(i8* %add.ptr19, i8* %arraydecay20, i8* %add.ptr25)
  %arraydecay26 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %10 = load i8* %i, align 1
  %conv27 = zext i8 %10 to i32
  %mul28 = mul nsw i32 %conv27, 16
  %idx.ext29 = sext i32 %mul28 to i64
  %add.ptr30 = getelementptr inbounds i8* %arraydecay26, i64 %idx.ext29
  call void @phex(i8* %add.ptr30)
  br label %for.inc31

for.inc31:                                        ; preds = %for.body14
  %11 = load i8* %i, align 1
  %inc32 = add i8 %11, 1
  store i8 %inc32, i8* %i, align 1
  br label %for.cond10

for.end33:                                        ; preds = %for.cond10
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str7, i32 0, i32 0))
  store i8 0, i8* %i, align 1
  br label %for.cond36

for.cond36:                                       ; preds = %for.inc57, %for.end33
  %12 = load i8* %i, align 1
  %conv37 = zext i8 %12 to i32
  %cmp38 = icmp slt i32 %conv37, 4
  br i1 %cmp38, label %for.body40, label %for.end59

for.body40:                                       ; preds = %for.cond36
  %arraydecay41 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %13 = load i8* %i, align 1
  %conv42 = zext i8 %13 to i32
  %mul43 = mul nsw i32 %conv42, 16
  %idx.ext44 = sext i32 %mul43 to i64
  %add.ptr45 = getelementptr inbounds i8* %arraydecay41, i64 %idx.ext44
  %arraydecay46 = getelementptr inbounds [16 x i8]* %key, i32 0, i32 0
  %arraydecay47 = getelementptr inbounds [64 x i8]* %buf2, i32 0, i32 0
  %14 = load i8* %i, align 1
  %conv48 = zext i8 %14 to i32
  %mul49 = mul nsw i32 %conv48, 16
  %idx.ext50 = sext i32 %mul49 to i64
  %add.ptr51 = getelementptr inbounds i8* %arraydecay47, i64 %idx.ext50
  call void @AES128_ECB_decrypt(i8* %add.ptr45, i8* %arraydecay46, i8* %add.ptr51)
  %arraydecay52 = getelementptr inbounds [64 x i8]* %buf2, i32 0, i32 0
  %15 = load i8* %i, align 1
  %conv53 = zext i8 %15 to i32
  %mul54 = mul nsw i32 %conv53, 16
  %idx.ext55 = sext i32 %mul54 to i64
  %add.ptr56 = getelementptr inbounds i8* %arraydecay52, i64 %idx.ext55
  call void @phex(i8* %add.ptr56)
  br label %for.inc57

for.inc57:                                        ; preds = %for.body40
  %16 = load i8* %i, align 1
  %inc58 = add i8 %16, 1
  store i8 %inc58, i8* %i, align 1
  br label %for.cond36

for.end59:                                        ; preds = %for.cond36
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @phex(i8* %str) #0 {
entry:
  %str.addr = alloca i8*, align 8
  %i = alloca i8, align 1
  store i8* %str, i8** %str.addr, align 8
  store i8 0, i8* %i, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i8* %i, align 1
  %conv = zext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i8* %i, align 1
  %idxprom = zext i8 %1 to i64
  %2 = load i8** %str.addr, align 8
  %arrayidx = getelementptr inbounds i8* %2, i64 %idxprom
  %3 = load i8* %arrayidx, align 1
  %conv2 = zext i8 %3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0), i32 %conv2)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i8* %i, align 1
  %inc = add i8 %4, 1
  store i8 %inc, i8* %i, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0))
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
