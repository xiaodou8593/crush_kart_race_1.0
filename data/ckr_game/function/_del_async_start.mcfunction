#ckr_game:_del_async_start
# 开始析构游戏实例

# 保护区块加载器最后销毁
tag @e[tag=vp_instance,tag=chunk_area] add vp_instance_protected

data modify storage vp_core:io game_state set value "clearing"

# 调用析构主程序
schedule function ckr_game:_del_async_main 1t replace