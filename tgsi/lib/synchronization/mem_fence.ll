declare void @llvm.tgsi.local.mem.bar() #0
declare void @llvm.tgsi.global.mem.bar() #0

define void @mem_fence(i32 %flags) #2 {
barrier_global_test:
  %0 = icmp ne i32 %flags, 1
  br i1 %0, label %barrier_global, label %barrier_local

barrier_global:
  call void @llvm.tgsi.global.mem.bar()
  br label %done

barrier_local:
  call void @llvm.tgsi.local.mem.bar()
  br label %done

done:
  ret void
}

attributes #0 = { nounwind convergent }
attributes #1 = { nounwind alwaysinline }
attributes #2 = { nounwind convergent alwaysinline }
