#ckr_game:_del_async_main
# 析构游戏实例主程序
# 占用<loop,int>
# ckr_game:_del_async_start异步调用

# 循环调用
execute if data storage vp_core:io {game_state:"clear done"} run return run data modify storage vp_core:io game_state set value "cleared"
schedule function ckr_game:_del_async_main 1t replace

# 销毁实例
scoreboard players set loop int 15
execute if score loop int matches 1.. run function ckr_game:del_loop

# 结束清理
execute unless entity @e[tag=vp_instance,limit=1] run data modify storage vp_core:io game_state set value "clear done"