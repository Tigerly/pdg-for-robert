; ModuleID = 'array-sbcets.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @__softboundcets_global_init, i8* null }]

define i32 @softboundcets_pseudo_main() {
entry:
  %lock_alloca = alloca i8*
  %key_alloca = alloca i64
  call void @__softboundcets_stack_memory_allocation(i8** %lock_alloca, i64* %key_alloca)
  %lock.load = load i8** %lock_alloca
  %key.load = load i64* %key_alloca
  %0 = call i8* @__softboundcets_get_global_lock()
  %retval = alloca i32, align 4
  %retval1 = bitcast i32* %retval to i32*
  %bitcast = bitcast i32* %retval to i8*
  %mtmp = getelementptr i32* %retval1, i32 1
  %bitcast2 = bitcast i32* %mtmp to i8*
  %a = alloca [10 x i32], align 16
  %a3 = bitcast [10 x i32]* %a to [10 x i32]*
  %bitcast4 = bitcast [10 x i32]* %a to i8*
  %mtmp5 = getelementptr [10 x i32]* %a3, i32 1
  %bitcast6 = bitcast [10 x i32]* %mtmp5 to i8*
  %i = alloca i32, align 4
  %i7 = bitcast i32* %i to i32*
  %bitcast8 = bitcast i32* %i to i8*
  %mtmp9 = getelementptr i32* %i7, i32 1
  %bitcast10 = bitcast i32* %mtmp9 to i8*
  %bitcast11 = bitcast i32* %retval to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast, i8* %bitcast2, i8* %bitcast11, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %retval
  %bitcast12 = bitcast i32* %i to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast8, i8* %bitcast10, i8* %bitcast12, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %bitcast13 = bitcast i32* %i to i8*
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %bitcast14 = bitcast i32* %i to i8*
  %2 = load i32* %i, align 4
  %bitcast15 = bitcast i32* %i to i8*
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [10 x i32]* %a, i32 0, i64 %idxprom
  %bitcast16 = bitcast i32* %arrayidx to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast4, i8* %bitcast6, i8* %bitcast16, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 %2, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %bitcast20 = bitcast i32* %i to i8*
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  %bitcast21 = bitcast i32* %i to i8*
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx1 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 3
  %bitcast17 = bitcast i32* %arrayidx1 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast4, i8* %bitcast6, i8* %bitcast17, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 9
  %bitcast18 = bitcast i32* %arrayidx2 to i8*
  call void @__softboundcets_spatial_store_dereference_check(i8* %bitcast4, i8* %bitcast6, i8* %bitcast18, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  store i32 0, i32* %arrayidx2, align 4
  %arrayidx3 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 3
  %bitcast19 = bitcast i32* %arrayidx3 to i8*
  call void @__softboundcets_spatial_load_dereference_check(i8* %bitcast4, i8* %bitcast6, i8* %bitcast19, i64 ptrtoint (i32* getelementptr (i32* null, i32 1) to i64))
  %5 = load i32* %arrayidx3, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %5)
  call void @__softboundcets_stack_memory_deallocation(i64 %key.load)
  ret i32 0
}

declare i32 @printf(i8*, ...) #0

declare void @__softboundcets_spatial_load_dereference_check(i8*, i8*, i8*, i64)

declare void @__softboundcets_spatial_store_dereference_check(i8*, i8*, i8*, i64)

declare void @__softboundcets_temporal_load_dereference_check(i8*, i64, i8*, i8*)

declare void @__softboundcets_temporal_store_dereference_check(i8*, i64, i8*, i8*)

; Function Attrs: nounwind
define internal void @__softboundcets_global_init() #1 {
entry:
  call void @__softboundcets_init(i32 1)
  ret void
}

declare void @__softboundcets_init(i32)

declare void @__softboundcets_allocate_shadow_stack_space(i32)

declare void @__softboundcets_deallocate_shadow_stack_space()

declare i8* @__softboundcets_load_base_shadow_stack(i32)

declare i8* @__softboundcets_load_bound_shadow_stack(i32)

declare i64 @__softboundcets_load_key_shadow_stack(i32)

declare i8* @__softboundcets_load_lock_shadow_stack(i32)

declare void @__softboundcets_store_base_shadow_stack(i8*, i32)

declare void @__softboundcets_store_bound_shadow_stack(i8*, i32)

declare void @__softboundcets_store_key_shadow_stack(i64, i32)

declare void @__softboundcets_store_lock_shadow_stack(i8*, i32)

declare void @__softboundcets_introspect_metadata(i8*, i8*, i32)

declare void @__softboundcets_copy_metadata(i8*, i8*, i64)

declare i8* @__softboundcets_metadata_map(i8*)

declare i8* @__softboundcets_metadata_load_base(i8*)

declare i8* @__softboundcets_metadata_load_bound(i8*)

declare i64 @__softboundcets_metadata_load_key(i8*)

declare i8* @__softboundcets_metadata_load_lock(i8*)

declare void @__softboundcets_metadata_load_vector(i8*, i8**, i8**, i64*, i8**, i32)

declare void @__softboundcets_metadata_store_vector(i8*, i8*, i8*, i64, i8*, i32)

declare void @__softboundcets_metadata_load(i8*, i8**, i8**, i64*, i8**)

declare void @__softboundcets_metadata_store(i8*, i8*, i8*, i64, i8*)

declare void @__softboundcets_memcopy_check(i8*, i8*, i64, i8*, i8*, i8*, i8*, i64, i8*, i64, i8*)

declare void @__softboundcets_memset_check(i8*, i64, i8*, i8*, i64, i8*)

declare i8* @__softboundcets_get_global_lock()

declare void @__softboundcets_stack_memory_allocation(i8**, i64*)

declare void @__softboundcets_stack_memory_deallocation(i64)

declare void @__softboundcets_spatial_call_dereference_check(i8*, i8*, i8*)

declare void @__softboundcets_print_metadata(i8*, i8*, i8*, i64, i64*)

declare void @__softboundcets_dummy()

declare void @__softboundcets_intermediate(i1, i1, i1, i64)

attributes #0 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
