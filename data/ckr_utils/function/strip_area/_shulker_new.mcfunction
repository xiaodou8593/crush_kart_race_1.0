#ckr_utils:strip_area/_shulker_new
# 从潜影贝读入临时对象，并生成实例
# 输入entity @e[type=minecraft:shulker]
# 输出 @e[tag=result,limit=1]
# 占用storage ckr_utils:io input
# 占用storage ckr_utils:io result

function ckr_utils:strip_area/_shulker_to
function ckr_utils:strip_area/_model
data modify storage ckr_utils:io input set from storage ckr_utils:io result
function ckr_utils:strip_area/_new