#ckr_player:bossbar/_update_color
# 更新bossbar颜色
# 输入macro storage vp_core:io result{bossbar_ptr:$(bossbar_ptr),bossbar_color:$(bossbar_color)}

$bossbar set ckr_player:bossbar_$(bossbar_ptr) color $(bossbar_color)