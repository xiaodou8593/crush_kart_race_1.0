#ckr_gliders:default/_class
# 生成预设静态数据模板

function ckr_gliders:default/_zero
scoreboard players set vve_euler_b int 6
scoreboard players set vve_euler_vmax int 150000
scoreboard players set target_theta int -2147483648
scoreboard players set control_active int -10
function ckr_gliders:default/_model
data modify storage ckr_gliders:class default_plate set from storage ckr_gliders:io result