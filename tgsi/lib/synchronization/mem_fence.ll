declare void @llvm.tgsi.membar(i32 ) #0

define void @mem_fence(i32 %flags) #1 {
barrier_global_test:
  %0 = icmp uge i32 %flags, 2
  br i1 %0, label %barrier_global, label %barrier_local

barrier_global:
  call void @llvm.tgsi.membar(i32 31)
  br label %done

barrier_local:
  call void @llvm.tgsi.membar(i32 16)
  br label %done

done:
  ret void
}

attributes #0 = { nounwind convergent }
attributes #1 = { nounwind convergent alwaysinline }
