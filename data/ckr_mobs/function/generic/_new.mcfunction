#ckr_mobs:generic/_new
# 使用数据模板生成实体对象
# 输入数据模板storage ckr_mobs:io input
# 输入执行位置
# 输出 @e[tag=result,limit=1]

tag @e[tag=result] remove result
function ckr_mobs:generic/new_summon with storage ckr_mobs:io input
execute as @e[tag=result,limit=1] run function ckr_mobs:generic/set
execute as @e[tag=result,limit=1] run function ckr_mobs:generic/set_operation