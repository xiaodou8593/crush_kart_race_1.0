#ckr_utils:guis/track_edit/_enter_sub
# 进入ckr_utils:guis/sub_edit子编辑器
# 传入玩家为执行者
# 需要在当前界面下运行

# 当前界面入栈
function iframe:gui_stack/_push

# 下一刻跳转到sub_edit界面
data modify storage iframe:io input set value "ckr_utils:guis/sub_edit"
function iframe:_enter