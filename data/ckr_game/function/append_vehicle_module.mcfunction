#ckr_game:append_vehicle_module
# ckr_game:_build_async_start调用

# 添加载具模块信息
data modify storage ckr_utils:io input.list_vehicle_modules append from storage math:io list[0]

data modify storage math:io list append from storage math:io list[0]
data remove storage math:io list[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function ckr_game:append_vehicle_module