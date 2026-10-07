#ckr_game:_del_async_start
# 开始析构游戏实例

data modify storage vp_core:io game_state set value "clearing"

# 调用析构主程序
schedule function ckr_game:_del_async_main 1t replace