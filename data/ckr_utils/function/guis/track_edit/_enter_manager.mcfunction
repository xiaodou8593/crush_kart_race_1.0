#ckr_utils:guis/track_edit/_enter_manager
# 进入vp_core:guis/structure_manager界面
# 传入玩家为执行者
# 需要在当前界面下运行

# 当前界面入栈
function iframe:gui_stack/_push

# 下一刻跳转到structure_saving界面
data modify storage iframe:io input set value "vp_core:guis/structure_manager"
function iframe:_enter