; ModuleID = 'ping.annonated.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sockaddr = type { i16, [14 x i8] }
%struct.hostent = type { i8*, i8**, i32, i32, i8** }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timezone = type { i32, i32 }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.protoent = type { i8*, i8**, i32 }
%struct.timeval = type { i64, i64 }
%struct.fd_set = type { [16 x i64] }
%struct.icmp = type { i8, i8, i16, %union.anon, %union.anon.0 }
%union.anon = type { %struct.in_addr }
%union.anon.0 = type { %struct.anon.1 }
%struct.anon.1 = type { %struct.ip }
%struct.ip = type { i8, i8, i16, i16, i16, i8, i8, i16, %struct.in_addr, %struct.in_addr }
%struct.ih_idseq = type { i16, i16 }

@usage = global [59 x i8] c"Usage:  ping [-dfqrv] host [packetsize [count [preload]]]\0A\00", align 16
@preload = global i32 0, align 4
@ntransmitted = global i32 0, align 4
@nreceived = global i32 0, align 4
@timing = global i32 0, align 4
@tmin = global i32 999999999, align 4
@tmax = global i32 0, align 4
@tsum = global i32 0, align 4
@whereto = common global %struct.sockaddr zeroinitializer, align 2
@options = common global i32 0, align 4
@pingflags = common global i32 0, align 4
@hnamebuf = common global [64 x i8] zeroinitializer, align 16
@hostname = common global i8* null, align 8
@hp = common global %struct.hostent* null, align 8
@.str = private unnamed_addr constant [21 x i8] c"%s: unknown host %s\0A\00", align 1
@datalen = common global i32 0, align 4
@stderr = external global %struct._IO_FILE*
@.str1 = private unnamed_addr constant [29 x i8] c"ping: packet size too large\0A\00", align 1
@npackets = common global i32 0, align 4
@ident = common global i32 0, align 4
@.str2 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"icmp: unknown protocol\0A\00", align 1
@s = common global i32 0, align 4
@.str4 = private unnamed_addr constant [13 x i8] c"ping: socket\00", align 1
@.str5 = private unnamed_addr constant [14 x i8] c"...debug on.\0A\00", align 1
@.str6 = private unnamed_addr constant [16 x i8] c"...no routing.\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"PING %s (%s): %d data bytes\0A\00", align 1
@.str8 = private unnamed_addr constant [24 x i8] c"PING %s: %d data bytes\0A\00", align 1
@stdout = external global %struct._IO_FILE*
@i = common global i32 0, align 4
@packet = common global [4096 x i8] zeroinitializer, align 16
@.str9 = private unnamed_addr constant [15 x i8] c"ping: recvfrom\00", align 1
@pinger.outpack = internal global [4096 x i8] zeroinitializer, align 16
@tz = common global %struct.timezone zeroinitializer, align 4
@.str10 = private unnamed_addr constant [7 x i8] c"sendto\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"ping: wrote %s %d chars, ret=%d\0A\00", align 1
@pr_type.ttab = internal global [17 x i8*] [i8* getelementptr inbounds ([11 x i8]* @.str12, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str13, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8]* @.str15, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str16, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8]* @.str17, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str18, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str19, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8]* @.str20, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str21, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8]* @.str22, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8]* @.str23, i32 0, i32 0), i8* getelementptr inbounds ([18 x i8]* @.str24, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str25, i32 0, i32 0), i8* getelementptr inbounds ([16 x i8]* @.str26, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str27, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8]* @.str28, i32 0, i32 0)], align 16
@.str12 = private unnamed_addr constant [11 x i8] c"Echo Reply\00", align 1
@.str13 = private unnamed_addr constant [7 x i8] c"ICMP 1\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"ICMP 2\00", align 1
@.str15 = private unnamed_addr constant [17 x i8] c"Dest Unreachable\00", align 1
@.str16 = private unnamed_addr constant [14 x i8] c"Source Quench\00", align 1
@.str17 = private unnamed_addr constant [9 x i8] c"Redirect\00", align 1
@.str18 = private unnamed_addr constant [7 x i8] c"ICMP 6\00", align 1
@.str19 = private unnamed_addr constant [7 x i8] c"ICMP 7\00", align 1
@.str20 = private unnamed_addr constant [5 x i8] c"Echo\00", align 1
@.str21 = private unnamed_addr constant [7 x i8] c"ICMP 9\00", align 1
@.str22 = private unnamed_addr constant [8 x i8] c"ICMP 10\00", align 1
@.str23 = private unnamed_addr constant [14 x i8] c"Time Exceeded\00", align 1
@.str24 = private unnamed_addr constant [18 x i8] c"Parameter Problem\00", align 1
@.str25 = private unnamed_addr constant [10 x i8] c"Timestamp\00", align 1
@.str26 = private unnamed_addr constant [16 x i8] c"Timestamp Reply\00", align 1
@.str27 = private unnamed_addr constant [13 x i8] c"Info Request\00", align 1
@.str28 = private unnamed_addr constant [11 x i8] c"Info Reply\00", align 1
@.str29 = private unnamed_addr constant [13 x i8] c"OUT-OF-RANGE\00", align 1
@.str30 = private unnamed_addr constant [37 x i8] c"packet too short (%d bytes) from %s\0A\00", align 1
@.str31 = private unnamed_addr constant [50 x i8] c"%d bytes from %s: icmp_type=%d (%s) icmp_code=%d\0A\00", align 1
@.str32 = private unnamed_addr constant [16 x i8] c"x%2.2x: x%8.8x\0A\00", align 1
@.str33 = private unnamed_addr constant [30 x i8] c"%d bytes from %s: icmp_seq=%d\00", align 1
@.str34 = private unnamed_addr constant [13 x i8] c" time=%d ms\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"\0A----%s PING Statistics----\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"%d packets transmitted, \00", align 1
@.str37 = private unnamed_addr constant [22 x i8] c"%d packets received, \00", align 1
@.str38 = private unnamed_addr constant [35 x i8] c"-- somebody's printing up packets!\00", align 1
@.str39 = private unnamed_addr constant [17 x i8] c"%d%% packet loss\00", align 1
@.str40 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str41 = private unnamed_addr constant [41 x i8] c"round-trip (ms)  min/avg/max = %d/%d/%d\0A\00", align 1
@.str42 = private unnamed_addr constant [10 x i8] c"sensitive\00", section "llvm.metadata"
@.str43 = private unnamed_addr constant [7 x i8] c"ping.c\00", section "llvm.metadata"
@llvm.global.annotations = appending global [1 x { i8*, i8*, i8*, i32 }] [{ i8*, i8*, i8*, i32 } { i8* bitcast (i8** @hostname to i8*), i8* getelementptr inbounds ([10 x i8]* @.str42, i32 0, i32 0), i8* getelementptr inbounds ([7 x i8]* @.str43, i32 0, i32 0), i32 63 }], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %from = alloca %struct.sockaddr_in, align 4
  %av = alloca i8**, align 8
  %to = alloca %struct.sockaddr_in*, align 8
  %on = alloca i32, align 4
  %proto = alloca %struct.protoent*, align 8
  %len = alloca i32, align 4
  %fromlen = alloca i32, align 4
  %cc = alloca i32, align 4
  %timeout = alloca %struct.timeval, align 8
  %fdmask = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8*** %argv.addr, align 8
  store i8** %0, i8*** %av, align 8
  store %struct.sockaddr_in* bitcast (%struct.sockaddr* @whereto to %struct.sockaddr_in*), %struct.sockaddr_in** %to, align 8
  store i32 1, i32* %on, align 4
  %1 = load i32* %argc.addr, align 4
  %dec = add nsw i32 %1, -1
  store i32 %dec, i32* %argc.addr, align 4
  %2 = load i8*** %av, align 8
  %incdec.ptr = getelementptr inbounds i8** %2, i32 1
  store i8** %incdec.ptr, i8*** %av, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.end, %entry
  %3 = load i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %3, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %4 = load i8*** %av, align 8
  %arrayidx = getelementptr inbounds i8** %4, i64 0
  %5 = load i8** %arrayidx, align 8
  %6 = load i8* %5, align 1
  %conv = sext i8 %6 to i32
  %cmp1 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %7 = phi i1 [ false, %while.cond ], [ %cmp1, %land.rhs ]
  br i1 %7, label %while.body, label %while.end19

while.body:                                       ; preds = %land.end
  br label %while.cond3

while.cond3:                                      ; preds = %sw.epilog, %while.body
  %8 = load i8*** %av, align 8
  %arrayidx4 = getelementptr inbounds i8** %8, i64 0
  %9 = load i8** %arrayidx4, align 8
  %incdec.ptr5 = getelementptr inbounds i8* %9, i32 1
  store i8* %incdec.ptr5, i8** %arrayidx4, align 8
  %10 = load i8* %incdec.ptr5, align 1
  %tobool = icmp ne i8 %10, 0
  br i1 %tobool, label %while.body6, label %while.end

while.body6:                                      ; preds = %while.cond3
  %11 = load i8*** %av, align 8
  %arrayidx7 = getelementptr inbounds i8** %11, i64 0
  %12 = load i8** %arrayidx7, align 8
  %13 = load i8* %12, align 1
  %conv8 = sext i8 %13 to i32
  switch i32 %conv8, label %sw.epilog [
    i32 100, label %sw.bb
    i32 114, label %sw.bb9
    i32 118, label %sw.bb11
    i32 113, label %sw.bb13
    i32 102, label %sw.bb15
  ]

sw.bb:                                            ; preds = %while.body6
  %14 = load i32* @options, align 4
  %or = or i32 %14, 1
  store i32 %or, i32* @options, align 4
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body6
  %15 = load i32* @options, align 4
  %or10 = or i32 %15, 5
  store i32 %or10, i32* @options, align 4
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body6
  %16 = load i32* @pingflags, align 4
  %or12 = or i32 %16, 1
  store i32 %or12, i32* @pingflags, align 4
  br label %sw.epilog

sw.bb13:                                          ; preds = %while.body6
  %17 = load i32* @pingflags, align 4
  %or14 = or i32 %17, 2
  store i32 %or14, i32* @pingflags, align 4
  br label %sw.epilog

sw.bb15:                                          ; preds = %while.body6
  %18 = load i32* @pingflags, align 4
  %or16 = or i32 %18, 4
  store i32 %or16, i32* @pingflags, align 4
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb15, %sw.bb13, %sw.bb11, %sw.bb9, %sw.bb, %while.body6
  br label %while.cond3

while.end:                                        ; preds = %while.cond3
  %19 = load i32* %argc.addr, align 4
  %dec17 = add nsw i32 %19, -1
  store i32 %dec17, i32* %argc.addr, align 4
  %20 = load i8*** %av, align 8
  %incdec.ptr18 = getelementptr inbounds i8** %20, i32 1
  store i8** %incdec.ptr18, i8*** %av, align 8
  br label %while.cond

while.end19:                                      ; preds = %land.end
  %21 = load i32* %argc.addr, align 4
  %cmp20 = icmp slt i32 %21, 1
  br i1 %cmp20, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end19
  %22 = load i32* %argc.addr, align 4
  %cmp22 = icmp sgt i32 %22, 4
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %while.end19
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @usage, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @llvm.memset.p0i8.i64(i8* bitcast (%struct.sockaddr* @whereto to i8*), i8 0, i64 16, i32 1, i1 false)
  %23 = load %struct.sockaddr_in** %to, align 8
  %sin_family = getelementptr inbounds %struct.sockaddr_in* %23, i32 0, i32 0
  store i16 2, i16* %sin_family, align 2
  %24 = load i8*** %av, align 8
  %arrayidx24 = getelementptr inbounds i8** %24, i64 0
  %25 = load i8** %arrayidx24, align 8
  %call25 = call i32 (i8*, ...)* bitcast (i32 (...)* @inet_addr to i32 (i8*, ...)*)(i8* %25)
  %26 = load %struct.sockaddr_in** %to, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in* %26, i32 0, i32 2
  %s_addr = getelementptr inbounds %struct.in_addr* %sin_addr, i32 0, i32 0
  store i32 %call25, i32* %s_addr, align 4
  %27 = load %struct.sockaddr_in** %to, align 8
  %sin_addr26 = getelementptr inbounds %struct.sockaddr_in* %27, i32 0, i32 2
  %s_addr27 = getelementptr inbounds %struct.in_addr* %sin_addr26, i32 0, i32 0
  %28 = load i32* %s_addr27, align 4
  %cmp28 = icmp ne i32 %28, -1
  br i1 %cmp28, label %if.then30, label %if.else

if.then30:                                        ; preds = %if.end
  %29 = load i8*** %av, align 8
  %arrayidx31 = getelementptr inbounds i8** %29, i64 0
  %30 = load i8** %arrayidx31, align 8
  %call32 = call i8* @strcpy(i8* getelementptr inbounds ([64 x i8]* @hnamebuf, i32 0, i32 0), i8* %30)
  store i8* getelementptr inbounds ([64 x i8]* @hnamebuf, i32 0, i32 0), i8** @hostname, align 8
  br label %if.end47

if.else:                                          ; preds = %if.end
  %31 = load i8*** %av, align 8
  %arrayidx33 = getelementptr inbounds i8** %31, i64 0
  %32 = load i8** %arrayidx33, align 8
  %call34 = call %struct.hostent* @gethostbyname(i8* %32)
  store %struct.hostent* %call34, %struct.hostent** @hp, align 8
  %33 = load %struct.hostent** @hp, align 8
  %tobool35 = icmp ne %struct.hostent* %33, null
  br i1 %tobool35, label %if.then36, label %if.else42

if.then36:                                        ; preds = %if.else
  %34 = load %struct.hostent** @hp, align 8
  %h_addrtype = getelementptr inbounds %struct.hostent* %34, i32 0, i32 2
  %35 = load i32* %h_addrtype, align 4
  %conv37 = trunc i32 %35 to i16
  %36 = load %struct.sockaddr_in** %to, align 8
  %sin_family38 = getelementptr inbounds %struct.sockaddr_in* %36, i32 0, i32 0
  store i16 %conv37, i16* %sin_family38, align 2
  %37 = load %struct.hostent** @hp, align 8
  %h_addr_list = getelementptr inbounds %struct.hostent* %37, i32 0, i32 4
  %38 = load i8*** %h_addr_list, align 8
  %arrayidx39 = getelementptr inbounds i8** %38, i64 0
  %39 = load i8** %arrayidx39, align 8
  %40 = load %struct.sockaddr_in** %to, align 8
  %sin_addr40 = getelementptr inbounds %struct.sockaddr_in* %40, i32 0, i32 2
  %41 = bitcast %struct.in_addr* %sin_addr40 to i8*
  %42 = load %struct.hostent** @hp, align 8
  %h_length = getelementptr inbounds %struct.hostent* %42, i32 0, i32 3
  %43 = load i32* %h_length, align 4
  %call41 = call i32 (i8*, i8*, i32, ...)* bitcast (i32 (...)* @bcopy to i32 (i8*, i8*, i32, ...)*)(i8* %39, i8* %41, i32 %43)
  %44 = load %struct.hostent** @hp, align 8
  %h_name = getelementptr inbounds %struct.hostent* %44, i32 0, i32 0
  %45 = load i8** %h_name, align 8
  store i8* %45, i8** @hostname, align 8
  br label %if.end46

if.else42:                                        ; preds = %if.else
  %46 = load i8*** %argv.addr, align 8
  %arrayidx43 = getelementptr inbounds i8** %46, i64 0
  %47 = load i8** %arrayidx43, align 8
  %48 = load i8*** %av, align 8
  %arrayidx44 = getelementptr inbounds i8** %48, i64 0
  %49 = load i8** %arrayidx44, align 8
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i8* %47, i8* %49)
  call void @exit(i32 1) #6
  unreachable

if.end46:                                         ; preds = %if.then36
  br label %if.end47

if.end47:                                         ; preds = %if.end46, %if.then30
  %50 = load i32* %argc.addr, align 4
  %cmp48 = icmp sge i32 %50, 2
  br i1 %cmp48, label %if.then50, label %if.else53

if.then50:                                        ; preds = %if.end47
  %51 = load i8*** %av, align 8
  %arrayidx51 = getelementptr inbounds i8** %51, i64 1
  %52 = load i8** %arrayidx51, align 8
  %call52 = call i32 (i8*, ...)* bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %52)
  store i32 %call52, i32* @datalen, align 4
  br label %if.end54

if.else53:                                        ; preds = %if.end47
  store i32 56, i32* @datalen, align 4
  br label %if.end54

if.end54:                                         ; preds = %if.else53, %if.then50
  %53 = load i32* @datalen, align 4
  %cmp55 = icmp sgt i32 %53, 4096
  br i1 %cmp55, label %if.then57, label %if.end59

if.then57:                                        ; preds = %if.end54
  %54 = load %struct._IO_FILE** @stderr, align 8
  %call58 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

if.end59:                                         ; preds = %if.end54
  %55 = load i32* @datalen, align 4
  %conv60 = sext i32 %55 to i64
  %cmp61 = icmp uge i64 %conv60, 16
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end59
  store i32 1, i32* @timing, align 4
  br label %if.end64

if.end64:                                         ; preds = %if.then63, %if.end59
  %56 = load i32* %argc.addr, align 4
  %cmp65 = icmp sge i32 %56, 3
  br i1 %cmp65, label %if.then67, label %if.end70

if.then67:                                        ; preds = %if.end64
  %57 = load i8*** %av, align 8
  %arrayidx68 = getelementptr inbounds i8** %57, i64 2
  %58 = load i8** %arrayidx68, align 8
  %call69 = call i32 (i8*, ...)* bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %58)
  store i32 %call69, i32* @npackets, align 4
  br label %if.end70

if.end70:                                         ; preds = %if.then67, %if.end64
  %59 = load i32* %argc.addr, align 4
  %cmp71 = icmp eq i32 %59, 4
  br i1 %cmp71, label %if.then73, label %if.end76

if.then73:                                        ; preds = %if.end70
  %60 = load i8*** %av, align 8
  %arrayidx74 = getelementptr inbounds i8** %60, i64 3
  %61 = load i8** %arrayidx74, align 8
  %call75 = call i32 (i8*, ...)* bitcast (i32 (...)* @atoi to i32 (i8*, ...)*)(i8* %61)
  store i32 %call75, i32* @preload, align 4
  br label %if.end76

if.end76:                                         ; preds = %if.then73, %if.end70
  %call77 = call i32 (...)* @getpid()
  %and = and i32 %call77, 65535
  store i32 %and, i32* @ident, align 4
  %call78 = call %struct.protoent* @getprotobyname(i8* getelementptr inbounds ([5 x i8]* @.str2, i32 0, i32 0))
  store %struct.protoent* %call78, %struct.protoent** %proto, align 8
  %cmp79 = icmp eq %struct.protoent* %call78, null
  br i1 %cmp79, label %if.then81, label %if.end83

if.then81:                                        ; preds = %if.end76
  %62 = load %struct._IO_FILE** @stderr, align 8
  %call82 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %62, i8* getelementptr inbounds ([24 x i8]* @.str3, i32 0, i32 0))
  call void @exit(i32 10) #6
  unreachable

if.end83:                                         ; preds = %if.end76
  %63 = load %struct.protoent** %proto, align 8
  %p_proto = getelementptr inbounds %struct.protoent* %63, i32 0, i32 2
  %64 = load i32* %p_proto, align 4
  %call84 = call i32 @socket(i32 2, i32 3, i32 %64) #3
  store i32 %call84, i32* @s, align 4
  %cmp85 = icmp slt i32 %call84, 0
  br i1 %cmp85, label %if.then87, label %if.end88

if.then87:                                        ; preds = %if.end83
  call void @perror(i8* getelementptr inbounds ([13 x i8]* @.str4, i32 0, i32 0))
  call void @exit(i32 5) #6
  unreachable

if.end88:                                         ; preds = %if.end83
  %65 = load i32* @options, align 4
  %and89 = and i32 %65, 1
  %tobool90 = icmp ne i32 %and89, 0
  br i1 %tobool90, label %if.then91, label %if.end98

if.then91:                                        ; preds = %if.end88
  %66 = load i32* @pingflags, align 4
  %and92 = and i32 %66, 1
  %tobool93 = icmp ne i32 %and92, 0
  br i1 %tobool93, label %if.then94, label %if.end96

if.then94:                                        ; preds = %if.then91
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0))
  br label %if.end96

if.end96:                                         ; preds = %if.then94, %if.then91
  %67 = load i32* @s, align 4
  %68 = bitcast i32* %on to i8*
  %call97 = call i32 @setsockopt(i32 %67, i32 1, i32 1, i8* %68, i32 4) #3
  br label %if.end98

if.end98:                                         ; preds = %if.end96, %if.end88
  %69 = load i32* @options, align 4
  %and99 = and i32 %69, 5
  %tobool100 = icmp ne i32 %and99, 0
  br i1 %tobool100, label %if.then101, label %if.end108

if.then101:                                       ; preds = %if.end98
  %70 = load i32* @pingflags, align 4
  %and102 = and i32 %70, 1
  %tobool103 = icmp ne i32 %and102, 0
  br i1 %tobool103, label %if.then104, label %if.end106

if.then104:                                       ; preds = %if.then101
  %call105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0))
  br label %if.end106

if.end106:                                        ; preds = %if.then104, %if.then101
  %71 = load i32* @s, align 4
  %72 = bitcast i32* %on to i8*
  %call107 = call i32 @setsockopt(i32 %71, i32 1, i32 5, i8* %72, i32 4) #3
  br label %if.end108

if.end108:                                        ; preds = %if.end106, %if.end98
  %73 = load %struct.sockaddr_in** %to, align 8
  %sin_family109 = getelementptr inbounds %struct.sockaddr_in* %73, i32 0, i32 0
  %74 = load i16* %sin_family109, align 2
  %conv110 = zext i16 %74 to i32
  %cmp111 = icmp eq i32 %conv110, 2
  br i1 %cmp111, label %if.then113, label %if.else117

if.then113:                                       ; preds = %if.end108
  %75 = load i8** @hostname, align 8
  %76 = load %struct.sockaddr_in** %to, align 8
  %sin_addr114 = getelementptr inbounds %struct.sockaddr_in* %76, i32 0, i32 2
  %coerce.dive = getelementptr %struct.in_addr* %sin_addr114, i32 0, i32 0
  %77 = load i32* %coerce.dive
  %call115 = call i8* (i32, ...)* bitcast (i8* (...)* @inet_ntoa to i8* (i32, ...)*)(i32 %77)
  %78 = load i32* @datalen, align 4
  %call116 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i8* %75, i8* %call115, i32 %78)
  br label %if.end119

if.else117:                                       ; preds = %if.end108
  %79 = load i8** @hostname, align 8
  %80 = load i32* @datalen, align 4
  %call118 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str8, i32 0, i32 0), i8* %79, i32 %80)
  br label %if.end119

if.end119:                                        ; preds = %if.else117, %if.then113
  %81 = load %struct._IO_FILE** @stdout, align 8
  call void @setlinebuf(%struct._IO_FILE* %81) #3
  %call120 = call void (i32)* (i32, void (i32)*)* @signal(i32 2, void (i32)* bitcast (i32 ()* @finish to void (i32)*)) #3
  %call121 = call void (i32)* (i32, void (i32)*)* @signal(i32 14, void (i32)* bitcast (i32 ()* @catcher to void (i32)*)) #3
  store i32 0, i32* @i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end119
  %82 = load i32* @i, align 4
  %83 = load i32* @preload, align 4
  %cmp122 = icmp slt i32 %82, %83
  br i1 %cmp122, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call124 = call i32 @pinger()
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %84 = load i32* @i, align 4
  %inc = add nsw i32 %84, 1
  store i32 %inc, i32* @i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %85 = load i32* @pingflags, align 4
  %and125 = and i32 %85, 4
  %tobool126 = icmp ne i32 %and125, 0
  br i1 %tobool126, label %if.end129, label %if.then127

if.then127:                                       ; preds = %for.end
  %call128 = call i32 @catcher()
  br label %if.end129

if.end129:                                        ; preds = %if.then127, %for.end
  br label %for.cond130

for.cond130:                                      ; preds = %if.end159, %if.end151, %if.then150, %if.then138, %if.end129
  store i32 4096, i32* %len, align 4
  store i32 16, i32* %fromlen, align 4
  %86 = load i32* @s, align 4
  %shl = shl i32 1, %86
  store i32 %shl, i32* %fdmask, align 4
  %tv_sec = getelementptr inbounds %struct.timeval* %timeout, i32 0, i32 0
  store i64 0, i64* %tv_sec, align 8
  %tv_usec = getelementptr inbounds %struct.timeval* %timeout, i32 0, i32 1
  store i64 10000, i64* %tv_usec, align 8
  %87 = load i32* @pingflags, align 4
  %and131 = and i32 %87, 4
  %tobool132 = icmp ne i32 %and131, 0
  br i1 %tobool132, label %if.then133, label %if.end140

if.then133:                                       ; preds = %for.cond130
  %call134 = call i32 @pinger()
  %88 = bitcast i32* %fdmask to %struct.fd_set*
  %call135 = call i32 @select(i32 32, %struct.fd_set* %88, %struct.fd_set* null, %struct.fd_set* null, %struct.timeval* %timeout)
  %cmp136 = icmp eq i32 %call135, 0
  br i1 %cmp136, label %if.then138, label %if.end139

if.then138:                                       ; preds = %if.then133
  br label %for.cond130

if.end139:                                        ; preds = %if.then133
  br label %if.end140

if.end140:                                        ; preds = %if.end139, %for.cond130
  %89 = load i32* @s, align 4
  %90 = load i32* %len, align 4
  %conv141 = sext i32 %90 to i64
  %91 = bitcast %struct.sockaddr_in* %from to %struct.sockaddr*
  %call142 = call i64 @recvfrom(i32 %89, i8* getelementptr inbounds ([4096 x i8]* @packet, i32 0, i32 0), i64 %conv141, i32 0, %struct.sockaddr* %91, i32* %fromlen)
  %conv143 = trunc i64 %call142 to i32
  store i32 %conv143, i32* %cc, align 4
  %cmp144 = icmp slt i32 %conv143, 0
  br i1 %cmp144, label %if.then146, label %if.end152

if.then146:                                       ; preds = %if.end140
  %call147 = call i32* @__errno_location() #7
  %92 = load i32* %call147, align 4
  %cmp148 = icmp eq i32 %92, 4
  br i1 %cmp148, label %if.then150, label %if.end151

if.then150:                                       ; preds = %if.then146
  br label %for.cond130

if.end151:                                        ; preds = %if.then146
  call void @perror(i8* getelementptr inbounds ([15 x i8]* @.str9, i32 0, i32 0))
  br label %for.cond130

if.end152:                                        ; preds = %if.end140
  %93 = load i32* %cc, align 4
  %call153 = call i32 @pr_pack(i8* getelementptr inbounds ([4096 x i8]* @packet, i32 0, i32 0), i32 %93, %struct.sockaddr_in* %from)
  %94 = load i32* @npackets, align 4
  %tobool154 = icmp ne i32 %94, 0
  br i1 %tobool154, label %land.lhs.true, label %if.end159

land.lhs.true:                                    ; preds = %if.end152
  %95 = load i32* @nreceived, align 4
  %96 = load i32* @npackets, align 4
  %cmp155 = icmp sge i32 %95, %96
  br i1 %cmp155, label %if.then157, label %if.end159

if.then157:                                       ; preds = %land.lhs.true
  %call158 = call i32 @finish()
  br label %if.end159

if.end159:                                        ; preds = %if.then157, %land.lhs.true, %if.end152
  br label %for.cond130

return:                                           ; No predecessors!
  %97 = load i32* %retval
  ret i32 %97
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn
declare void @exit(i32) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

declare i32 @inet_addr(...) #1

declare i8* @strcpy(i8*, i8*) #1

declare %struct.hostent* @gethostbyname(i8*) #1

declare i32 @bcopy(...) #1

declare i32 @atoi(...) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @getpid(...) #1

declare %struct.protoent* @getprotobyname(i8*) #1

; Function Attrs: nounwind
declare i32 @socket(i32, i32, i32) #4

declare void @perror(i8*) #1

; Function Attrs: nounwind
declare i32 @setsockopt(i32, i32, i32, i8*, i32) #4

declare i8* @inet_ntoa(...) #1

; Function Attrs: nounwind
declare void @setlinebuf(%struct._IO_FILE*) #4

; Function Attrs: nounwind
declare void (i32)* @signal(i32, void (i32)*) #4

declare i32 @select(i32, %struct.fd_set*, %struct.fd_set*, %struct.fd_set*, %struct.timeval*) #1

declare i64 @recvfrom(i32, i8*, i64, i32, %struct.sockaddr*, i32*) #1

; Function Attrs: nounwind readnone
declare i32* @__errno_location() #5

; Function Attrs: nounwind uwtable
define i32 @catcher() #0 {
entry:
  %retval = alloca i32, align 4
  %waittime = alloca i32, align 4
  %call = call i32 @pinger()
  %0 = load i32* @npackets, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* @ntransmitted, align 4
  %2 = load i32* @npackets, align 4
  %cmp1 = icmp slt i32 %1, %2
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %call2 = call i32 (i32, ...)* bitcast (i32 (...)* @alarm to i32 (i32, ...)*)(i32 1)
  br label %if.end10

if.else:                                          ; preds = %lor.lhs.false
  %3 = load i32* @nreceived, align 4
  %tobool = icmp ne i32 %3, 0
  br i1 %tobool, label %if.then3, label %if.else6

if.then3:                                         ; preds = %if.else
  %4 = load i32* @tmax, align 4
  %mul = mul nsw i32 2, %4
  %div = sdiv i32 %mul, 1000
  store i32 %div, i32* %waittime, align 4
  %5 = load i32* %waittime, align 4
  %cmp4 = icmp eq i32 %5, 0
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.then3
  store i32 1, i32* %waittime, align 4
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.then3
  br label %if.end7

if.else6:                                         ; preds = %if.else
  store i32 10, i32* %waittime, align 4
  br label %if.end7

if.end7:                                          ; preds = %if.else6, %if.end
  %call8 = call void (i32)* (i32, void (i32)*)* @signal(i32 14, void (i32)* bitcast (i32 ()* @finish to void (i32)*)) #3
  %6 = load i32* %waittime, align 4
  %call9 = call i32 (i32, ...)* bitcast (i32 (...)* @alarm to i32 (i32, ...)*)(i32 %6)
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.then
  %7 = load i32* %retval
  ret i32 %7
}

declare i32 @alarm(...) #1

; Function Attrs: nounwind uwtable
define i32 @pinger() #0 {
entry:
  %retval = alloca i32, align 4
  %icp = alloca %struct.icmp*, align 8
  %i = alloca i32, align 4
  %cc = alloca i32, align 4
  %tp = alloca %struct.timeval*, align 8
  %datap = alloca i8*, align 8
  store %struct.icmp* bitcast ([4096 x i8]* @pinger.outpack to %struct.icmp*), %struct.icmp** %icp, align 8
  store %struct.timeval* bitcast (i8* getelementptr inbounds ([4096 x i8]* @pinger.outpack, i32 0, i64 8) to %struct.timeval*), %struct.timeval** %tp, align 8
  store i8* getelementptr inbounds ([4096 x i8]* @pinger.outpack, i32 0, i64 24), i8** %datap, align 8
  %0 = load %struct.icmp** %icp, align 8
  %icmp_type = getelementptr inbounds %struct.icmp* %0, i32 0, i32 0
  store i8 8, i8* %icmp_type, align 1
  %1 = load %struct.icmp** %icp, align 8
  %icmp_code = getelementptr inbounds %struct.icmp* %1, i32 0, i32 1
  store i8 0, i8* %icmp_code, align 1
  %2 = load %struct.icmp** %icp, align 8
  %icmp_cksum = getelementptr inbounds %struct.icmp* %2, i32 0, i32 2
  store i16 0, i16* %icmp_cksum, align 2
  %3 = load i32* @ntransmitted, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* @ntransmitted, align 4
  %conv = trunc i32 %3 to i16
  %4 = load %struct.icmp** %icp, align 8
  %icmp_hun = getelementptr inbounds %struct.icmp* %4, i32 0, i32 3
  %ih_idseq = bitcast %union.anon* %icmp_hun to %struct.ih_idseq*
  %icd_seq = getelementptr inbounds %struct.ih_idseq* %ih_idseq, i32 0, i32 1
  store i16 %conv, i16* %icd_seq, align 2
  %5 = load i32* @ident, align 4
  %conv1 = trunc i32 %5 to i16
  %6 = load %struct.icmp** %icp, align 8
  %icmp_hun2 = getelementptr inbounds %struct.icmp* %6, i32 0, i32 3
  %ih_idseq3 = bitcast %union.anon* %icmp_hun2 to %struct.ih_idseq*
  %icd_id = getelementptr inbounds %struct.ih_idseq* %ih_idseq3, i32 0, i32 0
  store i16 %conv1, i16* %icd_id, align 2
  %7 = load i32* @datalen, align 4
  %add = add nsw i32 %7, 8
  store i32 %add, i32* %cc, align 4
  %8 = load i32* @timing, align 4
  %tobool = icmp ne i32 %8, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %9 = load %struct.timeval** %tp, align 8
  %call = call i32 @gettimeofday(%struct.timeval* %9, %struct.timezone* @tz) #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  store i32 8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %10 = load i32* %i, align 4
  %11 = load i32* @datalen, align 4
  %cmp = icmp slt i32 %10, %11
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %12 = load i32* %i, align 4
  %conv5 = trunc i32 %12 to i8
  %13 = load i8** %datap, align 8
  %incdec.ptr = getelementptr inbounds i8* %13, i32 1
  store i8* %incdec.ptr, i8** %datap, align 8
  store i8 %conv5, i8* %13, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32* %i, align 4
  %inc6 = add nsw i32 %14, 1
  store i32 %inc6, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %15 = load %struct.icmp** %icp, align 8
  %16 = load i32* %cc, align 4
  %call7 = call i32 (%struct.icmp*, i32, ...)* bitcast (i32 (i16*, i32)* @in_cksum to i32 (%struct.icmp*, i32, ...)*)(%struct.icmp* %15, i32 %16)
  %conv8 = trunc i32 %call7 to i16
  %17 = load %struct.icmp** %icp, align 8
  %icmp_cksum9 = getelementptr inbounds %struct.icmp* %17, i32 0, i32 2
  store i16 %conv8, i16* %icmp_cksum9, align 2
  %18 = load i32* @s, align 4
  %19 = load i32* %cc, align 4
  %conv10 = sext i32 %19 to i64
  %call11 = call i64 @sendto(i32 %18, i8* getelementptr inbounds ([4096 x i8]* @pinger.outpack, i32 0, i32 0), i64 %conv10, i32 0, %struct.sockaddr* @whereto, i32 16)
  %conv12 = trunc i64 %call11 to i32
  store i32 %conv12, i32* %i, align 4
  %20 = load i32* %i, align 4
  %cmp13 = icmp slt i32 %20, 0
  br i1 %cmp13, label %if.then17, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end
  %21 = load i32* %i, align 4
  %22 = load i32* %cc, align 4
  %cmp15 = icmp ne i32 %21, %22
  br i1 %cmp15, label %if.then17, label %if.end24

if.then17:                                        ; preds = %lor.lhs.false, %for.end
  %23 = load i32* %i, align 4
  %cmp18 = icmp slt i32 %23, 0
  br i1 %cmp18, label %if.then20, label %if.end21

if.then20:                                        ; preds = %if.then17
  call void @perror(i8* getelementptr inbounds ([7 x i8]* @.str10, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.then20, %if.then17
  %24 = load i8** @hostname, align 8
  %25 = load i32* %cc, align 4
  %26 = load i32* %i, align 4
  %call22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str11, i32 0, i32 0), i8* %24, i32 %25, i32 %26)
  %27 = load %struct._IO_FILE** @stdout, align 8
  %call23 = call i32 @fflush(%struct._IO_FILE* %27)
  br label %if.end24

if.end24:                                         ; preds = %if.end21, %lor.lhs.false
  %28 = load i32* @pingflags, align 4
  %cmp25 = icmp eq i32 %28, 4
  br i1 %cmp25, label %if.then27, label %if.end30

if.then27:                                        ; preds = %if.end24
  %call28 = call i32 @putchar(i32 46)
  %29 = load %struct._IO_FILE** @stdout, align 8
  %call29 = call i32 @fflush(%struct._IO_FILE* %29)
  br label %if.end30

if.end30:                                         ; preds = %if.then27, %if.end24
  %30 = load i32* %retval
  ret i32 %30
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval*, %struct.timezone*) #4

declare i64 @sendto(i32, i8*, i64, i32, %struct.sockaddr*, i32) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @putchar(i32) #1

; Function Attrs: nounwind uwtable
define i8* @pr_type(i32 %t) #0 {
entry:
  %retval = alloca i8*, align 8
  %t.addr = alloca i32, align 4
  store i32 %t, i32* %t.addr, align 4
  %0 = load i32* %t.addr, align 4
  %cmp = icmp slt i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %t.addr, align 4
  %cmp1 = icmp sgt i32 %1, 16
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i8* getelementptr inbounds ([13 x i8]* @.str29, i32 0, i32 0), i8** %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32* %t.addr, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [17 x i8*]* @pr_type.ttab, i32 0, i64 %idxprom
  %3 = load i8** %arrayidx, align 8
  store i8* %3, i8** %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i8** %retval
  ret i8* %4
}

; Function Attrs: nounwind uwtable
define i32 @pr_pack(i8* %buf, i32 %cc, %struct.sockaddr_in* %from) #0 {
entry:
  %retval = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %cc.addr = alloca i32, align 4
  %from.addr = alloca %struct.sockaddr_in*, align 8
  %ip = alloca %struct.ip*, align 8
  %icp = alloca %struct.icmp*, align 8
  %lp = alloca i64*, align 8
  %i = alloca i32, align 4
  %tv = alloca %struct.timeval, align 8
  %tp = alloca %struct.timeval*, align 8
  %hlen = alloca i32, align 4
  %triptime = alloca i32, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %cc, i32* %cc.addr, align 4
  store %struct.sockaddr_in* %from, %struct.sockaddr_in** %from.addr, align 8
  store i64* bitcast ([4096 x i8]* @packet to i64*), i64** %lp, align 8
  %0 = load %struct.sockaddr_in** %from.addr, align 8
  %sin_addr = getelementptr inbounds %struct.sockaddr_in* %0, i32 0, i32 2
  %s_addr = getelementptr inbounds %struct.in_addr* %sin_addr, i32 0, i32 0
  %1 = load i32* %s_addr, align 4
  %call = call i32 @ntohl(i32 %1) #7
  %2 = load %struct.sockaddr_in** %from.addr, align 8
  %sin_addr1 = getelementptr inbounds %struct.sockaddr_in* %2, i32 0, i32 2
  %s_addr2 = getelementptr inbounds %struct.in_addr* %sin_addr1, i32 0, i32 0
  store i32 %call, i32* %s_addr2, align 4
  %call3 = call i32 @gettimeofday(%struct.timeval* %tv, %struct.timezone* @tz) #3
  %3 = load i8** %buf.addr, align 8
  %4 = bitcast i8* %3 to %struct.ip*
  store %struct.ip* %4, %struct.ip** %ip, align 8
  %5 = load %struct.ip** %ip, align 8
  %6 = bitcast %struct.ip* %5 to i8*
  %bf.load = load i8* %6, align 4
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %shl = shl i32 %bf.cast, 2
  store i32 %shl, i32* %hlen, align 4
  %7 = load i32* %cc.addr, align 4
  %8 = load i32* %hlen, align 4
  %add = add nsw i32 %8, 8
  %cmp = icmp slt i32 %7, %add
  br i1 %cmp, label %if.then, label %if.end10

if.then:                                          ; preds = %entry
  %9 = load i32* @pingflags, align 4
  %and = and i32 %9, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then4, label %if.end

if.then4:                                         ; preds = %if.then
  %10 = load i32* %cc.addr, align 4
  %11 = load %struct.sockaddr_in** %from.addr, align 8
  %sin_addr5 = getelementptr inbounds %struct.sockaddr_in* %11, i32 0, i32 2
  %s_addr6 = getelementptr inbounds %struct.in_addr* %sin_addr5, i32 0, i32 0
  %12 = load i32* %s_addr6, align 4
  %call7 = call i32 @ntohl(i32 %12) #7
  %call8 = call i8* (i32, ...)* bitcast (i8* (...)* @inet_ntoa to i8* (i32, ...)*)(i32 %call7)
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([37 x i8]* @.str30, i32 0, i32 0), i32 %10, i8* %call8)
  br label %if.end

if.end:                                           ; preds = %if.then4, %if.then
  store i32 0, i32* %retval
  br label %return

if.end10:                                         ; preds = %entry
  %13 = load i32* %hlen, align 4
  %14 = load i32* %cc.addr, align 4
  %sub = sub nsw i32 %14, %13
  store i32 %sub, i32* %cc.addr, align 4
  %15 = load i8** %buf.addr, align 8
  %16 = load i32* %hlen, align 4
  %idx.ext = sext i32 %16 to i64
  %add.ptr = getelementptr inbounds i8* %15, i64 %idx.ext
  %17 = bitcast i8* %add.ptr to %struct.icmp*
  store %struct.icmp* %17, %struct.icmp** %icp, align 8
  %18 = load i32* @pingflags, align 4
  %and11 = and i32 %18, 2
  %tobool12 = icmp ne i32 %and11, 0
  br i1 %tobool12, label %if.end35, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end10
  %19 = load %struct.icmp** %icp, align 8
  %icmp_type = getelementptr inbounds %struct.icmp* %19, i32 0, i32 0
  %20 = load i8* %icmp_type, align 1
  %conv = zext i8 %20 to i32
  %cmp13 = icmp ne i32 %conv, 0
  br i1 %cmp13, label %if.then15, label %if.end35

if.then15:                                        ; preds = %land.lhs.true
  %21 = load i32* %cc.addr, align 4
  %22 = load %struct.sockaddr_in** %from.addr, align 8
  %sin_addr16 = getelementptr inbounds %struct.sockaddr_in* %22, i32 0, i32 2
  %s_addr17 = getelementptr inbounds %struct.in_addr* %sin_addr16, i32 0, i32 0
  %23 = load i32* %s_addr17, align 4
  %call18 = call i32 @ntohl(i32 %23) #7
  %call19 = call i8* (i32, ...)* bitcast (i8* (...)* @inet_ntoa to i8* (i32, ...)*)(i32 %call18)
  %24 = load %struct.icmp** %icp, align 8
  %icmp_type20 = getelementptr inbounds %struct.icmp* %24, i32 0, i32 0
  %25 = load i8* %icmp_type20, align 1
  %conv21 = zext i8 %25 to i32
  %26 = load %struct.icmp** %icp, align 8
  %icmp_type22 = getelementptr inbounds %struct.icmp* %26, i32 0, i32 0
  %27 = load i8* %icmp_type22, align 1
  %conv23 = zext i8 %27 to i32
  %call24 = call i8* @pr_type(i32 %conv23)
  %28 = load %struct.icmp** %icp, align 8
  %icmp_code = getelementptr inbounds %struct.icmp* %28, i32 0, i32 1
  %29 = load i8* %icmp_code, align 1
  %conv25 = zext i8 %29 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([50 x i8]* @.str31, i32 0, i32 0), i32 %21, i8* %call19, i32 %conv21, i8* %call24, i32 %conv25)
  %30 = load i32* @pingflags, align 4
  %and27 = and i32 %30, 1
  %tobool28 = icmp ne i32 %and27, 0
  br i1 %tobool28, label %if.then29, label %if.end34

if.then29:                                        ; preds = %if.then15
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.then29
  %31 = load i32* %i, align 4
  %cmp30 = icmp slt i32 %31, 12
  br i1 %cmp30, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %32 = load i32* %i, align 4
  %conv32 = sext i32 %32 to i64
  %mul = mul i64 %conv32, 8
  %33 = load i64** %lp, align 8
  %incdec.ptr = getelementptr inbounds i64* %33, i32 1
  store i64* %incdec.ptr, i64** %lp, align 8
  %34 = load i64* %33, align 8
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str32, i32 0, i32 0), i64 %mul, i64 %34)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %35 = load i32* %i, align 4
  %inc = add nsw i32 %35, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end34

if.end34:                                         ; preds = %for.end, %if.then15
  store i32 0, i32* %retval
  br label %return

if.end35:                                         ; preds = %land.lhs.true, %if.end10
  %36 = load %struct.icmp** %icp, align 8
  %icmp_hun = getelementptr inbounds %struct.icmp* %36, i32 0, i32 3
  %ih_idseq = bitcast %union.anon* %icmp_hun to %struct.ih_idseq*
  %icd_id = getelementptr inbounds %struct.ih_idseq* %ih_idseq, i32 0, i32 0
  %37 = load i16* %icd_id, align 2
  %conv36 = zext i16 %37 to i32
  %38 = load i32* @ident, align 4
  %cmp37 = icmp ne i32 %conv36, %38
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end35
  store i32 0, i32* %retval
  br label %return

if.end40:                                         ; preds = %if.end35
  %39 = load i32* @timing, align 4
  %tobool41 = icmp ne i32 %39, 0
  br i1 %tobool41, label %if.then42, label %if.end56

if.then42:                                        ; preds = %if.end40
  %40 = load %struct.icmp** %icp, align 8
  %icmp_dun = getelementptr inbounds %struct.icmp* %40, i32 0, i32 4
  %id_data = bitcast %union.anon.0* %icmp_dun to [1 x i8]*
  %arrayidx = getelementptr inbounds [1 x i8]* %id_data, i32 0, i64 0
  %41 = bitcast i8* %arrayidx to %struct.timeval*
  store %struct.timeval* %41, %struct.timeval** %tp, align 8
  %42 = load %struct.timeval** %tp, align 8
  %call43 = call i32 @tvsub(%struct.timeval* %tv, %struct.timeval* %42)
  %tv_sec = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 0
  %43 = load i64* %tv_sec, align 8
  %mul44 = mul nsw i64 %43, 1000
  %tv_usec = getelementptr inbounds %struct.timeval* %tv, i32 0, i32 1
  %44 = load i64* %tv_usec, align 8
  %div = sdiv i64 %44, 1000
  %add45 = add nsw i64 %mul44, %div
  %conv46 = trunc i64 %add45 to i32
  store i32 %conv46, i32* %triptime, align 4
  %45 = load i32* %triptime, align 4
  %46 = load i32* @tsum, align 4
  %add47 = add nsw i32 %46, %45
  store i32 %add47, i32* @tsum, align 4
  %47 = load i32* %triptime, align 4
  %48 = load i32* @tmin, align 4
  %cmp48 = icmp slt i32 %47, %48
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.then42
  %49 = load i32* %triptime, align 4
  store i32 %49, i32* @tmin, align 4
  br label %if.end51

if.end51:                                         ; preds = %if.then50, %if.then42
  %50 = load i32* %triptime, align 4
  %51 = load i32* @tmax, align 4
  %cmp52 = icmp sgt i32 %50, %51
  br i1 %cmp52, label %if.then54, label %if.end55

if.then54:                                        ; preds = %if.end51
  %52 = load i32* %triptime, align 4
  store i32 %52, i32* @tmax, align 4
  br label %if.end55

if.end55:                                         ; preds = %if.then54, %if.end51
  br label %if.end56

if.end56:                                         ; preds = %if.end55, %if.end40
  %53 = load i32* @pingflags, align 4
  %and57 = and i32 %53, 2
  %tobool58 = icmp ne i32 %and57, 0
  br i1 %tobool58, label %if.end78, label %if.then59

if.then59:                                        ; preds = %if.end56
  %54 = load i32* @pingflags, align 4
  %cmp60 = icmp ne i32 %54, 4
  br i1 %cmp60, label %if.then62, label %if.else74

if.then62:                                        ; preds = %if.then59
  %55 = load i32* %cc.addr, align 4
  %56 = load %struct.sockaddr_in** %from.addr, align 8
  %sin_addr63 = getelementptr inbounds %struct.sockaddr_in* %56, i32 0, i32 2
  %coerce.dive = getelementptr %struct.in_addr* %sin_addr63, i32 0, i32 0
  %57 = load i32* %coerce.dive
  %call64 = call i8* (i32, ...)* bitcast (i8* (...)* @inet_ntoa to i8* (i32, ...)*)(i32 %57)
  %58 = load %struct.icmp** %icp, align 8
  %icmp_hun65 = getelementptr inbounds %struct.icmp* %58, i32 0, i32 3
  %ih_idseq66 = bitcast %union.anon* %icmp_hun65 to %struct.ih_idseq*
  %icd_seq = getelementptr inbounds %struct.ih_idseq* %ih_idseq66, i32 0, i32 1
  %59 = load i16* %icd_seq, align 2
  %conv67 = zext i16 %59 to i32
  %call68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str33, i32 0, i32 0), i32 %55, i8* %call64, i32 %conv67)
  %60 = load i32* @timing, align 4
  %tobool69 = icmp ne i32 %60, 0
  br i1 %tobool69, label %if.then70, label %if.else

if.then70:                                        ; preds = %if.then62
  %61 = load i32* %triptime, align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str34, i32 0, i32 0), i32 %61)
  br label %if.end73

if.else:                                          ; preds = %if.then62
  %call72 = call i32 @putchar(i32 10)
  br label %if.end73

if.end73:                                         ; preds = %if.else, %if.then70
  br label %if.end77

if.else74:                                        ; preds = %if.then59
  %call75 = call i32 @putchar(i32 8)
  %62 = load %struct._IO_FILE** @stdout, align 8
  %call76 = call i32 @fflush(%struct._IO_FILE* %62)
  br label %if.end77

if.end77:                                         ; preds = %if.else74, %if.end73
  br label %if.end78

if.end78:                                         ; preds = %if.end77, %if.end56
  %63 = load i32* @nreceived, align 4
  %inc79 = add nsw i32 %63, 1
  store i32 %inc79, i32* @nreceived, align 4
  br label %return

return:                                           ; preds = %if.end78, %if.then39, %if.end34, %if.end
  %64 = load i32* %retval
  ret i32 %64
}

; Function Attrs: nounwind readnone
declare i32 @ntohl(i32) #5

; Function Attrs: nounwind uwtable
define i32 @in_cksum(i16* %addr, i32 %len) #0 {
entry:
  %addr.addr = alloca i16*, align 8
  %len.addr = alloca i32, align 4
  %nleft = alloca i32, align 4
  %w = alloca i16*, align 8
  %answer = alloca i16, align 2
  %sum = alloca i32, align 4
  %u = alloca i16, align 2
  store i16* %addr, i16** %addr.addr, align 8
  store i32 %len, i32* %len.addr, align 4
  %0 = load i32* %len.addr, align 4
  store i32 %0, i32* %nleft, align 4
  %1 = load i16** %addr.addr, align 8
  store i16* %1, i16** %w, align 8
  store i32 0, i32* %sum, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i32* %nleft, align 4
  %cmp = icmp sgt i32 %2, 1
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %3 = load i16** %w, align 8
  %incdec.ptr = getelementptr inbounds i16* %3, i32 1
  store i16* %incdec.ptr, i16** %w, align 8
  %4 = load i16* %3, align 2
  %conv = zext i16 %4 to i32
  %5 = load i32* %sum, align 4
  %add = add nsw i32 %5, %conv
  store i32 %add, i32* %sum, align 4
  %6 = load i32* %nleft, align 4
  %sub = sub nsw i32 %6, 2
  store i32 %sub, i32* %nleft, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %7 = load i32* %nleft, align 4
  %cmp1 = icmp eq i32 %7, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  store i16 0, i16* %u, align 2
  %8 = load i16** %w, align 8
  %9 = bitcast i16* %8 to i8*
  %10 = load i8* %9, align 1
  %11 = bitcast i16* %u to i8*
  store i8 %10, i8* %11, align 1
  %12 = load i16* %u, align 2
  %conv3 = zext i16 %12 to i32
  %13 = load i32* %sum, align 4
  %add4 = add nsw i32 %13, %conv3
  store i32 %add4, i32* %sum, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %while.end
  %14 = load i32* %sum, align 4
  %shr = ashr i32 %14, 16
  %15 = load i32* %sum, align 4
  %and = and i32 %15, 65535
  %add5 = add nsw i32 %shr, %and
  store i32 %add5, i32* %sum, align 4
  %16 = load i32* %sum, align 4
  %shr6 = ashr i32 %16, 16
  %17 = load i32* %sum, align 4
  %add7 = add nsw i32 %17, %shr6
  store i32 %add7, i32* %sum, align 4
  %18 = load i32* %sum, align 4
  %neg = xor i32 %18, -1
  %conv8 = trunc i32 %neg to i16
  store i16 %conv8, i16* %answer, align 2
  %19 = load i16* %answer, align 2
  %conv9 = zext i16 %19 to i32
  ret i32 %conv9
}

; Function Attrs: nounwind uwtable
define i32 @tvsub(%struct.timeval* %out, %struct.timeval* %in) #0 {
entry:
  %retval = alloca i32, align 4
  %out.addr = alloca %struct.timeval*, align 8
  %in.addr = alloca %struct.timeval*, align 8
  store %struct.timeval* %out, %struct.timeval** %out.addr, align 8
  store %struct.timeval* %in, %struct.timeval** %in.addr, align 8
  %0 = load %struct.timeval** %in.addr, align 8
  %tv_usec = getelementptr inbounds %struct.timeval* %0, i32 0, i32 1
  %1 = load i64* %tv_usec, align 8
  %2 = load %struct.timeval** %out.addr, align 8
  %tv_usec1 = getelementptr inbounds %struct.timeval* %2, i32 0, i32 1
  %3 = load i64* %tv_usec1, align 8
  %sub = sub nsw i64 %3, %1
  store i64 %sub, i64* %tv_usec1, align 8
  %cmp = icmp slt i64 %sub, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %4 = load %struct.timeval** %out.addr, align 8
  %tv_sec = getelementptr inbounds %struct.timeval* %4, i32 0, i32 0
  %5 = load i64* %tv_sec, align 8
  %dec = add nsw i64 %5, -1
  store i64 %dec, i64* %tv_sec, align 8
  %6 = load %struct.timeval** %out.addr, align 8
  %tv_usec2 = getelementptr inbounds %struct.timeval* %6, i32 0, i32 1
  %7 = load i64* %tv_usec2, align 8
  %add = add nsw i64 %7, 1000000
  store i64 %add, i64* %tv_usec2, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %8 = load %struct.timeval** %in.addr, align 8
  %tv_sec3 = getelementptr inbounds %struct.timeval* %8, i32 0, i32 0
  %9 = load i64* %tv_sec3, align 8
  %10 = load %struct.timeval** %out.addr, align 8
  %tv_sec4 = getelementptr inbounds %struct.timeval* %10, i32 0, i32 0
  %11 = load i64* %tv_sec4, align 8
  %sub5 = sub nsw i64 %11, %9
  store i64 %sub5, i64* %tv_sec4, align 8
  %12 = load i32* %retval
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @finish() #0 {
entry:
  %retval = alloca i32, align 4
  %call = call i32 @putchar(i32 10)
  %0 = load %struct._IO_FILE** @stdout, align 8
  %call1 = call i32 @fflush(%struct._IO_FILE* %0)
  %1 = load i8** @hostname, align 8
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i32 0, i32 0), i8* %1)
  %2 = load i32* @ntransmitted, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i32 0, i32 0), i32 %2)
  %3 = load i32* @nreceived, align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str37, i32 0, i32 0), i32 %3)
  %4 = load i32* @ntransmitted, align 4
  %tobool = icmp ne i32 %4, 0
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %5 = load i32* @nreceived, align 4
  %6 = load i32* @ntransmitted, align 4
  %cmp = icmp sgt i32 %5, %6
  br i1 %cmp, label %if.then5, label %if.else

if.then5:                                         ; preds = %if.then
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str38, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %if.then
  %7 = load i32* @ntransmitted, align 4
  %8 = load i32* @nreceived, align 4
  %sub = sub nsw i32 %7, %8
  %mul = mul nsw i32 %sub, 100
  %9 = load i32* @ntransmitted, align 4
  %div = sdiv i32 %mul, %9
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str39, i32 0, i32 0), i32 %div)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then5
  br label %if.end8

if.end8:                                          ; preds = %if.end, %entry
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str40, i32 0, i32 0))
  %10 = load i32* @nreceived, align 4
  %tobool10 = icmp ne i32 %10, 0
  br i1 %tobool10, label %land.lhs.true, label %if.end15

land.lhs.true:                                    ; preds = %if.end8
  %11 = load i32* @timing, align 4
  %tobool11 = icmp ne i32 %11, 0
  br i1 %tobool11, label %if.then12, label %if.end15

if.then12:                                        ; preds = %land.lhs.true
  %12 = load i32* @tmin, align 4
  %13 = load i32* @tsum, align 4
  %14 = load i32* @nreceived, align 4
  %div13 = sdiv i32 %13, %14
  %15 = load i32* @tmax, align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str41, i32 0, i32 0), i32 %12, i32 %div13, i32 %15)
  br label %if.end15

if.end15:                                         ; preds = %if.then12, %land.lhs.true, %if.end8
  %16 = load %struct._IO_FILE** @stdout, align 8
  %call16 = call i32 @fflush(%struct._IO_FILE* %16)
  call void @exit(i32 0) #6
  unreachable

return:                                           ; No predecessors!
  %17 = load i32* %retval
  ret i32 %17
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
