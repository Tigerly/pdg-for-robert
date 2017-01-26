; ModuleID = 'lbm.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.MAIN_Param = type { i32, i8*, i32, i32, i8* }
%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@.str = private unnamed_addr constant [49 x i8] c"LBM_allocateGrid: could not allocate %.1f MByte\0A\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str2 = private unnamed_addr constant [138 x i8] c"LBM_showGridStatistics:\0A\09nObstacleCells: %7i nAccelCells: %7i nFluidCells: %7i\0A\09minRho: %8.4f maxRho: %8.4f mass: %e\0A\09minU: %e maxU: %e\0A\0A\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"wb\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str5 = private unnamed_addr constant [10 x i8] c"%e %e %e\0A\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str7 = private unnamed_addr constant [10 x i8] c"%f %f %f\0A\00", align 1
@.str8 = private unnamed_addr constant [43 x i8] c"LBM_compareVelocityField: maxDiff = %e  \0A\0A\00", align 1
@srcGrid = internal global [26000000 x double]* null, align 8
@dstGrid = internal global [26000000 x double]* null, align 8
@.str9 = private unnamed_addr constant [14 x i8] c"timestep: %i\0A\00", align 1
@.str110 = private unnamed_addr constant [109 x i8] c"syntax: lbm <time steps> <result file> <0: nil, 1: cmp, 2: str> <0: ldc, 1: channel flow> [<obstacle file>]\0A\00", align 1
@.str211 = private unnamed_addr constant [55 x i8] c"MAIN_parseCommandLine: cannot stat obstacle file '%s'\0A\00", align 1
@.str312 = private unnamed_addr constant [82 x i8] c"MAIN_parseCommandLine:\0A\09size of file '%s' is %i bytes\0A\09expected size is %i bytes\0A\00", align 1
@.str413 = private unnamed_addr constant [53 x i8] c"MAIN_parseCommandLine: cannot stat result file '%s'\0A\00", align 1
@MAIN_printInfo.actionString = internal constant [3 x [32 x i8]] [[32 x i8] c"nothing\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"compare\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"store\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"], align 16
@MAIN_printInfo.simTypeString = internal constant [3 x [32 x i8]] [[32 x i8] c"lid-driven cavity\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] c"channel flow\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", [32 x i8] zeroinitializer], align 16
@.str514 = private unnamed_addr constant [174 x i8] c"MAIN_printInfo:\0A\09grid size      : %i x %i x %i = %.2f * 10^6 Cells\0A\09nTimeSteps     : %i\0A\09result file    : %s\0A\09action         : %s\0A\09simulation type: %s\0A\09obstacle file  : %s\0A\0A\00", align 1
@.str615 = private unnamed_addr constant [7 x i8] c"<none>\00", align 1
@.str716 = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str817 = private unnamed_addr constant [7 x i8] c"main.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast ([26000000 x double]** @srcGrid to i8*), i8* getelementptr inbounds ([10 x i8]* @.str716, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str817, i32 0, i32 0), i32 21 }], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define internal void @LBM_allocateGrid(double** %ptr) #0 {
entry:
  %ptr.addr = alloca double**, align 8
  %margin = alloca i64, align 8
  %size = alloca i64, align 8
  store double** %ptr, double*** %ptr.addr, align 8
  store i64 400000, i64* %margin, align 8
  store i64 214400000, i64* %size, align 8
  %call = call noalias i8* @malloc(i64 214400000) #5
  %0 = bitcast i8* %call to double*
  %1 = load double*** %ptr.addr, align 8
  store double* %0, double** %1, align 8
  %2 = load double*** %ptr.addr, align 8
  %3 = load double** %2, align 8
  %tobool = icmp ne double* %3, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([49 x i8]* @.str, i32 0, i32 0), double 0x40698EF800000000)
  call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %entry
  %4 = load double*** %ptr.addr, align 8
  %5 = load double** %4, align 8
  %add.ptr = getelementptr inbounds double* %5, i64 400000
  store double* %add.ptr, double** %4, align 8
  ret void
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define internal void @LBM_freeGrid(double** %ptr) #0 {
entry:
  %ptr.addr = alloca double**, align 8
  %margin = alloca i64, align 8
  store double** %ptr, double*** %ptr.addr, align 8
  store i64 400000, i64* %margin, align 8
  %0 = load double*** %ptr.addr, align 8
  %1 = load double** %0, align 8
  %add.ptr = getelementptr inbounds double* %1, i64 -400000
  %2 = bitcast double* %add.ptr to i8*
  call void @free(i8* %2) #5
  %3 = load double*** %ptr.addr, align 8
  store double* null, double** %3, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define internal void @LBM_initializeGrid(double* %grid) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i32 -400000, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 26400000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 0, %1
  %idxprom = sext i32 %add to i64
  %2 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  store double 0x3FD5555555555555, double* %arrayidx, align 8
  %3 = load i32* %i, align 4
  %add1 = add nsw i32 1, %3
  %idxprom2 = sext i32 %add1 to i64
  %4 = load double** %grid.addr, align 8
  %arrayidx3 = getelementptr inbounds double* %4, i64 %idxprom2
  store double 0x3FAC71C71C71C71C, double* %arrayidx3, align 8
  %5 = load i32* %i, align 4
  %add4 = add nsw i32 2, %5
  %idxprom5 = sext i32 %add4 to i64
  %6 = load double** %grid.addr, align 8
  %arrayidx6 = getelementptr inbounds double* %6, i64 %idxprom5
  store double 0x3FAC71C71C71C71C, double* %arrayidx6, align 8
  %7 = load i32* %i, align 4
  %add7 = add nsw i32 3, %7
  %idxprom8 = sext i32 %add7 to i64
  %8 = load double** %grid.addr, align 8
  %arrayidx9 = getelementptr inbounds double* %8, i64 %idxprom8
  store double 0x3FAC71C71C71C71C, double* %arrayidx9, align 8
  %9 = load i32* %i, align 4
  %add10 = add nsw i32 4, %9
  %idxprom11 = sext i32 %add10 to i64
  %10 = load double** %grid.addr, align 8
  %arrayidx12 = getelementptr inbounds double* %10, i64 %idxprom11
  store double 0x3FAC71C71C71C71C, double* %arrayidx12, align 8
  %11 = load i32* %i, align 4
  %add13 = add nsw i32 5, %11
  %idxprom14 = sext i32 %add13 to i64
  %12 = load double** %grid.addr, align 8
  %arrayidx15 = getelementptr inbounds double* %12, i64 %idxprom14
  store double 0x3FAC71C71C71C71C, double* %arrayidx15, align 8
  %13 = load i32* %i, align 4
  %add16 = add nsw i32 6, %13
  %idxprom17 = sext i32 %add16 to i64
  %14 = load double** %grid.addr, align 8
  %arrayidx18 = getelementptr inbounds double* %14, i64 %idxprom17
  store double 0x3FAC71C71C71C71C, double* %arrayidx18, align 8
  %15 = load i32* %i, align 4
  %add19 = add nsw i32 7, %15
  %idxprom20 = sext i32 %add19 to i64
  %16 = load double** %grid.addr, align 8
  %arrayidx21 = getelementptr inbounds double* %16, i64 %idxprom20
  store double 0x3F9C71C71C71C71C, double* %arrayidx21, align 8
  %17 = load i32* %i, align 4
  %add22 = add nsw i32 8, %17
  %idxprom23 = sext i32 %add22 to i64
  %18 = load double** %grid.addr, align 8
  %arrayidx24 = getelementptr inbounds double* %18, i64 %idxprom23
  store double 0x3F9C71C71C71C71C, double* %arrayidx24, align 8
  %19 = load i32* %i, align 4
  %add25 = add nsw i32 9, %19
  %idxprom26 = sext i32 %add25 to i64
  %20 = load double** %grid.addr, align 8
  %arrayidx27 = getelementptr inbounds double* %20, i64 %idxprom26
  store double 0x3F9C71C71C71C71C, double* %arrayidx27, align 8
  %21 = load i32* %i, align 4
  %add28 = add nsw i32 10, %21
  %idxprom29 = sext i32 %add28 to i64
  %22 = load double** %grid.addr, align 8
  %arrayidx30 = getelementptr inbounds double* %22, i64 %idxprom29
  store double 0x3F9C71C71C71C71C, double* %arrayidx30, align 8
  %23 = load i32* %i, align 4
  %add31 = add nsw i32 11, %23
  %idxprom32 = sext i32 %add31 to i64
  %24 = load double** %grid.addr, align 8
  %arrayidx33 = getelementptr inbounds double* %24, i64 %idxprom32
  store double 0x3F9C71C71C71C71C, double* %arrayidx33, align 8
  %25 = load i32* %i, align 4
  %add34 = add nsw i32 12, %25
  %idxprom35 = sext i32 %add34 to i64
  %26 = load double** %grid.addr, align 8
  %arrayidx36 = getelementptr inbounds double* %26, i64 %idxprom35
  store double 0x3F9C71C71C71C71C, double* %arrayidx36, align 8
  %27 = load i32* %i, align 4
  %add37 = add nsw i32 13, %27
  %idxprom38 = sext i32 %add37 to i64
  %28 = load double** %grid.addr, align 8
  %arrayidx39 = getelementptr inbounds double* %28, i64 %idxprom38
  store double 0x3F9C71C71C71C71C, double* %arrayidx39, align 8
  %29 = load i32* %i, align 4
  %add40 = add nsw i32 14, %29
  %idxprom41 = sext i32 %add40 to i64
  %30 = load double** %grid.addr, align 8
  %arrayidx42 = getelementptr inbounds double* %30, i64 %idxprom41
  store double 0x3F9C71C71C71C71C, double* %arrayidx42, align 8
  %31 = load i32* %i, align 4
  %add43 = add nsw i32 15, %31
  %idxprom44 = sext i32 %add43 to i64
  %32 = load double** %grid.addr, align 8
  %arrayidx45 = getelementptr inbounds double* %32, i64 %idxprom44
  store double 0x3F9C71C71C71C71C, double* %arrayidx45, align 8
  %33 = load i32* %i, align 4
  %add46 = add nsw i32 16, %33
  %idxprom47 = sext i32 %add46 to i64
  %34 = load double** %grid.addr, align 8
  %arrayidx48 = getelementptr inbounds double* %34, i64 %idxprom47
  store double 0x3F9C71C71C71C71C, double* %arrayidx48, align 8
  %35 = load i32* %i, align 4
  %add49 = add nsw i32 17, %35
  %idxprom50 = sext i32 %add49 to i64
  %36 = load double** %grid.addr, align 8
  %arrayidx51 = getelementptr inbounds double* %36, i64 %idxprom50
  store double 0x3F9C71C71C71C71C, double* %arrayidx51, align 8
  %37 = load i32* %i, align 4
  %add52 = add nsw i32 18, %37
  %idxprom53 = sext i32 %add52 to i64
  %38 = load double** %grid.addr, align 8
  %arrayidx54 = getelementptr inbounds double* %38, i64 %idxprom53
  store double 0x3F9C71C71C71C71C, double* %arrayidx54, align 8
  %39 = load i32* %i, align 4
  %add55 = add nsw i32 19, %39
  %idxprom56 = sext i32 %add55 to i64
  %40 = load double** %grid.addr, align 8
  %arrayidx57 = getelementptr inbounds double* %40, i64 %idxprom56
  %41 = bitcast double* %arrayidx57 to i8*
  %42 = bitcast i8* %41 to i32*
  store i32* %42, i32** %_aux_, align 8
  %43 = load i32** %_aux_, align 8
  store i32 0, i32* %43, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %44 = load i32* %i, align 4
  %add58 = add nsw i32 %44, 20
  store i32 %add58, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_swapGrids([26000000 x double]** %grid1, [26000000 x double]** %grid2) #0 {
entry:
  %grid1.addr = alloca [26000000 x double]**, align 8
  %grid2.addr = alloca [26000000 x double]**, align 8
  %aux = alloca [26000000 x double]*, align 8
  store [26000000 x double]** %grid1, [26000000 x double]*** %grid1.addr, align 8
  store [26000000 x double]** %grid2, [26000000 x double]*** %grid2.addr, align 8
  %0 = load [26000000 x double]*** %grid1.addr, align 8
  %1 = load [26000000 x double]** %0, align 8
  store [26000000 x double]* %1, [26000000 x double]** %aux, align 8
  %2 = load [26000000 x double]*** %grid2.addr, align 8
  %3 = load [26000000 x double]** %2, align 8
  %4 = load [26000000 x double]*** %grid1.addr, align 8
  store [26000000 x double]* %3, [26000000 x double]** %4, align 8
  %5 = load [26000000 x double]** %aux, align 8
  %6 = load [26000000 x double]*** %grid2.addr, align 8
  store [26000000 x double]* %5, [26000000 x double]** %6, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_loadObstacleFile(double* %grid, i8* %filename) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %filename.addr = alloca i8*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %file = alloca %struct._IO_FILE*, align 8
  %_aux_ = alloca i32*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  %0 = load i8** %filename.addr, align 8
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc19, %entry
  %1 = load i32* %z, align 4
  %cmp = icmp slt i32 %1, 130
  br i1 %cmp, label %for.body, label %for.end21

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc15, %for.body
  %2 = load i32* %y, align 4
  %cmp2 = icmp slt i32 %2, 100
  br i1 %cmp2, label %for.body3, label %for.end17

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %x, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %3 = load i32* %x, align 4
  %cmp5 = icmp slt i32 %3, 100
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %4 = load %struct._IO_FILE** %file, align 8
  %call7 = call i32 @fgetc(%struct._IO_FILE* %4)
  %cmp8 = icmp ne i32 %call7, 46
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body6
  %5 = load i32* %x, align 4
  %6 = load i32* %y, align 4
  %mul = mul nsw i32 %6, 100
  %add = add nsw i32 %5, %mul
  %7 = load i32* %z, align 4
  %mul9 = mul nsw i32 %7, 100
  %mul10 = mul nsw i32 %mul9, 100
  %add11 = add nsw i32 %add, %mul10
  %mul12 = mul nsw i32 20, %add11
  %add13 = add nsw i32 19, %mul12
  %idxprom = sext i32 %add13 to i64
  %8 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %8, i64 %idxprom
  %9 = bitcast double* %arrayidx to i8*
  %10 = bitcast i8* %9 to i32*
  store i32* %10, i32** %_aux_, align 8
  %11 = load i32** %_aux_, align 8
  %12 = load i32* %11, align 4
  %or = or i32 %12, 1
  store i32 %or, i32* %11, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body6
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %13 = load i32* %x, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  %14 = load %struct._IO_FILE** %file, align 8
  %call14 = call i32 @fgetc(%struct._IO_FILE* %14)
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %15 = load i32* %y, align 4
  %inc16 = add nsw i32 %15, 1
  store i32 %inc16, i32* %y, align 4
  br label %for.cond1

for.end17:                                        ; preds = %for.cond1
  %16 = load %struct._IO_FILE** %file, align 8
  %call18 = call i32 @fgetc(%struct._IO_FILE* %16)
  br label %for.inc19

for.inc19:                                        ; preds = %for.end17
  %17 = load i32* %z, align 4
  %inc20 = add nsw i32 %17, 1
  store i32 %inc20, i32* %z, align 4
  br label %for.cond

for.end21:                                        ; preds = %for.cond
  %18 = load %struct._IO_FILE** %file, align 8
  %call22 = call i32 @fclose(%struct._IO_FILE* %18)
  ret void
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

declare i32 @fgetc(%struct._IO_FILE*) #2

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal void @LBM_initializeSpecialCellsForLDC(double* %grid) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  %_aux_33 = alloca i32*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i32 -2, i32* %z, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc48, %entry
  %0 = load i32* %z, align 4
  %cmp = icmp slt i32 %0, 132
  br i1 %cmp, label %for.body, label %for.end50

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc45, %for.body
  %1 = load i32* %y, align 4
  %cmp2 = icmp slt i32 %1, 100
  br i1 %cmp2, label %for.body3, label %for.end47

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %x, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32* %x, align 4
  %cmp5 = icmp slt i32 %2, 100
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %3 = load i32* %x, align 4
  %cmp7 = icmp eq i32 %3, 0
  br i1 %cmp7, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body6
  %4 = load i32* %x, align 4
  %cmp8 = icmp eq i32 %4, 99
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %5 = load i32* %y, align 4
  %cmp10 = icmp eq i32 %5, 0
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false9
  %6 = load i32* %y, align 4
  %cmp12 = icmp eq i32 %6, 99
  br i1 %cmp12, label %if.then, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false11
  %7 = load i32* %z, align 4
  %cmp14 = icmp eq i32 %7, 0
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false13
  %8 = load i32* %z, align 4
  %cmp16 = icmp eq i32 %8, 129
  br i1 %cmp16, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false15, %lor.lhs.false13, %lor.lhs.false11, %lor.lhs.false9, %lor.lhs.false, %for.body6
  %9 = load i32* %x, align 4
  %10 = load i32* %y, align 4
  %mul = mul nsw i32 %10, 100
  %add = add nsw i32 %9, %mul
  %11 = load i32* %z, align 4
  %mul17 = mul nsw i32 %11, 100
  %mul18 = mul nsw i32 %mul17, 100
  %add19 = add nsw i32 %add, %mul18
  %mul20 = mul nsw i32 20, %add19
  %add21 = add nsw i32 19, %mul20
  %idxprom = sext i32 %add21 to i64
  %12 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %12, i64 %idxprom
  %13 = bitcast double* %arrayidx to i8*
  %14 = bitcast i8* %13 to i32*
  store i32* %14, i32** %_aux_, align 8
  %15 = load i32** %_aux_, align 8
  %16 = load i32* %15, align 4
  %or = or i32 %16, 1
  store i32 %or, i32* %15, align 4
  br label %if.end44

if.else:                                          ; preds = %lor.lhs.false15
  %17 = load i32* %z, align 4
  %cmp22 = icmp eq i32 %17, 1
  br i1 %cmp22, label %land.lhs.true, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %if.else
  %18 = load i32* %z, align 4
  %cmp24 = icmp eq i32 %18, 128
  br i1 %cmp24, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false23, %if.else
  %19 = load i32* %x, align 4
  %cmp25 = icmp sgt i32 %19, 1
  br i1 %cmp25, label %land.lhs.true26, label %if.end

land.lhs.true26:                                  ; preds = %land.lhs.true
  %20 = load i32* %x, align 4
  %cmp27 = icmp slt i32 %20, 98
  br i1 %cmp27, label %land.lhs.true28, label %if.end

land.lhs.true28:                                  ; preds = %land.lhs.true26
  %21 = load i32* %y, align 4
  %cmp29 = icmp sgt i32 %21, 1
  br i1 %cmp29, label %land.lhs.true30, label %if.end

land.lhs.true30:                                  ; preds = %land.lhs.true28
  %22 = load i32* %y, align 4
  %cmp31 = icmp slt i32 %22, 98
  br i1 %cmp31, label %if.then32, label %if.end

if.then32:                                        ; preds = %land.lhs.true30
  %23 = load i32* %x, align 4
  %24 = load i32* %y, align 4
  %mul34 = mul nsw i32 %24, 100
  %add35 = add nsw i32 %23, %mul34
  %25 = load i32* %z, align 4
  %mul36 = mul nsw i32 %25, 100
  %mul37 = mul nsw i32 %mul36, 100
  %add38 = add nsw i32 %add35, %mul37
  %mul39 = mul nsw i32 20, %add38
  %add40 = add nsw i32 19, %mul39
  %idxprom41 = sext i32 %add40 to i64
  %26 = load double** %grid.addr, align 8
  %arrayidx42 = getelementptr inbounds double* %26, i64 %idxprom41
  %27 = bitcast double* %arrayidx42 to i8*
  %28 = bitcast i8* %27 to i32*
  store i32* %28, i32** %_aux_33, align 8
  %29 = load i32** %_aux_33, align 8
  %30 = load i32* %29, align 4
  %or43 = or i32 %30, 2
  store i32 %or43, i32* %29, align 4
  br label %if.end

if.end:                                           ; preds = %if.then32, %land.lhs.true30, %land.lhs.true28, %land.lhs.true26, %land.lhs.true, %lor.lhs.false23
  br label %if.end44

if.end44:                                         ; preds = %if.end, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end44
  %31 = load i32* %x, align 4
  %inc = add nsw i32 %31, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc45

for.inc45:                                        ; preds = %for.end
  %32 = load i32* %y, align 4
  %inc46 = add nsw i32 %32, 1
  store i32 %inc46, i32* %y, align 4
  br label %for.cond1

for.end47:                                        ; preds = %for.cond1
  br label %for.inc48

for.inc48:                                        ; preds = %for.end47
  %33 = load i32* %z, align 4
  %inc49 = add nsw i32 %33, 1
  store i32 %inc49, i32* %z, align 4
  br label %for.cond

for.end50:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_initializeSpecialCellsForChannel(double* %grid) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %_aux_ = alloca i32*, align 8
  %_aux_31 = alloca i32*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i32 -2, i32* %z, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc46, %entry
  %0 = load i32* %z, align 4
  %cmp = icmp slt i32 %0, 132
  br i1 %cmp, label %for.body, label %for.end48

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc43, %for.body
  %1 = load i32* %y, align 4
  %cmp2 = icmp slt i32 %1, 100
  br i1 %cmp2, label %for.body3, label %for.end45

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %x, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %2 = load i32* %x, align 4
  %cmp5 = icmp slt i32 %2, 100
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %3 = load i32* %x, align 4
  %cmp7 = icmp eq i32 %3, 0
  br i1 %cmp7, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body6
  %4 = load i32* %x, align 4
  %cmp8 = icmp eq i32 %4, 99
  br i1 %cmp8, label %if.then, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %lor.lhs.false
  %5 = load i32* %y, align 4
  %cmp10 = icmp eq i32 %5, 0
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false9
  %6 = load i32* %y, align 4
  %cmp12 = icmp eq i32 %6, 99
  br i1 %cmp12, label %if.then, label %if.end42

if.then:                                          ; preds = %lor.lhs.false11, %lor.lhs.false9, %lor.lhs.false, %for.body6
  %7 = load i32* %x, align 4
  %8 = load i32* %y, align 4
  %mul = mul nsw i32 %8, 100
  %add = add nsw i32 %7, %mul
  %9 = load i32* %z, align 4
  %mul13 = mul nsw i32 %9, 100
  %mul14 = mul nsw i32 %mul13, 100
  %add15 = add nsw i32 %add, %mul14
  %mul16 = mul nsw i32 20, %add15
  %add17 = add nsw i32 19, %mul16
  %idxprom = sext i32 %add17 to i64
  %10 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %10, i64 %idxprom
  %11 = bitcast double* %arrayidx to i8*
  %12 = bitcast i8* %11 to i32*
  store i32* %12, i32** %_aux_, align 8
  %13 = load i32** %_aux_, align 8
  %14 = load i32* %13, align 4
  %or = or i32 %14, 1
  store i32 %or, i32* %13, align 4
  %15 = load i32* %z, align 4
  %cmp18 = icmp eq i32 %15, 0
  br i1 %cmp18, label %land.lhs.true, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %if.then
  %16 = load i32* %z, align 4
  %cmp20 = icmp eq i32 %16, 129
  br i1 %cmp20, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %lor.lhs.false19, %if.then
  %17 = load i32* %x, align 4
  %18 = load i32* %y, align 4
  %mul21 = mul nsw i32 %18, 100
  %add22 = add nsw i32 %17, %mul21
  %19 = load i32* %z, align 4
  %mul23 = mul nsw i32 %19, 100
  %mul24 = mul nsw i32 %mul23, 100
  %add25 = add nsw i32 %add22, %mul24
  %mul26 = mul nsw i32 20, %add25
  %add27 = add nsw i32 19, %mul26
  %idxprom28 = sext i32 %add27 to i64
  %20 = load double** %grid.addr, align 8
  %arrayidx29 = getelementptr inbounds double* %20, i64 %idxprom28
  %21 = bitcast double* %arrayidx29 to i8*
  %22 = bitcast i8* %21 to i32*
  %23 = load i32* %22, align 4
  %and = and i32 %23, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.end, label %if.then30

if.then30:                                        ; preds = %land.lhs.true
  %24 = load i32* %x, align 4
  %25 = load i32* %y, align 4
  %mul32 = mul nsw i32 %25, 100
  %add33 = add nsw i32 %24, %mul32
  %26 = load i32* %z, align 4
  %mul34 = mul nsw i32 %26, 100
  %mul35 = mul nsw i32 %mul34, 100
  %add36 = add nsw i32 %add33, %mul35
  %mul37 = mul nsw i32 20, %add36
  %add38 = add nsw i32 19, %mul37
  %idxprom39 = sext i32 %add38 to i64
  %27 = load double** %grid.addr, align 8
  %arrayidx40 = getelementptr inbounds double* %27, i64 %idxprom39
  %28 = bitcast double* %arrayidx40 to i8*
  %29 = bitcast i8* %28 to i32*
  store i32* %29, i32** %_aux_31, align 8
  %30 = load i32** %_aux_31, align 8
  %31 = load i32* %30, align 4
  %or41 = or i32 %31, 4
  store i32 %or41, i32* %30, align 4
  br label %if.end

if.end:                                           ; preds = %if.then30, %land.lhs.true, %lor.lhs.false19
  br label %if.end42

if.end42:                                         ; preds = %if.end, %lor.lhs.false11
  br label %for.inc

for.inc:                                          ; preds = %if.end42
  %32 = load i32* %x, align 4
  %inc = add nsw i32 %32, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc43

for.inc43:                                        ; preds = %for.end
  %33 = load i32* %y, align 4
  %inc44 = add nsw i32 %33, 1
  store i32 %inc44, i32* %y, align 4
  br label %for.cond1

for.end45:                                        ; preds = %for.cond1
  br label %for.inc46

for.inc46:                                        ; preds = %for.end45
  %34 = load i32* %z, align 4
  %inc47 = add nsw i32 %34, 1
  store i32 %inc47, i32* %z, align 4
  br label %for.cond

for.end48:                                        ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_performStreamCollide(double* %srcGrid, double* %dstGrid) #0 {
entry:
  %srcGrid.addr = alloca double*, align 8
  %dstGrid.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %u2 = alloca double, align 8
  %rho = alloca double, align 8
  store double* %srcGrid, double** %srcGrid.addr, align 8
  store double* %dstGrid, double** %dstGrid.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 26000000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 19, %1
  %idxprom = sext i32 %add to i64
  %2 = load double** %srcGrid.addr, align 8
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %3 = bitcast double* %arrayidx to i8*
  %4 = bitcast i8* %3 to i32*
  %5 = load i32* %4, align 4
  %and = and i32 %5, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %add1 = add nsw i32 0, %6
  %idxprom2 = sext i32 %add1 to i64
  %7 = load double** %srcGrid.addr, align 8
  %arrayidx3 = getelementptr inbounds double* %7, i64 %idxprom2
  %8 = load double* %arrayidx3, align 8
  %9 = load i32* %i, align 4
  %add4 = add nsw i32 0, %9
  %idxprom5 = sext i32 %add4 to i64
  %10 = load double** %dstGrid.addr, align 8
  %arrayidx6 = getelementptr inbounds double* %10, i64 %idxprom5
  store double %8, double* %arrayidx6, align 8
  %11 = load i32* %i, align 4
  %add7 = add nsw i32 1, %11
  %idxprom8 = sext i32 %add7 to i64
  %12 = load double** %srcGrid.addr, align 8
  %arrayidx9 = getelementptr inbounds double* %12, i64 %idxprom8
  %13 = load double* %arrayidx9, align 8
  %14 = load i32* %i, align 4
  %add10 = add nsw i32 -1998, %14
  %idxprom11 = sext i32 %add10 to i64
  %15 = load double** %dstGrid.addr, align 8
  %arrayidx12 = getelementptr inbounds double* %15, i64 %idxprom11
  store double %13, double* %arrayidx12, align 8
  %16 = load i32* %i, align 4
  %add13 = add nsw i32 2, %16
  %idxprom14 = sext i32 %add13 to i64
  %17 = load double** %srcGrid.addr, align 8
  %arrayidx15 = getelementptr inbounds double* %17, i64 %idxprom14
  %18 = load double* %arrayidx15, align 8
  %19 = load i32* %i, align 4
  %add16 = add nsw i32 2001, %19
  %idxprom17 = sext i32 %add16 to i64
  %20 = load double** %dstGrid.addr, align 8
  %arrayidx18 = getelementptr inbounds double* %20, i64 %idxprom17
  store double %18, double* %arrayidx18, align 8
  %21 = load i32* %i, align 4
  %add19 = add nsw i32 3, %21
  %idxprom20 = sext i32 %add19 to i64
  %22 = load double** %srcGrid.addr, align 8
  %arrayidx21 = getelementptr inbounds double* %22, i64 %idxprom20
  %23 = load double* %arrayidx21, align 8
  %24 = load i32* %i, align 4
  %add22 = add nsw i32 -16, %24
  %idxprom23 = sext i32 %add22 to i64
  %25 = load double** %dstGrid.addr, align 8
  %arrayidx24 = getelementptr inbounds double* %25, i64 %idxprom23
  store double %23, double* %arrayidx24, align 8
  %26 = load i32* %i, align 4
  %add25 = add nsw i32 4, %26
  %idxprom26 = sext i32 %add25 to i64
  %27 = load double** %srcGrid.addr, align 8
  %arrayidx27 = getelementptr inbounds double* %27, i64 %idxprom26
  %28 = load double* %arrayidx27, align 8
  %29 = load i32* %i, align 4
  %add28 = add nsw i32 23, %29
  %idxprom29 = sext i32 %add28 to i64
  %30 = load double** %dstGrid.addr, align 8
  %arrayidx30 = getelementptr inbounds double* %30, i64 %idxprom29
  store double %28, double* %arrayidx30, align 8
  %31 = load i32* %i, align 4
  %add31 = add nsw i32 5, %31
  %idxprom32 = sext i32 %add31 to i64
  %32 = load double** %srcGrid.addr, align 8
  %arrayidx33 = getelementptr inbounds double* %32, i64 %idxprom32
  %33 = load double* %arrayidx33, align 8
  %34 = load i32* %i, align 4
  %add34 = add nsw i32 -199994, %34
  %idxprom35 = sext i32 %add34 to i64
  %35 = load double** %dstGrid.addr, align 8
  %arrayidx36 = getelementptr inbounds double* %35, i64 %idxprom35
  store double %33, double* %arrayidx36, align 8
  %36 = load i32* %i, align 4
  %add37 = add nsw i32 6, %36
  %idxprom38 = sext i32 %add37 to i64
  %37 = load double** %srcGrid.addr, align 8
  %arrayidx39 = getelementptr inbounds double* %37, i64 %idxprom38
  %38 = load double* %arrayidx39, align 8
  %39 = load i32* %i, align 4
  %add40 = add nsw i32 200005, %39
  %idxprom41 = sext i32 %add40 to i64
  %40 = load double** %dstGrid.addr, align 8
  %arrayidx42 = getelementptr inbounds double* %40, i64 %idxprom41
  store double %38, double* %arrayidx42, align 8
  %41 = load i32* %i, align 4
  %add43 = add nsw i32 7, %41
  %idxprom44 = sext i32 %add43 to i64
  %42 = load double** %srcGrid.addr, align 8
  %arrayidx45 = getelementptr inbounds double* %42, i64 %idxprom44
  %43 = load double* %arrayidx45, align 8
  %44 = load i32* %i, align 4
  %add46 = add nsw i32 -2010, %44
  %idxprom47 = sext i32 %add46 to i64
  %45 = load double** %dstGrid.addr, align 8
  %arrayidx48 = getelementptr inbounds double* %45, i64 %idxprom47
  store double %43, double* %arrayidx48, align 8
  %46 = load i32* %i, align 4
  %add49 = add nsw i32 8, %46
  %idxprom50 = sext i32 %add49 to i64
  %47 = load double** %srcGrid.addr, align 8
  %arrayidx51 = getelementptr inbounds double* %47, i64 %idxprom50
  %48 = load double* %arrayidx51, align 8
  %49 = load i32* %i, align 4
  %add52 = add nsw i32 -1971, %49
  %idxprom53 = sext i32 %add52 to i64
  %50 = load double** %dstGrid.addr, align 8
  %arrayidx54 = getelementptr inbounds double* %50, i64 %idxprom53
  store double %48, double* %arrayidx54, align 8
  %51 = load i32* %i, align 4
  %add55 = add nsw i32 9, %51
  %idxprom56 = sext i32 %add55 to i64
  %52 = load double** %srcGrid.addr, align 8
  %arrayidx57 = getelementptr inbounds double* %52, i64 %idxprom56
  %53 = load double* %arrayidx57, align 8
  %54 = load i32* %i, align 4
  %add58 = add nsw i32 1988, %54
  %idxprom59 = sext i32 %add58 to i64
  %55 = load double** %dstGrid.addr, align 8
  %arrayidx60 = getelementptr inbounds double* %55, i64 %idxprom59
  store double %53, double* %arrayidx60, align 8
  %56 = load i32* %i, align 4
  %add61 = add nsw i32 10, %56
  %idxprom62 = sext i32 %add61 to i64
  %57 = load double** %srcGrid.addr, align 8
  %arrayidx63 = getelementptr inbounds double* %57, i64 %idxprom62
  %58 = load double* %arrayidx63, align 8
  %59 = load i32* %i, align 4
  %add64 = add nsw i32 2027, %59
  %idxprom65 = sext i32 %add64 to i64
  %60 = load double** %dstGrid.addr, align 8
  %arrayidx66 = getelementptr inbounds double* %60, i64 %idxprom65
  store double %58, double* %arrayidx66, align 8
  %61 = load i32* %i, align 4
  %add67 = add nsw i32 11, %61
  %idxprom68 = sext i32 %add67 to i64
  %62 = load double** %srcGrid.addr, align 8
  %arrayidx69 = getelementptr inbounds double* %62, i64 %idxprom68
  %63 = load double* %arrayidx69, align 8
  %64 = load i32* %i, align 4
  %add70 = add nsw i32 -201986, %64
  %idxprom71 = sext i32 %add70 to i64
  %65 = load double** %dstGrid.addr, align 8
  %arrayidx72 = getelementptr inbounds double* %65, i64 %idxprom71
  store double %63, double* %arrayidx72, align 8
  %66 = load i32* %i, align 4
  %add73 = add nsw i32 12, %66
  %idxprom74 = sext i32 %add73 to i64
  %67 = load double** %srcGrid.addr, align 8
  %arrayidx75 = getelementptr inbounds double* %67, i64 %idxprom74
  %68 = load double* %arrayidx75, align 8
  %69 = load i32* %i, align 4
  %add76 = add nsw i32 198013, %69
  %idxprom77 = sext i32 %add76 to i64
  %70 = load double** %dstGrid.addr, align 8
  %arrayidx78 = getelementptr inbounds double* %70, i64 %idxprom77
  store double %68, double* %arrayidx78, align 8
  %71 = load i32* %i, align 4
  %add79 = add nsw i32 13, %71
  %idxprom80 = sext i32 %add79 to i64
  %72 = load double** %srcGrid.addr, align 8
  %arrayidx81 = getelementptr inbounds double* %72, i64 %idxprom80
  %73 = load double* %arrayidx81, align 8
  %74 = load i32* %i, align 4
  %add82 = add nsw i32 -197988, %74
  %idxprom83 = sext i32 %add82 to i64
  %75 = load double** %dstGrid.addr, align 8
  %arrayidx84 = getelementptr inbounds double* %75, i64 %idxprom83
  store double %73, double* %arrayidx84, align 8
  %76 = load i32* %i, align 4
  %add85 = add nsw i32 14, %76
  %idxprom86 = sext i32 %add85 to i64
  %77 = load double** %srcGrid.addr, align 8
  %arrayidx87 = getelementptr inbounds double* %77, i64 %idxprom86
  %78 = load double* %arrayidx87, align 8
  %79 = load i32* %i, align 4
  %add88 = add nsw i32 202011, %79
  %idxprom89 = sext i32 %add88 to i64
  %80 = load double** %dstGrid.addr, align 8
  %arrayidx90 = getelementptr inbounds double* %80, i64 %idxprom89
  store double %78, double* %arrayidx90, align 8
  %81 = load i32* %i, align 4
  %add91 = add nsw i32 15, %81
  %idxprom92 = sext i32 %add91 to i64
  %82 = load double** %srcGrid.addr, align 8
  %arrayidx93 = getelementptr inbounds double* %82, i64 %idxprom92
  %83 = load double* %arrayidx93, align 8
  %84 = load i32* %i, align 4
  %add94 = add nsw i32 -200002, %84
  %idxprom95 = sext i32 %add94 to i64
  %85 = load double** %dstGrid.addr, align 8
  %arrayidx96 = getelementptr inbounds double* %85, i64 %idxprom95
  store double %83, double* %arrayidx96, align 8
  %86 = load i32* %i, align 4
  %add97 = add nsw i32 16, %86
  %idxprom98 = sext i32 %add97 to i64
  %87 = load double** %srcGrid.addr, align 8
  %arrayidx99 = getelementptr inbounds double* %87, i64 %idxprom98
  %88 = load double* %arrayidx99, align 8
  %89 = load i32* %i, align 4
  %add100 = add nsw i32 199997, %89
  %idxprom101 = sext i32 %add100 to i64
  %90 = load double** %dstGrid.addr, align 8
  %arrayidx102 = getelementptr inbounds double* %90, i64 %idxprom101
  store double %88, double* %arrayidx102, align 8
  %91 = load i32* %i, align 4
  %add103 = add nsw i32 17, %91
  %idxprom104 = sext i32 %add103 to i64
  %92 = load double** %srcGrid.addr, align 8
  %arrayidx105 = getelementptr inbounds double* %92, i64 %idxprom104
  %93 = load double* %arrayidx105, align 8
  %94 = load i32* %i, align 4
  %add106 = add nsw i32 -199964, %94
  %idxprom107 = sext i32 %add106 to i64
  %95 = load double** %dstGrid.addr, align 8
  %arrayidx108 = getelementptr inbounds double* %95, i64 %idxprom107
  store double %93, double* %arrayidx108, align 8
  %96 = load i32* %i, align 4
  %add109 = add nsw i32 18, %96
  %idxprom110 = sext i32 %add109 to i64
  %97 = load double** %srcGrid.addr, align 8
  %arrayidx111 = getelementptr inbounds double* %97, i64 %idxprom110
  %98 = load double* %arrayidx111, align 8
  %99 = load i32* %i, align 4
  %add112 = add nsw i32 200035, %99
  %idxprom113 = sext i32 %add112 to i64
  %100 = load double** %dstGrid.addr, align 8
  %arrayidx114 = getelementptr inbounds double* %100, i64 %idxprom113
  store double %98, double* %arrayidx114, align 8
  br label %for.inc

if.end:                                           ; preds = %for.body
  %101 = load i32* %i, align 4
  %add115 = add nsw i32 0, %101
  %idxprom116 = sext i32 %add115 to i64
  %102 = load double** %srcGrid.addr, align 8
  %arrayidx117 = getelementptr inbounds double* %102, i64 %idxprom116
  %103 = load double* %arrayidx117, align 8
  %104 = load i32* %i, align 4
  %add118 = add nsw i32 1, %104
  %idxprom119 = sext i32 %add118 to i64
  %105 = load double** %srcGrid.addr, align 8
  %arrayidx120 = getelementptr inbounds double* %105, i64 %idxprom119
  %106 = load double* %arrayidx120, align 8
  %add121 = fadd double %103, %106
  %107 = load i32* %i, align 4
  %add122 = add nsw i32 2, %107
  %idxprom123 = sext i32 %add122 to i64
  %108 = load double** %srcGrid.addr, align 8
  %arrayidx124 = getelementptr inbounds double* %108, i64 %idxprom123
  %109 = load double* %arrayidx124, align 8
  %add125 = fadd double %add121, %109
  %110 = load i32* %i, align 4
  %add126 = add nsw i32 3, %110
  %idxprom127 = sext i32 %add126 to i64
  %111 = load double** %srcGrid.addr, align 8
  %arrayidx128 = getelementptr inbounds double* %111, i64 %idxprom127
  %112 = load double* %arrayidx128, align 8
  %add129 = fadd double %add125, %112
  %113 = load i32* %i, align 4
  %add130 = add nsw i32 4, %113
  %idxprom131 = sext i32 %add130 to i64
  %114 = load double** %srcGrid.addr, align 8
  %arrayidx132 = getelementptr inbounds double* %114, i64 %idxprom131
  %115 = load double* %arrayidx132, align 8
  %add133 = fadd double %add129, %115
  %116 = load i32* %i, align 4
  %add134 = add nsw i32 5, %116
  %idxprom135 = sext i32 %add134 to i64
  %117 = load double** %srcGrid.addr, align 8
  %arrayidx136 = getelementptr inbounds double* %117, i64 %idxprom135
  %118 = load double* %arrayidx136, align 8
  %add137 = fadd double %add133, %118
  %119 = load i32* %i, align 4
  %add138 = add nsw i32 6, %119
  %idxprom139 = sext i32 %add138 to i64
  %120 = load double** %srcGrid.addr, align 8
  %arrayidx140 = getelementptr inbounds double* %120, i64 %idxprom139
  %121 = load double* %arrayidx140, align 8
  %add141 = fadd double %add137, %121
  %122 = load i32* %i, align 4
  %add142 = add nsw i32 7, %122
  %idxprom143 = sext i32 %add142 to i64
  %123 = load double** %srcGrid.addr, align 8
  %arrayidx144 = getelementptr inbounds double* %123, i64 %idxprom143
  %124 = load double* %arrayidx144, align 8
  %add145 = fadd double %add141, %124
  %125 = load i32* %i, align 4
  %add146 = add nsw i32 8, %125
  %idxprom147 = sext i32 %add146 to i64
  %126 = load double** %srcGrid.addr, align 8
  %arrayidx148 = getelementptr inbounds double* %126, i64 %idxprom147
  %127 = load double* %arrayidx148, align 8
  %add149 = fadd double %add145, %127
  %128 = load i32* %i, align 4
  %add150 = add nsw i32 9, %128
  %idxprom151 = sext i32 %add150 to i64
  %129 = load double** %srcGrid.addr, align 8
  %arrayidx152 = getelementptr inbounds double* %129, i64 %idxprom151
  %130 = load double* %arrayidx152, align 8
  %add153 = fadd double %add149, %130
  %131 = load i32* %i, align 4
  %add154 = add nsw i32 10, %131
  %idxprom155 = sext i32 %add154 to i64
  %132 = load double** %srcGrid.addr, align 8
  %arrayidx156 = getelementptr inbounds double* %132, i64 %idxprom155
  %133 = load double* %arrayidx156, align 8
  %add157 = fadd double %add153, %133
  %134 = load i32* %i, align 4
  %add158 = add nsw i32 11, %134
  %idxprom159 = sext i32 %add158 to i64
  %135 = load double** %srcGrid.addr, align 8
  %arrayidx160 = getelementptr inbounds double* %135, i64 %idxprom159
  %136 = load double* %arrayidx160, align 8
  %add161 = fadd double %add157, %136
  %137 = load i32* %i, align 4
  %add162 = add nsw i32 12, %137
  %idxprom163 = sext i32 %add162 to i64
  %138 = load double** %srcGrid.addr, align 8
  %arrayidx164 = getelementptr inbounds double* %138, i64 %idxprom163
  %139 = load double* %arrayidx164, align 8
  %add165 = fadd double %add161, %139
  %140 = load i32* %i, align 4
  %add166 = add nsw i32 13, %140
  %idxprom167 = sext i32 %add166 to i64
  %141 = load double** %srcGrid.addr, align 8
  %arrayidx168 = getelementptr inbounds double* %141, i64 %idxprom167
  %142 = load double* %arrayidx168, align 8
  %add169 = fadd double %add165, %142
  %143 = load i32* %i, align 4
  %add170 = add nsw i32 14, %143
  %idxprom171 = sext i32 %add170 to i64
  %144 = load double** %srcGrid.addr, align 8
  %arrayidx172 = getelementptr inbounds double* %144, i64 %idxprom171
  %145 = load double* %arrayidx172, align 8
  %add173 = fadd double %add169, %145
  %146 = load i32* %i, align 4
  %add174 = add nsw i32 15, %146
  %idxprom175 = sext i32 %add174 to i64
  %147 = load double** %srcGrid.addr, align 8
  %arrayidx176 = getelementptr inbounds double* %147, i64 %idxprom175
  %148 = load double* %arrayidx176, align 8
  %add177 = fadd double %add173, %148
  %149 = load i32* %i, align 4
  %add178 = add nsw i32 16, %149
  %idxprom179 = sext i32 %add178 to i64
  %150 = load double** %srcGrid.addr, align 8
  %arrayidx180 = getelementptr inbounds double* %150, i64 %idxprom179
  %151 = load double* %arrayidx180, align 8
  %add181 = fadd double %add177, %151
  %152 = load i32* %i, align 4
  %add182 = add nsw i32 17, %152
  %idxprom183 = sext i32 %add182 to i64
  %153 = load double** %srcGrid.addr, align 8
  %arrayidx184 = getelementptr inbounds double* %153, i64 %idxprom183
  %154 = load double* %arrayidx184, align 8
  %add185 = fadd double %add181, %154
  %155 = load i32* %i, align 4
  %add186 = add nsw i32 18, %155
  %idxprom187 = sext i32 %add186 to i64
  %156 = load double** %srcGrid.addr, align 8
  %arrayidx188 = getelementptr inbounds double* %156, i64 %idxprom187
  %157 = load double* %arrayidx188, align 8
  %add189 = fadd double %add185, %157
  store double %add189, double* %rho, align 8
  %158 = load i32* %i, align 4
  %add190 = add nsw i32 3, %158
  %idxprom191 = sext i32 %add190 to i64
  %159 = load double** %srcGrid.addr, align 8
  %arrayidx192 = getelementptr inbounds double* %159, i64 %idxprom191
  %160 = load double* %arrayidx192, align 8
  %161 = load i32* %i, align 4
  %add193 = add nsw i32 4, %161
  %idxprom194 = sext i32 %add193 to i64
  %162 = load double** %srcGrid.addr, align 8
  %arrayidx195 = getelementptr inbounds double* %162, i64 %idxprom194
  %163 = load double* %arrayidx195, align 8
  %sub = fsub double %160, %163
  %164 = load i32* %i, align 4
  %add196 = add nsw i32 7, %164
  %idxprom197 = sext i32 %add196 to i64
  %165 = load double** %srcGrid.addr, align 8
  %arrayidx198 = getelementptr inbounds double* %165, i64 %idxprom197
  %166 = load double* %arrayidx198, align 8
  %add199 = fadd double %sub, %166
  %167 = load i32* %i, align 4
  %add200 = add nsw i32 8, %167
  %idxprom201 = sext i32 %add200 to i64
  %168 = load double** %srcGrid.addr, align 8
  %arrayidx202 = getelementptr inbounds double* %168, i64 %idxprom201
  %169 = load double* %arrayidx202, align 8
  %sub203 = fsub double %add199, %169
  %170 = load i32* %i, align 4
  %add204 = add nsw i32 9, %170
  %idxprom205 = sext i32 %add204 to i64
  %171 = load double** %srcGrid.addr, align 8
  %arrayidx206 = getelementptr inbounds double* %171, i64 %idxprom205
  %172 = load double* %arrayidx206, align 8
  %add207 = fadd double %sub203, %172
  %173 = load i32* %i, align 4
  %add208 = add nsw i32 10, %173
  %idxprom209 = sext i32 %add208 to i64
  %174 = load double** %srcGrid.addr, align 8
  %arrayidx210 = getelementptr inbounds double* %174, i64 %idxprom209
  %175 = load double* %arrayidx210, align 8
  %sub211 = fsub double %add207, %175
  %176 = load i32* %i, align 4
  %add212 = add nsw i32 15, %176
  %idxprom213 = sext i32 %add212 to i64
  %177 = load double** %srcGrid.addr, align 8
  %arrayidx214 = getelementptr inbounds double* %177, i64 %idxprom213
  %178 = load double* %arrayidx214, align 8
  %add215 = fadd double %sub211, %178
  %179 = load i32* %i, align 4
  %add216 = add nsw i32 16, %179
  %idxprom217 = sext i32 %add216 to i64
  %180 = load double** %srcGrid.addr, align 8
  %arrayidx218 = getelementptr inbounds double* %180, i64 %idxprom217
  %181 = load double* %arrayidx218, align 8
  %add219 = fadd double %add215, %181
  %182 = load i32* %i, align 4
  %add220 = add nsw i32 17, %182
  %idxprom221 = sext i32 %add220 to i64
  %183 = load double** %srcGrid.addr, align 8
  %arrayidx222 = getelementptr inbounds double* %183, i64 %idxprom221
  %184 = load double* %arrayidx222, align 8
  %sub223 = fsub double %add219, %184
  %185 = load i32* %i, align 4
  %add224 = add nsw i32 18, %185
  %idxprom225 = sext i32 %add224 to i64
  %186 = load double** %srcGrid.addr, align 8
  %arrayidx226 = getelementptr inbounds double* %186, i64 %idxprom225
  %187 = load double* %arrayidx226, align 8
  %sub227 = fsub double %sub223, %187
  store double %sub227, double* %ux, align 8
  %188 = load i32* %i, align 4
  %add228 = add nsw i32 1, %188
  %idxprom229 = sext i32 %add228 to i64
  %189 = load double** %srcGrid.addr, align 8
  %arrayidx230 = getelementptr inbounds double* %189, i64 %idxprom229
  %190 = load double* %arrayidx230, align 8
  %191 = load i32* %i, align 4
  %add231 = add nsw i32 2, %191
  %idxprom232 = sext i32 %add231 to i64
  %192 = load double** %srcGrid.addr, align 8
  %arrayidx233 = getelementptr inbounds double* %192, i64 %idxprom232
  %193 = load double* %arrayidx233, align 8
  %sub234 = fsub double %190, %193
  %194 = load i32* %i, align 4
  %add235 = add nsw i32 7, %194
  %idxprom236 = sext i32 %add235 to i64
  %195 = load double** %srcGrid.addr, align 8
  %arrayidx237 = getelementptr inbounds double* %195, i64 %idxprom236
  %196 = load double* %arrayidx237, align 8
  %add238 = fadd double %sub234, %196
  %197 = load i32* %i, align 4
  %add239 = add nsw i32 8, %197
  %idxprom240 = sext i32 %add239 to i64
  %198 = load double** %srcGrid.addr, align 8
  %arrayidx241 = getelementptr inbounds double* %198, i64 %idxprom240
  %199 = load double* %arrayidx241, align 8
  %add242 = fadd double %add238, %199
  %200 = load i32* %i, align 4
  %add243 = add nsw i32 9, %200
  %idxprom244 = sext i32 %add243 to i64
  %201 = load double** %srcGrid.addr, align 8
  %arrayidx245 = getelementptr inbounds double* %201, i64 %idxprom244
  %202 = load double* %arrayidx245, align 8
  %sub246 = fsub double %add242, %202
  %203 = load i32* %i, align 4
  %add247 = add nsw i32 10, %203
  %idxprom248 = sext i32 %add247 to i64
  %204 = load double** %srcGrid.addr, align 8
  %arrayidx249 = getelementptr inbounds double* %204, i64 %idxprom248
  %205 = load double* %arrayidx249, align 8
  %sub250 = fsub double %sub246, %205
  %206 = load i32* %i, align 4
  %add251 = add nsw i32 11, %206
  %idxprom252 = sext i32 %add251 to i64
  %207 = load double** %srcGrid.addr, align 8
  %arrayidx253 = getelementptr inbounds double* %207, i64 %idxprom252
  %208 = load double* %arrayidx253, align 8
  %add254 = fadd double %sub250, %208
  %209 = load i32* %i, align 4
  %add255 = add nsw i32 12, %209
  %idxprom256 = sext i32 %add255 to i64
  %210 = load double** %srcGrid.addr, align 8
  %arrayidx257 = getelementptr inbounds double* %210, i64 %idxprom256
  %211 = load double* %arrayidx257, align 8
  %add258 = fadd double %add254, %211
  %212 = load i32* %i, align 4
  %add259 = add nsw i32 13, %212
  %idxprom260 = sext i32 %add259 to i64
  %213 = load double** %srcGrid.addr, align 8
  %arrayidx261 = getelementptr inbounds double* %213, i64 %idxprom260
  %214 = load double* %arrayidx261, align 8
  %sub262 = fsub double %add258, %214
  %215 = load i32* %i, align 4
  %add263 = add nsw i32 14, %215
  %idxprom264 = sext i32 %add263 to i64
  %216 = load double** %srcGrid.addr, align 8
  %arrayidx265 = getelementptr inbounds double* %216, i64 %idxprom264
  %217 = load double* %arrayidx265, align 8
  %sub266 = fsub double %sub262, %217
  store double %sub266, double* %uy, align 8
  %218 = load i32* %i, align 4
  %add267 = add nsw i32 5, %218
  %idxprom268 = sext i32 %add267 to i64
  %219 = load double** %srcGrid.addr, align 8
  %arrayidx269 = getelementptr inbounds double* %219, i64 %idxprom268
  %220 = load double* %arrayidx269, align 8
  %221 = load i32* %i, align 4
  %add270 = add nsw i32 6, %221
  %idxprom271 = sext i32 %add270 to i64
  %222 = load double** %srcGrid.addr, align 8
  %arrayidx272 = getelementptr inbounds double* %222, i64 %idxprom271
  %223 = load double* %arrayidx272, align 8
  %sub273 = fsub double %220, %223
  %224 = load i32* %i, align 4
  %add274 = add nsw i32 11, %224
  %idxprom275 = sext i32 %add274 to i64
  %225 = load double** %srcGrid.addr, align 8
  %arrayidx276 = getelementptr inbounds double* %225, i64 %idxprom275
  %226 = load double* %arrayidx276, align 8
  %add277 = fadd double %sub273, %226
  %227 = load i32* %i, align 4
  %add278 = add nsw i32 12, %227
  %idxprom279 = sext i32 %add278 to i64
  %228 = load double** %srcGrid.addr, align 8
  %arrayidx280 = getelementptr inbounds double* %228, i64 %idxprom279
  %229 = load double* %arrayidx280, align 8
  %sub281 = fsub double %add277, %229
  %230 = load i32* %i, align 4
  %add282 = add nsw i32 13, %230
  %idxprom283 = sext i32 %add282 to i64
  %231 = load double** %srcGrid.addr, align 8
  %arrayidx284 = getelementptr inbounds double* %231, i64 %idxprom283
  %232 = load double* %arrayidx284, align 8
  %add285 = fadd double %sub281, %232
  %233 = load i32* %i, align 4
  %add286 = add nsw i32 14, %233
  %idxprom287 = sext i32 %add286 to i64
  %234 = load double** %srcGrid.addr, align 8
  %arrayidx288 = getelementptr inbounds double* %234, i64 %idxprom287
  %235 = load double* %arrayidx288, align 8
  %sub289 = fsub double %add285, %235
  %236 = load i32* %i, align 4
  %add290 = add nsw i32 15, %236
  %idxprom291 = sext i32 %add290 to i64
  %237 = load double** %srcGrid.addr, align 8
  %arrayidx292 = getelementptr inbounds double* %237, i64 %idxprom291
  %238 = load double* %arrayidx292, align 8
  %add293 = fadd double %sub289, %238
  %239 = load i32* %i, align 4
  %add294 = add nsw i32 16, %239
  %idxprom295 = sext i32 %add294 to i64
  %240 = load double** %srcGrid.addr, align 8
  %arrayidx296 = getelementptr inbounds double* %240, i64 %idxprom295
  %241 = load double* %arrayidx296, align 8
  %sub297 = fsub double %add293, %241
  %242 = load i32* %i, align 4
  %add298 = add nsw i32 17, %242
  %idxprom299 = sext i32 %add298 to i64
  %243 = load double** %srcGrid.addr, align 8
  %arrayidx300 = getelementptr inbounds double* %243, i64 %idxprom299
  %244 = load double* %arrayidx300, align 8
  %add301 = fadd double %sub297, %244
  %245 = load i32* %i, align 4
  %add302 = add nsw i32 18, %245
  %idxprom303 = sext i32 %add302 to i64
  %246 = load double** %srcGrid.addr, align 8
  %arrayidx304 = getelementptr inbounds double* %246, i64 %idxprom303
  %247 = load double* %arrayidx304, align 8
  %sub305 = fsub double %add301, %247
  store double %sub305, double* %uz, align 8
  %248 = load double* %rho, align 8
  %249 = load double* %ux, align 8
  %div = fdiv double %249, %248
  store double %div, double* %ux, align 8
  %250 = load double* %rho, align 8
  %251 = load double* %uy, align 8
  %div306 = fdiv double %251, %250
  store double %div306, double* %uy, align 8
  %252 = load double* %rho, align 8
  %253 = load double* %uz, align 8
  %div307 = fdiv double %253, %252
  store double %div307, double* %uz, align 8
  %254 = load i32* %i, align 4
  %add308 = add nsw i32 19, %254
  %idxprom309 = sext i32 %add308 to i64
  %255 = load double** %srcGrid.addr, align 8
  %arrayidx310 = getelementptr inbounds double* %255, i64 %idxprom309
  %256 = bitcast double* %arrayidx310 to i8*
  %257 = bitcast i8* %256 to i32*
  %258 = load i32* %257, align 4
  %and311 = and i32 %258, 2
  %tobool312 = icmp ne i32 %and311, 0
  br i1 %tobool312, label %if.then313, label %if.end314

if.then313:                                       ; preds = %if.end
  store double 5.000000e-03, double* %ux, align 8
  store double 2.000000e-03, double* %uy, align 8
  store double 0.000000e+00, double* %uz, align 8
  br label %if.end314

if.end314:                                        ; preds = %if.then313, %if.end
  %259 = load double* %ux, align 8
  %260 = load double* %ux, align 8
  %mul = fmul double %259, %260
  %261 = load double* %uy, align 8
  %262 = load double* %uy, align 8
  %mul315 = fmul double %261, %262
  %add316 = fadd double %mul, %mul315
  %263 = load double* %uz, align 8
  %264 = load double* %uz, align 8
  %mul317 = fmul double %263, %264
  %add318 = fadd double %add316, %mul317
  %mul319 = fmul double 1.500000e+00, %add318
  store double %mul319, double* %u2, align 8
  %265 = load i32* %i, align 4
  %add320 = add nsw i32 0, %265
  %idxprom321 = sext i32 %add320 to i64
  %266 = load double** %srcGrid.addr, align 8
  %arrayidx322 = getelementptr inbounds double* %266, i64 %idxprom321
  %267 = load double* %arrayidx322, align 8
  %mul323 = fmul double -9.500000e-01, %267
  %268 = load double* %rho, align 8
  %mul324 = fmul double 0x3FE4CCCCCCCCCCCC, %268
  %269 = load double* %u2, align 8
  %sub325 = fsub double 1.000000e+00, %269
  %mul326 = fmul double %mul324, %sub325
  %add327 = fadd double %mul323, %mul326
  %270 = load i32* %i, align 4
  %add328 = add nsw i32 0, %270
  %idxprom329 = sext i32 %add328 to i64
  %271 = load double** %dstGrid.addr, align 8
  %arrayidx330 = getelementptr inbounds double* %271, i64 %idxprom329
  store double %add327, double* %arrayidx330, align 8
  %272 = load i32* %i, align 4
  %add331 = add nsw i32 1, %272
  %idxprom332 = sext i32 %add331 to i64
  %273 = load double** %srcGrid.addr, align 8
  %arrayidx333 = getelementptr inbounds double* %273, i64 %idxprom332
  %274 = load double* %arrayidx333, align 8
  %mul334 = fmul double -9.500000e-01, %274
  %275 = load double* %rho, align 8
  %mul335 = fmul double 0x3FBBBBBBBBBBBBBB, %275
  %276 = load double* %uy, align 8
  %277 = load double* %uy, align 8
  %mul336 = fmul double 4.500000e+00, %277
  %add337 = fadd double %mul336, 3.000000e+00
  %mul338 = fmul double %276, %add337
  %add339 = fadd double 1.000000e+00, %mul338
  %278 = load double* %u2, align 8
  %sub340 = fsub double %add339, %278
  %mul341 = fmul double %mul335, %sub340
  %add342 = fadd double %mul334, %mul341
  %279 = load i32* %i, align 4
  %add343 = add nsw i32 2001, %279
  %idxprom344 = sext i32 %add343 to i64
  %280 = load double** %dstGrid.addr, align 8
  %arrayidx345 = getelementptr inbounds double* %280, i64 %idxprom344
  store double %add342, double* %arrayidx345, align 8
  %281 = load i32* %i, align 4
  %add346 = add nsw i32 2, %281
  %idxprom347 = sext i32 %add346 to i64
  %282 = load double** %srcGrid.addr, align 8
  %arrayidx348 = getelementptr inbounds double* %282, i64 %idxprom347
  %283 = load double* %arrayidx348, align 8
  %mul349 = fmul double -9.500000e-01, %283
  %284 = load double* %rho, align 8
  %mul350 = fmul double 0x3FBBBBBBBBBBBBBB, %284
  %285 = load double* %uy, align 8
  %286 = load double* %uy, align 8
  %mul351 = fmul double 4.500000e+00, %286
  %sub352 = fsub double %mul351, 3.000000e+00
  %mul353 = fmul double %285, %sub352
  %add354 = fadd double 1.000000e+00, %mul353
  %287 = load double* %u2, align 8
  %sub355 = fsub double %add354, %287
  %mul356 = fmul double %mul350, %sub355
  %add357 = fadd double %mul349, %mul356
  %288 = load i32* %i, align 4
  %add358 = add nsw i32 -1998, %288
  %idxprom359 = sext i32 %add358 to i64
  %289 = load double** %dstGrid.addr, align 8
  %arrayidx360 = getelementptr inbounds double* %289, i64 %idxprom359
  store double %add357, double* %arrayidx360, align 8
  %290 = load i32* %i, align 4
  %add361 = add nsw i32 3, %290
  %idxprom362 = sext i32 %add361 to i64
  %291 = load double** %srcGrid.addr, align 8
  %arrayidx363 = getelementptr inbounds double* %291, i64 %idxprom362
  %292 = load double* %arrayidx363, align 8
  %mul364 = fmul double -9.500000e-01, %292
  %293 = load double* %rho, align 8
  %mul365 = fmul double 0x3FBBBBBBBBBBBBBB, %293
  %294 = load double* %ux, align 8
  %295 = load double* %ux, align 8
  %mul366 = fmul double 4.500000e+00, %295
  %add367 = fadd double %mul366, 3.000000e+00
  %mul368 = fmul double %294, %add367
  %add369 = fadd double 1.000000e+00, %mul368
  %296 = load double* %u2, align 8
  %sub370 = fsub double %add369, %296
  %mul371 = fmul double %mul365, %sub370
  %add372 = fadd double %mul364, %mul371
  %297 = load i32* %i, align 4
  %add373 = add nsw i32 23, %297
  %idxprom374 = sext i32 %add373 to i64
  %298 = load double** %dstGrid.addr, align 8
  %arrayidx375 = getelementptr inbounds double* %298, i64 %idxprom374
  store double %add372, double* %arrayidx375, align 8
  %299 = load i32* %i, align 4
  %add376 = add nsw i32 4, %299
  %idxprom377 = sext i32 %add376 to i64
  %300 = load double** %srcGrid.addr, align 8
  %arrayidx378 = getelementptr inbounds double* %300, i64 %idxprom377
  %301 = load double* %arrayidx378, align 8
  %mul379 = fmul double -9.500000e-01, %301
  %302 = load double* %rho, align 8
  %mul380 = fmul double 0x3FBBBBBBBBBBBBBB, %302
  %303 = load double* %ux, align 8
  %304 = load double* %ux, align 8
  %mul381 = fmul double 4.500000e+00, %304
  %sub382 = fsub double %mul381, 3.000000e+00
  %mul383 = fmul double %303, %sub382
  %add384 = fadd double 1.000000e+00, %mul383
  %305 = load double* %u2, align 8
  %sub385 = fsub double %add384, %305
  %mul386 = fmul double %mul380, %sub385
  %add387 = fadd double %mul379, %mul386
  %306 = load i32* %i, align 4
  %add388 = add nsw i32 -16, %306
  %idxprom389 = sext i32 %add388 to i64
  %307 = load double** %dstGrid.addr, align 8
  %arrayidx390 = getelementptr inbounds double* %307, i64 %idxprom389
  store double %add387, double* %arrayidx390, align 8
  %308 = load i32* %i, align 4
  %add391 = add nsw i32 5, %308
  %idxprom392 = sext i32 %add391 to i64
  %309 = load double** %srcGrid.addr, align 8
  %arrayidx393 = getelementptr inbounds double* %309, i64 %idxprom392
  %310 = load double* %arrayidx393, align 8
  %mul394 = fmul double -9.500000e-01, %310
  %311 = load double* %rho, align 8
  %mul395 = fmul double 0x3FBBBBBBBBBBBBBB, %311
  %312 = load double* %uz, align 8
  %313 = load double* %uz, align 8
  %mul396 = fmul double 4.500000e+00, %313
  %add397 = fadd double %mul396, 3.000000e+00
  %mul398 = fmul double %312, %add397
  %add399 = fadd double 1.000000e+00, %mul398
  %314 = load double* %u2, align 8
  %sub400 = fsub double %add399, %314
  %mul401 = fmul double %mul395, %sub400
  %add402 = fadd double %mul394, %mul401
  %315 = load i32* %i, align 4
  %add403 = add nsw i32 200005, %315
  %idxprom404 = sext i32 %add403 to i64
  %316 = load double** %dstGrid.addr, align 8
  %arrayidx405 = getelementptr inbounds double* %316, i64 %idxprom404
  store double %add402, double* %arrayidx405, align 8
  %317 = load i32* %i, align 4
  %add406 = add nsw i32 6, %317
  %idxprom407 = sext i32 %add406 to i64
  %318 = load double** %srcGrid.addr, align 8
  %arrayidx408 = getelementptr inbounds double* %318, i64 %idxprom407
  %319 = load double* %arrayidx408, align 8
  %mul409 = fmul double -9.500000e-01, %319
  %320 = load double* %rho, align 8
  %mul410 = fmul double 0x3FBBBBBBBBBBBBBB, %320
  %321 = load double* %uz, align 8
  %322 = load double* %uz, align 8
  %mul411 = fmul double 4.500000e+00, %322
  %sub412 = fsub double %mul411, 3.000000e+00
  %mul413 = fmul double %321, %sub412
  %add414 = fadd double 1.000000e+00, %mul413
  %323 = load double* %u2, align 8
  %sub415 = fsub double %add414, %323
  %mul416 = fmul double %mul410, %sub415
  %add417 = fadd double %mul409, %mul416
  %324 = load i32* %i, align 4
  %add418 = add nsw i32 -199994, %324
  %idxprom419 = sext i32 %add418 to i64
  %325 = load double** %dstGrid.addr, align 8
  %arrayidx420 = getelementptr inbounds double* %325, i64 %idxprom419
  store double %add417, double* %arrayidx420, align 8
  %326 = load i32* %i, align 4
  %add421 = add nsw i32 7, %326
  %idxprom422 = sext i32 %add421 to i64
  %327 = load double** %srcGrid.addr, align 8
  %arrayidx423 = getelementptr inbounds double* %327, i64 %idxprom422
  %328 = load double* %arrayidx423, align 8
  %mul424 = fmul double -9.500000e-01, %328
  %329 = load double* %rho, align 8
  %mul425 = fmul double 0x3FABBBBBBBBBBBBB, %329
  %330 = load double* %ux, align 8
  %331 = load double* %uy, align 8
  %add426 = fadd double %330, %331
  %332 = load double* %ux, align 8
  %333 = load double* %uy, align 8
  %add427 = fadd double %332, %333
  %mul428 = fmul double 4.500000e+00, %add427
  %add429 = fadd double %mul428, 3.000000e+00
  %mul430 = fmul double %add426, %add429
  %add431 = fadd double 1.000000e+00, %mul430
  %334 = load double* %u2, align 8
  %sub432 = fsub double %add431, %334
  %mul433 = fmul double %mul425, %sub432
  %add434 = fadd double %mul424, %mul433
  %335 = load i32* %i, align 4
  %add435 = add nsw i32 2027, %335
  %idxprom436 = sext i32 %add435 to i64
  %336 = load double** %dstGrid.addr, align 8
  %arrayidx437 = getelementptr inbounds double* %336, i64 %idxprom436
  store double %add434, double* %arrayidx437, align 8
  %337 = load i32* %i, align 4
  %add438 = add nsw i32 8, %337
  %idxprom439 = sext i32 %add438 to i64
  %338 = load double** %srcGrid.addr, align 8
  %arrayidx440 = getelementptr inbounds double* %338, i64 %idxprom439
  %339 = load double* %arrayidx440, align 8
  %mul441 = fmul double -9.500000e-01, %339
  %340 = load double* %rho, align 8
  %mul442 = fmul double 0x3FABBBBBBBBBBBBB, %340
  %341 = load double* %ux, align 8
  %sub443 = fsub double -0.000000e+00, %341
  %342 = load double* %uy, align 8
  %add444 = fadd double %sub443, %342
  %343 = load double* %ux, align 8
  %sub445 = fsub double -0.000000e+00, %343
  %344 = load double* %uy, align 8
  %add446 = fadd double %sub445, %344
  %mul447 = fmul double 4.500000e+00, %add446
  %add448 = fadd double %mul447, 3.000000e+00
  %mul449 = fmul double %add444, %add448
  %add450 = fadd double 1.000000e+00, %mul449
  %345 = load double* %u2, align 8
  %sub451 = fsub double %add450, %345
  %mul452 = fmul double %mul442, %sub451
  %add453 = fadd double %mul441, %mul452
  %346 = load i32* %i, align 4
  %add454 = add nsw i32 1988, %346
  %idxprom455 = sext i32 %add454 to i64
  %347 = load double** %dstGrid.addr, align 8
  %arrayidx456 = getelementptr inbounds double* %347, i64 %idxprom455
  store double %add453, double* %arrayidx456, align 8
  %348 = load i32* %i, align 4
  %add457 = add nsw i32 9, %348
  %idxprom458 = sext i32 %add457 to i64
  %349 = load double** %srcGrid.addr, align 8
  %arrayidx459 = getelementptr inbounds double* %349, i64 %idxprom458
  %350 = load double* %arrayidx459, align 8
  %mul460 = fmul double -9.500000e-01, %350
  %351 = load double* %rho, align 8
  %mul461 = fmul double 0x3FABBBBBBBBBBBBB, %351
  %352 = load double* %ux, align 8
  %353 = load double* %uy, align 8
  %sub462 = fsub double %352, %353
  %354 = load double* %ux, align 8
  %355 = load double* %uy, align 8
  %sub463 = fsub double %354, %355
  %mul464 = fmul double 4.500000e+00, %sub463
  %add465 = fadd double %mul464, 3.000000e+00
  %mul466 = fmul double %sub462, %add465
  %add467 = fadd double 1.000000e+00, %mul466
  %356 = load double* %u2, align 8
  %sub468 = fsub double %add467, %356
  %mul469 = fmul double %mul461, %sub468
  %add470 = fadd double %mul460, %mul469
  %357 = load i32* %i, align 4
  %add471 = add nsw i32 -1971, %357
  %idxprom472 = sext i32 %add471 to i64
  %358 = load double** %dstGrid.addr, align 8
  %arrayidx473 = getelementptr inbounds double* %358, i64 %idxprom472
  store double %add470, double* %arrayidx473, align 8
  %359 = load i32* %i, align 4
  %add474 = add nsw i32 10, %359
  %idxprom475 = sext i32 %add474 to i64
  %360 = load double** %srcGrid.addr, align 8
  %arrayidx476 = getelementptr inbounds double* %360, i64 %idxprom475
  %361 = load double* %arrayidx476, align 8
  %mul477 = fmul double -9.500000e-01, %361
  %362 = load double* %rho, align 8
  %mul478 = fmul double 0x3FABBBBBBBBBBBBB, %362
  %363 = load double* %ux, align 8
  %sub479 = fsub double -0.000000e+00, %363
  %364 = load double* %uy, align 8
  %sub480 = fsub double %sub479, %364
  %365 = load double* %ux, align 8
  %sub481 = fsub double -0.000000e+00, %365
  %366 = load double* %uy, align 8
  %sub482 = fsub double %sub481, %366
  %mul483 = fmul double 4.500000e+00, %sub482
  %add484 = fadd double %mul483, 3.000000e+00
  %mul485 = fmul double %sub480, %add484
  %add486 = fadd double 1.000000e+00, %mul485
  %367 = load double* %u2, align 8
  %sub487 = fsub double %add486, %367
  %mul488 = fmul double %mul478, %sub487
  %add489 = fadd double %mul477, %mul488
  %368 = load i32* %i, align 4
  %add490 = add nsw i32 -2010, %368
  %idxprom491 = sext i32 %add490 to i64
  %369 = load double** %dstGrid.addr, align 8
  %arrayidx492 = getelementptr inbounds double* %369, i64 %idxprom491
  store double %add489, double* %arrayidx492, align 8
  %370 = load i32* %i, align 4
  %add493 = add nsw i32 11, %370
  %idxprom494 = sext i32 %add493 to i64
  %371 = load double** %srcGrid.addr, align 8
  %arrayidx495 = getelementptr inbounds double* %371, i64 %idxprom494
  %372 = load double* %arrayidx495, align 8
  %mul496 = fmul double -9.500000e-01, %372
  %373 = load double* %rho, align 8
  %mul497 = fmul double 0x3FABBBBBBBBBBBBB, %373
  %374 = load double* %uy, align 8
  %375 = load double* %uz, align 8
  %add498 = fadd double %374, %375
  %376 = load double* %uy, align 8
  %377 = load double* %uz, align 8
  %add499 = fadd double %376, %377
  %mul500 = fmul double 4.500000e+00, %add499
  %add501 = fadd double %mul500, 3.000000e+00
  %mul502 = fmul double %add498, %add501
  %add503 = fadd double 1.000000e+00, %mul502
  %378 = load double* %u2, align 8
  %sub504 = fsub double %add503, %378
  %mul505 = fmul double %mul497, %sub504
  %add506 = fadd double %mul496, %mul505
  %379 = load i32* %i, align 4
  %add507 = add nsw i32 202011, %379
  %idxprom508 = sext i32 %add507 to i64
  %380 = load double** %dstGrid.addr, align 8
  %arrayidx509 = getelementptr inbounds double* %380, i64 %idxprom508
  store double %add506, double* %arrayidx509, align 8
  %381 = load i32* %i, align 4
  %add510 = add nsw i32 12, %381
  %idxprom511 = sext i32 %add510 to i64
  %382 = load double** %srcGrid.addr, align 8
  %arrayidx512 = getelementptr inbounds double* %382, i64 %idxprom511
  %383 = load double* %arrayidx512, align 8
  %mul513 = fmul double -9.500000e-01, %383
  %384 = load double* %rho, align 8
  %mul514 = fmul double 0x3FABBBBBBBBBBBBB, %384
  %385 = load double* %uy, align 8
  %386 = load double* %uz, align 8
  %sub515 = fsub double %385, %386
  %387 = load double* %uy, align 8
  %388 = load double* %uz, align 8
  %sub516 = fsub double %387, %388
  %mul517 = fmul double 4.500000e+00, %sub516
  %add518 = fadd double %mul517, 3.000000e+00
  %mul519 = fmul double %sub515, %add518
  %add520 = fadd double 1.000000e+00, %mul519
  %389 = load double* %u2, align 8
  %sub521 = fsub double %add520, %389
  %mul522 = fmul double %mul514, %sub521
  %add523 = fadd double %mul513, %mul522
  %390 = load i32* %i, align 4
  %add524 = add nsw i32 -197988, %390
  %idxprom525 = sext i32 %add524 to i64
  %391 = load double** %dstGrid.addr, align 8
  %arrayidx526 = getelementptr inbounds double* %391, i64 %idxprom525
  store double %add523, double* %arrayidx526, align 8
  %392 = load i32* %i, align 4
  %add527 = add nsw i32 13, %392
  %idxprom528 = sext i32 %add527 to i64
  %393 = load double** %srcGrid.addr, align 8
  %arrayidx529 = getelementptr inbounds double* %393, i64 %idxprom528
  %394 = load double* %arrayidx529, align 8
  %mul530 = fmul double -9.500000e-01, %394
  %395 = load double* %rho, align 8
  %mul531 = fmul double 0x3FABBBBBBBBBBBBB, %395
  %396 = load double* %uy, align 8
  %sub532 = fsub double -0.000000e+00, %396
  %397 = load double* %uz, align 8
  %add533 = fadd double %sub532, %397
  %398 = load double* %uy, align 8
  %sub534 = fsub double -0.000000e+00, %398
  %399 = load double* %uz, align 8
  %add535 = fadd double %sub534, %399
  %mul536 = fmul double 4.500000e+00, %add535
  %add537 = fadd double %mul536, 3.000000e+00
  %mul538 = fmul double %add533, %add537
  %add539 = fadd double 1.000000e+00, %mul538
  %400 = load double* %u2, align 8
  %sub540 = fsub double %add539, %400
  %mul541 = fmul double %mul531, %sub540
  %add542 = fadd double %mul530, %mul541
  %401 = load i32* %i, align 4
  %add543 = add nsw i32 198013, %401
  %idxprom544 = sext i32 %add543 to i64
  %402 = load double** %dstGrid.addr, align 8
  %arrayidx545 = getelementptr inbounds double* %402, i64 %idxprom544
  store double %add542, double* %arrayidx545, align 8
  %403 = load i32* %i, align 4
  %add546 = add nsw i32 14, %403
  %idxprom547 = sext i32 %add546 to i64
  %404 = load double** %srcGrid.addr, align 8
  %arrayidx548 = getelementptr inbounds double* %404, i64 %idxprom547
  %405 = load double* %arrayidx548, align 8
  %mul549 = fmul double -9.500000e-01, %405
  %406 = load double* %rho, align 8
  %mul550 = fmul double 0x3FABBBBBBBBBBBBB, %406
  %407 = load double* %uy, align 8
  %sub551 = fsub double -0.000000e+00, %407
  %408 = load double* %uz, align 8
  %sub552 = fsub double %sub551, %408
  %409 = load double* %uy, align 8
  %sub553 = fsub double -0.000000e+00, %409
  %410 = load double* %uz, align 8
  %sub554 = fsub double %sub553, %410
  %mul555 = fmul double 4.500000e+00, %sub554
  %add556 = fadd double %mul555, 3.000000e+00
  %mul557 = fmul double %sub552, %add556
  %add558 = fadd double 1.000000e+00, %mul557
  %411 = load double* %u2, align 8
  %sub559 = fsub double %add558, %411
  %mul560 = fmul double %mul550, %sub559
  %add561 = fadd double %mul549, %mul560
  %412 = load i32* %i, align 4
  %add562 = add nsw i32 -201986, %412
  %idxprom563 = sext i32 %add562 to i64
  %413 = load double** %dstGrid.addr, align 8
  %arrayidx564 = getelementptr inbounds double* %413, i64 %idxprom563
  store double %add561, double* %arrayidx564, align 8
  %414 = load i32* %i, align 4
  %add565 = add nsw i32 15, %414
  %idxprom566 = sext i32 %add565 to i64
  %415 = load double** %srcGrid.addr, align 8
  %arrayidx567 = getelementptr inbounds double* %415, i64 %idxprom566
  %416 = load double* %arrayidx567, align 8
  %mul568 = fmul double -9.500000e-01, %416
  %417 = load double* %rho, align 8
  %mul569 = fmul double 0x3FABBBBBBBBBBBBB, %417
  %418 = load double* %ux, align 8
  %419 = load double* %uz, align 8
  %add570 = fadd double %418, %419
  %420 = load double* %ux, align 8
  %421 = load double* %uz, align 8
  %add571 = fadd double %420, %421
  %mul572 = fmul double 4.500000e+00, %add571
  %add573 = fadd double %mul572, 3.000000e+00
  %mul574 = fmul double %add570, %add573
  %add575 = fadd double 1.000000e+00, %mul574
  %422 = load double* %u2, align 8
  %sub576 = fsub double %add575, %422
  %mul577 = fmul double %mul569, %sub576
  %add578 = fadd double %mul568, %mul577
  %423 = load i32* %i, align 4
  %add579 = add nsw i32 200035, %423
  %idxprom580 = sext i32 %add579 to i64
  %424 = load double** %dstGrid.addr, align 8
  %arrayidx581 = getelementptr inbounds double* %424, i64 %idxprom580
  store double %add578, double* %arrayidx581, align 8
  %425 = load i32* %i, align 4
  %add582 = add nsw i32 16, %425
  %idxprom583 = sext i32 %add582 to i64
  %426 = load double** %srcGrid.addr, align 8
  %arrayidx584 = getelementptr inbounds double* %426, i64 %idxprom583
  %427 = load double* %arrayidx584, align 8
  %mul585 = fmul double -9.500000e-01, %427
  %428 = load double* %rho, align 8
  %mul586 = fmul double 0x3FABBBBBBBBBBBBB, %428
  %429 = load double* %ux, align 8
  %430 = load double* %uz, align 8
  %sub587 = fsub double %429, %430
  %431 = load double* %ux, align 8
  %432 = load double* %uz, align 8
  %sub588 = fsub double %431, %432
  %mul589 = fmul double 4.500000e+00, %sub588
  %add590 = fadd double %mul589, 3.000000e+00
  %mul591 = fmul double %sub587, %add590
  %add592 = fadd double 1.000000e+00, %mul591
  %433 = load double* %u2, align 8
  %sub593 = fsub double %add592, %433
  %mul594 = fmul double %mul586, %sub593
  %add595 = fadd double %mul585, %mul594
  %434 = load i32* %i, align 4
  %add596 = add nsw i32 -199964, %434
  %idxprom597 = sext i32 %add596 to i64
  %435 = load double** %dstGrid.addr, align 8
  %arrayidx598 = getelementptr inbounds double* %435, i64 %idxprom597
  store double %add595, double* %arrayidx598, align 8
  %436 = load i32* %i, align 4
  %add599 = add nsw i32 17, %436
  %idxprom600 = sext i32 %add599 to i64
  %437 = load double** %srcGrid.addr, align 8
  %arrayidx601 = getelementptr inbounds double* %437, i64 %idxprom600
  %438 = load double* %arrayidx601, align 8
  %mul602 = fmul double -9.500000e-01, %438
  %439 = load double* %rho, align 8
  %mul603 = fmul double 0x3FABBBBBBBBBBBBB, %439
  %440 = load double* %ux, align 8
  %sub604 = fsub double -0.000000e+00, %440
  %441 = load double* %uz, align 8
  %add605 = fadd double %sub604, %441
  %442 = load double* %ux, align 8
  %sub606 = fsub double -0.000000e+00, %442
  %443 = load double* %uz, align 8
  %add607 = fadd double %sub606, %443
  %mul608 = fmul double 4.500000e+00, %add607
  %add609 = fadd double %mul608, 3.000000e+00
  %mul610 = fmul double %add605, %add609
  %add611 = fadd double 1.000000e+00, %mul610
  %444 = load double* %u2, align 8
  %sub612 = fsub double %add611, %444
  %mul613 = fmul double %mul603, %sub612
  %add614 = fadd double %mul602, %mul613
  %445 = load i32* %i, align 4
  %add615 = add nsw i32 199997, %445
  %idxprom616 = sext i32 %add615 to i64
  %446 = load double** %dstGrid.addr, align 8
  %arrayidx617 = getelementptr inbounds double* %446, i64 %idxprom616
  store double %add614, double* %arrayidx617, align 8
  %447 = load i32* %i, align 4
  %add618 = add nsw i32 18, %447
  %idxprom619 = sext i32 %add618 to i64
  %448 = load double** %srcGrid.addr, align 8
  %arrayidx620 = getelementptr inbounds double* %448, i64 %idxprom619
  %449 = load double* %arrayidx620, align 8
  %mul621 = fmul double -9.500000e-01, %449
  %450 = load double* %rho, align 8
  %mul622 = fmul double 0x3FABBBBBBBBBBBBB, %450
  %451 = load double* %ux, align 8
  %sub623 = fsub double -0.000000e+00, %451
  %452 = load double* %uz, align 8
  %sub624 = fsub double %sub623, %452
  %453 = load double* %ux, align 8
  %sub625 = fsub double -0.000000e+00, %453
  %454 = load double* %uz, align 8
  %sub626 = fsub double %sub625, %454
  %mul627 = fmul double 4.500000e+00, %sub626
  %add628 = fadd double %mul627, 3.000000e+00
  %mul629 = fmul double %sub624, %add628
  %add630 = fadd double 1.000000e+00, %mul629
  %455 = load double* %u2, align 8
  %sub631 = fsub double %add630, %455
  %mul632 = fmul double %mul622, %sub631
  %add633 = fadd double %mul621, %mul632
  %456 = load i32* %i, align 4
  %add634 = add nsw i32 -200002, %456
  %idxprom635 = sext i32 %add634 to i64
  %457 = load double** %dstGrid.addr, align 8
  %arrayidx636 = getelementptr inbounds double* %457, i64 %idxprom635
  store double %add633, double* %arrayidx636, align 8
  br label %for.inc

for.inc:                                          ; preds = %if.end314, %if.then
  %458 = load i32* %i, align 4
  %add637 = add nsw i32 %458, 20
  store i32 %add637, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_handleInOutFlow(double* %srcGrid) #0 {
entry:
  %srcGrid.addr = alloca double*, align 8
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %rho = alloca double, align 8
  %ux1 = alloca double, align 8
  %uy1 = alloca double, align 8
  %uz1 = alloca double, align 8
  %rho1 = alloca double, align 8
  %ux2 = alloca double, align 8
  %uy2 = alloca double, align 8
  %uz2 = alloca double, align 8
  %rho2 = alloca double, align 8
  %u2 = alloca double, align 8
  %px = alloca double, align 8
  %py = alloca double, align 8
  %i = alloca i32, align 4
  store double* %srcGrid, double** %srcGrid.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 200000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 200000, %1
  %idxprom = sext i32 %add to i64
  %2 = load double** %srcGrid.addr, align 8
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %3 = load double* %arrayidx, align 8
  %4 = load i32* %i, align 4
  %add1 = add nsw i32 200001, %4
  %idxprom2 = sext i32 %add1 to i64
  %5 = load double** %srcGrid.addr, align 8
  %arrayidx3 = getelementptr inbounds double* %5, i64 %idxprom2
  %6 = load double* %arrayidx3, align 8
  %add4 = fadd double %3, %6
  %7 = load i32* %i, align 4
  %add5 = add nsw i32 200002, %7
  %idxprom6 = sext i32 %add5 to i64
  %8 = load double** %srcGrid.addr, align 8
  %arrayidx7 = getelementptr inbounds double* %8, i64 %idxprom6
  %9 = load double* %arrayidx7, align 8
  %add8 = fadd double %add4, %9
  %10 = load i32* %i, align 4
  %add9 = add nsw i32 200003, %10
  %idxprom10 = sext i32 %add9 to i64
  %11 = load double** %srcGrid.addr, align 8
  %arrayidx11 = getelementptr inbounds double* %11, i64 %idxprom10
  %12 = load double* %arrayidx11, align 8
  %add12 = fadd double %add8, %12
  %13 = load i32* %i, align 4
  %add13 = add nsw i32 200004, %13
  %idxprom14 = sext i32 %add13 to i64
  %14 = load double** %srcGrid.addr, align 8
  %arrayidx15 = getelementptr inbounds double* %14, i64 %idxprom14
  %15 = load double* %arrayidx15, align 8
  %add16 = fadd double %add12, %15
  %16 = load i32* %i, align 4
  %add17 = add nsw i32 200005, %16
  %idxprom18 = sext i32 %add17 to i64
  %17 = load double** %srcGrid.addr, align 8
  %arrayidx19 = getelementptr inbounds double* %17, i64 %idxprom18
  %18 = load double* %arrayidx19, align 8
  %add20 = fadd double %add16, %18
  %19 = load i32* %i, align 4
  %add21 = add nsw i32 200006, %19
  %idxprom22 = sext i32 %add21 to i64
  %20 = load double** %srcGrid.addr, align 8
  %arrayidx23 = getelementptr inbounds double* %20, i64 %idxprom22
  %21 = load double* %arrayidx23, align 8
  %add24 = fadd double %add20, %21
  %22 = load i32* %i, align 4
  %add25 = add nsw i32 200007, %22
  %idxprom26 = sext i32 %add25 to i64
  %23 = load double** %srcGrid.addr, align 8
  %arrayidx27 = getelementptr inbounds double* %23, i64 %idxprom26
  %24 = load double* %arrayidx27, align 8
  %add28 = fadd double %add24, %24
  %25 = load i32* %i, align 4
  %add29 = add nsw i32 200008, %25
  %idxprom30 = sext i32 %add29 to i64
  %26 = load double** %srcGrid.addr, align 8
  %arrayidx31 = getelementptr inbounds double* %26, i64 %idxprom30
  %27 = load double* %arrayidx31, align 8
  %add32 = fadd double %add28, %27
  %28 = load i32* %i, align 4
  %add33 = add nsw i32 200009, %28
  %idxprom34 = sext i32 %add33 to i64
  %29 = load double** %srcGrid.addr, align 8
  %arrayidx35 = getelementptr inbounds double* %29, i64 %idxprom34
  %30 = load double* %arrayidx35, align 8
  %add36 = fadd double %add32, %30
  %31 = load i32* %i, align 4
  %add37 = add nsw i32 200010, %31
  %idxprom38 = sext i32 %add37 to i64
  %32 = load double** %srcGrid.addr, align 8
  %arrayidx39 = getelementptr inbounds double* %32, i64 %idxprom38
  %33 = load double* %arrayidx39, align 8
  %add40 = fadd double %add36, %33
  %34 = load i32* %i, align 4
  %add41 = add nsw i32 200011, %34
  %idxprom42 = sext i32 %add41 to i64
  %35 = load double** %srcGrid.addr, align 8
  %arrayidx43 = getelementptr inbounds double* %35, i64 %idxprom42
  %36 = load double* %arrayidx43, align 8
  %add44 = fadd double %add40, %36
  %37 = load i32* %i, align 4
  %add45 = add nsw i32 200012, %37
  %idxprom46 = sext i32 %add45 to i64
  %38 = load double** %srcGrid.addr, align 8
  %arrayidx47 = getelementptr inbounds double* %38, i64 %idxprom46
  %39 = load double* %arrayidx47, align 8
  %add48 = fadd double %add44, %39
  %40 = load i32* %i, align 4
  %add49 = add nsw i32 200013, %40
  %idxprom50 = sext i32 %add49 to i64
  %41 = load double** %srcGrid.addr, align 8
  %arrayidx51 = getelementptr inbounds double* %41, i64 %idxprom50
  %42 = load double* %arrayidx51, align 8
  %add52 = fadd double %add48, %42
  %43 = load i32* %i, align 4
  %add53 = add nsw i32 200014, %43
  %idxprom54 = sext i32 %add53 to i64
  %44 = load double** %srcGrid.addr, align 8
  %arrayidx55 = getelementptr inbounds double* %44, i64 %idxprom54
  %45 = load double* %arrayidx55, align 8
  %add56 = fadd double %add52, %45
  %46 = load i32* %i, align 4
  %add57 = add nsw i32 200015, %46
  %idxprom58 = sext i32 %add57 to i64
  %47 = load double** %srcGrid.addr, align 8
  %arrayidx59 = getelementptr inbounds double* %47, i64 %idxprom58
  %48 = load double* %arrayidx59, align 8
  %add60 = fadd double %add56, %48
  %49 = load i32* %i, align 4
  %add61 = add nsw i32 200016, %49
  %idxprom62 = sext i32 %add61 to i64
  %50 = load double** %srcGrid.addr, align 8
  %arrayidx63 = getelementptr inbounds double* %50, i64 %idxprom62
  %51 = load double* %arrayidx63, align 8
  %add64 = fadd double %add60, %51
  %52 = load i32* %i, align 4
  %add65 = add nsw i32 200017, %52
  %idxprom66 = sext i32 %add65 to i64
  %53 = load double** %srcGrid.addr, align 8
  %arrayidx67 = getelementptr inbounds double* %53, i64 %idxprom66
  %54 = load double* %arrayidx67, align 8
  %add68 = fadd double %add64, %54
  %55 = load i32* %i, align 4
  %add69 = add nsw i32 200018, %55
  %idxprom70 = sext i32 %add69 to i64
  %56 = load double** %srcGrid.addr, align 8
  %arrayidx71 = getelementptr inbounds double* %56, i64 %idxprom70
  %57 = load double* %arrayidx71, align 8
  %add72 = fadd double %add68, %57
  store double %add72, double* %rho1, align 8
  %58 = load i32* %i, align 4
  %add73 = add nsw i32 400000, %58
  %idxprom74 = sext i32 %add73 to i64
  %59 = load double** %srcGrid.addr, align 8
  %arrayidx75 = getelementptr inbounds double* %59, i64 %idxprom74
  %60 = load double* %arrayidx75, align 8
  %61 = load i32* %i, align 4
  %add76 = add nsw i32 400001, %61
  %idxprom77 = sext i32 %add76 to i64
  %62 = load double** %srcGrid.addr, align 8
  %arrayidx78 = getelementptr inbounds double* %62, i64 %idxprom77
  %63 = load double* %arrayidx78, align 8
  %add79 = fadd double %60, %63
  %64 = load i32* %i, align 4
  %add80 = add nsw i32 400002, %64
  %idxprom81 = sext i32 %add80 to i64
  %65 = load double** %srcGrid.addr, align 8
  %arrayidx82 = getelementptr inbounds double* %65, i64 %idxprom81
  %66 = load double* %arrayidx82, align 8
  %add83 = fadd double %add79, %66
  %67 = load i32* %i, align 4
  %add84 = add nsw i32 400003, %67
  %idxprom85 = sext i32 %add84 to i64
  %68 = load double** %srcGrid.addr, align 8
  %arrayidx86 = getelementptr inbounds double* %68, i64 %idxprom85
  %69 = load double* %arrayidx86, align 8
  %add87 = fadd double %add83, %69
  %70 = load i32* %i, align 4
  %add88 = add nsw i32 400004, %70
  %idxprom89 = sext i32 %add88 to i64
  %71 = load double** %srcGrid.addr, align 8
  %arrayidx90 = getelementptr inbounds double* %71, i64 %idxprom89
  %72 = load double* %arrayidx90, align 8
  %add91 = fadd double %add87, %72
  %73 = load i32* %i, align 4
  %add92 = add nsw i32 400005, %73
  %idxprom93 = sext i32 %add92 to i64
  %74 = load double** %srcGrid.addr, align 8
  %arrayidx94 = getelementptr inbounds double* %74, i64 %idxprom93
  %75 = load double* %arrayidx94, align 8
  %add95 = fadd double %add91, %75
  %76 = load i32* %i, align 4
  %add96 = add nsw i32 400006, %76
  %idxprom97 = sext i32 %add96 to i64
  %77 = load double** %srcGrid.addr, align 8
  %arrayidx98 = getelementptr inbounds double* %77, i64 %idxprom97
  %78 = load double* %arrayidx98, align 8
  %add99 = fadd double %add95, %78
  %79 = load i32* %i, align 4
  %add100 = add nsw i32 400007, %79
  %idxprom101 = sext i32 %add100 to i64
  %80 = load double** %srcGrid.addr, align 8
  %arrayidx102 = getelementptr inbounds double* %80, i64 %idxprom101
  %81 = load double* %arrayidx102, align 8
  %add103 = fadd double %add99, %81
  %82 = load i32* %i, align 4
  %add104 = add nsw i32 400008, %82
  %idxprom105 = sext i32 %add104 to i64
  %83 = load double** %srcGrid.addr, align 8
  %arrayidx106 = getelementptr inbounds double* %83, i64 %idxprom105
  %84 = load double* %arrayidx106, align 8
  %add107 = fadd double %add103, %84
  %85 = load i32* %i, align 4
  %add108 = add nsw i32 400009, %85
  %idxprom109 = sext i32 %add108 to i64
  %86 = load double** %srcGrid.addr, align 8
  %arrayidx110 = getelementptr inbounds double* %86, i64 %idxprom109
  %87 = load double* %arrayidx110, align 8
  %add111 = fadd double %add107, %87
  %88 = load i32* %i, align 4
  %add112 = add nsw i32 400010, %88
  %idxprom113 = sext i32 %add112 to i64
  %89 = load double** %srcGrid.addr, align 8
  %arrayidx114 = getelementptr inbounds double* %89, i64 %idxprom113
  %90 = load double* %arrayidx114, align 8
  %add115 = fadd double %add111, %90
  %91 = load i32* %i, align 4
  %add116 = add nsw i32 400011, %91
  %idxprom117 = sext i32 %add116 to i64
  %92 = load double** %srcGrid.addr, align 8
  %arrayidx118 = getelementptr inbounds double* %92, i64 %idxprom117
  %93 = load double* %arrayidx118, align 8
  %add119 = fadd double %add115, %93
  %94 = load i32* %i, align 4
  %add120 = add nsw i32 400012, %94
  %idxprom121 = sext i32 %add120 to i64
  %95 = load double** %srcGrid.addr, align 8
  %arrayidx122 = getelementptr inbounds double* %95, i64 %idxprom121
  %96 = load double* %arrayidx122, align 8
  %add123 = fadd double %add119, %96
  %97 = load i32* %i, align 4
  %add124 = add nsw i32 400013, %97
  %idxprom125 = sext i32 %add124 to i64
  %98 = load double** %srcGrid.addr, align 8
  %arrayidx126 = getelementptr inbounds double* %98, i64 %idxprom125
  %99 = load double* %arrayidx126, align 8
  %add127 = fadd double %add123, %99
  %100 = load i32* %i, align 4
  %add128 = add nsw i32 400014, %100
  %idxprom129 = sext i32 %add128 to i64
  %101 = load double** %srcGrid.addr, align 8
  %arrayidx130 = getelementptr inbounds double* %101, i64 %idxprom129
  %102 = load double* %arrayidx130, align 8
  %add131 = fadd double %add127, %102
  %103 = load i32* %i, align 4
  %add132 = add nsw i32 400015, %103
  %idxprom133 = sext i32 %add132 to i64
  %104 = load double** %srcGrid.addr, align 8
  %arrayidx134 = getelementptr inbounds double* %104, i64 %idxprom133
  %105 = load double* %arrayidx134, align 8
  %add135 = fadd double %add131, %105
  %106 = load i32* %i, align 4
  %add136 = add nsw i32 400016, %106
  %idxprom137 = sext i32 %add136 to i64
  %107 = load double** %srcGrid.addr, align 8
  %arrayidx138 = getelementptr inbounds double* %107, i64 %idxprom137
  %108 = load double* %arrayidx138, align 8
  %add139 = fadd double %add135, %108
  %109 = load i32* %i, align 4
  %add140 = add nsw i32 400017, %109
  %idxprom141 = sext i32 %add140 to i64
  %110 = load double** %srcGrid.addr, align 8
  %arrayidx142 = getelementptr inbounds double* %110, i64 %idxprom141
  %111 = load double* %arrayidx142, align 8
  %add143 = fadd double %add139, %111
  %112 = load i32* %i, align 4
  %add144 = add nsw i32 400018, %112
  %idxprom145 = sext i32 %add144 to i64
  %113 = load double** %srcGrid.addr, align 8
  %arrayidx146 = getelementptr inbounds double* %113, i64 %idxprom145
  %114 = load double* %arrayidx146, align 8
  %add147 = fadd double %add143, %114
  store double %add147, double* %rho2, align 8
  %115 = load double* %rho1, align 8
  %mul = fmul double 2.000000e+00, %115
  %116 = load double* %rho2, align 8
  %sub = fsub double %mul, %116
  store double %sub, double* %rho, align 8
  %117 = load i32* %i, align 4
  %div = sdiv i32 %117, 20
  %rem = srem i32 %div, 100
  %conv = sitofp i32 %rem to double
  %div148 = fdiv double %conv, 4.950000e+01
  %sub149 = fsub double %div148, 1.000000e+00
  store double %sub149, double* %px, align 8
  %118 = load i32* %i, align 4
  %div150 = sdiv i32 %118, 20
  %div151 = sdiv i32 %div150, 100
  %rem152 = srem i32 %div151, 100
  %conv153 = sitofp i32 %rem152 to double
  %div154 = fdiv double %conv153, 4.950000e+01
  %sub155 = fsub double %div154, 1.000000e+00
  store double %sub155, double* %py, align 8
  store double 0.000000e+00, double* %ux, align 8
  store double 0.000000e+00, double* %uy, align 8
  %119 = load double* %px, align 8
  %120 = load double* %px, align 8
  %mul156 = fmul double %119, %120
  %sub157 = fsub double 1.000000e+00, %mul156
  %mul158 = fmul double 1.000000e-02, %sub157
  %121 = load double* %py, align 8
  %122 = load double* %py, align 8
  %mul159 = fmul double %121, %122
  %sub160 = fsub double 1.000000e+00, %mul159
  %mul161 = fmul double %mul158, %sub160
  store double %mul161, double* %uz, align 8
  %123 = load double* %ux, align 8
  %124 = load double* %ux, align 8
  %mul162 = fmul double %123, %124
  %125 = load double* %uy, align 8
  %126 = load double* %uy, align 8
  %mul163 = fmul double %125, %126
  %add164 = fadd double %mul162, %mul163
  %127 = load double* %uz, align 8
  %128 = load double* %uz, align 8
  %mul165 = fmul double %127, %128
  %add166 = fadd double %add164, %mul165
  %mul167 = fmul double 1.500000e+00, %add166
  store double %mul167, double* %u2, align 8
  %129 = load double* %rho, align 8
  %mul168 = fmul double 0x3FD5555555555555, %129
  %130 = load double* %u2, align 8
  %sub169 = fsub double 1.000000e+00, %130
  %mul170 = fmul double %mul168, %sub169
  %131 = load i32* %i, align 4
  %add171 = add nsw i32 0, %131
  %idxprom172 = sext i32 %add171 to i64
  %132 = load double** %srcGrid.addr, align 8
  %arrayidx173 = getelementptr inbounds double* %132, i64 %idxprom172
  store double %mul170, double* %arrayidx173, align 8
  %133 = load double* %rho, align 8
  %mul174 = fmul double 0x3FAC71C71C71C71C, %133
  %134 = load double* %uy, align 8
  %135 = load double* %uy, align 8
  %mul175 = fmul double 4.500000e+00, %135
  %add176 = fadd double %mul175, 3.000000e+00
  %mul177 = fmul double %134, %add176
  %add178 = fadd double 1.000000e+00, %mul177
  %136 = load double* %u2, align 8
  %sub179 = fsub double %add178, %136
  %mul180 = fmul double %mul174, %sub179
  %137 = load i32* %i, align 4
  %add181 = add nsw i32 1, %137
  %idxprom182 = sext i32 %add181 to i64
  %138 = load double** %srcGrid.addr, align 8
  %arrayidx183 = getelementptr inbounds double* %138, i64 %idxprom182
  store double %mul180, double* %arrayidx183, align 8
  %139 = load double* %rho, align 8
  %mul184 = fmul double 0x3FAC71C71C71C71C, %139
  %140 = load double* %uy, align 8
  %141 = load double* %uy, align 8
  %mul185 = fmul double 4.500000e+00, %141
  %sub186 = fsub double %mul185, 3.000000e+00
  %mul187 = fmul double %140, %sub186
  %add188 = fadd double 1.000000e+00, %mul187
  %142 = load double* %u2, align 8
  %sub189 = fsub double %add188, %142
  %mul190 = fmul double %mul184, %sub189
  %143 = load i32* %i, align 4
  %add191 = add nsw i32 2, %143
  %idxprom192 = sext i32 %add191 to i64
  %144 = load double** %srcGrid.addr, align 8
  %arrayidx193 = getelementptr inbounds double* %144, i64 %idxprom192
  store double %mul190, double* %arrayidx193, align 8
  %145 = load double* %rho, align 8
  %mul194 = fmul double 0x3FAC71C71C71C71C, %145
  %146 = load double* %ux, align 8
  %147 = load double* %ux, align 8
  %mul195 = fmul double 4.500000e+00, %147
  %add196 = fadd double %mul195, 3.000000e+00
  %mul197 = fmul double %146, %add196
  %add198 = fadd double 1.000000e+00, %mul197
  %148 = load double* %u2, align 8
  %sub199 = fsub double %add198, %148
  %mul200 = fmul double %mul194, %sub199
  %149 = load i32* %i, align 4
  %add201 = add nsw i32 3, %149
  %idxprom202 = sext i32 %add201 to i64
  %150 = load double** %srcGrid.addr, align 8
  %arrayidx203 = getelementptr inbounds double* %150, i64 %idxprom202
  store double %mul200, double* %arrayidx203, align 8
  %151 = load double* %rho, align 8
  %mul204 = fmul double 0x3FAC71C71C71C71C, %151
  %152 = load double* %ux, align 8
  %153 = load double* %ux, align 8
  %mul205 = fmul double 4.500000e+00, %153
  %sub206 = fsub double %mul205, 3.000000e+00
  %mul207 = fmul double %152, %sub206
  %add208 = fadd double 1.000000e+00, %mul207
  %154 = load double* %u2, align 8
  %sub209 = fsub double %add208, %154
  %mul210 = fmul double %mul204, %sub209
  %155 = load i32* %i, align 4
  %add211 = add nsw i32 4, %155
  %idxprom212 = sext i32 %add211 to i64
  %156 = load double** %srcGrid.addr, align 8
  %arrayidx213 = getelementptr inbounds double* %156, i64 %idxprom212
  store double %mul210, double* %arrayidx213, align 8
  %157 = load double* %rho, align 8
  %mul214 = fmul double 0x3FAC71C71C71C71C, %157
  %158 = load double* %uz, align 8
  %159 = load double* %uz, align 8
  %mul215 = fmul double 4.500000e+00, %159
  %add216 = fadd double %mul215, 3.000000e+00
  %mul217 = fmul double %158, %add216
  %add218 = fadd double 1.000000e+00, %mul217
  %160 = load double* %u2, align 8
  %sub219 = fsub double %add218, %160
  %mul220 = fmul double %mul214, %sub219
  %161 = load i32* %i, align 4
  %add221 = add nsw i32 5, %161
  %idxprom222 = sext i32 %add221 to i64
  %162 = load double** %srcGrid.addr, align 8
  %arrayidx223 = getelementptr inbounds double* %162, i64 %idxprom222
  store double %mul220, double* %arrayidx223, align 8
  %163 = load double* %rho, align 8
  %mul224 = fmul double 0x3FAC71C71C71C71C, %163
  %164 = load double* %uz, align 8
  %165 = load double* %uz, align 8
  %mul225 = fmul double 4.500000e+00, %165
  %sub226 = fsub double %mul225, 3.000000e+00
  %mul227 = fmul double %164, %sub226
  %add228 = fadd double 1.000000e+00, %mul227
  %166 = load double* %u2, align 8
  %sub229 = fsub double %add228, %166
  %mul230 = fmul double %mul224, %sub229
  %167 = load i32* %i, align 4
  %add231 = add nsw i32 6, %167
  %idxprom232 = sext i32 %add231 to i64
  %168 = load double** %srcGrid.addr, align 8
  %arrayidx233 = getelementptr inbounds double* %168, i64 %idxprom232
  store double %mul230, double* %arrayidx233, align 8
  %169 = load double* %rho, align 8
  %mul234 = fmul double 0x3F9C71C71C71C71C, %169
  %170 = load double* %ux, align 8
  %171 = load double* %uy, align 8
  %add235 = fadd double %170, %171
  %172 = load double* %ux, align 8
  %173 = load double* %uy, align 8
  %add236 = fadd double %172, %173
  %mul237 = fmul double 4.500000e+00, %add236
  %add238 = fadd double %mul237, 3.000000e+00
  %mul239 = fmul double %add235, %add238
  %add240 = fadd double 1.000000e+00, %mul239
  %174 = load double* %u2, align 8
  %sub241 = fsub double %add240, %174
  %mul242 = fmul double %mul234, %sub241
  %175 = load i32* %i, align 4
  %add243 = add nsw i32 7, %175
  %idxprom244 = sext i32 %add243 to i64
  %176 = load double** %srcGrid.addr, align 8
  %arrayidx245 = getelementptr inbounds double* %176, i64 %idxprom244
  store double %mul242, double* %arrayidx245, align 8
  %177 = load double* %rho, align 8
  %mul246 = fmul double 0x3F9C71C71C71C71C, %177
  %178 = load double* %ux, align 8
  %sub247 = fsub double -0.000000e+00, %178
  %179 = load double* %uy, align 8
  %add248 = fadd double %sub247, %179
  %180 = load double* %ux, align 8
  %sub249 = fsub double -0.000000e+00, %180
  %181 = load double* %uy, align 8
  %add250 = fadd double %sub249, %181
  %mul251 = fmul double 4.500000e+00, %add250
  %add252 = fadd double %mul251, 3.000000e+00
  %mul253 = fmul double %add248, %add252
  %add254 = fadd double 1.000000e+00, %mul253
  %182 = load double* %u2, align 8
  %sub255 = fsub double %add254, %182
  %mul256 = fmul double %mul246, %sub255
  %183 = load i32* %i, align 4
  %add257 = add nsw i32 8, %183
  %idxprom258 = sext i32 %add257 to i64
  %184 = load double** %srcGrid.addr, align 8
  %arrayidx259 = getelementptr inbounds double* %184, i64 %idxprom258
  store double %mul256, double* %arrayidx259, align 8
  %185 = load double* %rho, align 8
  %mul260 = fmul double 0x3F9C71C71C71C71C, %185
  %186 = load double* %ux, align 8
  %187 = load double* %uy, align 8
  %sub261 = fsub double %186, %187
  %188 = load double* %ux, align 8
  %189 = load double* %uy, align 8
  %sub262 = fsub double %188, %189
  %mul263 = fmul double 4.500000e+00, %sub262
  %add264 = fadd double %mul263, 3.000000e+00
  %mul265 = fmul double %sub261, %add264
  %add266 = fadd double 1.000000e+00, %mul265
  %190 = load double* %u2, align 8
  %sub267 = fsub double %add266, %190
  %mul268 = fmul double %mul260, %sub267
  %191 = load i32* %i, align 4
  %add269 = add nsw i32 9, %191
  %idxprom270 = sext i32 %add269 to i64
  %192 = load double** %srcGrid.addr, align 8
  %arrayidx271 = getelementptr inbounds double* %192, i64 %idxprom270
  store double %mul268, double* %arrayidx271, align 8
  %193 = load double* %rho, align 8
  %mul272 = fmul double 0x3F9C71C71C71C71C, %193
  %194 = load double* %ux, align 8
  %sub273 = fsub double -0.000000e+00, %194
  %195 = load double* %uy, align 8
  %sub274 = fsub double %sub273, %195
  %196 = load double* %ux, align 8
  %sub275 = fsub double -0.000000e+00, %196
  %197 = load double* %uy, align 8
  %sub276 = fsub double %sub275, %197
  %mul277 = fmul double 4.500000e+00, %sub276
  %add278 = fadd double %mul277, 3.000000e+00
  %mul279 = fmul double %sub274, %add278
  %add280 = fadd double 1.000000e+00, %mul279
  %198 = load double* %u2, align 8
  %sub281 = fsub double %add280, %198
  %mul282 = fmul double %mul272, %sub281
  %199 = load i32* %i, align 4
  %add283 = add nsw i32 10, %199
  %idxprom284 = sext i32 %add283 to i64
  %200 = load double** %srcGrid.addr, align 8
  %arrayidx285 = getelementptr inbounds double* %200, i64 %idxprom284
  store double %mul282, double* %arrayidx285, align 8
  %201 = load double* %rho, align 8
  %mul286 = fmul double 0x3F9C71C71C71C71C, %201
  %202 = load double* %uy, align 8
  %203 = load double* %uz, align 8
  %add287 = fadd double %202, %203
  %204 = load double* %uy, align 8
  %205 = load double* %uz, align 8
  %add288 = fadd double %204, %205
  %mul289 = fmul double 4.500000e+00, %add288
  %add290 = fadd double %mul289, 3.000000e+00
  %mul291 = fmul double %add287, %add290
  %add292 = fadd double 1.000000e+00, %mul291
  %206 = load double* %u2, align 8
  %sub293 = fsub double %add292, %206
  %mul294 = fmul double %mul286, %sub293
  %207 = load i32* %i, align 4
  %add295 = add nsw i32 11, %207
  %idxprom296 = sext i32 %add295 to i64
  %208 = load double** %srcGrid.addr, align 8
  %arrayidx297 = getelementptr inbounds double* %208, i64 %idxprom296
  store double %mul294, double* %arrayidx297, align 8
  %209 = load double* %rho, align 8
  %mul298 = fmul double 0x3F9C71C71C71C71C, %209
  %210 = load double* %uy, align 8
  %211 = load double* %uz, align 8
  %sub299 = fsub double %210, %211
  %212 = load double* %uy, align 8
  %213 = load double* %uz, align 8
  %sub300 = fsub double %212, %213
  %mul301 = fmul double 4.500000e+00, %sub300
  %add302 = fadd double %mul301, 3.000000e+00
  %mul303 = fmul double %sub299, %add302
  %add304 = fadd double 1.000000e+00, %mul303
  %214 = load double* %u2, align 8
  %sub305 = fsub double %add304, %214
  %mul306 = fmul double %mul298, %sub305
  %215 = load i32* %i, align 4
  %add307 = add nsw i32 12, %215
  %idxprom308 = sext i32 %add307 to i64
  %216 = load double** %srcGrid.addr, align 8
  %arrayidx309 = getelementptr inbounds double* %216, i64 %idxprom308
  store double %mul306, double* %arrayidx309, align 8
  %217 = load double* %rho, align 8
  %mul310 = fmul double 0x3F9C71C71C71C71C, %217
  %218 = load double* %uy, align 8
  %sub311 = fsub double -0.000000e+00, %218
  %219 = load double* %uz, align 8
  %add312 = fadd double %sub311, %219
  %220 = load double* %uy, align 8
  %sub313 = fsub double -0.000000e+00, %220
  %221 = load double* %uz, align 8
  %add314 = fadd double %sub313, %221
  %mul315 = fmul double 4.500000e+00, %add314
  %add316 = fadd double %mul315, 3.000000e+00
  %mul317 = fmul double %add312, %add316
  %add318 = fadd double 1.000000e+00, %mul317
  %222 = load double* %u2, align 8
  %sub319 = fsub double %add318, %222
  %mul320 = fmul double %mul310, %sub319
  %223 = load i32* %i, align 4
  %add321 = add nsw i32 13, %223
  %idxprom322 = sext i32 %add321 to i64
  %224 = load double** %srcGrid.addr, align 8
  %arrayidx323 = getelementptr inbounds double* %224, i64 %idxprom322
  store double %mul320, double* %arrayidx323, align 8
  %225 = load double* %rho, align 8
  %mul324 = fmul double 0x3F9C71C71C71C71C, %225
  %226 = load double* %uy, align 8
  %sub325 = fsub double -0.000000e+00, %226
  %227 = load double* %uz, align 8
  %sub326 = fsub double %sub325, %227
  %228 = load double* %uy, align 8
  %sub327 = fsub double -0.000000e+00, %228
  %229 = load double* %uz, align 8
  %sub328 = fsub double %sub327, %229
  %mul329 = fmul double 4.500000e+00, %sub328
  %add330 = fadd double %mul329, 3.000000e+00
  %mul331 = fmul double %sub326, %add330
  %add332 = fadd double 1.000000e+00, %mul331
  %230 = load double* %u2, align 8
  %sub333 = fsub double %add332, %230
  %mul334 = fmul double %mul324, %sub333
  %231 = load i32* %i, align 4
  %add335 = add nsw i32 14, %231
  %idxprom336 = sext i32 %add335 to i64
  %232 = load double** %srcGrid.addr, align 8
  %arrayidx337 = getelementptr inbounds double* %232, i64 %idxprom336
  store double %mul334, double* %arrayidx337, align 8
  %233 = load double* %rho, align 8
  %mul338 = fmul double 0x3F9C71C71C71C71C, %233
  %234 = load double* %ux, align 8
  %235 = load double* %uz, align 8
  %add339 = fadd double %234, %235
  %236 = load double* %ux, align 8
  %237 = load double* %uz, align 8
  %add340 = fadd double %236, %237
  %mul341 = fmul double 4.500000e+00, %add340
  %add342 = fadd double %mul341, 3.000000e+00
  %mul343 = fmul double %add339, %add342
  %add344 = fadd double 1.000000e+00, %mul343
  %238 = load double* %u2, align 8
  %sub345 = fsub double %add344, %238
  %mul346 = fmul double %mul338, %sub345
  %239 = load i32* %i, align 4
  %add347 = add nsw i32 15, %239
  %idxprom348 = sext i32 %add347 to i64
  %240 = load double** %srcGrid.addr, align 8
  %arrayidx349 = getelementptr inbounds double* %240, i64 %idxprom348
  store double %mul346, double* %arrayidx349, align 8
  %241 = load double* %rho, align 8
  %mul350 = fmul double 0x3F9C71C71C71C71C, %241
  %242 = load double* %ux, align 8
  %243 = load double* %uz, align 8
  %sub351 = fsub double %242, %243
  %244 = load double* %ux, align 8
  %245 = load double* %uz, align 8
  %sub352 = fsub double %244, %245
  %mul353 = fmul double 4.500000e+00, %sub352
  %add354 = fadd double %mul353, 3.000000e+00
  %mul355 = fmul double %sub351, %add354
  %add356 = fadd double 1.000000e+00, %mul355
  %246 = load double* %u2, align 8
  %sub357 = fsub double %add356, %246
  %mul358 = fmul double %mul350, %sub357
  %247 = load i32* %i, align 4
  %add359 = add nsw i32 16, %247
  %idxprom360 = sext i32 %add359 to i64
  %248 = load double** %srcGrid.addr, align 8
  %arrayidx361 = getelementptr inbounds double* %248, i64 %idxprom360
  store double %mul358, double* %arrayidx361, align 8
  %249 = load double* %rho, align 8
  %mul362 = fmul double 0x3F9C71C71C71C71C, %249
  %250 = load double* %ux, align 8
  %sub363 = fsub double -0.000000e+00, %250
  %251 = load double* %uz, align 8
  %add364 = fadd double %sub363, %251
  %252 = load double* %ux, align 8
  %sub365 = fsub double -0.000000e+00, %252
  %253 = load double* %uz, align 8
  %add366 = fadd double %sub365, %253
  %mul367 = fmul double 4.500000e+00, %add366
  %add368 = fadd double %mul367, 3.000000e+00
  %mul369 = fmul double %add364, %add368
  %add370 = fadd double 1.000000e+00, %mul369
  %254 = load double* %u2, align 8
  %sub371 = fsub double %add370, %254
  %mul372 = fmul double %mul362, %sub371
  %255 = load i32* %i, align 4
  %add373 = add nsw i32 17, %255
  %idxprom374 = sext i32 %add373 to i64
  %256 = load double** %srcGrid.addr, align 8
  %arrayidx375 = getelementptr inbounds double* %256, i64 %idxprom374
  store double %mul372, double* %arrayidx375, align 8
  %257 = load double* %rho, align 8
  %mul376 = fmul double 0x3F9C71C71C71C71C, %257
  %258 = load double* %ux, align 8
  %sub377 = fsub double -0.000000e+00, %258
  %259 = load double* %uz, align 8
  %sub378 = fsub double %sub377, %259
  %260 = load double* %ux, align 8
  %sub379 = fsub double -0.000000e+00, %260
  %261 = load double* %uz, align 8
  %sub380 = fsub double %sub379, %261
  %mul381 = fmul double 4.500000e+00, %sub380
  %add382 = fadd double %mul381, 3.000000e+00
  %mul383 = fmul double %sub378, %add382
  %add384 = fadd double 1.000000e+00, %mul383
  %262 = load double* %u2, align 8
  %sub385 = fsub double %add384, %262
  %mul386 = fmul double %mul376, %sub385
  %263 = load i32* %i, align 4
  %add387 = add nsw i32 18, %263
  %idxprom388 = sext i32 %add387 to i64
  %264 = load double** %srcGrid.addr, align 8
  %arrayidx389 = getelementptr inbounds double* %264, i64 %idxprom388
  store double %mul386, double* %arrayidx389, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %265 = load i32* %i, align 4
  %add390 = add nsw i32 %265, 20
  store i32 %add390, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 25800000, i32* %i, align 4
  br label %for.cond391

for.cond391:                                      ; preds = %for.inc1019, %for.end
  %266 = load i32* %i, align 4
  %cmp392 = icmp slt i32 %266, 26000000
  br i1 %cmp392, label %for.body394, label %for.end1021

for.body394:                                      ; preds = %for.cond391
  %267 = load i32* %i, align 4
  %add395 = add nsw i32 -200000, %267
  %idxprom396 = sext i32 %add395 to i64
  %268 = load double** %srcGrid.addr, align 8
  %arrayidx397 = getelementptr inbounds double* %268, i64 %idxprom396
  %269 = load double* %arrayidx397, align 8
  %270 = load i32* %i, align 4
  %add398 = add nsw i32 -199999, %270
  %idxprom399 = sext i32 %add398 to i64
  %271 = load double** %srcGrid.addr, align 8
  %arrayidx400 = getelementptr inbounds double* %271, i64 %idxprom399
  %272 = load double* %arrayidx400, align 8
  %add401 = fadd double %269, %272
  %273 = load i32* %i, align 4
  %add402 = add nsw i32 -199998, %273
  %idxprom403 = sext i32 %add402 to i64
  %274 = load double** %srcGrid.addr, align 8
  %arrayidx404 = getelementptr inbounds double* %274, i64 %idxprom403
  %275 = load double* %arrayidx404, align 8
  %add405 = fadd double %add401, %275
  %276 = load i32* %i, align 4
  %add406 = add nsw i32 -199997, %276
  %idxprom407 = sext i32 %add406 to i64
  %277 = load double** %srcGrid.addr, align 8
  %arrayidx408 = getelementptr inbounds double* %277, i64 %idxprom407
  %278 = load double* %arrayidx408, align 8
  %add409 = fadd double %add405, %278
  %279 = load i32* %i, align 4
  %add410 = add nsw i32 -199996, %279
  %idxprom411 = sext i32 %add410 to i64
  %280 = load double** %srcGrid.addr, align 8
  %arrayidx412 = getelementptr inbounds double* %280, i64 %idxprom411
  %281 = load double* %arrayidx412, align 8
  %add413 = fadd double %add409, %281
  %282 = load i32* %i, align 4
  %add414 = add nsw i32 -199995, %282
  %idxprom415 = sext i32 %add414 to i64
  %283 = load double** %srcGrid.addr, align 8
  %arrayidx416 = getelementptr inbounds double* %283, i64 %idxprom415
  %284 = load double* %arrayidx416, align 8
  %add417 = fadd double %add413, %284
  %285 = load i32* %i, align 4
  %add418 = add nsw i32 -199994, %285
  %idxprom419 = sext i32 %add418 to i64
  %286 = load double** %srcGrid.addr, align 8
  %arrayidx420 = getelementptr inbounds double* %286, i64 %idxprom419
  %287 = load double* %arrayidx420, align 8
  %add421 = fadd double %add417, %287
  %288 = load i32* %i, align 4
  %add422 = add nsw i32 -199993, %288
  %idxprom423 = sext i32 %add422 to i64
  %289 = load double** %srcGrid.addr, align 8
  %arrayidx424 = getelementptr inbounds double* %289, i64 %idxprom423
  %290 = load double* %arrayidx424, align 8
  %add425 = fadd double %add421, %290
  %291 = load i32* %i, align 4
  %add426 = add nsw i32 -199992, %291
  %idxprom427 = sext i32 %add426 to i64
  %292 = load double** %srcGrid.addr, align 8
  %arrayidx428 = getelementptr inbounds double* %292, i64 %idxprom427
  %293 = load double* %arrayidx428, align 8
  %add429 = fadd double %add425, %293
  %294 = load i32* %i, align 4
  %add430 = add nsw i32 -199991, %294
  %idxprom431 = sext i32 %add430 to i64
  %295 = load double** %srcGrid.addr, align 8
  %arrayidx432 = getelementptr inbounds double* %295, i64 %idxprom431
  %296 = load double* %arrayidx432, align 8
  %add433 = fadd double %add429, %296
  %297 = load i32* %i, align 4
  %add434 = add nsw i32 -199990, %297
  %idxprom435 = sext i32 %add434 to i64
  %298 = load double** %srcGrid.addr, align 8
  %arrayidx436 = getelementptr inbounds double* %298, i64 %idxprom435
  %299 = load double* %arrayidx436, align 8
  %add437 = fadd double %add433, %299
  %300 = load i32* %i, align 4
  %add438 = add nsw i32 -199989, %300
  %idxprom439 = sext i32 %add438 to i64
  %301 = load double** %srcGrid.addr, align 8
  %arrayidx440 = getelementptr inbounds double* %301, i64 %idxprom439
  %302 = load double* %arrayidx440, align 8
  %add441 = fadd double %add437, %302
  %303 = load i32* %i, align 4
  %add442 = add nsw i32 -199988, %303
  %idxprom443 = sext i32 %add442 to i64
  %304 = load double** %srcGrid.addr, align 8
  %arrayidx444 = getelementptr inbounds double* %304, i64 %idxprom443
  %305 = load double* %arrayidx444, align 8
  %add445 = fadd double %add441, %305
  %306 = load i32* %i, align 4
  %add446 = add nsw i32 -199987, %306
  %idxprom447 = sext i32 %add446 to i64
  %307 = load double** %srcGrid.addr, align 8
  %arrayidx448 = getelementptr inbounds double* %307, i64 %idxprom447
  %308 = load double* %arrayidx448, align 8
  %add449 = fadd double %add445, %308
  %309 = load i32* %i, align 4
  %add450 = add nsw i32 -199986, %309
  %idxprom451 = sext i32 %add450 to i64
  %310 = load double** %srcGrid.addr, align 8
  %arrayidx452 = getelementptr inbounds double* %310, i64 %idxprom451
  %311 = load double* %arrayidx452, align 8
  %add453 = fadd double %add449, %311
  %312 = load i32* %i, align 4
  %add454 = add nsw i32 -199985, %312
  %idxprom455 = sext i32 %add454 to i64
  %313 = load double** %srcGrid.addr, align 8
  %arrayidx456 = getelementptr inbounds double* %313, i64 %idxprom455
  %314 = load double* %arrayidx456, align 8
  %add457 = fadd double %add453, %314
  %315 = load i32* %i, align 4
  %add458 = add nsw i32 -199984, %315
  %idxprom459 = sext i32 %add458 to i64
  %316 = load double** %srcGrid.addr, align 8
  %arrayidx460 = getelementptr inbounds double* %316, i64 %idxprom459
  %317 = load double* %arrayidx460, align 8
  %add461 = fadd double %add457, %317
  %318 = load i32* %i, align 4
  %add462 = add nsw i32 -199983, %318
  %idxprom463 = sext i32 %add462 to i64
  %319 = load double** %srcGrid.addr, align 8
  %arrayidx464 = getelementptr inbounds double* %319, i64 %idxprom463
  %320 = load double* %arrayidx464, align 8
  %add465 = fadd double %add461, %320
  %321 = load i32* %i, align 4
  %add466 = add nsw i32 -199982, %321
  %idxprom467 = sext i32 %add466 to i64
  %322 = load double** %srcGrid.addr, align 8
  %arrayidx468 = getelementptr inbounds double* %322, i64 %idxprom467
  %323 = load double* %arrayidx468, align 8
  %add469 = fadd double %add465, %323
  store double %add469, double* %rho1, align 8
  %324 = load i32* %i, align 4
  %add470 = add nsw i32 -199997, %324
  %idxprom471 = sext i32 %add470 to i64
  %325 = load double** %srcGrid.addr, align 8
  %arrayidx472 = getelementptr inbounds double* %325, i64 %idxprom471
  %326 = load double* %arrayidx472, align 8
  %327 = load i32* %i, align 4
  %add473 = add nsw i32 -199996, %327
  %idxprom474 = sext i32 %add473 to i64
  %328 = load double** %srcGrid.addr, align 8
  %arrayidx475 = getelementptr inbounds double* %328, i64 %idxprom474
  %329 = load double* %arrayidx475, align 8
  %sub476 = fsub double %326, %329
  %330 = load i32* %i, align 4
  %add477 = add nsw i32 -199993, %330
  %idxprom478 = sext i32 %add477 to i64
  %331 = load double** %srcGrid.addr, align 8
  %arrayidx479 = getelementptr inbounds double* %331, i64 %idxprom478
  %332 = load double* %arrayidx479, align 8
  %add480 = fadd double %sub476, %332
  %333 = load i32* %i, align 4
  %add481 = add nsw i32 -199992, %333
  %idxprom482 = sext i32 %add481 to i64
  %334 = load double** %srcGrid.addr, align 8
  %arrayidx483 = getelementptr inbounds double* %334, i64 %idxprom482
  %335 = load double* %arrayidx483, align 8
  %sub484 = fsub double %add480, %335
  %336 = load i32* %i, align 4
  %add485 = add nsw i32 -199991, %336
  %idxprom486 = sext i32 %add485 to i64
  %337 = load double** %srcGrid.addr, align 8
  %arrayidx487 = getelementptr inbounds double* %337, i64 %idxprom486
  %338 = load double* %arrayidx487, align 8
  %add488 = fadd double %sub484, %338
  %339 = load i32* %i, align 4
  %add489 = add nsw i32 -199990, %339
  %idxprom490 = sext i32 %add489 to i64
  %340 = load double** %srcGrid.addr, align 8
  %arrayidx491 = getelementptr inbounds double* %340, i64 %idxprom490
  %341 = load double* %arrayidx491, align 8
  %sub492 = fsub double %add488, %341
  %342 = load i32* %i, align 4
  %add493 = add nsw i32 -199985, %342
  %idxprom494 = sext i32 %add493 to i64
  %343 = load double** %srcGrid.addr, align 8
  %arrayidx495 = getelementptr inbounds double* %343, i64 %idxprom494
  %344 = load double* %arrayidx495, align 8
  %add496 = fadd double %sub492, %344
  %345 = load i32* %i, align 4
  %add497 = add nsw i32 -199984, %345
  %idxprom498 = sext i32 %add497 to i64
  %346 = load double** %srcGrid.addr, align 8
  %arrayidx499 = getelementptr inbounds double* %346, i64 %idxprom498
  %347 = load double* %arrayidx499, align 8
  %add500 = fadd double %add496, %347
  %348 = load i32* %i, align 4
  %add501 = add nsw i32 -199983, %348
  %idxprom502 = sext i32 %add501 to i64
  %349 = load double** %srcGrid.addr, align 8
  %arrayidx503 = getelementptr inbounds double* %349, i64 %idxprom502
  %350 = load double* %arrayidx503, align 8
  %sub504 = fsub double %add500, %350
  %351 = load i32* %i, align 4
  %add505 = add nsw i32 -199982, %351
  %idxprom506 = sext i32 %add505 to i64
  %352 = load double** %srcGrid.addr, align 8
  %arrayidx507 = getelementptr inbounds double* %352, i64 %idxprom506
  %353 = load double* %arrayidx507, align 8
  %sub508 = fsub double %sub504, %353
  store double %sub508, double* %ux1, align 8
  %354 = load i32* %i, align 4
  %add509 = add nsw i32 -199999, %354
  %idxprom510 = sext i32 %add509 to i64
  %355 = load double** %srcGrid.addr, align 8
  %arrayidx511 = getelementptr inbounds double* %355, i64 %idxprom510
  %356 = load double* %arrayidx511, align 8
  %357 = load i32* %i, align 4
  %add512 = add nsw i32 -199998, %357
  %idxprom513 = sext i32 %add512 to i64
  %358 = load double** %srcGrid.addr, align 8
  %arrayidx514 = getelementptr inbounds double* %358, i64 %idxprom513
  %359 = load double* %arrayidx514, align 8
  %sub515 = fsub double %356, %359
  %360 = load i32* %i, align 4
  %add516 = add nsw i32 -199993, %360
  %idxprom517 = sext i32 %add516 to i64
  %361 = load double** %srcGrid.addr, align 8
  %arrayidx518 = getelementptr inbounds double* %361, i64 %idxprom517
  %362 = load double* %arrayidx518, align 8
  %add519 = fadd double %sub515, %362
  %363 = load i32* %i, align 4
  %add520 = add nsw i32 -199992, %363
  %idxprom521 = sext i32 %add520 to i64
  %364 = load double** %srcGrid.addr, align 8
  %arrayidx522 = getelementptr inbounds double* %364, i64 %idxprom521
  %365 = load double* %arrayidx522, align 8
  %add523 = fadd double %add519, %365
  %366 = load i32* %i, align 4
  %add524 = add nsw i32 -199991, %366
  %idxprom525 = sext i32 %add524 to i64
  %367 = load double** %srcGrid.addr, align 8
  %arrayidx526 = getelementptr inbounds double* %367, i64 %idxprom525
  %368 = load double* %arrayidx526, align 8
  %sub527 = fsub double %add523, %368
  %369 = load i32* %i, align 4
  %add528 = add nsw i32 -199990, %369
  %idxprom529 = sext i32 %add528 to i64
  %370 = load double** %srcGrid.addr, align 8
  %arrayidx530 = getelementptr inbounds double* %370, i64 %idxprom529
  %371 = load double* %arrayidx530, align 8
  %sub531 = fsub double %sub527, %371
  %372 = load i32* %i, align 4
  %add532 = add nsw i32 -199989, %372
  %idxprom533 = sext i32 %add532 to i64
  %373 = load double** %srcGrid.addr, align 8
  %arrayidx534 = getelementptr inbounds double* %373, i64 %idxprom533
  %374 = load double* %arrayidx534, align 8
  %add535 = fadd double %sub531, %374
  %375 = load i32* %i, align 4
  %add536 = add nsw i32 -199988, %375
  %idxprom537 = sext i32 %add536 to i64
  %376 = load double** %srcGrid.addr, align 8
  %arrayidx538 = getelementptr inbounds double* %376, i64 %idxprom537
  %377 = load double* %arrayidx538, align 8
  %add539 = fadd double %add535, %377
  %378 = load i32* %i, align 4
  %add540 = add nsw i32 -199987, %378
  %idxprom541 = sext i32 %add540 to i64
  %379 = load double** %srcGrid.addr, align 8
  %arrayidx542 = getelementptr inbounds double* %379, i64 %idxprom541
  %380 = load double* %arrayidx542, align 8
  %sub543 = fsub double %add539, %380
  %381 = load i32* %i, align 4
  %add544 = add nsw i32 -199986, %381
  %idxprom545 = sext i32 %add544 to i64
  %382 = load double** %srcGrid.addr, align 8
  %arrayidx546 = getelementptr inbounds double* %382, i64 %idxprom545
  %383 = load double* %arrayidx546, align 8
  %sub547 = fsub double %sub543, %383
  store double %sub547, double* %uy1, align 8
  %384 = load i32* %i, align 4
  %add548 = add nsw i32 -199995, %384
  %idxprom549 = sext i32 %add548 to i64
  %385 = load double** %srcGrid.addr, align 8
  %arrayidx550 = getelementptr inbounds double* %385, i64 %idxprom549
  %386 = load double* %arrayidx550, align 8
  %387 = load i32* %i, align 4
  %add551 = add nsw i32 -199994, %387
  %idxprom552 = sext i32 %add551 to i64
  %388 = load double** %srcGrid.addr, align 8
  %arrayidx553 = getelementptr inbounds double* %388, i64 %idxprom552
  %389 = load double* %arrayidx553, align 8
  %sub554 = fsub double %386, %389
  %390 = load i32* %i, align 4
  %add555 = add nsw i32 -199989, %390
  %idxprom556 = sext i32 %add555 to i64
  %391 = load double** %srcGrid.addr, align 8
  %arrayidx557 = getelementptr inbounds double* %391, i64 %idxprom556
  %392 = load double* %arrayidx557, align 8
  %add558 = fadd double %sub554, %392
  %393 = load i32* %i, align 4
  %add559 = add nsw i32 -199988, %393
  %idxprom560 = sext i32 %add559 to i64
  %394 = load double** %srcGrid.addr, align 8
  %arrayidx561 = getelementptr inbounds double* %394, i64 %idxprom560
  %395 = load double* %arrayidx561, align 8
  %sub562 = fsub double %add558, %395
  %396 = load i32* %i, align 4
  %add563 = add nsw i32 -199987, %396
  %idxprom564 = sext i32 %add563 to i64
  %397 = load double** %srcGrid.addr, align 8
  %arrayidx565 = getelementptr inbounds double* %397, i64 %idxprom564
  %398 = load double* %arrayidx565, align 8
  %add566 = fadd double %sub562, %398
  %399 = load i32* %i, align 4
  %add567 = add nsw i32 -199986, %399
  %idxprom568 = sext i32 %add567 to i64
  %400 = load double** %srcGrid.addr, align 8
  %arrayidx569 = getelementptr inbounds double* %400, i64 %idxprom568
  %401 = load double* %arrayidx569, align 8
  %sub570 = fsub double %add566, %401
  %402 = load i32* %i, align 4
  %add571 = add nsw i32 -199985, %402
  %idxprom572 = sext i32 %add571 to i64
  %403 = load double** %srcGrid.addr, align 8
  %arrayidx573 = getelementptr inbounds double* %403, i64 %idxprom572
  %404 = load double* %arrayidx573, align 8
  %add574 = fadd double %sub570, %404
  %405 = load i32* %i, align 4
  %add575 = add nsw i32 -199984, %405
  %idxprom576 = sext i32 %add575 to i64
  %406 = load double** %srcGrid.addr, align 8
  %arrayidx577 = getelementptr inbounds double* %406, i64 %idxprom576
  %407 = load double* %arrayidx577, align 8
  %sub578 = fsub double %add574, %407
  %408 = load i32* %i, align 4
  %add579 = add nsw i32 -199983, %408
  %idxprom580 = sext i32 %add579 to i64
  %409 = load double** %srcGrid.addr, align 8
  %arrayidx581 = getelementptr inbounds double* %409, i64 %idxprom580
  %410 = load double* %arrayidx581, align 8
  %add582 = fadd double %sub578, %410
  %411 = load i32* %i, align 4
  %add583 = add nsw i32 -199982, %411
  %idxprom584 = sext i32 %add583 to i64
  %412 = load double** %srcGrid.addr, align 8
  %arrayidx585 = getelementptr inbounds double* %412, i64 %idxprom584
  %413 = load double* %arrayidx585, align 8
  %sub586 = fsub double %add582, %413
  store double %sub586, double* %uz1, align 8
  %414 = load double* %rho1, align 8
  %415 = load double* %ux1, align 8
  %div587 = fdiv double %415, %414
  store double %div587, double* %ux1, align 8
  %416 = load double* %rho1, align 8
  %417 = load double* %uy1, align 8
  %div588 = fdiv double %417, %416
  store double %div588, double* %uy1, align 8
  %418 = load double* %rho1, align 8
  %419 = load double* %uz1, align 8
  %div589 = fdiv double %419, %418
  store double %div589, double* %uz1, align 8
  %420 = load i32* %i, align 4
  %add590 = add nsw i32 -400000, %420
  %idxprom591 = sext i32 %add590 to i64
  %421 = load double** %srcGrid.addr, align 8
  %arrayidx592 = getelementptr inbounds double* %421, i64 %idxprom591
  %422 = load double* %arrayidx592, align 8
  %423 = load i32* %i, align 4
  %add593 = add nsw i32 -399999, %423
  %idxprom594 = sext i32 %add593 to i64
  %424 = load double** %srcGrid.addr, align 8
  %arrayidx595 = getelementptr inbounds double* %424, i64 %idxprom594
  %425 = load double* %arrayidx595, align 8
  %add596 = fadd double %422, %425
  %426 = load i32* %i, align 4
  %add597 = add nsw i32 -399998, %426
  %idxprom598 = sext i32 %add597 to i64
  %427 = load double** %srcGrid.addr, align 8
  %arrayidx599 = getelementptr inbounds double* %427, i64 %idxprom598
  %428 = load double* %arrayidx599, align 8
  %add600 = fadd double %add596, %428
  %429 = load i32* %i, align 4
  %add601 = add nsw i32 -399997, %429
  %idxprom602 = sext i32 %add601 to i64
  %430 = load double** %srcGrid.addr, align 8
  %arrayidx603 = getelementptr inbounds double* %430, i64 %idxprom602
  %431 = load double* %arrayidx603, align 8
  %add604 = fadd double %add600, %431
  %432 = load i32* %i, align 4
  %add605 = add nsw i32 -399996, %432
  %idxprom606 = sext i32 %add605 to i64
  %433 = load double** %srcGrid.addr, align 8
  %arrayidx607 = getelementptr inbounds double* %433, i64 %idxprom606
  %434 = load double* %arrayidx607, align 8
  %add608 = fadd double %add604, %434
  %435 = load i32* %i, align 4
  %add609 = add nsw i32 -399995, %435
  %idxprom610 = sext i32 %add609 to i64
  %436 = load double** %srcGrid.addr, align 8
  %arrayidx611 = getelementptr inbounds double* %436, i64 %idxprom610
  %437 = load double* %arrayidx611, align 8
  %add612 = fadd double %add608, %437
  %438 = load i32* %i, align 4
  %add613 = add nsw i32 -399994, %438
  %idxprom614 = sext i32 %add613 to i64
  %439 = load double** %srcGrid.addr, align 8
  %arrayidx615 = getelementptr inbounds double* %439, i64 %idxprom614
  %440 = load double* %arrayidx615, align 8
  %add616 = fadd double %add612, %440
  %441 = load i32* %i, align 4
  %add617 = add nsw i32 -399993, %441
  %idxprom618 = sext i32 %add617 to i64
  %442 = load double** %srcGrid.addr, align 8
  %arrayidx619 = getelementptr inbounds double* %442, i64 %idxprom618
  %443 = load double* %arrayidx619, align 8
  %add620 = fadd double %add616, %443
  %444 = load i32* %i, align 4
  %add621 = add nsw i32 -399992, %444
  %idxprom622 = sext i32 %add621 to i64
  %445 = load double** %srcGrid.addr, align 8
  %arrayidx623 = getelementptr inbounds double* %445, i64 %idxprom622
  %446 = load double* %arrayidx623, align 8
  %add624 = fadd double %add620, %446
  %447 = load i32* %i, align 4
  %add625 = add nsw i32 -399991, %447
  %idxprom626 = sext i32 %add625 to i64
  %448 = load double** %srcGrid.addr, align 8
  %arrayidx627 = getelementptr inbounds double* %448, i64 %idxprom626
  %449 = load double* %arrayidx627, align 8
  %add628 = fadd double %add624, %449
  %450 = load i32* %i, align 4
  %add629 = add nsw i32 -399990, %450
  %idxprom630 = sext i32 %add629 to i64
  %451 = load double** %srcGrid.addr, align 8
  %arrayidx631 = getelementptr inbounds double* %451, i64 %idxprom630
  %452 = load double* %arrayidx631, align 8
  %add632 = fadd double %add628, %452
  %453 = load i32* %i, align 4
  %add633 = add nsw i32 -399989, %453
  %idxprom634 = sext i32 %add633 to i64
  %454 = load double** %srcGrid.addr, align 8
  %arrayidx635 = getelementptr inbounds double* %454, i64 %idxprom634
  %455 = load double* %arrayidx635, align 8
  %add636 = fadd double %add632, %455
  %456 = load i32* %i, align 4
  %add637 = add nsw i32 -399988, %456
  %idxprom638 = sext i32 %add637 to i64
  %457 = load double** %srcGrid.addr, align 8
  %arrayidx639 = getelementptr inbounds double* %457, i64 %idxprom638
  %458 = load double* %arrayidx639, align 8
  %add640 = fadd double %add636, %458
  %459 = load i32* %i, align 4
  %add641 = add nsw i32 -399987, %459
  %idxprom642 = sext i32 %add641 to i64
  %460 = load double** %srcGrid.addr, align 8
  %arrayidx643 = getelementptr inbounds double* %460, i64 %idxprom642
  %461 = load double* %arrayidx643, align 8
  %add644 = fadd double %add640, %461
  %462 = load i32* %i, align 4
  %add645 = add nsw i32 -399986, %462
  %idxprom646 = sext i32 %add645 to i64
  %463 = load double** %srcGrid.addr, align 8
  %arrayidx647 = getelementptr inbounds double* %463, i64 %idxprom646
  %464 = load double* %arrayidx647, align 8
  %add648 = fadd double %add644, %464
  %465 = load i32* %i, align 4
  %add649 = add nsw i32 -399985, %465
  %idxprom650 = sext i32 %add649 to i64
  %466 = load double** %srcGrid.addr, align 8
  %arrayidx651 = getelementptr inbounds double* %466, i64 %idxprom650
  %467 = load double* %arrayidx651, align 8
  %add652 = fadd double %add648, %467
  %468 = load i32* %i, align 4
  %add653 = add nsw i32 -399984, %468
  %idxprom654 = sext i32 %add653 to i64
  %469 = load double** %srcGrid.addr, align 8
  %arrayidx655 = getelementptr inbounds double* %469, i64 %idxprom654
  %470 = load double* %arrayidx655, align 8
  %add656 = fadd double %add652, %470
  %471 = load i32* %i, align 4
  %add657 = add nsw i32 -399983, %471
  %idxprom658 = sext i32 %add657 to i64
  %472 = load double** %srcGrid.addr, align 8
  %arrayidx659 = getelementptr inbounds double* %472, i64 %idxprom658
  %473 = load double* %arrayidx659, align 8
  %add660 = fadd double %add656, %473
  %474 = load i32* %i, align 4
  %add661 = add nsw i32 -399982, %474
  %idxprom662 = sext i32 %add661 to i64
  %475 = load double** %srcGrid.addr, align 8
  %arrayidx663 = getelementptr inbounds double* %475, i64 %idxprom662
  %476 = load double* %arrayidx663, align 8
  %add664 = fadd double %add660, %476
  store double %add664, double* %rho2, align 8
  %477 = load i32* %i, align 4
  %add665 = add nsw i32 -399997, %477
  %idxprom666 = sext i32 %add665 to i64
  %478 = load double** %srcGrid.addr, align 8
  %arrayidx667 = getelementptr inbounds double* %478, i64 %idxprom666
  %479 = load double* %arrayidx667, align 8
  %480 = load i32* %i, align 4
  %add668 = add nsw i32 -399996, %480
  %idxprom669 = sext i32 %add668 to i64
  %481 = load double** %srcGrid.addr, align 8
  %arrayidx670 = getelementptr inbounds double* %481, i64 %idxprom669
  %482 = load double* %arrayidx670, align 8
  %sub671 = fsub double %479, %482
  %483 = load i32* %i, align 4
  %add672 = add nsw i32 -399993, %483
  %idxprom673 = sext i32 %add672 to i64
  %484 = load double** %srcGrid.addr, align 8
  %arrayidx674 = getelementptr inbounds double* %484, i64 %idxprom673
  %485 = load double* %arrayidx674, align 8
  %add675 = fadd double %sub671, %485
  %486 = load i32* %i, align 4
  %add676 = add nsw i32 -399992, %486
  %idxprom677 = sext i32 %add676 to i64
  %487 = load double** %srcGrid.addr, align 8
  %arrayidx678 = getelementptr inbounds double* %487, i64 %idxprom677
  %488 = load double* %arrayidx678, align 8
  %sub679 = fsub double %add675, %488
  %489 = load i32* %i, align 4
  %add680 = add nsw i32 -399991, %489
  %idxprom681 = sext i32 %add680 to i64
  %490 = load double** %srcGrid.addr, align 8
  %arrayidx682 = getelementptr inbounds double* %490, i64 %idxprom681
  %491 = load double* %arrayidx682, align 8
  %add683 = fadd double %sub679, %491
  %492 = load i32* %i, align 4
  %add684 = add nsw i32 -399990, %492
  %idxprom685 = sext i32 %add684 to i64
  %493 = load double** %srcGrid.addr, align 8
  %arrayidx686 = getelementptr inbounds double* %493, i64 %idxprom685
  %494 = load double* %arrayidx686, align 8
  %sub687 = fsub double %add683, %494
  %495 = load i32* %i, align 4
  %add688 = add nsw i32 -399985, %495
  %idxprom689 = sext i32 %add688 to i64
  %496 = load double** %srcGrid.addr, align 8
  %arrayidx690 = getelementptr inbounds double* %496, i64 %idxprom689
  %497 = load double* %arrayidx690, align 8
  %add691 = fadd double %sub687, %497
  %498 = load i32* %i, align 4
  %add692 = add nsw i32 -399984, %498
  %idxprom693 = sext i32 %add692 to i64
  %499 = load double** %srcGrid.addr, align 8
  %arrayidx694 = getelementptr inbounds double* %499, i64 %idxprom693
  %500 = load double* %arrayidx694, align 8
  %add695 = fadd double %add691, %500
  %501 = load i32* %i, align 4
  %add696 = add nsw i32 -399983, %501
  %idxprom697 = sext i32 %add696 to i64
  %502 = load double** %srcGrid.addr, align 8
  %arrayidx698 = getelementptr inbounds double* %502, i64 %idxprom697
  %503 = load double* %arrayidx698, align 8
  %sub699 = fsub double %add695, %503
  %504 = load i32* %i, align 4
  %add700 = add nsw i32 -399982, %504
  %idxprom701 = sext i32 %add700 to i64
  %505 = load double** %srcGrid.addr, align 8
  %arrayidx702 = getelementptr inbounds double* %505, i64 %idxprom701
  %506 = load double* %arrayidx702, align 8
  %sub703 = fsub double %sub699, %506
  store double %sub703, double* %ux2, align 8
  %507 = load i32* %i, align 4
  %add704 = add nsw i32 -399999, %507
  %idxprom705 = sext i32 %add704 to i64
  %508 = load double** %srcGrid.addr, align 8
  %arrayidx706 = getelementptr inbounds double* %508, i64 %idxprom705
  %509 = load double* %arrayidx706, align 8
  %510 = load i32* %i, align 4
  %add707 = add nsw i32 -399998, %510
  %idxprom708 = sext i32 %add707 to i64
  %511 = load double** %srcGrid.addr, align 8
  %arrayidx709 = getelementptr inbounds double* %511, i64 %idxprom708
  %512 = load double* %arrayidx709, align 8
  %sub710 = fsub double %509, %512
  %513 = load i32* %i, align 4
  %add711 = add nsw i32 -399993, %513
  %idxprom712 = sext i32 %add711 to i64
  %514 = load double** %srcGrid.addr, align 8
  %arrayidx713 = getelementptr inbounds double* %514, i64 %idxprom712
  %515 = load double* %arrayidx713, align 8
  %add714 = fadd double %sub710, %515
  %516 = load i32* %i, align 4
  %add715 = add nsw i32 -399992, %516
  %idxprom716 = sext i32 %add715 to i64
  %517 = load double** %srcGrid.addr, align 8
  %arrayidx717 = getelementptr inbounds double* %517, i64 %idxprom716
  %518 = load double* %arrayidx717, align 8
  %add718 = fadd double %add714, %518
  %519 = load i32* %i, align 4
  %add719 = add nsw i32 -399991, %519
  %idxprom720 = sext i32 %add719 to i64
  %520 = load double** %srcGrid.addr, align 8
  %arrayidx721 = getelementptr inbounds double* %520, i64 %idxprom720
  %521 = load double* %arrayidx721, align 8
  %sub722 = fsub double %add718, %521
  %522 = load i32* %i, align 4
  %add723 = add nsw i32 -399990, %522
  %idxprom724 = sext i32 %add723 to i64
  %523 = load double** %srcGrid.addr, align 8
  %arrayidx725 = getelementptr inbounds double* %523, i64 %idxprom724
  %524 = load double* %arrayidx725, align 8
  %sub726 = fsub double %sub722, %524
  %525 = load i32* %i, align 4
  %add727 = add nsw i32 -399989, %525
  %idxprom728 = sext i32 %add727 to i64
  %526 = load double** %srcGrid.addr, align 8
  %arrayidx729 = getelementptr inbounds double* %526, i64 %idxprom728
  %527 = load double* %arrayidx729, align 8
  %add730 = fadd double %sub726, %527
  %528 = load i32* %i, align 4
  %add731 = add nsw i32 -399988, %528
  %idxprom732 = sext i32 %add731 to i64
  %529 = load double** %srcGrid.addr, align 8
  %arrayidx733 = getelementptr inbounds double* %529, i64 %idxprom732
  %530 = load double* %arrayidx733, align 8
  %add734 = fadd double %add730, %530
  %531 = load i32* %i, align 4
  %add735 = add nsw i32 -399987, %531
  %idxprom736 = sext i32 %add735 to i64
  %532 = load double** %srcGrid.addr, align 8
  %arrayidx737 = getelementptr inbounds double* %532, i64 %idxprom736
  %533 = load double* %arrayidx737, align 8
  %sub738 = fsub double %add734, %533
  %534 = load i32* %i, align 4
  %add739 = add nsw i32 -399986, %534
  %idxprom740 = sext i32 %add739 to i64
  %535 = load double** %srcGrid.addr, align 8
  %arrayidx741 = getelementptr inbounds double* %535, i64 %idxprom740
  %536 = load double* %arrayidx741, align 8
  %sub742 = fsub double %sub738, %536
  store double %sub742, double* %uy2, align 8
  %537 = load i32* %i, align 4
  %add743 = add nsw i32 -399995, %537
  %idxprom744 = sext i32 %add743 to i64
  %538 = load double** %srcGrid.addr, align 8
  %arrayidx745 = getelementptr inbounds double* %538, i64 %idxprom744
  %539 = load double* %arrayidx745, align 8
  %540 = load i32* %i, align 4
  %add746 = add nsw i32 -399994, %540
  %idxprom747 = sext i32 %add746 to i64
  %541 = load double** %srcGrid.addr, align 8
  %arrayidx748 = getelementptr inbounds double* %541, i64 %idxprom747
  %542 = load double* %arrayidx748, align 8
  %sub749 = fsub double %539, %542
  %543 = load i32* %i, align 4
  %add750 = add nsw i32 -399989, %543
  %idxprom751 = sext i32 %add750 to i64
  %544 = load double** %srcGrid.addr, align 8
  %arrayidx752 = getelementptr inbounds double* %544, i64 %idxprom751
  %545 = load double* %arrayidx752, align 8
  %add753 = fadd double %sub749, %545
  %546 = load i32* %i, align 4
  %add754 = add nsw i32 -399988, %546
  %idxprom755 = sext i32 %add754 to i64
  %547 = load double** %srcGrid.addr, align 8
  %arrayidx756 = getelementptr inbounds double* %547, i64 %idxprom755
  %548 = load double* %arrayidx756, align 8
  %sub757 = fsub double %add753, %548
  %549 = load i32* %i, align 4
  %add758 = add nsw i32 -399987, %549
  %idxprom759 = sext i32 %add758 to i64
  %550 = load double** %srcGrid.addr, align 8
  %arrayidx760 = getelementptr inbounds double* %550, i64 %idxprom759
  %551 = load double* %arrayidx760, align 8
  %add761 = fadd double %sub757, %551
  %552 = load i32* %i, align 4
  %add762 = add nsw i32 -399986, %552
  %idxprom763 = sext i32 %add762 to i64
  %553 = load double** %srcGrid.addr, align 8
  %arrayidx764 = getelementptr inbounds double* %553, i64 %idxprom763
  %554 = load double* %arrayidx764, align 8
  %sub765 = fsub double %add761, %554
  %555 = load i32* %i, align 4
  %add766 = add nsw i32 -399985, %555
  %idxprom767 = sext i32 %add766 to i64
  %556 = load double** %srcGrid.addr, align 8
  %arrayidx768 = getelementptr inbounds double* %556, i64 %idxprom767
  %557 = load double* %arrayidx768, align 8
  %add769 = fadd double %sub765, %557
  %558 = load i32* %i, align 4
  %add770 = add nsw i32 -399984, %558
  %idxprom771 = sext i32 %add770 to i64
  %559 = load double** %srcGrid.addr, align 8
  %arrayidx772 = getelementptr inbounds double* %559, i64 %idxprom771
  %560 = load double* %arrayidx772, align 8
  %sub773 = fsub double %add769, %560
  %561 = load i32* %i, align 4
  %add774 = add nsw i32 -399983, %561
  %idxprom775 = sext i32 %add774 to i64
  %562 = load double** %srcGrid.addr, align 8
  %arrayidx776 = getelementptr inbounds double* %562, i64 %idxprom775
  %563 = load double* %arrayidx776, align 8
  %add777 = fadd double %sub773, %563
  %564 = load i32* %i, align 4
  %add778 = add nsw i32 -399982, %564
  %idxprom779 = sext i32 %add778 to i64
  %565 = load double** %srcGrid.addr, align 8
  %arrayidx780 = getelementptr inbounds double* %565, i64 %idxprom779
  %566 = load double* %arrayidx780, align 8
  %sub781 = fsub double %add777, %566
  store double %sub781, double* %uz2, align 8
  %567 = load double* %rho2, align 8
  %568 = load double* %ux2, align 8
  %div782 = fdiv double %568, %567
  store double %div782, double* %ux2, align 8
  %569 = load double* %rho2, align 8
  %570 = load double* %uy2, align 8
  %div783 = fdiv double %570, %569
  store double %div783, double* %uy2, align 8
  %571 = load double* %rho2, align 8
  %572 = load double* %uz2, align 8
  %div784 = fdiv double %572, %571
  store double %div784, double* %uz2, align 8
  store double 1.000000e+00, double* %rho, align 8
  %573 = load double* %ux1, align 8
  %mul785 = fmul double 2.000000e+00, %573
  %574 = load double* %ux2, align 8
  %sub786 = fsub double %mul785, %574
  store double %sub786, double* %ux, align 8
  %575 = load double* %uy1, align 8
  %mul787 = fmul double 2.000000e+00, %575
  %576 = load double* %uy2, align 8
  %sub788 = fsub double %mul787, %576
  store double %sub788, double* %uy, align 8
  %577 = load double* %uz1, align 8
  %mul789 = fmul double 2.000000e+00, %577
  %578 = load double* %uz2, align 8
  %sub790 = fsub double %mul789, %578
  store double %sub790, double* %uz, align 8
  %579 = load double* %ux, align 8
  %580 = load double* %ux, align 8
  %mul791 = fmul double %579, %580
  %581 = load double* %uy, align 8
  %582 = load double* %uy, align 8
  %mul792 = fmul double %581, %582
  %add793 = fadd double %mul791, %mul792
  %583 = load double* %uz, align 8
  %584 = load double* %uz, align 8
  %mul794 = fmul double %583, %584
  %add795 = fadd double %add793, %mul794
  %mul796 = fmul double 1.500000e+00, %add795
  store double %mul796, double* %u2, align 8
  %585 = load double* %rho, align 8
  %mul797 = fmul double 0x3FD5555555555555, %585
  %586 = load double* %u2, align 8
  %sub798 = fsub double 1.000000e+00, %586
  %mul799 = fmul double %mul797, %sub798
  %587 = load i32* %i, align 4
  %add800 = add nsw i32 0, %587
  %idxprom801 = sext i32 %add800 to i64
  %588 = load double** %srcGrid.addr, align 8
  %arrayidx802 = getelementptr inbounds double* %588, i64 %idxprom801
  store double %mul799, double* %arrayidx802, align 8
  %589 = load double* %rho, align 8
  %mul803 = fmul double 0x3FAC71C71C71C71C, %589
  %590 = load double* %uy, align 8
  %591 = load double* %uy, align 8
  %mul804 = fmul double 4.500000e+00, %591
  %add805 = fadd double %mul804, 3.000000e+00
  %mul806 = fmul double %590, %add805
  %add807 = fadd double 1.000000e+00, %mul806
  %592 = load double* %u2, align 8
  %sub808 = fsub double %add807, %592
  %mul809 = fmul double %mul803, %sub808
  %593 = load i32* %i, align 4
  %add810 = add nsw i32 1, %593
  %idxprom811 = sext i32 %add810 to i64
  %594 = load double** %srcGrid.addr, align 8
  %arrayidx812 = getelementptr inbounds double* %594, i64 %idxprom811
  store double %mul809, double* %arrayidx812, align 8
  %595 = load double* %rho, align 8
  %mul813 = fmul double 0x3FAC71C71C71C71C, %595
  %596 = load double* %uy, align 8
  %597 = load double* %uy, align 8
  %mul814 = fmul double 4.500000e+00, %597
  %sub815 = fsub double %mul814, 3.000000e+00
  %mul816 = fmul double %596, %sub815
  %add817 = fadd double 1.000000e+00, %mul816
  %598 = load double* %u2, align 8
  %sub818 = fsub double %add817, %598
  %mul819 = fmul double %mul813, %sub818
  %599 = load i32* %i, align 4
  %add820 = add nsw i32 2, %599
  %idxprom821 = sext i32 %add820 to i64
  %600 = load double** %srcGrid.addr, align 8
  %arrayidx822 = getelementptr inbounds double* %600, i64 %idxprom821
  store double %mul819, double* %arrayidx822, align 8
  %601 = load double* %rho, align 8
  %mul823 = fmul double 0x3FAC71C71C71C71C, %601
  %602 = load double* %ux, align 8
  %603 = load double* %ux, align 8
  %mul824 = fmul double 4.500000e+00, %603
  %add825 = fadd double %mul824, 3.000000e+00
  %mul826 = fmul double %602, %add825
  %add827 = fadd double 1.000000e+00, %mul826
  %604 = load double* %u2, align 8
  %sub828 = fsub double %add827, %604
  %mul829 = fmul double %mul823, %sub828
  %605 = load i32* %i, align 4
  %add830 = add nsw i32 3, %605
  %idxprom831 = sext i32 %add830 to i64
  %606 = load double** %srcGrid.addr, align 8
  %arrayidx832 = getelementptr inbounds double* %606, i64 %idxprom831
  store double %mul829, double* %arrayidx832, align 8
  %607 = load double* %rho, align 8
  %mul833 = fmul double 0x3FAC71C71C71C71C, %607
  %608 = load double* %ux, align 8
  %609 = load double* %ux, align 8
  %mul834 = fmul double 4.500000e+00, %609
  %sub835 = fsub double %mul834, 3.000000e+00
  %mul836 = fmul double %608, %sub835
  %add837 = fadd double 1.000000e+00, %mul836
  %610 = load double* %u2, align 8
  %sub838 = fsub double %add837, %610
  %mul839 = fmul double %mul833, %sub838
  %611 = load i32* %i, align 4
  %add840 = add nsw i32 4, %611
  %idxprom841 = sext i32 %add840 to i64
  %612 = load double** %srcGrid.addr, align 8
  %arrayidx842 = getelementptr inbounds double* %612, i64 %idxprom841
  store double %mul839, double* %arrayidx842, align 8
  %613 = load double* %rho, align 8
  %mul843 = fmul double 0x3FAC71C71C71C71C, %613
  %614 = load double* %uz, align 8
  %615 = load double* %uz, align 8
  %mul844 = fmul double 4.500000e+00, %615
  %add845 = fadd double %mul844, 3.000000e+00
  %mul846 = fmul double %614, %add845
  %add847 = fadd double 1.000000e+00, %mul846
  %616 = load double* %u2, align 8
  %sub848 = fsub double %add847, %616
  %mul849 = fmul double %mul843, %sub848
  %617 = load i32* %i, align 4
  %add850 = add nsw i32 5, %617
  %idxprom851 = sext i32 %add850 to i64
  %618 = load double** %srcGrid.addr, align 8
  %arrayidx852 = getelementptr inbounds double* %618, i64 %idxprom851
  store double %mul849, double* %arrayidx852, align 8
  %619 = load double* %rho, align 8
  %mul853 = fmul double 0x3FAC71C71C71C71C, %619
  %620 = load double* %uz, align 8
  %621 = load double* %uz, align 8
  %mul854 = fmul double 4.500000e+00, %621
  %sub855 = fsub double %mul854, 3.000000e+00
  %mul856 = fmul double %620, %sub855
  %add857 = fadd double 1.000000e+00, %mul856
  %622 = load double* %u2, align 8
  %sub858 = fsub double %add857, %622
  %mul859 = fmul double %mul853, %sub858
  %623 = load i32* %i, align 4
  %add860 = add nsw i32 6, %623
  %idxprom861 = sext i32 %add860 to i64
  %624 = load double** %srcGrid.addr, align 8
  %arrayidx862 = getelementptr inbounds double* %624, i64 %idxprom861
  store double %mul859, double* %arrayidx862, align 8
  %625 = load double* %rho, align 8
  %mul863 = fmul double 0x3F9C71C71C71C71C, %625
  %626 = load double* %ux, align 8
  %627 = load double* %uy, align 8
  %add864 = fadd double %626, %627
  %628 = load double* %ux, align 8
  %629 = load double* %uy, align 8
  %add865 = fadd double %628, %629
  %mul866 = fmul double 4.500000e+00, %add865
  %add867 = fadd double %mul866, 3.000000e+00
  %mul868 = fmul double %add864, %add867
  %add869 = fadd double 1.000000e+00, %mul868
  %630 = load double* %u2, align 8
  %sub870 = fsub double %add869, %630
  %mul871 = fmul double %mul863, %sub870
  %631 = load i32* %i, align 4
  %add872 = add nsw i32 7, %631
  %idxprom873 = sext i32 %add872 to i64
  %632 = load double** %srcGrid.addr, align 8
  %arrayidx874 = getelementptr inbounds double* %632, i64 %idxprom873
  store double %mul871, double* %arrayidx874, align 8
  %633 = load double* %rho, align 8
  %mul875 = fmul double 0x3F9C71C71C71C71C, %633
  %634 = load double* %ux, align 8
  %sub876 = fsub double -0.000000e+00, %634
  %635 = load double* %uy, align 8
  %add877 = fadd double %sub876, %635
  %636 = load double* %ux, align 8
  %sub878 = fsub double -0.000000e+00, %636
  %637 = load double* %uy, align 8
  %add879 = fadd double %sub878, %637
  %mul880 = fmul double 4.500000e+00, %add879
  %add881 = fadd double %mul880, 3.000000e+00
  %mul882 = fmul double %add877, %add881
  %add883 = fadd double 1.000000e+00, %mul882
  %638 = load double* %u2, align 8
  %sub884 = fsub double %add883, %638
  %mul885 = fmul double %mul875, %sub884
  %639 = load i32* %i, align 4
  %add886 = add nsw i32 8, %639
  %idxprom887 = sext i32 %add886 to i64
  %640 = load double** %srcGrid.addr, align 8
  %arrayidx888 = getelementptr inbounds double* %640, i64 %idxprom887
  store double %mul885, double* %arrayidx888, align 8
  %641 = load double* %rho, align 8
  %mul889 = fmul double 0x3F9C71C71C71C71C, %641
  %642 = load double* %ux, align 8
  %643 = load double* %uy, align 8
  %sub890 = fsub double %642, %643
  %644 = load double* %ux, align 8
  %645 = load double* %uy, align 8
  %sub891 = fsub double %644, %645
  %mul892 = fmul double 4.500000e+00, %sub891
  %add893 = fadd double %mul892, 3.000000e+00
  %mul894 = fmul double %sub890, %add893
  %add895 = fadd double 1.000000e+00, %mul894
  %646 = load double* %u2, align 8
  %sub896 = fsub double %add895, %646
  %mul897 = fmul double %mul889, %sub896
  %647 = load i32* %i, align 4
  %add898 = add nsw i32 9, %647
  %idxprom899 = sext i32 %add898 to i64
  %648 = load double** %srcGrid.addr, align 8
  %arrayidx900 = getelementptr inbounds double* %648, i64 %idxprom899
  store double %mul897, double* %arrayidx900, align 8
  %649 = load double* %rho, align 8
  %mul901 = fmul double 0x3F9C71C71C71C71C, %649
  %650 = load double* %ux, align 8
  %sub902 = fsub double -0.000000e+00, %650
  %651 = load double* %uy, align 8
  %sub903 = fsub double %sub902, %651
  %652 = load double* %ux, align 8
  %sub904 = fsub double -0.000000e+00, %652
  %653 = load double* %uy, align 8
  %sub905 = fsub double %sub904, %653
  %mul906 = fmul double 4.500000e+00, %sub905
  %add907 = fadd double %mul906, 3.000000e+00
  %mul908 = fmul double %sub903, %add907
  %add909 = fadd double 1.000000e+00, %mul908
  %654 = load double* %u2, align 8
  %sub910 = fsub double %add909, %654
  %mul911 = fmul double %mul901, %sub910
  %655 = load i32* %i, align 4
  %add912 = add nsw i32 10, %655
  %idxprom913 = sext i32 %add912 to i64
  %656 = load double** %srcGrid.addr, align 8
  %arrayidx914 = getelementptr inbounds double* %656, i64 %idxprom913
  store double %mul911, double* %arrayidx914, align 8
  %657 = load double* %rho, align 8
  %mul915 = fmul double 0x3F9C71C71C71C71C, %657
  %658 = load double* %uy, align 8
  %659 = load double* %uz, align 8
  %add916 = fadd double %658, %659
  %660 = load double* %uy, align 8
  %661 = load double* %uz, align 8
  %add917 = fadd double %660, %661
  %mul918 = fmul double 4.500000e+00, %add917
  %add919 = fadd double %mul918, 3.000000e+00
  %mul920 = fmul double %add916, %add919
  %add921 = fadd double 1.000000e+00, %mul920
  %662 = load double* %u2, align 8
  %sub922 = fsub double %add921, %662
  %mul923 = fmul double %mul915, %sub922
  %663 = load i32* %i, align 4
  %add924 = add nsw i32 11, %663
  %idxprom925 = sext i32 %add924 to i64
  %664 = load double** %srcGrid.addr, align 8
  %arrayidx926 = getelementptr inbounds double* %664, i64 %idxprom925
  store double %mul923, double* %arrayidx926, align 8
  %665 = load double* %rho, align 8
  %mul927 = fmul double 0x3F9C71C71C71C71C, %665
  %666 = load double* %uy, align 8
  %667 = load double* %uz, align 8
  %sub928 = fsub double %666, %667
  %668 = load double* %uy, align 8
  %669 = load double* %uz, align 8
  %sub929 = fsub double %668, %669
  %mul930 = fmul double 4.500000e+00, %sub929
  %add931 = fadd double %mul930, 3.000000e+00
  %mul932 = fmul double %sub928, %add931
  %add933 = fadd double 1.000000e+00, %mul932
  %670 = load double* %u2, align 8
  %sub934 = fsub double %add933, %670
  %mul935 = fmul double %mul927, %sub934
  %671 = load i32* %i, align 4
  %add936 = add nsw i32 12, %671
  %idxprom937 = sext i32 %add936 to i64
  %672 = load double** %srcGrid.addr, align 8
  %arrayidx938 = getelementptr inbounds double* %672, i64 %idxprom937
  store double %mul935, double* %arrayidx938, align 8
  %673 = load double* %rho, align 8
  %mul939 = fmul double 0x3F9C71C71C71C71C, %673
  %674 = load double* %uy, align 8
  %sub940 = fsub double -0.000000e+00, %674
  %675 = load double* %uz, align 8
  %add941 = fadd double %sub940, %675
  %676 = load double* %uy, align 8
  %sub942 = fsub double -0.000000e+00, %676
  %677 = load double* %uz, align 8
  %add943 = fadd double %sub942, %677
  %mul944 = fmul double 4.500000e+00, %add943
  %add945 = fadd double %mul944, 3.000000e+00
  %mul946 = fmul double %add941, %add945
  %add947 = fadd double 1.000000e+00, %mul946
  %678 = load double* %u2, align 8
  %sub948 = fsub double %add947, %678
  %mul949 = fmul double %mul939, %sub948
  %679 = load i32* %i, align 4
  %add950 = add nsw i32 13, %679
  %idxprom951 = sext i32 %add950 to i64
  %680 = load double** %srcGrid.addr, align 8
  %arrayidx952 = getelementptr inbounds double* %680, i64 %idxprom951
  store double %mul949, double* %arrayidx952, align 8
  %681 = load double* %rho, align 8
  %mul953 = fmul double 0x3F9C71C71C71C71C, %681
  %682 = load double* %uy, align 8
  %sub954 = fsub double -0.000000e+00, %682
  %683 = load double* %uz, align 8
  %sub955 = fsub double %sub954, %683
  %684 = load double* %uy, align 8
  %sub956 = fsub double -0.000000e+00, %684
  %685 = load double* %uz, align 8
  %sub957 = fsub double %sub956, %685
  %mul958 = fmul double 4.500000e+00, %sub957
  %add959 = fadd double %mul958, 3.000000e+00
  %mul960 = fmul double %sub955, %add959
  %add961 = fadd double 1.000000e+00, %mul960
  %686 = load double* %u2, align 8
  %sub962 = fsub double %add961, %686
  %mul963 = fmul double %mul953, %sub962
  %687 = load i32* %i, align 4
  %add964 = add nsw i32 14, %687
  %idxprom965 = sext i32 %add964 to i64
  %688 = load double** %srcGrid.addr, align 8
  %arrayidx966 = getelementptr inbounds double* %688, i64 %idxprom965
  store double %mul963, double* %arrayidx966, align 8
  %689 = load double* %rho, align 8
  %mul967 = fmul double 0x3F9C71C71C71C71C, %689
  %690 = load double* %ux, align 8
  %691 = load double* %uz, align 8
  %add968 = fadd double %690, %691
  %692 = load double* %ux, align 8
  %693 = load double* %uz, align 8
  %add969 = fadd double %692, %693
  %mul970 = fmul double 4.500000e+00, %add969
  %add971 = fadd double %mul970, 3.000000e+00
  %mul972 = fmul double %add968, %add971
  %add973 = fadd double 1.000000e+00, %mul972
  %694 = load double* %u2, align 8
  %sub974 = fsub double %add973, %694
  %mul975 = fmul double %mul967, %sub974
  %695 = load i32* %i, align 4
  %add976 = add nsw i32 15, %695
  %idxprom977 = sext i32 %add976 to i64
  %696 = load double** %srcGrid.addr, align 8
  %arrayidx978 = getelementptr inbounds double* %696, i64 %idxprom977
  store double %mul975, double* %arrayidx978, align 8
  %697 = load double* %rho, align 8
  %mul979 = fmul double 0x3F9C71C71C71C71C, %697
  %698 = load double* %ux, align 8
  %699 = load double* %uz, align 8
  %sub980 = fsub double %698, %699
  %700 = load double* %ux, align 8
  %701 = load double* %uz, align 8
  %sub981 = fsub double %700, %701
  %mul982 = fmul double 4.500000e+00, %sub981
  %add983 = fadd double %mul982, 3.000000e+00
  %mul984 = fmul double %sub980, %add983
  %add985 = fadd double 1.000000e+00, %mul984
  %702 = load double* %u2, align 8
  %sub986 = fsub double %add985, %702
  %mul987 = fmul double %mul979, %sub986
  %703 = load i32* %i, align 4
  %add988 = add nsw i32 16, %703
  %idxprom989 = sext i32 %add988 to i64
  %704 = load double** %srcGrid.addr, align 8
  %arrayidx990 = getelementptr inbounds double* %704, i64 %idxprom989
  store double %mul987, double* %arrayidx990, align 8
  %705 = load double* %rho, align 8
  %mul991 = fmul double 0x3F9C71C71C71C71C, %705
  %706 = load double* %ux, align 8
  %sub992 = fsub double -0.000000e+00, %706
  %707 = load double* %uz, align 8
  %add993 = fadd double %sub992, %707
  %708 = load double* %ux, align 8
  %sub994 = fsub double -0.000000e+00, %708
  %709 = load double* %uz, align 8
  %add995 = fadd double %sub994, %709
  %mul996 = fmul double 4.500000e+00, %add995
  %add997 = fadd double %mul996, 3.000000e+00
  %mul998 = fmul double %add993, %add997
  %add999 = fadd double 1.000000e+00, %mul998
  %710 = load double* %u2, align 8
  %sub1000 = fsub double %add999, %710
  %mul1001 = fmul double %mul991, %sub1000
  %711 = load i32* %i, align 4
  %add1002 = add nsw i32 17, %711
  %idxprom1003 = sext i32 %add1002 to i64
  %712 = load double** %srcGrid.addr, align 8
  %arrayidx1004 = getelementptr inbounds double* %712, i64 %idxprom1003
  store double %mul1001, double* %arrayidx1004, align 8
  %713 = load double* %rho, align 8
  %mul1005 = fmul double 0x3F9C71C71C71C71C, %713
  %714 = load double* %ux, align 8
  %sub1006 = fsub double -0.000000e+00, %714
  %715 = load double* %uz, align 8
  %sub1007 = fsub double %sub1006, %715
  %716 = load double* %ux, align 8
  %sub1008 = fsub double -0.000000e+00, %716
  %717 = load double* %uz, align 8
  %sub1009 = fsub double %sub1008, %717
  %mul1010 = fmul double 4.500000e+00, %sub1009
  %add1011 = fadd double %mul1010, 3.000000e+00
  %mul1012 = fmul double %sub1007, %add1011
  %add1013 = fadd double 1.000000e+00, %mul1012
  %718 = load double* %u2, align 8
  %sub1014 = fsub double %add1013, %718
  %mul1015 = fmul double %mul1005, %sub1014
  %719 = load i32* %i, align 4
  %add1016 = add nsw i32 18, %719
  %idxprom1017 = sext i32 %add1016 to i64
  %720 = load double** %srcGrid.addr, align 8
  %arrayidx1018 = getelementptr inbounds double* %720, i64 %idxprom1017
  store double %mul1015, double* %arrayidx1018, align 8
  br label %for.inc1019

for.inc1019:                                      ; preds = %for.body394
  %721 = load i32* %i, align 4
  %add1020 = add nsw i32 %721, 20
  store i32 %add1020, i32* %i, align 4
  br label %for.cond391

for.end1021:                                      ; preds = %for.cond391
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @LBM_showGridStatistics(double* %grid) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %nObstacleCells = alloca i32, align 4
  %nAccelCells = alloca i32, align 4
  %nFluidCells = alloca i32, align 4
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %minU2 = alloca double, align 8
  %maxU2 = alloca double, align 8
  %u2 = alloca double, align 8
  %minRho = alloca double, align 8
  %maxRho = alloca double, align 8
  %rho = alloca double, align 8
  %mass = alloca double, align 8
  %i = alloca i32, align 4
  store double* %grid, double** %grid.addr, align 8
  store i32 0, i32* %nObstacleCells, align 4
  store i32 0, i32* %nAccelCells, align 4
  store i32 0, i32* %nFluidCells, align 4
  store double 1.000000e+30, double* %minU2, align 8
  store double -1.000000e+30, double* %maxU2, align 8
  store double 1.000000e+30, double* %minRho, align 8
  store double -1.000000e+30, double* %maxRho, align 8
  store double 0.000000e+00, double* %mass, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 26000000
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 0, %1
  %idxprom = sext i32 %add to i64
  %2 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %3 = load double* %arrayidx, align 8
  %4 = load i32* %i, align 4
  %add1 = add nsw i32 1, %4
  %idxprom2 = sext i32 %add1 to i64
  %5 = load double** %grid.addr, align 8
  %arrayidx3 = getelementptr inbounds double* %5, i64 %idxprom2
  %6 = load double* %arrayidx3, align 8
  %add4 = fadd double %3, %6
  %7 = load i32* %i, align 4
  %add5 = add nsw i32 2, %7
  %idxprom6 = sext i32 %add5 to i64
  %8 = load double** %grid.addr, align 8
  %arrayidx7 = getelementptr inbounds double* %8, i64 %idxprom6
  %9 = load double* %arrayidx7, align 8
  %add8 = fadd double %add4, %9
  %10 = load i32* %i, align 4
  %add9 = add nsw i32 3, %10
  %idxprom10 = sext i32 %add9 to i64
  %11 = load double** %grid.addr, align 8
  %arrayidx11 = getelementptr inbounds double* %11, i64 %idxprom10
  %12 = load double* %arrayidx11, align 8
  %add12 = fadd double %add8, %12
  %13 = load i32* %i, align 4
  %add13 = add nsw i32 4, %13
  %idxprom14 = sext i32 %add13 to i64
  %14 = load double** %grid.addr, align 8
  %arrayidx15 = getelementptr inbounds double* %14, i64 %idxprom14
  %15 = load double* %arrayidx15, align 8
  %add16 = fadd double %add12, %15
  %16 = load i32* %i, align 4
  %add17 = add nsw i32 5, %16
  %idxprom18 = sext i32 %add17 to i64
  %17 = load double** %grid.addr, align 8
  %arrayidx19 = getelementptr inbounds double* %17, i64 %idxprom18
  %18 = load double* %arrayidx19, align 8
  %add20 = fadd double %add16, %18
  %19 = load i32* %i, align 4
  %add21 = add nsw i32 6, %19
  %idxprom22 = sext i32 %add21 to i64
  %20 = load double** %grid.addr, align 8
  %arrayidx23 = getelementptr inbounds double* %20, i64 %idxprom22
  %21 = load double* %arrayidx23, align 8
  %add24 = fadd double %add20, %21
  %22 = load i32* %i, align 4
  %add25 = add nsw i32 7, %22
  %idxprom26 = sext i32 %add25 to i64
  %23 = load double** %grid.addr, align 8
  %arrayidx27 = getelementptr inbounds double* %23, i64 %idxprom26
  %24 = load double* %arrayidx27, align 8
  %add28 = fadd double %add24, %24
  %25 = load i32* %i, align 4
  %add29 = add nsw i32 8, %25
  %idxprom30 = sext i32 %add29 to i64
  %26 = load double** %grid.addr, align 8
  %arrayidx31 = getelementptr inbounds double* %26, i64 %idxprom30
  %27 = load double* %arrayidx31, align 8
  %add32 = fadd double %add28, %27
  %28 = load i32* %i, align 4
  %add33 = add nsw i32 9, %28
  %idxprom34 = sext i32 %add33 to i64
  %29 = load double** %grid.addr, align 8
  %arrayidx35 = getelementptr inbounds double* %29, i64 %idxprom34
  %30 = load double* %arrayidx35, align 8
  %add36 = fadd double %add32, %30
  %31 = load i32* %i, align 4
  %add37 = add nsw i32 10, %31
  %idxprom38 = sext i32 %add37 to i64
  %32 = load double** %grid.addr, align 8
  %arrayidx39 = getelementptr inbounds double* %32, i64 %idxprom38
  %33 = load double* %arrayidx39, align 8
  %add40 = fadd double %add36, %33
  %34 = load i32* %i, align 4
  %add41 = add nsw i32 11, %34
  %idxprom42 = sext i32 %add41 to i64
  %35 = load double** %grid.addr, align 8
  %arrayidx43 = getelementptr inbounds double* %35, i64 %idxprom42
  %36 = load double* %arrayidx43, align 8
  %add44 = fadd double %add40, %36
  %37 = load i32* %i, align 4
  %add45 = add nsw i32 12, %37
  %idxprom46 = sext i32 %add45 to i64
  %38 = load double** %grid.addr, align 8
  %arrayidx47 = getelementptr inbounds double* %38, i64 %idxprom46
  %39 = load double* %arrayidx47, align 8
  %add48 = fadd double %add44, %39
  %40 = load i32* %i, align 4
  %add49 = add nsw i32 13, %40
  %idxprom50 = sext i32 %add49 to i64
  %41 = load double** %grid.addr, align 8
  %arrayidx51 = getelementptr inbounds double* %41, i64 %idxprom50
  %42 = load double* %arrayidx51, align 8
  %add52 = fadd double %add48, %42
  %43 = load i32* %i, align 4
  %add53 = add nsw i32 14, %43
  %idxprom54 = sext i32 %add53 to i64
  %44 = load double** %grid.addr, align 8
  %arrayidx55 = getelementptr inbounds double* %44, i64 %idxprom54
  %45 = load double* %arrayidx55, align 8
  %add56 = fadd double %add52, %45
  %46 = load i32* %i, align 4
  %add57 = add nsw i32 15, %46
  %idxprom58 = sext i32 %add57 to i64
  %47 = load double** %grid.addr, align 8
  %arrayidx59 = getelementptr inbounds double* %47, i64 %idxprom58
  %48 = load double* %arrayidx59, align 8
  %add60 = fadd double %add56, %48
  %49 = load i32* %i, align 4
  %add61 = add nsw i32 16, %49
  %idxprom62 = sext i32 %add61 to i64
  %50 = load double** %grid.addr, align 8
  %arrayidx63 = getelementptr inbounds double* %50, i64 %idxprom62
  %51 = load double* %arrayidx63, align 8
  %add64 = fadd double %add60, %51
  %52 = load i32* %i, align 4
  %add65 = add nsw i32 17, %52
  %idxprom66 = sext i32 %add65 to i64
  %53 = load double** %grid.addr, align 8
  %arrayidx67 = getelementptr inbounds double* %53, i64 %idxprom66
  %54 = load double* %arrayidx67, align 8
  %add68 = fadd double %add64, %54
  %55 = load i32* %i, align 4
  %add69 = add nsw i32 18, %55
  %idxprom70 = sext i32 %add69 to i64
  %56 = load double** %grid.addr, align 8
  %arrayidx71 = getelementptr inbounds double* %56, i64 %idxprom70
  %57 = load double* %arrayidx71, align 8
  %add72 = fadd double %add68, %57
  store double %add72, double* %rho, align 8
  %58 = load double* %rho, align 8
  %59 = load double* %minRho, align 8
  %cmp73 = fcmp olt double %58, %59
  br i1 %cmp73, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %60 = load double* %rho, align 8
  store double %60, double* %minRho, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %61 = load double* %rho, align 8
  %62 = load double* %maxRho, align 8
  %cmp74 = fcmp ogt double %61, %62
  br i1 %cmp74, label %if.then75, label %if.end76

if.then75:                                        ; preds = %if.end
  %63 = load double* %rho, align 8
  store double %63, double* %maxRho, align 8
  br label %if.end76

if.end76:                                         ; preds = %if.then75, %if.end
  %64 = load double* %rho, align 8
  %65 = load double* %mass, align 8
  %add77 = fadd double %65, %64
  store double %add77, double* %mass, align 8
  %66 = load i32* %i, align 4
  %add78 = add nsw i32 19, %66
  %idxprom79 = sext i32 %add78 to i64
  %67 = load double** %grid.addr, align 8
  %arrayidx80 = getelementptr inbounds double* %67, i64 %idxprom79
  %68 = bitcast double* %arrayidx80 to i8*
  %69 = bitcast i8* %68 to i32*
  %70 = load i32* %69, align 4
  %and = and i32 %70, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then81, label %if.else

if.then81:                                        ; preds = %if.end76
  %71 = load i32* %nObstacleCells, align 4
  %inc = add nsw i32 %71, 1
  store i32 %inc, i32* %nObstacleCells, align 4
  br label %if.end219

if.else:                                          ; preds = %if.end76
  %72 = load i32* %i, align 4
  %add82 = add nsw i32 19, %72
  %idxprom83 = sext i32 %add82 to i64
  %73 = load double** %grid.addr, align 8
  %arrayidx84 = getelementptr inbounds double* %73, i64 %idxprom83
  %74 = bitcast double* %arrayidx84 to i8*
  %75 = bitcast i8* %74 to i32*
  %76 = load i32* %75, align 4
  %and85 = and i32 %76, 2
  %tobool86 = icmp ne i32 %and85, 0
  br i1 %tobool86, label %if.then87, label %if.else89

if.then87:                                        ; preds = %if.else
  %77 = load i32* %nAccelCells, align 4
  %inc88 = add nsw i32 %77, 1
  store i32 %inc88, i32* %nAccelCells, align 4
  br label %if.end91

if.else89:                                        ; preds = %if.else
  %78 = load i32* %nFluidCells, align 4
  %inc90 = add nsw i32 %78, 1
  store i32 %inc90, i32* %nFluidCells, align 4
  br label %if.end91

if.end91:                                         ; preds = %if.else89, %if.then87
  %79 = load i32* %i, align 4
  %add92 = add nsw i32 3, %79
  %idxprom93 = sext i32 %add92 to i64
  %80 = load double** %grid.addr, align 8
  %arrayidx94 = getelementptr inbounds double* %80, i64 %idxprom93
  %81 = load double* %arrayidx94, align 8
  %82 = load i32* %i, align 4
  %add95 = add nsw i32 4, %82
  %idxprom96 = sext i32 %add95 to i64
  %83 = load double** %grid.addr, align 8
  %arrayidx97 = getelementptr inbounds double* %83, i64 %idxprom96
  %84 = load double* %arrayidx97, align 8
  %sub = fsub double %81, %84
  %85 = load i32* %i, align 4
  %add98 = add nsw i32 7, %85
  %idxprom99 = sext i32 %add98 to i64
  %86 = load double** %grid.addr, align 8
  %arrayidx100 = getelementptr inbounds double* %86, i64 %idxprom99
  %87 = load double* %arrayidx100, align 8
  %add101 = fadd double %sub, %87
  %88 = load i32* %i, align 4
  %add102 = add nsw i32 8, %88
  %idxprom103 = sext i32 %add102 to i64
  %89 = load double** %grid.addr, align 8
  %arrayidx104 = getelementptr inbounds double* %89, i64 %idxprom103
  %90 = load double* %arrayidx104, align 8
  %sub105 = fsub double %add101, %90
  %91 = load i32* %i, align 4
  %add106 = add nsw i32 9, %91
  %idxprom107 = sext i32 %add106 to i64
  %92 = load double** %grid.addr, align 8
  %arrayidx108 = getelementptr inbounds double* %92, i64 %idxprom107
  %93 = load double* %arrayidx108, align 8
  %add109 = fadd double %sub105, %93
  %94 = load i32* %i, align 4
  %add110 = add nsw i32 10, %94
  %idxprom111 = sext i32 %add110 to i64
  %95 = load double** %grid.addr, align 8
  %arrayidx112 = getelementptr inbounds double* %95, i64 %idxprom111
  %96 = load double* %arrayidx112, align 8
  %sub113 = fsub double %add109, %96
  %97 = load i32* %i, align 4
  %add114 = add nsw i32 15, %97
  %idxprom115 = sext i32 %add114 to i64
  %98 = load double** %grid.addr, align 8
  %arrayidx116 = getelementptr inbounds double* %98, i64 %idxprom115
  %99 = load double* %arrayidx116, align 8
  %add117 = fadd double %sub113, %99
  %100 = load i32* %i, align 4
  %add118 = add nsw i32 16, %100
  %idxprom119 = sext i32 %add118 to i64
  %101 = load double** %grid.addr, align 8
  %arrayidx120 = getelementptr inbounds double* %101, i64 %idxprom119
  %102 = load double* %arrayidx120, align 8
  %add121 = fadd double %add117, %102
  %103 = load i32* %i, align 4
  %add122 = add nsw i32 17, %103
  %idxprom123 = sext i32 %add122 to i64
  %104 = load double** %grid.addr, align 8
  %arrayidx124 = getelementptr inbounds double* %104, i64 %idxprom123
  %105 = load double* %arrayidx124, align 8
  %sub125 = fsub double %add121, %105
  %106 = load i32* %i, align 4
  %add126 = add nsw i32 18, %106
  %idxprom127 = sext i32 %add126 to i64
  %107 = load double** %grid.addr, align 8
  %arrayidx128 = getelementptr inbounds double* %107, i64 %idxprom127
  %108 = load double* %arrayidx128, align 8
  %sub129 = fsub double %sub125, %108
  store double %sub129, double* %ux, align 8
  %109 = load i32* %i, align 4
  %add130 = add nsw i32 1, %109
  %idxprom131 = sext i32 %add130 to i64
  %110 = load double** %grid.addr, align 8
  %arrayidx132 = getelementptr inbounds double* %110, i64 %idxprom131
  %111 = load double* %arrayidx132, align 8
  %112 = load i32* %i, align 4
  %add133 = add nsw i32 2, %112
  %idxprom134 = sext i32 %add133 to i64
  %113 = load double** %grid.addr, align 8
  %arrayidx135 = getelementptr inbounds double* %113, i64 %idxprom134
  %114 = load double* %arrayidx135, align 8
  %sub136 = fsub double %111, %114
  %115 = load i32* %i, align 4
  %add137 = add nsw i32 7, %115
  %idxprom138 = sext i32 %add137 to i64
  %116 = load double** %grid.addr, align 8
  %arrayidx139 = getelementptr inbounds double* %116, i64 %idxprom138
  %117 = load double* %arrayidx139, align 8
  %add140 = fadd double %sub136, %117
  %118 = load i32* %i, align 4
  %add141 = add nsw i32 8, %118
  %idxprom142 = sext i32 %add141 to i64
  %119 = load double** %grid.addr, align 8
  %arrayidx143 = getelementptr inbounds double* %119, i64 %idxprom142
  %120 = load double* %arrayidx143, align 8
  %add144 = fadd double %add140, %120
  %121 = load i32* %i, align 4
  %add145 = add nsw i32 9, %121
  %idxprom146 = sext i32 %add145 to i64
  %122 = load double** %grid.addr, align 8
  %arrayidx147 = getelementptr inbounds double* %122, i64 %idxprom146
  %123 = load double* %arrayidx147, align 8
  %sub148 = fsub double %add144, %123
  %124 = load i32* %i, align 4
  %add149 = add nsw i32 10, %124
  %idxprom150 = sext i32 %add149 to i64
  %125 = load double** %grid.addr, align 8
  %arrayidx151 = getelementptr inbounds double* %125, i64 %idxprom150
  %126 = load double* %arrayidx151, align 8
  %sub152 = fsub double %sub148, %126
  %127 = load i32* %i, align 4
  %add153 = add nsw i32 11, %127
  %idxprom154 = sext i32 %add153 to i64
  %128 = load double** %grid.addr, align 8
  %arrayidx155 = getelementptr inbounds double* %128, i64 %idxprom154
  %129 = load double* %arrayidx155, align 8
  %add156 = fadd double %sub152, %129
  %130 = load i32* %i, align 4
  %add157 = add nsw i32 12, %130
  %idxprom158 = sext i32 %add157 to i64
  %131 = load double** %grid.addr, align 8
  %arrayidx159 = getelementptr inbounds double* %131, i64 %idxprom158
  %132 = load double* %arrayidx159, align 8
  %add160 = fadd double %add156, %132
  %133 = load i32* %i, align 4
  %add161 = add nsw i32 13, %133
  %idxprom162 = sext i32 %add161 to i64
  %134 = load double** %grid.addr, align 8
  %arrayidx163 = getelementptr inbounds double* %134, i64 %idxprom162
  %135 = load double* %arrayidx163, align 8
  %sub164 = fsub double %add160, %135
  %136 = load i32* %i, align 4
  %add165 = add nsw i32 14, %136
  %idxprom166 = sext i32 %add165 to i64
  %137 = load double** %grid.addr, align 8
  %arrayidx167 = getelementptr inbounds double* %137, i64 %idxprom166
  %138 = load double* %arrayidx167, align 8
  %sub168 = fsub double %sub164, %138
  store double %sub168, double* %uy, align 8
  %139 = load i32* %i, align 4
  %add169 = add nsw i32 5, %139
  %idxprom170 = sext i32 %add169 to i64
  %140 = load double** %grid.addr, align 8
  %arrayidx171 = getelementptr inbounds double* %140, i64 %idxprom170
  %141 = load double* %arrayidx171, align 8
  %142 = load i32* %i, align 4
  %add172 = add nsw i32 6, %142
  %idxprom173 = sext i32 %add172 to i64
  %143 = load double** %grid.addr, align 8
  %arrayidx174 = getelementptr inbounds double* %143, i64 %idxprom173
  %144 = load double* %arrayidx174, align 8
  %sub175 = fsub double %141, %144
  %145 = load i32* %i, align 4
  %add176 = add nsw i32 11, %145
  %idxprom177 = sext i32 %add176 to i64
  %146 = load double** %grid.addr, align 8
  %arrayidx178 = getelementptr inbounds double* %146, i64 %idxprom177
  %147 = load double* %arrayidx178, align 8
  %add179 = fadd double %sub175, %147
  %148 = load i32* %i, align 4
  %add180 = add nsw i32 12, %148
  %idxprom181 = sext i32 %add180 to i64
  %149 = load double** %grid.addr, align 8
  %arrayidx182 = getelementptr inbounds double* %149, i64 %idxprom181
  %150 = load double* %arrayidx182, align 8
  %sub183 = fsub double %add179, %150
  %151 = load i32* %i, align 4
  %add184 = add nsw i32 13, %151
  %idxprom185 = sext i32 %add184 to i64
  %152 = load double** %grid.addr, align 8
  %arrayidx186 = getelementptr inbounds double* %152, i64 %idxprom185
  %153 = load double* %arrayidx186, align 8
  %add187 = fadd double %sub183, %153
  %154 = load i32* %i, align 4
  %add188 = add nsw i32 14, %154
  %idxprom189 = sext i32 %add188 to i64
  %155 = load double** %grid.addr, align 8
  %arrayidx190 = getelementptr inbounds double* %155, i64 %idxprom189
  %156 = load double* %arrayidx190, align 8
  %sub191 = fsub double %add187, %156
  %157 = load i32* %i, align 4
  %add192 = add nsw i32 15, %157
  %idxprom193 = sext i32 %add192 to i64
  %158 = load double** %grid.addr, align 8
  %arrayidx194 = getelementptr inbounds double* %158, i64 %idxprom193
  %159 = load double* %arrayidx194, align 8
  %add195 = fadd double %sub191, %159
  %160 = load i32* %i, align 4
  %add196 = add nsw i32 16, %160
  %idxprom197 = sext i32 %add196 to i64
  %161 = load double** %grid.addr, align 8
  %arrayidx198 = getelementptr inbounds double* %161, i64 %idxprom197
  %162 = load double* %arrayidx198, align 8
  %sub199 = fsub double %add195, %162
  %163 = load i32* %i, align 4
  %add200 = add nsw i32 17, %163
  %idxprom201 = sext i32 %add200 to i64
  %164 = load double** %grid.addr, align 8
  %arrayidx202 = getelementptr inbounds double* %164, i64 %idxprom201
  %165 = load double* %arrayidx202, align 8
  %add203 = fadd double %sub199, %165
  %166 = load i32* %i, align 4
  %add204 = add nsw i32 18, %166
  %idxprom205 = sext i32 %add204 to i64
  %167 = load double** %grid.addr, align 8
  %arrayidx206 = getelementptr inbounds double* %167, i64 %idxprom205
  %168 = load double* %arrayidx206, align 8
  %sub207 = fsub double %add203, %168
  store double %sub207, double* %uz, align 8
  %169 = load double* %ux, align 8
  %170 = load double* %ux, align 8
  %mul = fmul double %169, %170
  %171 = load double* %uy, align 8
  %172 = load double* %uy, align 8
  %mul208 = fmul double %171, %172
  %add209 = fadd double %mul, %mul208
  %173 = load double* %uz, align 8
  %174 = load double* %uz, align 8
  %mul210 = fmul double %173, %174
  %add211 = fadd double %add209, %mul210
  %175 = load double* %rho, align 8
  %176 = load double* %rho, align 8
  %mul212 = fmul double %175, %176
  %div = fdiv double %add211, %mul212
  store double %div, double* %u2, align 8
  %177 = load double* %u2, align 8
  %178 = load double* %minU2, align 8
  %cmp213 = fcmp olt double %177, %178
  br i1 %cmp213, label %if.then214, label %if.end215

if.then214:                                       ; preds = %if.end91
  %179 = load double* %u2, align 8
  store double %179, double* %minU2, align 8
  br label %if.end215

if.end215:                                        ; preds = %if.then214, %if.end91
  %180 = load double* %u2, align 8
  %181 = load double* %maxU2, align 8
  %cmp216 = fcmp ogt double %180, %181
  br i1 %cmp216, label %if.then217, label %if.end218

if.then217:                                       ; preds = %if.end215
  %182 = load double* %u2, align 8
  store double %182, double* %maxU2, align 8
  br label %if.end218

if.end218:                                        ; preds = %if.then217, %if.end215
  br label %if.end219

if.end219:                                        ; preds = %if.end218, %if.then81
  br label %for.inc

for.inc:                                          ; preds = %if.end219
  %183 = load i32* %i, align 4
  %add220 = add nsw i32 %183, 20
  store i32 %add220, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %184 = load i32* %nObstacleCells, align 4
  %185 = load i32* %nAccelCells, align 4
  %186 = load i32* %nFluidCells, align 4
  %187 = load double* %minRho, align 8
  %188 = load double* %maxRho, align 8
  %189 = load double* %mass, align 8
  %190 = load double* %minU2, align 8
  %call = call double @sqrt(double %190) #5
  %191 = load double* %maxU2, align 8
  %call221 = call double @sqrt(double %191) #5
  %call222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([138 x i8]* @.str2, i32 0, i32 0), i32 %184, i32 %185, i32 %186, double %187, double %188, double %189, double %call, double %call221)
  ret void
}

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind uwtable
define internal void @LBM_storeVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %filename.addr = alloca i8*, align 8
  %binary.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %rho = alloca float, align 4
  %ux = alloca float, align 4
  %uy = alloca float, align 4
  %uz = alloca float, align 4
  %file = alloca %struct._IO_FILE*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32 %binary, i32* %binary.addr, align 4
  %0 = load i8** %filename.addr, align 8
  %1 = load i32* %binary.addr, align 4
  %tobool = icmp ne i32 %1, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0)
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* %cond)
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc501, %entry
  %2 = load i32* %z, align 4
  %cmp = icmp slt i32 %2, 130
  br i1 %cmp, label %for.body, label %for.end503

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc498, %for.body
  %3 = load i32* %y, align 4
  %cmp2 = icmp slt i32 %3, 100
  br i1 %cmp2, label %for.body3, label %for.end500

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %x, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %x, align 4
  %cmp5 = icmp slt i32 %4, 100
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %5 = load i32* %x, align 4
  %6 = load i32* %y, align 4
  %mul = mul nsw i32 %6, 100
  %add = add nsw i32 %5, %mul
  %7 = load i32* %z, align 4
  %mul7 = mul nsw i32 %7, 100
  %mul8 = mul nsw i32 %mul7, 100
  %add9 = add nsw i32 %add, %mul8
  %mul10 = mul nsw i32 20, %add9
  %add11 = add nsw i32 0, %mul10
  %idxprom = sext i32 %add11 to i64
  %8 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %8, i64 %idxprom
  %9 = load double* %arrayidx, align 8
  %10 = load i32* %x, align 4
  %11 = load i32* %y, align 4
  %mul12 = mul nsw i32 %11, 100
  %add13 = add nsw i32 %10, %mul12
  %12 = load i32* %z, align 4
  %mul14 = mul nsw i32 %12, 100
  %mul15 = mul nsw i32 %mul14, 100
  %add16 = add nsw i32 %add13, %mul15
  %mul17 = mul nsw i32 20, %add16
  %add18 = add nsw i32 1, %mul17
  %idxprom19 = sext i32 %add18 to i64
  %13 = load double** %grid.addr, align 8
  %arrayidx20 = getelementptr inbounds double* %13, i64 %idxprom19
  %14 = load double* %arrayidx20, align 8
  %add21 = fadd double %9, %14
  %15 = load i32* %x, align 4
  %16 = load i32* %y, align 4
  %mul22 = mul nsw i32 %16, 100
  %add23 = add nsw i32 %15, %mul22
  %17 = load i32* %z, align 4
  %mul24 = mul nsw i32 %17, 100
  %mul25 = mul nsw i32 %mul24, 100
  %add26 = add nsw i32 %add23, %mul25
  %mul27 = mul nsw i32 20, %add26
  %add28 = add nsw i32 2, %mul27
  %idxprom29 = sext i32 %add28 to i64
  %18 = load double** %grid.addr, align 8
  %arrayidx30 = getelementptr inbounds double* %18, i64 %idxprom29
  %19 = load double* %arrayidx30, align 8
  %add31 = fadd double %add21, %19
  %20 = load i32* %x, align 4
  %21 = load i32* %y, align 4
  %mul32 = mul nsw i32 %21, 100
  %add33 = add nsw i32 %20, %mul32
  %22 = load i32* %z, align 4
  %mul34 = mul nsw i32 %22, 100
  %mul35 = mul nsw i32 %mul34, 100
  %add36 = add nsw i32 %add33, %mul35
  %mul37 = mul nsw i32 20, %add36
  %add38 = add nsw i32 3, %mul37
  %idxprom39 = sext i32 %add38 to i64
  %23 = load double** %grid.addr, align 8
  %arrayidx40 = getelementptr inbounds double* %23, i64 %idxprom39
  %24 = load double* %arrayidx40, align 8
  %add41 = fadd double %add31, %24
  %25 = load i32* %x, align 4
  %26 = load i32* %y, align 4
  %mul42 = mul nsw i32 %26, 100
  %add43 = add nsw i32 %25, %mul42
  %27 = load i32* %z, align 4
  %mul44 = mul nsw i32 %27, 100
  %mul45 = mul nsw i32 %mul44, 100
  %add46 = add nsw i32 %add43, %mul45
  %mul47 = mul nsw i32 20, %add46
  %add48 = add nsw i32 4, %mul47
  %idxprom49 = sext i32 %add48 to i64
  %28 = load double** %grid.addr, align 8
  %arrayidx50 = getelementptr inbounds double* %28, i64 %idxprom49
  %29 = load double* %arrayidx50, align 8
  %add51 = fadd double %add41, %29
  %30 = load i32* %x, align 4
  %31 = load i32* %y, align 4
  %mul52 = mul nsw i32 %31, 100
  %add53 = add nsw i32 %30, %mul52
  %32 = load i32* %z, align 4
  %mul54 = mul nsw i32 %32, 100
  %mul55 = mul nsw i32 %mul54, 100
  %add56 = add nsw i32 %add53, %mul55
  %mul57 = mul nsw i32 20, %add56
  %add58 = add nsw i32 5, %mul57
  %idxprom59 = sext i32 %add58 to i64
  %33 = load double** %grid.addr, align 8
  %arrayidx60 = getelementptr inbounds double* %33, i64 %idxprom59
  %34 = load double* %arrayidx60, align 8
  %add61 = fadd double %add51, %34
  %35 = load i32* %x, align 4
  %36 = load i32* %y, align 4
  %mul62 = mul nsw i32 %36, 100
  %add63 = add nsw i32 %35, %mul62
  %37 = load i32* %z, align 4
  %mul64 = mul nsw i32 %37, 100
  %mul65 = mul nsw i32 %mul64, 100
  %add66 = add nsw i32 %add63, %mul65
  %mul67 = mul nsw i32 20, %add66
  %add68 = add nsw i32 6, %mul67
  %idxprom69 = sext i32 %add68 to i64
  %38 = load double** %grid.addr, align 8
  %arrayidx70 = getelementptr inbounds double* %38, i64 %idxprom69
  %39 = load double* %arrayidx70, align 8
  %add71 = fadd double %add61, %39
  %40 = load i32* %x, align 4
  %41 = load i32* %y, align 4
  %mul72 = mul nsw i32 %41, 100
  %add73 = add nsw i32 %40, %mul72
  %42 = load i32* %z, align 4
  %mul74 = mul nsw i32 %42, 100
  %mul75 = mul nsw i32 %mul74, 100
  %add76 = add nsw i32 %add73, %mul75
  %mul77 = mul nsw i32 20, %add76
  %add78 = add nsw i32 7, %mul77
  %idxprom79 = sext i32 %add78 to i64
  %43 = load double** %grid.addr, align 8
  %arrayidx80 = getelementptr inbounds double* %43, i64 %idxprom79
  %44 = load double* %arrayidx80, align 8
  %add81 = fadd double %add71, %44
  %45 = load i32* %x, align 4
  %46 = load i32* %y, align 4
  %mul82 = mul nsw i32 %46, 100
  %add83 = add nsw i32 %45, %mul82
  %47 = load i32* %z, align 4
  %mul84 = mul nsw i32 %47, 100
  %mul85 = mul nsw i32 %mul84, 100
  %add86 = add nsw i32 %add83, %mul85
  %mul87 = mul nsw i32 20, %add86
  %add88 = add nsw i32 8, %mul87
  %idxprom89 = sext i32 %add88 to i64
  %48 = load double** %grid.addr, align 8
  %arrayidx90 = getelementptr inbounds double* %48, i64 %idxprom89
  %49 = load double* %arrayidx90, align 8
  %add91 = fadd double %add81, %49
  %50 = load i32* %x, align 4
  %51 = load i32* %y, align 4
  %mul92 = mul nsw i32 %51, 100
  %add93 = add nsw i32 %50, %mul92
  %52 = load i32* %z, align 4
  %mul94 = mul nsw i32 %52, 100
  %mul95 = mul nsw i32 %mul94, 100
  %add96 = add nsw i32 %add93, %mul95
  %mul97 = mul nsw i32 20, %add96
  %add98 = add nsw i32 9, %mul97
  %idxprom99 = sext i32 %add98 to i64
  %53 = load double** %grid.addr, align 8
  %arrayidx100 = getelementptr inbounds double* %53, i64 %idxprom99
  %54 = load double* %arrayidx100, align 8
  %add101 = fadd double %add91, %54
  %55 = load i32* %x, align 4
  %56 = load i32* %y, align 4
  %mul102 = mul nsw i32 %56, 100
  %add103 = add nsw i32 %55, %mul102
  %57 = load i32* %z, align 4
  %mul104 = mul nsw i32 %57, 100
  %mul105 = mul nsw i32 %mul104, 100
  %add106 = add nsw i32 %add103, %mul105
  %mul107 = mul nsw i32 20, %add106
  %add108 = add nsw i32 10, %mul107
  %idxprom109 = sext i32 %add108 to i64
  %58 = load double** %grid.addr, align 8
  %arrayidx110 = getelementptr inbounds double* %58, i64 %idxprom109
  %59 = load double* %arrayidx110, align 8
  %add111 = fadd double %add101, %59
  %60 = load i32* %x, align 4
  %61 = load i32* %y, align 4
  %mul112 = mul nsw i32 %61, 100
  %add113 = add nsw i32 %60, %mul112
  %62 = load i32* %z, align 4
  %mul114 = mul nsw i32 %62, 100
  %mul115 = mul nsw i32 %mul114, 100
  %add116 = add nsw i32 %add113, %mul115
  %mul117 = mul nsw i32 20, %add116
  %add118 = add nsw i32 11, %mul117
  %idxprom119 = sext i32 %add118 to i64
  %63 = load double** %grid.addr, align 8
  %arrayidx120 = getelementptr inbounds double* %63, i64 %idxprom119
  %64 = load double* %arrayidx120, align 8
  %add121 = fadd double %add111, %64
  %65 = load i32* %x, align 4
  %66 = load i32* %y, align 4
  %mul122 = mul nsw i32 %66, 100
  %add123 = add nsw i32 %65, %mul122
  %67 = load i32* %z, align 4
  %mul124 = mul nsw i32 %67, 100
  %mul125 = mul nsw i32 %mul124, 100
  %add126 = add nsw i32 %add123, %mul125
  %mul127 = mul nsw i32 20, %add126
  %add128 = add nsw i32 12, %mul127
  %idxprom129 = sext i32 %add128 to i64
  %68 = load double** %grid.addr, align 8
  %arrayidx130 = getelementptr inbounds double* %68, i64 %idxprom129
  %69 = load double* %arrayidx130, align 8
  %add131 = fadd double %add121, %69
  %70 = load i32* %x, align 4
  %71 = load i32* %y, align 4
  %mul132 = mul nsw i32 %71, 100
  %add133 = add nsw i32 %70, %mul132
  %72 = load i32* %z, align 4
  %mul134 = mul nsw i32 %72, 100
  %mul135 = mul nsw i32 %mul134, 100
  %add136 = add nsw i32 %add133, %mul135
  %mul137 = mul nsw i32 20, %add136
  %add138 = add nsw i32 13, %mul137
  %idxprom139 = sext i32 %add138 to i64
  %73 = load double** %grid.addr, align 8
  %arrayidx140 = getelementptr inbounds double* %73, i64 %idxprom139
  %74 = load double* %arrayidx140, align 8
  %add141 = fadd double %add131, %74
  %75 = load i32* %x, align 4
  %76 = load i32* %y, align 4
  %mul142 = mul nsw i32 %76, 100
  %add143 = add nsw i32 %75, %mul142
  %77 = load i32* %z, align 4
  %mul144 = mul nsw i32 %77, 100
  %mul145 = mul nsw i32 %mul144, 100
  %add146 = add nsw i32 %add143, %mul145
  %mul147 = mul nsw i32 20, %add146
  %add148 = add nsw i32 14, %mul147
  %idxprom149 = sext i32 %add148 to i64
  %78 = load double** %grid.addr, align 8
  %arrayidx150 = getelementptr inbounds double* %78, i64 %idxprom149
  %79 = load double* %arrayidx150, align 8
  %add151 = fadd double %add141, %79
  %80 = load i32* %x, align 4
  %81 = load i32* %y, align 4
  %mul152 = mul nsw i32 %81, 100
  %add153 = add nsw i32 %80, %mul152
  %82 = load i32* %z, align 4
  %mul154 = mul nsw i32 %82, 100
  %mul155 = mul nsw i32 %mul154, 100
  %add156 = add nsw i32 %add153, %mul155
  %mul157 = mul nsw i32 20, %add156
  %add158 = add nsw i32 15, %mul157
  %idxprom159 = sext i32 %add158 to i64
  %83 = load double** %grid.addr, align 8
  %arrayidx160 = getelementptr inbounds double* %83, i64 %idxprom159
  %84 = load double* %arrayidx160, align 8
  %add161 = fadd double %add151, %84
  %85 = load i32* %x, align 4
  %86 = load i32* %y, align 4
  %mul162 = mul nsw i32 %86, 100
  %add163 = add nsw i32 %85, %mul162
  %87 = load i32* %z, align 4
  %mul164 = mul nsw i32 %87, 100
  %mul165 = mul nsw i32 %mul164, 100
  %add166 = add nsw i32 %add163, %mul165
  %mul167 = mul nsw i32 20, %add166
  %add168 = add nsw i32 16, %mul167
  %idxprom169 = sext i32 %add168 to i64
  %88 = load double** %grid.addr, align 8
  %arrayidx170 = getelementptr inbounds double* %88, i64 %idxprom169
  %89 = load double* %arrayidx170, align 8
  %add171 = fadd double %add161, %89
  %90 = load i32* %x, align 4
  %91 = load i32* %y, align 4
  %mul172 = mul nsw i32 %91, 100
  %add173 = add nsw i32 %90, %mul172
  %92 = load i32* %z, align 4
  %mul174 = mul nsw i32 %92, 100
  %mul175 = mul nsw i32 %mul174, 100
  %add176 = add nsw i32 %add173, %mul175
  %mul177 = mul nsw i32 20, %add176
  %add178 = add nsw i32 17, %mul177
  %idxprom179 = sext i32 %add178 to i64
  %93 = load double** %grid.addr, align 8
  %arrayidx180 = getelementptr inbounds double* %93, i64 %idxprom179
  %94 = load double* %arrayidx180, align 8
  %add181 = fadd double %add171, %94
  %95 = load i32* %x, align 4
  %96 = load i32* %y, align 4
  %mul182 = mul nsw i32 %96, 100
  %add183 = add nsw i32 %95, %mul182
  %97 = load i32* %z, align 4
  %mul184 = mul nsw i32 %97, 100
  %mul185 = mul nsw i32 %mul184, 100
  %add186 = add nsw i32 %add183, %mul185
  %mul187 = mul nsw i32 20, %add186
  %add188 = add nsw i32 18, %mul187
  %idxprom189 = sext i32 %add188 to i64
  %98 = load double** %grid.addr, align 8
  %arrayidx190 = getelementptr inbounds double* %98, i64 %idxprom189
  %99 = load double* %arrayidx190, align 8
  %add191 = fadd double %add181, %99
  %conv = fptrunc double %add191 to float
  store float %conv, float* %rho, align 4
  %100 = load i32* %x, align 4
  %101 = load i32* %y, align 4
  %mul192 = mul nsw i32 %101, 100
  %add193 = add nsw i32 %100, %mul192
  %102 = load i32* %z, align 4
  %mul194 = mul nsw i32 %102, 100
  %mul195 = mul nsw i32 %mul194, 100
  %add196 = add nsw i32 %add193, %mul195
  %mul197 = mul nsw i32 20, %add196
  %add198 = add nsw i32 3, %mul197
  %idxprom199 = sext i32 %add198 to i64
  %103 = load double** %grid.addr, align 8
  %arrayidx200 = getelementptr inbounds double* %103, i64 %idxprom199
  %104 = load double* %arrayidx200, align 8
  %105 = load i32* %x, align 4
  %106 = load i32* %y, align 4
  %mul201 = mul nsw i32 %106, 100
  %add202 = add nsw i32 %105, %mul201
  %107 = load i32* %z, align 4
  %mul203 = mul nsw i32 %107, 100
  %mul204 = mul nsw i32 %mul203, 100
  %add205 = add nsw i32 %add202, %mul204
  %mul206 = mul nsw i32 20, %add205
  %add207 = add nsw i32 4, %mul206
  %idxprom208 = sext i32 %add207 to i64
  %108 = load double** %grid.addr, align 8
  %arrayidx209 = getelementptr inbounds double* %108, i64 %idxprom208
  %109 = load double* %arrayidx209, align 8
  %sub = fsub double %104, %109
  %110 = load i32* %x, align 4
  %111 = load i32* %y, align 4
  %mul210 = mul nsw i32 %111, 100
  %add211 = add nsw i32 %110, %mul210
  %112 = load i32* %z, align 4
  %mul212 = mul nsw i32 %112, 100
  %mul213 = mul nsw i32 %mul212, 100
  %add214 = add nsw i32 %add211, %mul213
  %mul215 = mul nsw i32 20, %add214
  %add216 = add nsw i32 7, %mul215
  %idxprom217 = sext i32 %add216 to i64
  %113 = load double** %grid.addr, align 8
  %arrayidx218 = getelementptr inbounds double* %113, i64 %idxprom217
  %114 = load double* %arrayidx218, align 8
  %add219 = fadd double %sub, %114
  %115 = load i32* %x, align 4
  %116 = load i32* %y, align 4
  %mul220 = mul nsw i32 %116, 100
  %add221 = add nsw i32 %115, %mul220
  %117 = load i32* %z, align 4
  %mul222 = mul nsw i32 %117, 100
  %mul223 = mul nsw i32 %mul222, 100
  %add224 = add nsw i32 %add221, %mul223
  %mul225 = mul nsw i32 20, %add224
  %add226 = add nsw i32 8, %mul225
  %idxprom227 = sext i32 %add226 to i64
  %118 = load double** %grid.addr, align 8
  %arrayidx228 = getelementptr inbounds double* %118, i64 %idxprom227
  %119 = load double* %arrayidx228, align 8
  %sub229 = fsub double %add219, %119
  %120 = load i32* %x, align 4
  %121 = load i32* %y, align 4
  %mul230 = mul nsw i32 %121, 100
  %add231 = add nsw i32 %120, %mul230
  %122 = load i32* %z, align 4
  %mul232 = mul nsw i32 %122, 100
  %mul233 = mul nsw i32 %mul232, 100
  %add234 = add nsw i32 %add231, %mul233
  %mul235 = mul nsw i32 20, %add234
  %add236 = add nsw i32 9, %mul235
  %idxprom237 = sext i32 %add236 to i64
  %123 = load double** %grid.addr, align 8
  %arrayidx238 = getelementptr inbounds double* %123, i64 %idxprom237
  %124 = load double* %arrayidx238, align 8
  %add239 = fadd double %sub229, %124
  %125 = load i32* %x, align 4
  %126 = load i32* %y, align 4
  %mul240 = mul nsw i32 %126, 100
  %add241 = add nsw i32 %125, %mul240
  %127 = load i32* %z, align 4
  %mul242 = mul nsw i32 %127, 100
  %mul243 = mul nsw i32 %mul242, 100
  %add244 = add nsw i32 %add241, %mul243
  %mul245 = mul nsw i32 20, %add244
  %add246 = add nsw i32 10, %mul245
  %idxprom247 = sext i32 %add246 to i64
  %128 = load double** %grid.addr, align 8
  %arrayidx248 = getelementptr inbounds double* %128, i64 %idxprom247
  %129 = load double* %arrayidx248, align 8
  %sub249 = fsub double %add239, %129
  %130 = load i32* %x, align 4
  %131 = load i32* %y, align 4
  %mul250 = mul nsw i32 %131, 100
  %add251 = add nsw i32 %130, %mul250
  %132 = load i32* %z, align 4
  %mul252 = mul nsw i32 %132, 100
  %mul253 = mul nsw i32 %mul252, 100
  %add254 = add nsw i32 %add251, %mul253
  %mul255 = mul nsw i32 20, %add254
  %add256 = add nsw i32 15, %mul255
  %idxprom257 = sext i32 %add256 to i64
  %133 = load double** %grid.addr, align 8
  %arrayidx258 = getelementptr inbounds double* %133, i64 %idxprom257
  %134 = load double* %arrayidx258, align 8
  %add259 = fadd double %sub249, %134
  %135 = load i32* %x, align 4
  %136 = load i32* %y, align 4
  %mul260 = mul nsw i32 %136, 100
  %add261 = add nsw i32 %135, %mul260
  %137 = load i32* %z, align 4
  %mul262 = mul nsw i32 %137, 100
  %mul263 = mul nsw i32 %mul262, 100
  %add264 = add nsw i32 %add261, %mul263
  %mul265 = mul nsw i32 20, %add264
  %add266 = add nsw i32 16, %mul265
  %idxprom267 = sext i32 %add266 to i64
  %138 = load double** %grid.addr, align 8
  %arrayidx268 = getelementptr inbounds double* %138, i64 %idxprom267
  %139 = load double* %arrayidx268, align 8
  %add269 = fadd double %add259, %139
  %140 = load i32* %x, align 4
  %141 = load i32* %y, align 4
  %mul270 = mul nsw i32 %141, 100
  %add271 = add nsw i32 %140, %mul270
  %142 = load i32* %z, align 4
  %mul272 = mul nsw i32 %142, 100
  %mul273 = mul nsw i32 %mul272, 100
  %add274 = add nsw i32 %add271, %mul273
  %mul275 = mul nsw i32 20, %add274
  %add276 = add nsw i32 17, %mul275
  %idxprom277 = sext i32 %add276 to i64
  %143 = load double** %grid.addr, align 8
  %arrayidx278 = getelementptr inbounds double* %143, i64 %idxprom277
  %144 = load double* %arrayidx278, align 8
  %sub279 = fsub double %add269, %144
  %145 = load i32* %x, align 4
  %146 = load i32* %y, align 4
  %mul280 = mul nsw i32 %146, 100
  %add281 = add nsw i32 %145, %mul280
  %147 = load i32* %z, align 4
  %mul282 = mul nsw i32 %147, 100
  %mul283 = mul nsw i32 %mul282, 100
  %add284 = add nsw i32 %add281, %mul283
  %mul285 = mul nsw i32 20, %add284
  %add286 = add nsw i32 18, %mul285
  %idxprom287 = sext i32 %add286 to i64
  %148 = load double** %grid.addr, align 8
  %arrayidx288 = getelementptr inbounds double* %148, i64 %idxprom287
  %149 = load double* %arrayidx288, align 8
  %sub289 = fsub double %sub279, %149
  %conv290 = fptrunc double %sub289 to float
  store float %conv290, float* %ux, align 4
  %150 = load i32* %x, align 4
  %151 = load i32* %y, align 4
  %mul291 = mul nsw i32 %151, 100
  %add292 = add nsw i32 %150, %mul291
  %152 = load i32* %z, align 4
  %mul293 = mul nsw i32 %152, 100
  %mul294 = mul nsw i32 %mul293, 100
  %add295 = add nsw i32 %add292, %mul294
  %mul296 = mul nsw i32 20, %add295
  %add297 = add nsw i32 1, %mul296
  %idxprom298 = sext i32 %add297 to i64
  %153 = load double** %grid.addr, align 8
  %arrayidx299 = getelementptr inbounds double* %153, i64 %idxprom298
  %154 = load double* %arrayidx299, align 8
  %155 = load i32* %x, align 4
  %156 = load i32* %y, align 4
  %mul300 = mul nsw i32 %156, 100
  %add301 = add nsw i32 %155, %mul300
  %157 = load i32* %z, align 4
  %mul302 = mul nsw i32 %157, 100
  %mul303 = mul nsw i32 %mul302, 100
  %add304 = add nsw i32 %add301, %mul303
  %mul305 = mul nsw i32 20, %add304
  %add306 = add nsw i32 2, %mul305
  %idxprom307 = sext i32 %add306 to i64
  %158 = load double** %grid.addr, align 8
  %arrayidx308 = getelementptr inbounds double* %158, i64 %idxprom307
  %159 = load double* %arrayidx308, align 8
  %sub309 = fsub double %154, %159
  %160 = load i32* %x, align 4
  %161 = load i32* %y, align 4
  %mul310 = mul nsw i32 %161, 100
  %add311 = add nsw i32 %160, %mul310
  %162 = load i32* %z, align 4
  %mul312 = mul nsw i32 %162, 100
  %mul313 = mul nsw i32 %mul312, 100
  %add314 = add nsw i32 %add311, %mul313
  %mul315 = mul nsw i32 20, %add314
  %add316 = add nsw i32 7, %mul315
  %idxprom317 = sext i32 %add316 to i64
  %163 = load double** %grid.addr, align 8
  %arrayidx318 = getelementptr inbounds double* %163, i64 %idxprom317
  %164 = load double* %arrayidx318, align 8
  %add319 = fadd double %sub309, %164
  %165 = load i32* %x, align 4
  %166 = load i32* %y, align 4
  %mul320 = mul nsw i32 %166, 100
  %add321 = add nsw i32 %165, %mul320
  %167 = load i32* %z, align 4
  %mul322 = mul nsw i32 %167, 100
  %mul323 = mul nsw i32 %mul322, 100
  %add324 = add nsw i32 %add321, %mul323
  %mul325 = mul nsw i32 20, %add324
  %add326 = add nsw i32 8, %mul325
  %idxprom327 = sext i32 %add326 to i64
  %168 = load double** %grid.addr, align 8
  %arrayidx328 = getelementptr inbounds double* %168, i64 %idxprom327
  %169 = load double* %arrayidx328, align 8
  %add329 = fadd double %add319, %169
  %170 = load i32* %x, align 4
  %171 = load i32* %y, align 4
  %mul330 = mul nsw i32 %171, 100
  %add331 = add nsw i32 %170, %mul330
  %172 = load i32* %z, align 4
  %mul332 = mul nsw i32 %172, 100
  %mul333 = mul nsw i32 %mul332, 100
  %add334 = add nsw i32 %add331, %mul333
  %mul335 = mul nsw i32 20, %add334
  %add336 = add nsw i32 9, %mul335
  %idxprom337 = sext i32 %add336 to i64
  %173 = load double** %grid.addr, align 8
  %arrayidx338 = getelementptr inbounds double* %173, i64 %idxprom337
  %174 = load double* %arrayidx338, align 8
  %sub339 = fsub double %add329, %174
  %175 = load i32* %x, align 4
  %176 = load i32* %y, align 4
  %mul340 = mul nsw i32 %176, 100
  %add341 = add nsw i32 %175, %mul340
  %177 = load i32* %z, align 4
  %mul342 = mul nsw i32 %177, 100
  %mul343 = mul nsw i32 %mul342, 100
  %add344 = add nsw i32 %add341, %mul343
  %mul345 = mul nsw i32 20, %add344
  %add346 = add nsw i32 10, %mul345
  %idxprom347 = sext i32 %add346 to i64
  %178 = load double** %grid.addr, align 8
  %arrayidx348 = getelementptr inbounds double* %178, i64 %idxprom347
  %179 = load double* %arrayidx348, align 8
  %sub349 = fsub double %sub339, %179
  %180 = load i32* %x, align 4
  %181 = load i32* %y, align 4
  %mul350 = mul nsw i32 %181, 100
  %add351 = add nsw i32 %180, %mul350
  %182 = load i32* %z, align 4
  %mul352 = mul nsw i32 %182, 100
  %mul353 = mul nsw i32 %mul352, 100
  %add354 = add nsw i32 %add351, %mul353
  %mul355 = mul nsw i32 20, %add354
  %add356 = add nsw i32 11, %mul355
  %idxprom357 = sext i32 %add356 to i64
  %183 = load double** %grid.addr, align 8
  %arrayidx358 = getelementptr inbounds double* %183, i64 %idxprom357
  %184 = load double* %arrayidx358, align 8
  %add359 = fadd double %sub349, %184
  %185 = load i32* %x, align 4
  %186 = load i32* %y, align 4
  %mul360 = mul nsw i32 %186, 100
  %add361 = add nsw i32 %185, %mul360
  %187 = load i32* %z, align 4
  %mul362 = mul nsw i32 %187, 100
  %mul363 = mul nsw i32 %mul362, 100
  %add364 = add nsw i32 %add361, %mul363
  %mul365 = mul nsw i32 20, %add364
  %add366 = add nsw i32 12, %mul365
  %idxprom367 = sext i32 %add366 to i64
  %188 = load double** %grid.addr, align 8
  %arrayidx368 = getelementptr inbounds double* %188, i64 %idxprom367
  %189 = load double* %arrayidx368, align 8
  %add369 = fadd double %add359, %189
  %190 = load i32* %x, align 4
  %191 = load i32* %y, align 4
  %mul370 = mul nsw i32 %191, 100
  %add371 = add nsw i32 %190, %mul370
  %192 = load i32* %z, align 4
  %mul372 = mul nsw i32 %192, 100
  %mul373 = mul nsw i32 %mul372, 100
  %add374 = add nsw i32 %add371, %mul373
  %mul375 = mul nsw i32 20, %add374
  %add376 = add nsw i32 13, %mul375
  %idxprom377 = sext i32 %add376 to i64
  %193 = load double** %grid.addr, align 8
  %arrayidx378 = getelementptr inbounds double* %193, i64 %idxprom377
  %194 = load double* %arrayidx378, align 8
  %sub379 = fsub double %add369, %194
  %195 = load i32* %x, align 4
  %196 = load i32* %y, align 4
  %mul380 = mul nsw i32 %196, 100
  %add381 = add nsw i32 %195, %mul380
  %197 = load i32* %z, align 4
  %mul382 = mul nsw i32 %197, 100
  %mul383 = mul nsw i32 %mul382, 100
  %add384 = add nsw i32 %add381, %mul383
  %mul385 = mul nsw i32 20, %add384
  %add386 = add nsw i32 14, %mul385
  %idxprom387 = sext i32 %add386 to i64
  %198 = load double** %grid.addr, align 8
  %arrayidx388 = getelementptr inbounds double* %198, i64 %idxprom387
  %199 = load double* %arrayidx388, align 8
  %sub389 = fsub double %sub379, %199
  %conv390 = fptrunc double %sub389 to float
  store float %conv390, float* %uy, align 4
  %200 = load i32* %x, align 4
  %201 = load i32* %y, align 4
  %mul391 = mul nsw i32 %201, 100
  %add392 = add nsw i32 %200, %mul391
  %202 = load i32* %z, align 4
  %mul393 = mul nsw i32 %202, 100
  %mul394 = mul nsw i32 %mul393, 100
  %add395 = add nsw i32 %add392, %mul394
  %mul396 = mul nsw i32 20, %add395
  %add397 = add nsw i32 5, %mul396
  %idxprom398 = sext i32 %add397 to i64
  %203 = load double** %grid.addr, align 8
  %arrayidx399 = getelementptr inbounds double* %203, i64 %idxprom398
  %204 = load double* %arrayidx399, align 8
  %205 = load i32* %x, align 4
  %206 = load i32* %y, align 4
  %mul400 = mul nsw i32 %206, 100
  %add401 = add nsw i32 %205, %mul400
  %207 = load i32* %z, align 4
  %mul402 = mul nsw i32 %207, 100
  %mul403 = mul nsw i32 %mul402, 100
  %add404 = add nsw i32 %add401, %mul403
  %mul405 = mul nsw i32 20, %add404
  %add406 = add nsw i32 6, %mul405
  %idxprom407 = sext i32 %add406 to i64
  %208 = load double** %grid.addr, align 8
  %arrayidx408 = getelementptr inbounds double* %208, i64 %idxprom407
  %209 = load double* %arrayidx408, align 8
  %sub409 = fsub double %204, %209
  %210 = load i32* %x, align 4
  %211 = load i32* %y, align 4
  %mul410 = mul nsw i32 %211, 100
  %add411 = add nsw i32 %210, %mul410
  %212 = load i32* %z, align 4
  %mul412 = mul nsw i32 %212, 100
  %mul413 = mul nsw i32 %mul412, 100
  %add414 = add nsw i32 %add411, %mul413
  %mul415 = mul nsw i32 20, %add414
  %add416 = add nsw i32 11, %mul415
  %idxprom417 = sext i32 %add416 to i64
  %213 = load double** %grid.addr, align 8
  %arrayidx418 = getelementptr inbounds double* %213, i64 %idxprom417
  %214 = load double* %arrayidx418, align 8
  %add419 = fadd double %sub409, %214
  %215 = load i32* %x, align 4
  %216 = load i32* %y, align 4
  %mul420 = mul nsw i32 %216, 100
  %add421 = add nsw i32 %215, %mul420
  %217 = load i32* %z, align 4
  %mul422 = mul nsw i32 %217, 100
  %mul423 = mul nsw i32 %mul422, 100
  %add424 = add nsw i32 %add421, %mul423
  %mul425 = mul nsw i32 20, %add424
  %add426 = add nsw i32 12, %mul425
  %idxprom427 = sext i32 %add426 to i64
  %218 = load double** %grid.addr, align 8
  %arrayidx428 = getelementptr inbounds double* %218, i64 %idxprom427
  %219 = load double* %arrayidx428, align 8
  %sub429 = fsub double %add419, %219
  %220 = load i32* %x, align 4
  %221 = load i32* %y, align 4
  %mul430 = mul nsw i32 %221, 100
  %add431 = add nsw i32 %220, %mul430
  %222 = load i32* %z, align 4
  %mul432 = mul nsw i32 %222, 100
  %mul433 = mul nsw i32 %mul432, 100
  %add434 = add nsw i32 %add431, %mul433
  %mul435 = mul nsw i32 20, %add434
  %add436 = add nsw i32 13, %mul435
  %idxprom437 = sext i32 %add436 to i64
  %223 = load double** %grid.addr, align 8
  %arrayidx438 = getelementptr inbounds double* %223, i64 %idxprom437
  %224 = load double* %arrayidx438, align 8
  %add439 = fadd double %sub429, %224
  %225 = load i32* %x, align 4
  %226 = load i32* %y, align 4
  %mul440 = mul nsw i32 %226, 100
  %add441 = add nsw i32 %225, %mul440
  %227 = load i32* %z, align 4
  %mul442 = mul nsw i32 %227, 100
  %mul443 = mul nsw i32 %mul442, 100
  %add444 = add nsw i32 %add441, %mul443
  %mul445 = mul nsw i32 20, %add444
  %add446 = add nsw i32 14, %mul445
  %idxprom447 = sext i32 %add446 to i64
  %228 = load double** %grid.addr, align 8
  %arrayidx448 = getelementptr inbounds double* %228, i64 %idxprom447
  %229 = load double* %arrayidx448, align 8
  %sub449 = fsub double %add439, %229
  %230 = load i32* %x, align 4
  %231 = load i32* %y, align 4
  %mul450 = mul nsw i32 %231, 100
  %add451 = add nsw i32 %230, %mul450
  %232 = load i32* %z, align 4
  %mul452 = mul nsw i32 %232, 100
  %mul453 = mul nsw i32 %mul452, 100
  %add454 = add nsw i32 %add451, %mul453
  %mul455 = mul nsw i32 20, %add454
  %add456 = add nsw i32 15, %mul455
  %idxprom457 = sext i32 %add456 to i64
  %233 = load double** %grid.addr, align 8
  %arrayidx458 = getelementptr inbounds double* %233, i64 %idxprom457
  %234 = load double* %arrayidx458, align 8
  %add459 = fadd double %sub449, %234
  %235 = load i32* %x, align 4
  %236 = load i32* %y, align 4
  %mul460 = mul nsw i32 %236, 100
  %add461 = add nsw i32 %235, %mul460
  %237 = load i32* %z, align 4
  %mul462 = mul nsw i32 %237, 100
  %mul463 = mul nsw i32 %mul462, 100
  %add464 = add nsw i32 %add461, %mul463
  %mul465 = mul nsw i32 20, %add464
  %add466 = add nsw i32 16, %mul465
  %idxprom467 = sext i32 %add466 to i64
  %238 = load double** %grid.addr, align 8
  %arrayidx468 = getelementptr inbounds double* %238, i64 %idxprom467
  %239 = load double* %arrayidx468, align 8
  %sub469 = fsub double %add459, %239
  %240 = load i32* %x, align 4
  %241 = load i32* %y, align 4
  %mul470 = mul nsw i32 %241, 100
  %add471 = add nsw i32 %240, %mul470
  %242 = load i32* %z, align 4
  %mul472 = mul nsw i32 %242, 100
  %mul473 = mul nsw i32 %mul472, 100
  %add474 = add nsw i32 %add471, %mul473
  %mul475 = mul nsw i32 20, %add474
  %add476 = add nsw i32 17, %mul475
  %idxprom477 = sext i32 %add476 to i64
  %243 = load double** %grid.addr, align 8
  %arrayidx478 = getelementptr inbounds double* %243, i64 %idxprom477
  %244 = load double* %arrayidx478, align 8
  %add479 = fadd double %sub469, %244
  %245 = load i32* %x, align 4
  %246 = load i32* %y, align 4
  %mul480 = mul nsw i32 %246, 100
  %add481 = add nsw i32 %245, %mul480
  %247 = load i32* %z, align 4
  %mul482 = mul nsw i32 %247, 100
  %mul483 = mul nsw i32 %mul482, 100
  %add484 = add nsw i32 %add481, %mul483
  %mul485 = mul nsw i32 20, %add484
  %add486 = add nsw i32 18, %mul485
  %idxprom487 = sext i32 %add486 to i64
  %248 = load double** %grid.addr, align 8
  %arrayidx488 = getelementptr inbounds double* %248, i64 %idxprom487
  %249 = load double* %arrayidx488, align 8
  %sub489 = fsub double %add479, %249
  %conv490 = fptrunc double %sub489 to float
  store float %conv490, float* %uz, align 4
  %250 = load float* %rho, align 4
  %251 = load float* %ux, align 4
  %div = fdiv float %251, %250
  store float %div, float* %ux, align 4
  %252 = load float* %rho, align 4
  %253 = load float* %uy, align 4
  %div491 = fdiv float %253, %252
  store float %div491, float* %uy, align 4
  %254 = load float* %rho, align 4
  %255 = load float* %uz, align 4
  %div492 = fdiv float %255, %254
  store float %div492, float* %uz, align 4
  %256 = load i32* %binary.addr, align 4
  %tobool493 = icmp ne i32 %256, 0
  br i1 %tobool493, label %if.then, label %if.else

if.then:                                          ; preds = %for.body6
  %257 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %257, float* %ux)
  %258 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %258, float* %uy)
  %259 = load %struct._IO_FILE** %file, align 8
  call void @storeValue(%struct._IO_FILE* %259, float* %uz)
  br label %if.end

if.else:                                          ; preds = %for.body6
  %260 = load %struct._IO_FILE** %file, align 8
  %261 = load float* %ux, align 4
  %conv494 = fpext float %261 to double
  %262 = load float* %uy, align 4
  %conv495 = fpext float %262 to double
  %263 = load float* %uz, align 4
  %conv496 = fpext float %263 to double
  %call497 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %260, i8* getelementptr inbounds ([10 x i8]* @.str5, i32 0, i32 0), double %conv494, double %conv495, double %conv496)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %264 = load i32* %x, align 4
  %inc = add nsw i32 %264, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc498

for.inc498:                                       ; preds = %for.end
  %265 = load i32* %y, align 4
  %inc499 = add nsw i32 %265, 1
  store i32 %inc499, i32* %y, align 4
  br label %for.cond1

for.end500:                                       ; preds = %for.cond1
  br label %for.inc501

for.inc501:                                       ; preds = %for.end500
  %266 = load i32* %z, align 4
  %inc502 = add nsw i32 %266, 1
  store i32 %inc502, i32* %z, align 4
  br label %for.cond

for.end503:                                       ; preds = %for.cond
  %267 = load %struct._IO_FILE** %file, align 8
  %call504 = call i32 @fclose(%struct._IO_FILE* %267)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind uwtable
define internal void @LBM_compareVelocityField(double* %grid, i8* %filename, i32 %binary) #0 {
entry:
  %grid.addr = alloca double*, align 8
  %filename.addr = alloca i8*, align 8
  %binary.addr = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  %rho = alloca double, align 8
  %ux = alloca double, align 8
  %uy = alloca double, align 8
  %uz = alloca double, align 8
  %fileUx = alloca float, align 4
  %fileUy = alloca float, align 4
  %fileUz = alloca float, align 4
  %dUx = alloca float, align 4
  %dUy = alloca float, align 4
  %dUz = alloca float, align 4
  %diff2 = alloca float, align 4
  %maxDiff2 = alloca float, align 4
  %file = alloca %struct._IO_FILE*, align 8
  store double* %grid, double** %grid.addr, align 8
  store i8* %filename, i8** %filename.addr, align 8
  store i32 %binary, i32* %binary.addr, align 4
  store float 0xC6293E5940000000, float* %maxDiff2, align 4
  %0 = load i8** %filename.addr, align 8
  %1 = load i32* %binary.addr, align 4
  %tobool = icmp ne i32 %1, 0
  %cond = select i1 %tobool, i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0)
  %call = call %struct._IO_FILE* @fopen(i8* %0, i8* %cond)
  store %struct._IO_FILE* %call, %struct._IO_FILE** %file, align 8
  store i32 0, i32* %z, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc512, %entry
  %2 = load i32* %z, align 4
  %cmp = icmp slt i32 %2, 130
  br i1 %cmp, label %for.body, label %for.end514

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %y, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc509, %for.body
  %3 = load i32* %y, align 4
  %cmp2 = icmp slt i32 %3, 100
  br i1 %cmp2, label %for.body3, label %for.end511

for.body3:                                        ; preds = %for.cond1
  store i32 0, i32* %x, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body3
  %4 = load i32* %x, align 4
  %cmp5 = icmp slt i32 %4, 100
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond4
  %5 = load i32* %x, align 4
  %6 = load i32* %y, align 4
  %mul = mul nsw i32 %6, 100
  %add = add nsw i32 %5, %mul
  %7 = load i32* %z, align 4
  %mul7 = mul nsw i32 %7, 100
  %mul8 = mul nsw i32 %mul7, 100
  %add9 = add nsw i32 %add, %mul8
  %mul10 = mul nsw i32 20, %add9
  %add11 = add nsw i32 0, %mul10
  %idxprom = sext i32 %add11 to i64
  %8 = load double** %grid.addr, align 8
  %arrayidx = getelementptr inbounds double* %8, i64 %idxprom
  %9 = load double* %arrayidx, align 8
  %10 = load i32* %x, align 4
  %11 = load i32* %y, align 4
  %mul12 = mul nsw i32 %11, 100
  %add13 = add nsw i32 %10, %mul12
  %12 = load i32* %z, align 4
  %mul14 = mul nsw i32 %12, 100
  %mul15 = mul nsw i32 %mul14, 100
  %add16 = add nsw i32 %add13, %mul15
  %mul17 = mul nsw i32 20, %add16
  %add18 = add nsw i32 1, %mul17
  %idxprom19 = sext i32 %add18 to i64
  %13 = load double** %grid.addr, align 8
  %arrayidx20 = getelementptr inbounds double* %13, i64 %idxprom19
  %14 = load double* %arrayidx20, align 8
  %add21 = fadd double %9, %14
  %15 = load i32* %x, align 4
  %16 = load i32* %y, align 4
  %mul22 = mul nsw i32 %16, 100
  %add23 = add nsw i32 %15, %mul22
  %17 = load i32* %z, align 4
  %mul24 = mul nsw i32 %17, 100
  %mul25 = mul nsw i32 %mul24, 100
  %add26 = add nsw i32 %add23, %mul25
  %mul27 = mul nsw i32 20, %add26
  %add28 = add nsw i32 2, %mul27
  %idxprom29 = sext i32 %add28 to i64
  %18 = load double** %grid.addr, align 8
  %arrayidx30 = getelementptr inbounds double* %18, i64 %idxprom29
  %19 = load double* %arrayidx30, align 8
  %add31 = fadd double %add21, %19
  %20 = load i32* %x, align 4
  %21 = load i32* %y, align 4
  %mul32 = mul nsw i32 %21, 100
  %add33 = add nsw i32 %20, %mul32
  %22 = load i32* %z, align 4
  %mul34 = mul nsw i32 %22, 100
  %mul35 = mul nsw i32 %mul34, 100
  %add36 = add nsw i32 %add33, %mul35
  %mul37 = mul nsw i32 20, %add36
  %add38 = add nsw i32 3, %mul37
  %idxprom39 = sext i32 %add38 to i64
  %23 = load double** %grid.addr, align 8
  %arrayidx40 = getelementptr inbounds double* %23, i64 %idxprom39
  %24 = load double* %arrayidx40, align 8
  %add41 = fadd double %add31, %24
  %25 = load i32* %x, align 4
  %26 = load i32* %y, align 4
  %mul42 = mul nsw i32 %26, 100
  %add43 = add nsw i32 %25, %mul42
  %27 = load i32* %z, align 4
  %mul44 = mul nsw i32 %27, 100
  %mul45 = mul nsw i32 %mul44, 100
  %add46 = add nsw i32 %add43, %mul45
  %mul47 = mul nsw i32 20, %add46
  %add48 = add nsw i32 4, %mul47
  %idxprom49 = sext i32 %add48 to i64
  %28 = load double** %grid.addr, align 8
  %arrayidx50 = getelementptr inbounds double* %28, i64 %idxprom49
  %29 = load double* %arrayidx50, align 8
  %add51 = fadd double %add41, %29
  %30 = load i32* %x, align 4
  %31 = load i32* %y, align 4
  %mul52 = mul nsw i32 %31, 100
  %add53 = add nsw i32 %30, %mul52
  %32 = load i32* %z, align 4
  %mul54 = mul nsw i32 %32, 100
  %mul55 = mul nsw i32 %mul54, 100
  %add56 = add nsw i32 %add53, %mul55
  %mul57 = mul nsw i32 20, %add56
  %add58 = add nsw i32 5, %mul57
  %idxprom59 = sext i32 %add58 to i64
  %33 = load double** %grid.addr, align 8
  %arrayidx60 = getelementptr inbounds double* %33, i64 %idxprom59
  %34 = load double* %arrayidx60, align 8
  %add61 = fadd double %add51, %34
  %35 = load i32* %x, align 4
  %36 = load i32* %y, align 4
  %mul62 = mul nsw i32 %36, 100
  %add63 = add nsw i32 %35, %mul62
  %37 = load i32* %z, align 4
  %mul64 = mul nsw i32 %37, 100
  %mul65 = mul nsw i32 %mul64, 100
  %add66 = add nsw i32 %add63, %mul65
  %mul67 = mul nsw i32 20, %add66
  %add68 = add nsw i32 6, %mul67
  %idxprom69 = sext i32 %add68 to i64
  %38 = load double** %grid.addr, align 8
  %arrayidx70 = getelementptr inbounds double* %38, i64 %idxprom69
  %39 = load double* %arrayidx70, align 8
  %add71 = fadd double %add61, %39
  %40 = load i32* %x, align 4
  %41 = load i32* %y, align 4
  %mul72 = mul nsw i32 %41, 100
  %add73 = add nsw i32 %40, %mul72
  %42 = load i32* %z, align 4
  %mul74 = mul nsw i32 %42, 100
  %mul75 = mul nsw i32 %mul74, 100
  %add76 = add nsw i32 %add73, %mul75
  %mul77 = mul nsw i32 20, %add76
  %add78 = add nsw i32 7, %mul77
  %idxprom79 = sext i32 %add78 to i64
  %43 = load double** %grid.addr, align 8
  %arrayidx80 = getelementptr inbounds double* %43, i64 %idxprom79
  %44 = load double* %arrayidx80, align 8
  %add81 = fadd double %add71, %44
  %45 = load i32* %x, align 4
  %46 = load i32* %y, align 4
  %mul82 = mul nsw i32 %46, 100
  %add83 = add nsw i32 %45, %mul82
  %47 = load i32* %z, align 4
  %mul84 = mul nsw i32 %47, 100
  %mul85 = mul nsw i32 %mul84, 100
  %add86 = add nsw i32 %add83, %mul85
  %mul87 = mul nsw i32 20, %add86
  %add88 = add nsw i32 8, %mul87
  %idxprom89 = sext i32 %add88 to i64
  %48 = load double** %grid.addr, align 8
  %arrayidx90 = getelementptr inbounds double* %48, i64 %idxprom89
  %49 = load double* %arrayidx90, align 8
  %add91 = fadd double %add81, %49
  %50 = load i32* %x, align 4
  %51 = load i32* %y, align 4
  %mul92 = mul nsw i32 %51, 100
  %add93 = add nsw i32 %50, %mul92
  %52 = load i32* %z, align 4
  %mul94 = mul nsw i32 %52, 100
  %mul95 = mul nsw i32 %mul94, 100
  %add96 = add nsw i32 %add93, %mul95
  %mul97 = mul nsw i32 20, %add96
  %add98 = add nsw i32 9, %mul97
  %idxprom99 = sext i32 %add98 to i64
  %53 = load double** %grid.addr, align 8
  %arrayidx100 = getelementptr inbounds double* %53, i64 %idxprom99
  %54 = load double* %arrayidx100, align 8
  %add101 = fadd double %add91, %54
  %55 = load i32* %x, align 4
  %56 = load i32* %y, align 4
  %mul102 = mul nsw i32 %56, 100
  %add103 = add nsw i32 %55, %mul102
  %57 = load i32* %z, align 4
  %mul104 = mul nsw i32 %57, 100
  %mul105 = mul nsw i32 %mul104, 100
  %add106 = add nsw i32 %add103, %mul105
  %mul107 = mul nsw i32 20, %add106
  %add108 = add nsw i32 10, %mul107
  %idxprom109 = sext i32 %add108 to i64
  %58 = load double** %grid.addr, align 8
  %arrayidx110 = getelementptr inbounds double* %58, i64 %idxprom109
  %59 = load double* %arrayidx110, align 8
  %add111 = fadd double %add101, %59
  %60 = load i32* %x, align 4
  %61 = load i32* %y, align 4
  %mul112 = mul nsw i32 %61, 100
  %add113 = add nsw i32 %60, %mul112
  %62 = load i32* %z, align 4
  %mul114 = mul nsw i32 %62, 100
  %mul115 = mul nsw i32 %mul114, 100
  %add116 = add nsw i32 %add113, %mul115
  %mul117 = mul nsw i32 20, %add116
  %add118 = add nsw i32 11, %mul117
  %idxprom119 = sext i32 %add118 to i64
  %63 = load double** %grid.addr, align 8
  %arrayidx120 = getelementptr inbounds double* %63, i64 %idxprom119
  %64 = load double* %arrayidx120, align 8
  %add121 = fadd double %add111, %64
  %65 = load i32* %x, align 4
  %66 = load i32* %y, align 4
  %mul122 = mul nsw i32 %66, 100
  %add123 = add nsw i32 %65, %mul122
  %67 = load i32* %z, align 4
  %mul124 = mul nsw i32 %67, 100
  %mul125 = mul nsw i32 %mul124, 100
  %add126 = add nsw i32 %add123, %mul125
  %mul127 = mul nsw i32 20, %add126
  %add128 = add nsw i32 12, %mul127
  %idxprom129 = sext i32 %add128 to i64
  %68 = load double** %grid.addr, align 8
  %arrayidx130 = getelementptr inbounds double* %68, i64 %idxprom129
  %69 = load double* %arrayidx130, align 8
  %add131 = fadd double %add121, %69
  %70 = load i32* %x, align 4
  %71 = load i32* %y, align 4
  %mul132 = mul nsw i32 %71, 100
  %add133 = add nsw i32 %70, %mul132
  %72 = load i32* %z, align 4
  %mul134 = mul nsw i32 %72, 100
  %mul135 = mul nsw i32 %mul134, 100
  %add136 = add nsw i32 %add133, %mul135
  %mul137 = mul nsw i32 20, %add136
  %add138 = add nsw i32 13, %mul137
  %idxprom139 = sext i32 %add138 to i64
  %73 = load double** %grid.addr, align 8
  %arrayidx140 = getelementptr inbounds double* %73, i64 %idxprom139
  %74 = load double* %arrayidx140, align 8
  %add141 = fadd double %add131, %74
  %75 = load i32* %x, align 4
  %76 = load i32* %y, align 4
  %mul142 = mul nsw i32 %76, 100
  %add143 = add nsw i32 %75, %mul142
  %77 = load i32* %z, align 4
  %mul144 = mul nsw i32 %77, 100
  %mul145 = mul nsw i32 %mul144, 100
  %add146 = add nsw i32 %add143, %mul145
  %mul147 = mul nsw i32 20, %add146
  %add148 = add nsw i32 14, %mul147
  %idxprom149 = sext i32 %add148 to i64
  %78 = load double** %grid.addr, align 8
  %arrayidx150 = getelementptr inbounds double* %78, i64 %idxprom149
  %79 = load double* %arrayidx150, align 8
  %add151 = fadd double %add141, %79
  %80 = load i32* %x, align 4
  %81 = load i32* %y, align 4
  %mul152 = mul nsw i32 %81, 100
  %add153 = add nsw i32 %80, %mul152
  %82 = load i32* %z, align 4
  %mul154 = mul nsw i32 %82, 100
  %mul155 = mul nsw i32 %mul154, 100
  %add156 = add nsw i32 %add153, %mul155
  %mul157 = mul nsw i32 20, %add156
  %add158 = add nsw i32 15, %mul157
  %idxprom159 = sext i32 %add158 to i64
  %83 = load double** %grid.addr, align 8
  %arrayidx160 = getelementptr inbounds double* %83, i64 %idxprom159
  %84 = load double* %arrayidx160, align 8
  %add161 = fadd double %add151, %84
  %85 = load i32* %x, align 4
  %86 = load i32* %y, align 4
  %mul162 = mul nsw i32 %86, 100
  %add163 = add nsw i32 %85, %mul162
  %87 = load i32* %z, align 4
  %mul164 = mul nsw i32 %87, 100
  %mul165 = mul nsw i32 %mul164, 100
  %add166 = add nsw i32 %add163, %mul165
  %mul167 = mul nsw i32 20, %add166
  %add168 = add nsw i32 16, %mul167
  %idxprom169 = sext i32 %add168 to i64
  %88 = load double** %grid.addr, align 8
  %arrayidx170 = getelementptr inbounds double* %88, i64 %idxprom169
  %89 = load double* %arrayidx170, align 8
  %add171 = fadd double %add161, %89
  %90 = load i32* %x, align 4
  %91 = load i32* %y, align 4
  %mul172 = mul nsw i32 %91, 100
  %add173 = add nsw i32 %90, %mul172
  %92 = load i32* %z, align 4
  %mul174 = mul nsw i32 %92, 100
  %mul175 = mul nsw i32 %mul174, 100
  %add176 = add nsw i32 %add173, %mul175
  %mul177 = mul nsw i32 20, %add176
  %add178 = add nsw i32 17, %mul177
  %idxprom179 = sext i32 %add178 to i64
  %93 = load double** %grid.addr, align 8
  %arrayidx180 = getelementptr inbounds double* %93, i64 %idxprom179
  %94 = load double* %arrayidx180, align 8
  %add181 = fadd double %add171, %94
  %95 = load i32* %x, align 4
  %96 = load i32* %y, align 4
  %mul182 = mul nsw i32 %96, 100
  %add183 = add nsw i32 %95, %mul182
  %97 = load i32* %z, align 4
  %mul184 = mul nsw i32 %97, 100
  %mul185 = mul nsw i32 %mul184, 100
  %add186 = add nsw i32 %add183, %mul185
  %mul187 = mul nsw i32 20, %add186
  %add188 = add nsw i32 18, %mul187
  %idxprom189 = sext i32 %add188 to i64
  %98 = load double** %grid.addr, align 8
  %arrayidx190 = getelementptr inbounds double* %98, i64 %idxprom189
  %99 = load double* %arrayidx190, align 8
  %add191 = fadd double %add181, %99
  store double %add191, double* %rho, align 8
  %100 = load i32* %x, align 4
  %101 = load i32* %y, align 4
  %mul192 = mul nsw i32 %101, 100
  %add193 = add nsw i32 %100, %mul192
  %102 = load i32* %z, align 4
  %mul194 = mul nsw i32 %102, 100
  %mul195 = mul nsw i32 %mul194, 100
  %add196 = add nsw i32 %add193, %mul195
  %mul197 = mul nsw i32 20, %add196
  %add198 = add nsw i32 3, %mul197
  %idxprom199 = sext i32 %add198 to i64
  %103 = load double** %grid.addr, align 8
  %arrayidx200 = getelementptr inbounds double* %103, i64 %idxprom199
  %104 = load double* %arrayidx200, align 8
  %105 = load i32* %x, align 4
  %106 = load i32* %y, align 4
  %mul201 = mul nsw i32 %106, 100
  %add202 = add nsw i32 %105, %mul201
  %107 = load i32* %z, align 4
  %mul203 = mul nsw i32 %107, 100
  %mul204 = mul nsw i32 %mul203, 100
  %add205 = add nsw i32 %add202, %mul204
  %mul206 = mul nsw i32 20, %add205
  %add207 = add nsw i32 4, %mul206
  %idxprom208 = sext i32 %add207 to i64
  %108 = load double** %grid.addr, align 8
  %arrayidx209 = getelementptr inbounds double* %108, i64 %idxprom208
  %109 = load double* %arrayidx209, align 8
  %sub = fsub double %104, %109
  %110 = load i32* %x, align 4
  %111 = load i32* %y, align 4
  %mul210 = mul nsw i32 %111, 100
  %add211 = add nsw i32 %110, %mul210
  %112 = load i32* %z, align 4
  %mul212 = mul nsw i32 %112, 100
  %mul213 = mul nsw i32 %mul212, 100
  %add214 = add nsw i32 %add211, %mul213
  %mul215 = mul nsw i32 20, %add214
  %add216 = add nsw i32 7, %mul215
  %idxprom217 = sext i32 %add216 to i64
  %113 = load double** %grid.addr, align 8
  %arrayidx218 = getelementptr inbounds double* %113, i64 %idxprom217
  %114 = load double* %arrayidx218, align 8
  %add219 = fadd double %sub, %114
  %115 = load i32* %x, align 4
  %116 = load i32* %y, align 4
  %mul220 = mul nsw i32 %116, 100
  %add221 = add nsw i32 %115, %mul220
  %117 = load i32* %z, align 4
  %mul222 = mul nsw i32 %117, 100
  %mul223 = mul nsw i32 %mul222, 100
  %add224 = add nsw i32 %add221, %mul223
  %mul225 = mul nsw i32 20, %add224
  %add226 = add nsw i32 8, %mul225
  %idxprom227 = sext i32 %add226 to i64
  %118 = load double** %grid.addr, align 8
  %arrayidx228 = getelementptr inbounds double* %118, i64 %idxprom227
  %119 = load double* %arrayidx228, align 8
  %sub229 = fsub double %add219, %119
  %120 = load i32* %x, align 4
  %121 = load i32* %y, align 4
  %mul230 = mul nsw i32 %121, 100
  %add231 = add nsw i32 %120, %mul230
  %122 = load i32* %z, align 4
  %mul232 = mul nsw i32 %122, 100
  %mul233 = mul nsw i32 %mul232, 100
  %add234 = add nsw i32 %add231, %mul233
  %mul235 = mul nsw i32 20, %add234
  %add236 = add nsw i32 9, %mul235
  %idxprom237 = sext i32 %add236 to i64
  %123 = load double** %grid.addr, align 8
  %arrayidx238 = getelementptr inbounds double* %123, i64 %idxprom237
  %124 = load double* %arrayidx238, align 8
  %add239 = fadd double %sub229, %124
  %125 = load i32* %x, align 4
  %126 = load i32* %y, align 4
  %mul240 = mul nsw i32 %126, 100
  %add241 = add nsw i32 %125, %mul240
  %127 = load i32* %z, align 4
  %mul242 = mul nsw i32 %127, 100
  %mul243 = mul nsw i32 %mul242, 100
  %add244 = add nsw i32 %add241, %mul243
  %mul245 = mul nsw i32 20, %add244
  %add246 = add nsw i32 10, %mul245
  %idxprom247 = sext i32 %add246 to i64
  %128 = load double** %grid.addr, align 8
  %arrayidx248 = getelementptr inbounds double* %128, i64 %idxprom247
  %129 = load double* %arrayidx248, align 8
  %sub249 = fsub double %add239, %129
  %130 = load i32* %x, align 4
  %131 = load i32* %y, align 4
  %mul250 = mul nsw i32 %131, 100
  %add251 = add nsw i32 %130, %mul250
  %132 = load i32* %z, align 4
  %mul252 = mul nsw i32 %132, 100
  %mul253 = mul nsw i32 %mul252, 100
  %add254 = add nsw i32 %add251, %mul253
  %mul255 = mul nsw i32 20, %add254
  %add256 = add nsw i32 15, %mul255
  %idxprom257 = sext i32 %add256 to i64
  %133 = load double** %grid.addr, align 8
  %arrayidx258 = getelementptr inbounds double* %133, i64 %idxprom257
  %134 = load double* %arrayidx258, align 8
  %add259 = fadd double %sub249, %134
  %135 = load i32* %x, align 4
  %136 = load i32* %y, align 4
  %mul260 = mul nsw i32 %136, 100
  %add261 = add nsw i32 %135, %mul260
  %137 = load i32* %z, align 4
  %mul262 = mul nsw i32 %137, 100
  %mul263 = mul nsw i32 %mul262, 100
  %add264 = add nsw i32 %add261, %mul263
  %mul265 = mul nsw i32 20, %add264
  %add266 = add nsw i32 16, %mul265
  %idxprom267 = sext i32 %add266 to i64
  %138 = load double** %grid.addr, align 8
  %arrayidx268 = getelementptr inbounds double* %138, i64 %idxprom267
  %139 = load double* %arrayidx268, align 8
  %add269 = fadd double %add259, %139
  %140 = load i32* %x, align 4
  %141 = load i32* %y, align 4
  %mul270 = mul nsw i32 %141, 100
  %add271 = add nsw i32 %140, %mul270
  %142 = load i32* %z, align 4
  %mul272 = mul nsw i32 %142, 100
  %mul273 = mul nsw i32 %mul272, 100
  %add274 = add nsw i32 %add271, %mul273
  %mul275 = mul nsw i32 20, %add274
  %add276 = add nsw i32 17, %mul275
  %idxprom277 = sext i32 %add276 to i64
  %143 = load double** %grid.addr, align 8
  %arrayidx278 = getelementptr inbounds double* %143, i64 %idxprom277
  %144 = load double* %arrayidx278, align 8
  %sub279 = fsub double %add269, %144
  %145 = load i32* %x, align 4
  %146 = load i32* %y, align 4
  %mul280 = mul nsw i32 %146, 100
  %add281 = add nsw i32 %145, %mul280
  %147 = load i32* %z, align 4
  %mul282 = mul nsw i32 %147, 100
  %mul283 = mul nsw i32 %mul282, 100
  %add284 = add nsw i32 %add281, %mul283
  %mul285 = mul nsw i32 20, %add284
  %add286 = add nsw i32 18, %mul285
  %idxprom287 = sext i32 %add286 to i64
  %148 = load double** %grid.addr, align 8
  %arrayidx288 = getelementptr inbounds double* %148, i64 %idxprom287
  %149 = load double* %arrayidx288, align 8
  %sub289 = fsub double %sub279, %149
  store double %sub289, double* %ux, align 8
  %150 = load i32* %x, align 4
  %151 = load i32* %y, align 4
  %mul290 = mul nsw i32 %151, 100
  %add291 = add nsw i32 %150, %mul290
  %152 = load i32* %z, align 4
  %mul292 = mul nsw i32 %152, 100
  %mul293 = mul nsw i32 %mul292, 100
  %add294 = add nsw i32 %add291, %mul293
  %mul295 = mul nsw i32 20, %add294
  %add296 = add nsw i32 1, %mul295
  %idxprom297 = sext i32 %add296 to i64
  %153 = load double** %grid.addr, align 8
  %arrayidx298 = getelementptr inbounds double* %153, i64 %idxprom297
  %154 = load double* %arrayidx298, align 8
  %155 = load i32* %x, align 4
  %156 = load i32* %y, align 4
  %mul299 = mul nsw i32 %156, 100
  %add300 = add nsw i32 %155, %mul299
  %157 = load i32* %z, align 4
  %mul301 = mul nsw i32 %157, 100
  %mul302 = mul nsw i32 %mul301, 100
  %add303 = add nsw i32 %add300, %mul302
  %mul304 = mul nsw i32 20, %add303
  %add305 = add nsw i32 2, %mul304
  %idxprom306 = sext i32 %add305 to i64
  %158 = load double** %grid.addr, align 8
  %arrayidx307 = getelementptr inbounds double* %158, i64 %idxprom306
  %159 = load double* %arrayidx307, align 8
  %sub308 = fsub double %154, %159
  %160 = load i32* %x, align 4
  %161 = load i32* %y, align 4
  %mul309 = mul nsw i32 %161, 100
  %add310 = add nsw i32 %160, %mul309
  %162 = load i32* %z, align 4
  %mul311 = mul nsw i32 %162, 100
  %mul312 = mul nsw i32 %mul311, 100
  %add313 = add nsw i32 %add310, %mul312
  %mul314 = mul nsw i32 20, %add313
  %add315 = add nsw i32 7, %mul314
  %idxprom316 = sext i32 %add315 to i64
  %163 = load double** %grid.addr, align 8
  %arrayidx317 = getelementptr inbounds double* %163, i64 %idxprom316
  %164 = load double* %arrayidx317, align 8
  %add318 = fadd double %sub308, %164
  %165 = load i32* %x, align 4
  %166 = load i32* %y, align 4
  %mul319 = mul nsw i32 %166, 100
  %add320 = add nsw i32 %165, %mul319
  %167 = load i32* %z, align 4
  %mul321 = mul nsw i32 %167, 100
  %mul322 = mul nsw i32 %mul321, 100
  %add323 = add nsw i32 %add320, %mul322
  %mul324 = mul nsw i32 20, %add323
  %add325 = add nsw i32 8, %mul324
  %idxprom326 = sext i32 %add325 to i64
  %168 = load double** %grid.addr, align 8
  %arrayidx327 = getelementptr inbounds double* %168, i64 %idxprom326
  %169 = load double* %arrayidx327, align 8
  %add328 = fadd double %add318, %169
  %170 = load i32* %x, align 4
  %171 = load i32* %y, align 4
  %mul329 = mul nsw i32 %171, 100
  %add330 = add nsw i32 %170, %mul329
  %172 = load i32* %z, align 4
  %mul331 = mul nsw i32 %172, 100
  %mul332 = mul nsw i32 %mul331, 100
  %add333 = add nsw i32 %add330, %mul332
  %mul334 = mul nsw i32 20, %add333
  %add335 = add nsw i32 9, %mul334
  %idxprom336 = sext i32 %add335 to i64
  %173 = load double** %grid.addr, align 8
  %arrayidx337 = getelementptr inbounds double* %173, i64 %idxprom336
  %174 = load double* %arrayidx337, align 8
  %sub338 = fsub double %add328, %174
  %175 = load i32* %x, align 4
  %176 = load i32* %y, align 4
  %mul339 = mul nsw i32 %176, 100
  %add340 = add nsw i32 %175, %mul339
  %177 = load i32* %z, align 4
  %mul341 = mul nsw i32 %177, 100
  %mul342 = mul nsw i32 %mul341, 100
  %add343 = add nsw i32 %add340, %mul342
  %mul344 = mul nsw i32 20, %add343
  %add345 = add nsw i32 10, %mul344
  %idxprom346 = sext i32 %add345 to i64
  %178 = load double** %grid.addr, align 8
  %arrayidx347 = getelementptr inbounds double* %178, i64 %idxprom346
  %179 = load double* %arrayidx347, align 8
  %sub348 = fsub double %sub338, %179
  %180 = load i32* %x, align 4
  %181 = load i32* %y, align 4
  %mul349 = mul nsw i32 %181, 100
  %add350 = add nsw i32 %180, %mul349
  %182 = load i32* %z, align 4
  %mul351 = mul nsw i32 %182, 100
  %mul352 = mul nsw i32 %mul351, 100
  %add353 = add nsw i32 %add350, %mul352
  %mul354 = mul nsw i32 20, %add353
  %add355 = add nsw i32 11, %mul354
  %idxprom356 = sext i32 %add355 to i64
  %183 = load double** %grid.addr, align 8
  %arrayidx357 = getelementptr inbounds double* %183, i64 %idxprom356
  %184 = load double* %arrayidx357, align 8
  %add358 = fadd double %sub348, %184
  %185 = load i32* %x, align 4
  %186 = load i32* %y, align 4
  %mul359 = mul nsw i32 %186, 100
  %add360 = add nsw i32 %185, %mul359
  %187 = load i32* %z, align 4
  %mul361 = mul nsw i32 %187, 100
  %mul362 = mul nsw i32 %mul361, 100
  %add363 = add nsw i32 %add360, %mul362
  %mul364 = mul nsw i32 20, %add363
  %add365 = add nsw i32 12, %mul364
  %idxprom366 = sext i32 %add365 to i64
  %188 = load double** %grid.addr, align 8
  %arrayidx367 = getelementptr inbounds double* %188, i64 %idxprom366
  %189 = load double* %arrayidx367, align 8
  %add368 = fadd double %add358, %189
  %190 = load i32* %x, align 4
  %191 = load i32* %y, align 4
  %mul369 = mul nsw i32 %191, 100
  %add370 = add nsw i32 %190, %mul369
  %192 = load i32* %z, align 4
  %mul371 = mul nsw i32 %192, 100
  %mul372 = mul nsw i32 %mul371, 100
  %add373 = add nsw i32 %add370, %mul372
  %mul374 = mul nsw i32 20, %add373
  %add375 = add nsw i32 13, %mul374
  %idxprom376 = sext i32 %add375 to i64
  %193 = load double** %grid.addr, align 8
  %arrayidx377 = getelementptr inbounds double* %193, i64 %idxprom376
  %194 = load double* %arrayidx377, align 8
  %sub378 = fsub double %add368, %194
  %195 = load i32* %x, align 4
  %196 = load i32* %y, align 4
  %mul379 = mul nsw i32 %196, 100
  %add380 = add nsw i32 %195, %mul379
  %197 = load i32* %z, align 4
  %mul381 = mul nsw i32 %197, 100
  %mul382 = mul nsw i32 %mul381, 100
  %add383 = add nsw i32 %add380, %mul382
  %mul384 = mul nsw i32 20, %add383
  %add385 = add nsw i32 14, %mul384
  %idxprom386 = sext i32 %add385 to i64
  %198 = load double** %grid.addr, align 8
  %arrayidx387 = getelementptr inbounds double* %198, i64 %idxprom386
  %199 = load double* %arrayidx387, align 8
  %sub388 = fsub double %sub378, %199
  store double %sub388, double* %uy, align 8
  %200 = load i32* %x, align 4
  %201 = load i32* %y, align 4
  %mul389 = mul nsw i32 %201, 100
  %add390 = add nsw i32 %200, %mul389
  %202 = load i32* %z, align 4
  %mul391 = mul nsw i32 %202, 100
  %mul392 = mul nsw i32 %mul391, 100
  %add393 = add nsw i32 %add390, %mul392
  %mul394 = mul nsw i32 20, %add393
  %add395 = add nsw i32 5, %mul394
  %idxprom396 = sext i32 %add395 to i64
  %203 = load double** %grid.addr, align 8
  %arrayidx397 = getelementptr inbounds double* %203, i64 %idxprom396
  %204 = load double* %arrayidx397, align 8
  %205 = load i32* %x, align 4
  %206 = load i32* %y, align 4
  %mul398 = mul nsw i32 %206, 100
  %add399 = add nsw i32 %205, %mul398
  %207 = load i32* %z, align 4
  %mul400 = mul nsw i32 %207, 100
  %mul401 = mul nsw i32 %mul400, 100
  %add402 = add nsw i32 %add399, %mul401
  %mul403 = mul nsw i32 20, %add402
  %add404 = add nsw i32 6, %mul403
  %idxprom405 = sext i32 %add404 to i64
  %208 = load double** %grid.addr, align 8
  %arrayidx406 = getelementptr inbounds double* %208, i64 %idxprom405
  %209 = load double* %arrayidx406, align 8
  %sub407 = fsub double %204, %209
  %210 = load i32* %x, align 4
  %211 = load i32* %y, align 4
  %mul408 = mul nsw i32 %211, 100
  %add409 = add nsw i32 %210, %mul408
  %212 = load i32* %z, align 4
  %mul410 = mul nsw i32 %212, 100
  %mul411 = mul nsw i32 %mul410, 100
  %add412 = add nsw i32 %add409, %mul411
  %mul413 = mul nsw i32 20, %add412
  %add414 = add nsw i32 11, %mul413
  %idxprom415 = sext i32 %add414 to i64
  %213 = load double** %grid.addr, align 8
  %arrayidx416 = getelementptr inbounds double* %213, i64 %idxprom415
  %214 = load double* %arrayidx416, align 8
  %add417 = fadd double %sub407, %214
  %215 = load i32* %x, align 4
  %216 = load i32* %y, align 4
  %mul418 = mul nsw i32 %216, 100
  %add419 = add nsw i32 %215, %mul418
  %217 = load i32* %z, align 4
  %mul420 = mul nsw i32 %217, 100
  %mul421 = mul nsw i32 %mul420, 100
  %add422 = add nsw i32 %add419, %mul421
  %mul423 = mul nsw i32 20, %add422
  %add424 = add nsw i32 12, %mul423
  %idxprom425 = sext i32 %add424 to i64
  %218 = load double** %grid.addr, align 8
  %arrayidx426 = getelementptr inbounds double* %218, i64 %idxprom425
  %219 = load double* %arrayidx426, align 8
  %sub427 = fsub double %add417, %219
  %220 = load i32* %x, align 4
  %221 = load i32* %y, align 4
  %mul428 = mul nsw i32 %221, 100
  %add429 = add nsw i32 %220, %mul428
  %222 = load i32* %z, align 4
  %mul430 = mul nsw i32 %222, 100
  %mul431 = mul nsw i32 %mul430, 100
  %add432 = add nsw i32 %add429, %mul431
  %mul433 = mul nsw i32 20, %add432
  %add434 = add nsw i32 13, %mul433
  %idxprom435 = sext i32 %add434 to i64
  %223 = load double** %grid.addr, align 8
  %arrayidx436 = getelementptr inbounds double* %223, i64 %idxprom435
  %224 = load double* %arrayidx436, align 8
  %add437 = fadd double %sub427, %224
  %225 = load i32* %x, align 4
  %226 = load i32* %y, align 4
  %mul438 = mul nsw i32 %226, 100
  %add439 = add nsw i32 %225, %mul438
  %227 = load i32* %z, align 4
  %mul440 = mul nsw i32 %227, 100
  %mul441 = mul nsw i32 %mul440, 100
  %add442 = add nsw i32 %add439, %mul441
  %mul443 = mul nsw i32 20, %add442
  %add444 = add nsw i32 14, %mul443
  %idxprom445 = sext i32 %add444 to i64
  %228 = load double** %grid.addr, align 8
  %arrayidx446 = getelementptr inbounds double* %228, i64 %idxprom445
  %229 = load double* %arrayidx446, align 8
  %sub447 = fsub double %add437, %229
  %230 = load i32* %x, align 4
  %231 = load i32* %y, align 4
  %mul448 = mul nsw i32 %231, 100
  %add449 = add nsw i32 %230, %mul448
  %232 = load i32* %z, align 4
  %mul450 = mul nsw i32 %232, 100
  %mul451 = mul nsw i32 %mul450, 100
  %add452 = add nsw i32 %add449, %mul451
  %mul453 = mul nsw i32 20, %add452
  %add454 = add nsw i32 15, %mul453
  %idxprom455 = sext i32 %add454 to i64
  %233 = load double** %grid.addr, align 8
  %arrayidx456 = getelementptr inbounds double* %233, i64 %idxprom455
  %234 = load double* %arrayidx456, align 8
  %add457 = fadd double %sub447, %234
  %235 = load i32* %x, align 4
  %236 = load i32* %y, align 4
  %mul458 = mul nsw i32 %236, 100
  %add459 = add nsw i32 %235, %mul458
  %237 = load i32* %z, align 4
  %mul460 = mul nsw i32 %237, 100
  %mul461 = mul nsw i32 %mul460, 100
  %add462 = add nsw i32 %add459, %mul461
  %mul463 = mul nsw i32 20, %add462
  %add464 = add nsw i32 16, %mul463
  %idxprom465 = sext i32 %add464 to i64
  %238 = load double** %grid.addr, align 8
  %arrayidx466 = getelementptr inbounds double* %238, i64 %idxprom465
  %239 = load double* %arrayidx466, align 8
  %sub467 = fsub double %add457, %239
  %240 = load i32* %x, align 4
  %241 = load i32* %y, align 4
  %mul468 = mul nsw i32 %241, 100
  %add469 = add nsw i32 %240, %mul468
  %242 = load i32* %z, align 4
  %mul470 = mul nsw i32 %242, 100
  %mul471 = mul nsw i32 %mul470, 100
  %add472 = add nsw i32 %add469, %mul471
  %mul473 = mul nsw i32 20, %add472
  %add474 = add nsw i32 17, %mul473
  %idxprom475 = sext i32 %add474 to i64
  %243 = load double** %grid.addr, align 8
  %arrayidx476 = getelementptr inbounds double* %243, i64 %idxprom475
  %244 = load double* %arrayidx476, align 8
  %add477 = fadd double %sub467, %244
  %245 = load i32* %x, align 4
  %246 = load i32* %y, align 4
  %mul478 = mul nsw i32 %246, 100
  %add479 = add nsw i32 %245, %mul478
  %247 = load i32* %z, align 4
  %mul480 = mul nsw i32 %247, 100
  %mul481 = mul nsw i32 %mul480, 100
  %add482 = add nsw i32 %add479, %mul481
  %mul483 = mul nsw i32 20, %add482
  %add484 = add nsw i32 18, %mul483
  %idxprom485 = sext i32 %add484 to i64
  %248 = load double** %grid.addr, align 8
  %arrayidx486 = getelementptr inbounds double* %248, i64 %idxprom485
  %249 = load double* %arrayidx486, align 8
  %sub487 = fsub double %add477, %249
  store double %sub487, double* %uz, align 8
  %250 = load double* %rho, align 8
  %251 = load double* %ux, align 8
  %div = fdiv double %251, %250
  store double %div, double* %ux, align 8
  %252 = load double* %rho, align 8
  %253 = load double* %uy, align 8
  %div488 = fdiv double %253, %252
  store double %div488, double* %uy, align 8
  %254 = load double* %rho, align 8
  %255 = load double* %uz, align 8
  %div489 = fdiv double %255, %254
  store double %div489, double* %uz, align 8
  %256 = load i32* %binary.addr, align 4
  %tobool490 = icmp ne i32 %256, 0
  br i1 %tobool490, label %if.then, label %if.else

if.then:                                          ; preds = %for.body6
  %257 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %257, float* %fileUx)
  %258 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %258, float* %fileUy)
  %259 = load %struct._IO_FILE** %file, align 8
  call void @loadValue(%struct._IO_FILE* %259, float* %fileUz)
  br label %if.end

if.else:                                          ; preds = %for.body6
  %260 = load %struct._IO_FILE** %file, align 8
  %call491 = call i32 (%struct._IO_FILE*, i8*, ...)* @__isoc99_fscanf(%struct._IO_FILE* %260, i8* getelementptr inbounds ([10 x i8]* @.str7, i32 0, i32 0), float* %fileUx, float* %fileUy, float* %fileUz)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %261 = load double* %ux, align 8
  %262 = load float* %fileUx, align 4
  %conv = fpext float %262 to double
  %sub492 = fsub double %261, %conv
  %conv493 = fptrunc double %sub492 to float
  store float %conv493, float* %dUx, align 4
  %263 = load double* %uy, align 8
  %264 = load float* %fileUy, align 4
  %conv494 = fpext float %264 to double
  %sub495 = fsub double %263, %conv494
  %conv496 = fptrunc double %sub495 to float
  store float %conv496, float* %dUy, align 4
  %265 = load double* %uz, align 8
  %266 = load float* %fileUz, align 4
  %conv497 = fpext float %266 to double
  %sub498 = fsub double %265, %conv497
  %conv499 = fptrunc double %sub498 to float
  store float %conv499, float* %dUz, align 4
  %267 = load float* %dUx, align 4
  %268 = load float* %dUx, align 4
  %mul500 = fmul float %267, %268
  %269 = load float* %dUy, align 4
  %270 = load float* %dUy, align 4
  %mul501 = fmul float %269, %270
  %add502 = fadd float %mul500, %mul501
  %271 = load float* %dUz, align 4
  %272 = load float* %dUz, align 4
  %mul503 = fmul float %271, %272
  %add504 = fadd float %add502, %mul503
  store float %add504, float* %diff2, align 4
  %273 = load float* %diff2, align 4
  %274 = load float* %maxDiff2, align 4
  %cmp505 = fcmp ogt float %273, %274
  br i1 %cmp505, label %if.then507, label %if.end508

if.then507:                                       ; preds = %if.end
  %275 = load float* %diff2, align 4
  store float %275, float* %maxDiff2, align 4
  br label %if.end508

if.end508:                                        ; preds = %if.then507, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end508
  %276 = load i32* %x, align 4
  %inc = add nsw i32 %276, 1
  store i32 %inc, i32* %x, align 4
  br label %for.cond4

for.end:                                          ; preds = %for.cond4
  br label %for.inc509

for.inc509:                                       ; preds = %for.end
  %277 = load i32* %y, align 4
  %inc510 = add nsw i32 %277, 1
  store i32 %inc510, i32* %y, align 4
  br label %for.cond1

for.end511:                                       ; preds = %for.cond1
  br label %for.inc512

for.inc512:                                       ; preds = %for.end511
  %278 = load i32* %z, align 4
  %inc513 = add nsw i32 %278, 1
  store i32 %inc513, i32* %z, align 4
  br label %for.cond

for.end514:                                       ; preds = %for.cond
  %279 = load float* %maxDiff2, align 4
  %conv515 = fpext float %279 to double
  %call516 = call double @sqrt(double %conv515) #5
  %call517 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str8, i32 0, i32 0), double %call516)
  %280 = load %struct._IO_FILE** %file, align 8
  %call518 = call i32 @fclose(%struct._IO_FILE* %280)
  ret void
}

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #2

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #2

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #2

; Function Attrs: nounwind uwtable
define internal void @storeValue(%struct._IO_FILE* %file, float* %v) #0 {
entry:
  %file.addr = alloca %struct._IO_FILE*, align 8
  %v.addr = alloca float*, align 8
  %litteBigEndianTest = alloca i32, align 4
  %vPtr = alloca i8*, align 8
  %buffer = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  store float* %v, float** %v.addr, align 8
  store i32 1, i32* %litteBigEndianTest, align 4
  %0 = bitcast i32* %litteBigEndianTest to i8*
  %1 = load i8* %0, align 1
  %conv = zext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load float** %v.addr, align 8
  %3 = bitcast float* %2 to i8*
  store i8* %3, i8** %vPtr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %4 = load i32* %i, align 4
  %conv2 = sext i32 %4 to i64
  %cmp3 = icmp ult i64 %conv2, 4
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %5 = load i32* %i, align 4
  %conv5 = sext i32 %5 to i64
  %sub = sub i64 4, %conv5
  %sub6 = sub i64 %sub, 1
  %6 = load i8** %vPtr, align 8
  %arrayidx = getelementptr inbounds i8* %6, i64 %sub6
  %7 = load i8* %arrayidx, align 1
  %8 = load i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx7 = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %idxprom
  store i8 %7, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %10 = load %struct._IO_FILE** %file.addr, align 8
  %call = call i64 @fwrite(i8* %arraydecay, i64 4, i64 1, %struct._IO_FILE* %10)
  br label %if.end

if.else:                                          ; preds = %entry
  %11 = load float** %v.addr, align 8
  %12 = bitcast float* %11 to i8*
  %13 = load %struct._IO_FILE** %file.addr, align 8
  %call8 = call i64 @fwrite(i8* %12, i64 4, i64 1, %struct._IO_FILE* %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @loadValue(%struct._IO_FILE* %file, float* %v) #0 {
entry:
  %file.addr = alloca %struct._IO_FILE*, align 8
  %v.addr = alloca float*, align 8
  %litteBigEndianTest = alloca i32, align 4
  %vPtr = alloca i8*, align 8
  %buffer = alloca [4 x i8], align 1
  %i = alloca i32, align 4
  store %struct._IO_FILE* %file, %struct._IO_FILE** %file.addr, align 8
  store float* %v, float** %v.addr, align 8
  store i32 1, i32* %litteBigEndianTest, align 4
  %0 = bitcast i32* %litteBigEndianTest to i8*
  %1 = load i8* %0, align 1
  %conv = zext i8 %1 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %2 = load float** %v.addr, align 8
  %3 = bitcast float* %2 to i8*
  store i8* %3, i8** %vPtr, align 8
  %arraydecay = getelementptr inbounds [4 x i8]* %buffer, i32 0, i32 0
  %4 = load %struct._IO_FILE** %file.addr, align 8
  %call = call i64 @fread(i8* %arraydecay, i64 4, i64 1, %struct._IO_FILE* %4)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then
  %5 = load i32* %i, align 4
  %conv2 = sext i32 %5 to i64
  %cmp3 = icmp ult i64 %conv2, 4
  br i1 %cmp3, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32* %i, align 4
  %conv5 = sext i32 %6 to i64
  %sub = sub i64 4, %conv5
  %sub6 = sub i64 %sub, 1
  %arrayidx = getelementptr inbounds [4 x i8]* %buffer, i32 0, i64 %sub6
  %7 = load i8* %arrayidx, align 1
  %8 = load i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %9 = load i8** %vPtr, align 8
  %arrayidx7 = getelementptr inbounds i8* %9, i64 %idxprom
  store i8 %7, i8* %arrayidx7, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %10 = load i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end

if.else:                                          ; preds = %entry
  %11 = load float** %v.addr, align 8
  %12 = bitcast float* %11 to i8*
  %13 = load %struct._IO_FILE** %file.addr, align 8
  %call8 = call i64 @fread(i8* %12, i64 4, i64 1, %struct._IO_FILE* %13)
  br label %if.end

if.end:                                           ; preds = %if.else, %for.end
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %nArgs, i8** %arg) #0 {
entry:
  %retval = alloca i32, align 4
  %nArgs.addr = alloca i32, align 4
  %arg.addr = alloca i8**, align 8
  %param = alloca %struct.MAIN_Param, align 8
  %t = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %nArgs, i32* %nArgs.addr, align 4
  store i8** %arg, i8*** %arg.addr, align 8
  %0 = load i32* %nArgs.addr, align 4
  %1 = load i8*** %arg.addr, align 8
  call void @MAIN_parseCommandLine(i32 %0, i8** %1, %struct.MAIN_Param* %param)
  call void @MAIN_printInfo(%struct.MAIN_Param* %param)
  call void @MAIN_initialize(%struct.MAIN_Param* %param)
  store i32 1, i32* %t, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %t, align 4
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param* %param, i32 0, i32 0
  %3 = load i32* %nTimeSteps, align 4
  %cmp = icmp sle i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %simType = getelementptr inbounds %struct.MAIN_Param* %param, i32 0, i32 3
  %4 = load i32* %simType, align 4
  %cmp1 = icmp eq i32 %4, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double]* %5, i32 0, i32 0
  call void @LBM_handleInOutFlow(double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay2 = getelementptr inbounds [26000000 x double]* %6, i32 0, i32 0
  %7 = load [26000000 x double]** @dstGrid, align 8
  %arraydecay3 = getelementptr inbounds [26000000 x double]* %7, i32 0, i32 0
  call void @LBM_performStreamCollide(double* %arraydecay2, double* %arraydecay3)
  call void @LBM_swapGrids([26000000 x double]** @srcGrid, [26000000 x double]** @dstGrid)
  %8 = load i32* %t, align 4
  %and = and i32 %8, 63
  %cmp4 = icmp eq i32 %and, 0
  br i1 %cmp4, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.end
  %9 = load i32* %t, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0), i32 %9)
  %10 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay6 = getelementptr inbounds [26000000 x double]* %10, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay6)
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  br label %for.inc

for.inc:                                          ; preds = %if.end7
  %11 = load i32* %t, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %t, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @MAIN_finalize(%struct.MAIN_Param* %param)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @MAIN_parseCommandLine(i32 %nArgs, i8** %arg, %struct.MAIN_Param* %param) #0 {
entry:
  %nArgs.addr = alloca i32, align 4
  %arg.addr = alloca i8**, align 8
  %param.addr = alloca %struct.MAIN_Param*, align 8
  %fileStat = alloca %struct.stat, align 8
  store i32 %nArgs, i32* %nArgs.addr, align 4
  store i8** %arg, i8*** %arg.addr, align 8
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %0 = load i32* %nArgs.addr, align 4
  %cmp = icmp slt i32 %0, 5
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %nArgs.addr, align 4
  %cmp1 = icmp sgt i32 %1, 6
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([109 x i8]* @.str110, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8*** %arg.addr, align 8
  %arrayidx = getelementptr inbounds i8** %2, i64 1
  %3 = load i8** %arrayidx, align 8
  %call2 = call i32 @atoi(i8* %3) #7
  %4 = load %struct.MAIN_Param** %param.addr, align 8
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param* %4, i32 0, i32 0
  store i32 %call2, i32* %nTimeSteps, align 4
  %5 = load i8*** %arg.addr, align 8
  %arrayidx3 = getelementptr inbounds i8** %5, i64 2
  %6 = load i8** %arrayidx3, align 8
  %7 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param* %7, i32 0, i32 1
  store i8* %6, i8** %resultFilename, align 8
  %8 = load i8*** %arg.addr, align 8
  %arrayidx4 = getelementptr inbounds i8** %8, i64 3
  %9 = load i8** %arrayidx4, align 8
  %call5 = call i32 @atoi(i8* %9) #7
  %10 = load %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param* %10, i32 0, i32 2
  store i32 %call5, i32* %action, align 4
  %11 = load i8*** %arg.addr, align 8
  %arrayidx6 = getelementptr inbounds i8** %11, i64 4
  %12 = load i8** %arrayidx6, align 8
  %call7 = call i32 @atoi(i8* %12) #7
  %13 = load %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param* %13, i32 0, i32 3
  store i32 %call7, i32* %simType, align 4
  %14 = load i32* %nArgs.addr, align 4
  %cmp8 = icmp eq i32 %14, 6
  br i1 %cmp8, label %if.then9, label %if.else

if.then9:                                         ; preds = %if.end
  %15 = load i8*** %arg.addr, align 8
  %arrayidx10 = getelementptr inbounds i8** %15, i64 5
  %16 = load i8** %arrayidx10, align 8
  %17 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param* %17, i32 0, i32 4
  store i8* %16, i8** %obstacleFilename, align 8
  %18 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename11 = getelementptr inbounds %struct.MAIN_Param* %18, i32 0, i32 4
  %19 = load i8** %obstacleFilename11, align 8
  %call12 = call i32 @stat(i8* %19, %struct.stat* %fileStat) #5
  %cmp13 = icmp ne i32 %call12, 0
  br i1 %cmp13, label %if.then14, label %if.end17

if.then14:                                        ; preds = %if.then9
  %20 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename15 = getelementptr inbounds %struct.MAIN_Param* %20, i32 0, i32 4
  %21 = load i8** %obstacleFilename15, align 8
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([55 x i8]* @.str211, i32 0, i32 0), i8* %21)
  call void @exit(i32 1) #6
  unreachable

if.end17:                                         ; preds = %if.then9
  %st_size = getelementptr inbounds %struct.stat* %fileStat, i32 0, i32 8
  %22 = load i64* %st_size, align 8
  %cmp18 = icmp ne i64 %22, 1313130
  br i1 %cmp18, label %if.then19, label %if.end23

if.then19:                                        ; preds = %if.end17
  %23 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename20 = getelementptr inbounds %struct.MAIN_Param* %23, i32 0, i32 4
  %24 = load i8** %obstacleFilename20, align 8
  %st_size21 = getelementptr inbounds %struct.stat* %fileStat, i32 0, i32 8
  %25 = load i64* %st_size21, align 8
  %conv = trunc i64 %25 to i32
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([82 x i8]* @.str312, i32 0, i32 0), i8* %24, i32 %conv, i32 1313130)
  call void @exit(i32 1) #6
  unreachable

if.end23:                                         ; preds = %if.end17
  br label %if.end25

if.else:                                          ; preds = %if.end
  %26 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename24 = getelementptr inbounds %struct.MAIN_Param* %26, i32 0, i32 4
  store i8* null, i8** %obstacleFilename24, align 8
  br label %if.end25

if.end25:                                         ; preds = %if.else, %if.end23
  %27 = load %struct.MAIN_Param** %param.addr, align 8
  %action26 = getelementptr inbounds %struct.MAIN_Param* %27, i32 0, i32 2
  %28 = load i32* %action26, align 4
  %cmp27 = icmp eq i32 %28, 1
  br i1 %cmp27, label %land.lhs.true, label %if.end36

land.lhs.true:                                    ; preds = %if.end25
  %29 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename29 = getelementptr inbounds %struct.MAIN_Param* %29, i32 0, i32 1
  %30 = load i8** %resultFilename29, align 8
  %call30 = call i32 @stat(i8* %30, %struct.stat* %fileStat) #5
  %cmp31 = icmp ne i32 %call30, 0
  br i1 %cmp31, label %if.then33, label %if.end36

if.then33:                                        ; preds = %land.lhs.true
  %31 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename34 = getelementptr inbounds %struct.MAIN_Param* %31, i32 0, i32 1
  %32 = load i8** %resultFilename34, align 8
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([53 x i8]* @.str413, i32 0, i32 0), i8* %32)
  call void @exit(i32 1) #6
  unreachable

if.end36:                                         ; preds = %land.lhs.true, %if.end25
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MAIN_printInfo(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %0 = load %struct.MAIN_Param** %param.addr, align 8
  %nTimeSteps = getelementptr inbounds %struct.MAIN_Param* %0, i32 0, i32 0
  %1 = load i32* %nTimeSteps, align 4
  %2 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param* %2, i32 0, i32 1
  %3 = load i8** %resultFilename, align 8
  %4 = load %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param* %4, i32 0, i32 2
  %5 = load i32* %action, align 4
  %idxprom = zext i32 %5 to i64
  %arrayidx = getelementptr inbounds [3 x [32 x i8]]* @MAIN_printInfo.actionString, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [32 x i8]* %arrayidx, i32 0, i32 0
  %6 = load %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param* %6, i32 0, i32 3
  %7 = load i32* %simType, align 4
  %idxprom1 = zext i32 %7 to i64
  %arrayidx2 = getelementptr inbounds [3 x [32 x i8]]* @MAIN_printInfo.simTypeString, i32 0, i64 %idxprom1
  %arraydecay3 = getelementptr inbounds [32 x i8]* %arrayidx2, i32 0, i32 0
  %8 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param* %8, i32 0, i32 4
  %9 = load i8** %obstacleFilename, align 8
  %cmp = icmp eq i8* %9, null
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %10 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename4 = getelementptr inbounds %struct.MAIN_Param* %10, i32 0, i32 4
  %11 = load i8** %obstacleFilename4, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i8* [ getelementptr inbounds ([7 x i8]* @.str615, i32 0, i32 0), %cond.true ], [ %11, %cond.false ]
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([174 x i8]* @.str514, i32 0, i32 0), i32 100, i32 100, i32 130, double 0x3FF4CCCCCCCCCCCC, i32 %1, i8* %3, i8* %arraydecay, i8* %arraydecay3, i8* %cond)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MAIN_initialize(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  call void @LBM_allocateGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  %0 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double]* %0, i32 0, i32 0
  call void @LBM_initializeGrid(double* %arraydecay)
  %1 = load [26000000 x double]** @dstGrid, align 8
  %arraydecay1 = getelementptr inbounds [26000000 x double]* %1, i32 0, i32 0
  call void @LBM_initializeGrid(double* %arraydecay1)
  %2 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename = getelementptr inbounds %struct.MAIN_Param* %2, i32 0, i32 4
  %3 = load i8** %obstacleFilename, align 8
  %cmp = icmp ne i8* %3, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay2 = getelementptr inbounds [26000000 x double]* %4, i32 0, i32 0
  %5 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename3 = getelementptr inbounds %struct.MAIN_Param* %5, i32 0, i32 4
  %6 = load i8** %obstacleFilename3, align 8
  call void @LBM_loadObstacleFile(double* %arraydecay2, i8* %6)
  %7 = load [26000000 x double]** @dstGrid, align 8
  %arraydecay4 = getelementptr inbounds [26000000 x double]* %7, i32 0, i32 0
  %8 = load %struct.MAIN_Param** %param.addr, align 8
  %obstacleFilename5 = getelementptr inbounds %struct.MAIN_Param* %8, i32 0, i32 4
  %9 = load i8** %obstacleFilename5, align 8
  call void @LBM_loadObstacleFile(double* %arraydecay4, i8* %9)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %10 = load %struct.MAIN_Param** %param.addr, align 8
  %simType = getelementptr inbounds %struct.MAIN_Param* %10, i32 0, i32 3
  %11 = load i32* %simType, align 4
  %cmp6 = icmp eq i32 %11, 1
  br i1 %cmp6, label %if.then7, label %if.else

if.then7:                                         ; preds = %if.end
  %12 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay8 = getelementptr inbounds [26000000 x double]* %12, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay8)
  %13 = load [26000000 x double]** @dstGrid, align 8
  %arraydecay9 = getelementptr inbounds [26000000 x double]* %13, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForChannel(double* %arraydecay9)
  br label %if.end12

if.else:                                          ; preds = %if.end
  %14 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay10 = getelementptr inbounds [26000000 x double]* %14, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay10)
  %15 = load [26000000 x double]** @dstGrid, align 8
  %arraydecay11 = getelementptr inbounds [26000000 x double]* %15, i32 0, i32 0
  call void @LBM_initializeSpecialCellsForLDC(double* %arraydecay11)
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then7
  %16 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay13 = getelementptr inbounds [26000000 x double]* %16, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay13)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @MAIN_finalize(%struct.MAIN_Param* %param) #0 {
entry:
  %param.addr = alloca %struct.MAIN_Param*, align 8
  store %struct.MAIN_Param* %param, %struct.MAIN_Param** %param.addr, align 8
  %0 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay = getelementptr inbounds [26000000 x double]* %0, i32 0, i32 0
  call void @LBM_showGridStatistics(double* %arraydecay)
  %1 = load %struct.MAIN_Param** %param.addr, align 8
  %action = getelementptr inbounds %struct.MAIN_Param* %1, i32 0, i32 2
  %2 = load i32* %action, align 4
  %cmp = icmp eq i32 %2, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %3 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay1 = getelementptr inbounds [26000000 x double]* %3, i32 0, i32 0
  %4 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename = getelementptr inbounds %struct.MAIN_Param* %4, i32 0, i32 1
  %5 = load i8** %resultFilename, align 8
  call void @LBM_compareVelocityField(double* %arraydecay1, i8* %5, i32 -1)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %6 = load %struct.MAIN_Param** %param.addr, align 8
  %action2 = getelementptr inbounds %struct.MAIN_Param* %6, i32 0, i32 2
  %7 = load i32* %action2, align 4
  %cmp3 = icmp eq i32 %7, 2
  br i1 %cmp3, label %if.then4, label %if.end7

if.then4:                                         ; preds = %if.end
  %8 = load [26000000 x double]** @srcGrid, align 8
  %arraydecay5 = getelementptr inbounds [26000000 x double]* %8, i32 0, i32 0
  %9 = load %struct.MAIN_Param** %param.addr, align 8
  %resultFilename6 = getelementptr inbounds %struct.MAIN_Param* %9, i32 0, i32 1
  %10 = load i8** %resultFilename6, align 8
  call void @LBM_storeVelocityField(double* %arraydecay5, i8* %10, i32 -1)
  br label %if.end7

if.end7:                                          ; preds = %if.then4, %if.end
  call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @srcGrid to double**))
  call void @LBM_freeGrid(double** bitcast ([26000000 x double]** @dstGrid to double**))
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #4

; Function Attrs: nounwind
declare i32 @stat(i8*, %struct.stat*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0, !0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
