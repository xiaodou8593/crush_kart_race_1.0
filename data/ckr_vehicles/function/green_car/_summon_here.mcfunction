#ckr_vehicles:green_car/_summon_here
# 聊天栏快捷生成
# 传入执行位置
# 传入执行朝向

data modify storage ckr_vehicles:io input set from storage ckr_vehicles:class green_car_plate
function ckr_vehicles:green_car/_proj
execute positioned ~ ~2 ~ rotated ~ 0.0 as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
function ckr_vehicles:green_car/_model
data modify storage ckr_vehicles:io input set from storage ckr_vehicles:io result
execute positioned ~ ~2 ~ run function ckr_vehicles:green_car/_new