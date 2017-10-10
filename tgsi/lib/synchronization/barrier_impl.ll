declare void @llvm.tgsi.barrier() #0
declare void @llvm.tgsi.membar(i32 ) #0

define void @barrier(i32 %flags) #1 {
barrier_global_test:
  %0 = icmp uge i32 %flags, 2
  br i1 %0, label %barrier_global, label %barrier_local_test

barrier_global:
  tail call void @llvm.tgsi.membar(i32 31)
  br label %done

barrier_local_test:
  %1 = icmp eq i32 %flags, 1
  br i1 %1, label %barrier_local, label %done

barrier_local:
  tail call void @llvm.tgsi.membar(i32 16)
  br label %done

done:
  tail call void @llvm.tgsi.barrier()
  ret void
}

attributes #0 = { nounwind convergent}
attributes #1 = { nounwind alwaysinline convergent}
