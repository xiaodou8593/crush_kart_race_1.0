#ckr_utils:strip_area/test/print_plates
# 测试打印模板

data modify storage ckr_utils:io temp set value []
execute as @e[tag=ckr_utils_strip_area] run function ckr_utils:strip_area/test/print_plates_as
tellraw @a ["temp: ", {"nbt":"temp","storage":"ckr_utils:io"}]