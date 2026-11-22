#ckr_gliders:glassier/controlling
# ckr_gliders:glassier/main调用

execute as 0-0-0-0-0 run function vve:euler_control/main_angular

scoreboard players add vy int 280

scoreboard players operation vy int *= ckr_default_glider_f int
scoreboard players operation stemp_add int = ckr_default_glider_f int
scoreboard players remove stemp_add int 1
execute if score vy int matches ..-1 run scoreboard players operation vy int += stemp_add int
scoreboard players operation vy int /= 1000 int