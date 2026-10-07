#ckr_game:_build_async_main
# 游戏实例的构造主程序
# ckr_game:_build_async_start异步调用
# 占用temp{<temp_cnt,int>}

# 循环调用
execute if data storage vp_core:io {game_state:"prepare done"} run return run data modify storage vp_core:io game_state set value "prepared"
schedule function ckr_game:_build_async_main 1t replace

# 临时对象入栈
function ckr_game:_push

# 调用构造器
execute as @e[tag=vp_constructor,tag=running] run function module_control:_call_method {path:"main"}
# 临时对象出栈
function ckr_game:_pop
# 构造器是否还在运行
execute store result score temp_cnt int if entity @e[tag=vp_constructor,tag=running]
execute if score temp_cnt int matches 1.. run return fail
# 构造器时序
execute as @e[tag=vp_constructor,tag=chunk_loader] run return run tag @s add running
execute as @e[tag=vp_constructor,tag=area_clear] run return run tag @s add running
execute as @e[tag=vp_constructor,tag=structure_builder] run return run tag @s add running
execute as @e[tag=vp_constructor,tag=barrier_builder] run return run tag @s add running
execute as @e[tag=vp_constructor,tag=player_setup] run return run tag @s add running
execute as @e[tag=vp_constructor,tag=player_teleport] run return run tag @s add running
# 构造完成
data modify storage vp_core:io game_state set value "prepare done"