#vve_tutor:blue_car/_summon_here
# 聊天栏快捷生成
# 传入执行位置
# 传入执行朝向

data modify storage vve_tutor:io input set from storage vve_tutor:class blue_car_plate
function vve_tutor:blue_car/_proj
execute positioned ~ ~2 ~ rotated ~ 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function vve_tutor:blue_car/_model
data modify storage vve_tutor:io input set from storage vve_tutor:io result
execute positioned ~ ~2 ~ run function vve_tutor:blue_car/_new