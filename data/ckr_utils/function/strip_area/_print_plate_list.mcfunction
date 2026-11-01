#ckr_utils:strip_area/_print_plate_list
# 将所有实例构建为数据模板列表并打印
# 占用storage ckr_utils:io result
# 输出storage ckr_utils:io list

data modify storage ckr_utils:io list set value []
execute as @e[tag=ckr_utils_strip_area] run function ckr_utils:strip_area/plate_list_append
tellraw @a {"nbt":"list","storage":"ckr_utils:io"}