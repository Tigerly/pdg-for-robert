; ModuleID = 'getelementptr-sbcets-O3.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ST = type { i32, double, %struct.RT }
%struct.RT = type { i8, [10 x [20 x i32]], i8 }

@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 0, void ()* @__softboundcets_global_init, i8* null }]

; Function Attrs: nounwind readnone uwtable
define i32* @foo(%struct.ST* readnone %s) #0 {
entry:
  %0 = call i8* @__softboundcets_load_base_shadow_stack(i32 1)
  %1 = call i8* @__softboundcets_load_bound_shadow_stack(i32 1)
  %2 = call i64 @__softboundcets_load_key_shadow_stack(i32 1)
  %3 = call i8* @__softboundcets_load_lock_shadow_stack(i32 1)
  %4 = call i8* @__softboundcets_get_global_lock()
  %arrayidx2 = getelementptr inbounds %struct.ST* %s, i64 1, i32 2, i32 1, i64 5, i64 13
  call void @__softboundcets_store_base_shadow_stack(i8* %0, i32 0)
  call void @__softboundcets_store_bound_shadow_stack(i8* %1, i32 0)
  call void @__softboundcets_store_key_shadow_stack(i64 %2, i32 0)
  call void @__softboundcets_store_lock_shadow_stack(i8* %3, i32 0)
  ret i32* %arrayidx2
}

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

attributes #0 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
