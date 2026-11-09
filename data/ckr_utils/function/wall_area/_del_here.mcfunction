#ckr_utils:wall_area/_del_here
# 删除执行位置所在的墙实例
# 输入执行位置
# 传入世界实体为执行者

function ckr_utils:wall_area/_get_here_instance
execute as @e[tag=result] run function ckr_utils:wall_area/_delete_display_as
execute as @e[tag=result] run function ckr_utils:wall_area/_del