#ckr_game:main
# vp_game主程序

data modify storage ckr_game:io temp_state set from storage vp_core:io game_state
# 选择状态分支
execute if data storage ckr_game:io {temp_state:"prepared"} run function ckr_game:start_game
execute if data storage ckr_game:io {temp_state:"running"} run function ckr_game:running
execute if data storage ckr_game:io {temp_state:"rewarding"} run function ckr_game:rewarding