#vve_tutor:nice_bike/main_fire
# vve_tutor:nice_bike/main_c调用

execute store result score temp_fire int run data get entity @s Fire
data modify entity @s Fire set value 120s

execute if score temp_fire int matches 1.. run return fail
# 第一次点燃效果
damage @s 7 vve_tutor:damage
execute at @s positioned ~ ~1.0 ~ run particle minecraft:flame ~ ~ ~ 0.0 0.0 0.0 0.05 50 force @a
execute at @s positioned ~ ~1.0 ~ run playsound minecraft:entity.ghast.shoot player @a ~ ~ ~ 1.0 1.2