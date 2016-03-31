declare i32 @llvm.tgsi.read.blockid.x() nounwind readnone
declare i32 @llvm.tgsi.read.blockid.y() nounwind readnone
declare i32 @llvm.tgsi.read.blockid.z() nounwind readnone

define i32 @get_group_id(i32 %dim) nounwind readnone alwaysinline {
  switch i32 %dim, label %default [i32 0, label %x_dim i32 1, label %y_dim i32 2, label %z_dim]
x_dim:
  %x = call i32 @llvm.tgsi.read.blockid.x() nounwind readnone
  ret i32 %x
y_dim:
  %y = call i32 @llvm.tgsi.read.blockid.y() nounwind readnone
  ret i32 %y
z_dim:
  %z = call i32 @llvm.tgsi.read.blockid.z() nounwind readnone
  ret i32 %z
default:
  ret i32 0
}
