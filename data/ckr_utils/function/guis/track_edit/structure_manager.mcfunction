#ckr_utils:guis/track_edit/structure_manager
# ckr_utils:guis/track_edit/main调用

# 当前gui入栈
function iframe:gui_stack/_push

# 下一刻进入structure manager UI	
data modify storage iframe:io input set value "vp_core:guis/structure_manager"
function iframe:_enter