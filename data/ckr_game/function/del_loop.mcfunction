#ckr_game:del_loop
# ckr_game:_del_async_main调用

scoreboard players set res int 0
execute if score @e[tag=vp_instance,limit=1] module_id matches 0.. run scoreboard players set res int 1
execute if score res int matches 0 run kill @e[tag=vp_instance,limit=1]
execute if score res int matches 1 as @e[tag=vp_instance,limit=1] run function module_control:_call_method {path:"_del"}

scoreboard players remove loop int 1
execute if score loop int matches 1.. run function ckr_game:del_loop