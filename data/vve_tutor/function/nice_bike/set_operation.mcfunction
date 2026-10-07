#vve_tutor:nice_bike/set_operation
# vve_tutor:nice_bike/_new调用

function vve_tutor:nice_bike/_get
function vve_tutor:nice_bike/_update_display

# 设置载具模型
item replace entity @s container.0 with minecraft:clay_ball[minecraft:item_model="xiaodou123:nice_bike",minecraft:custom_model_data={floats:[0.0f]}]

# 设置座椅宽高（高度调整玩家位置）
scoreboard players set width int 10000
scoreboard players set height int 4000
execute on passengers run function vve:seat/_prescript

scoreboard players set @s vve_material_type 2