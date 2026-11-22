#ckr_vehicles:exploding/main
# ckr_game:running调用

# 生成爆炸效果
tag @e[tag=result] remove result
summon minecraft:creeper ~ ~512 ~ {Fuse:0,ExplosionRadius:2,Tags:["result"],CustomName:""}
tp @e[tag=result,limit=1] ~ ~ ~

# 爆炸计时
scoreboard players remove @s ckr_vehicle_explode_timer 1
execute if score @s ckr_vehicle_explode_timer matches 1.. run return fail

# 爆炸计时结束
tag @s remove ckr_vehicle_exploding
execute on passengers on passengers on passengers run tellraw @a [{"selector":"@s"},{"text":"的载具爆炸了"}]
execute on passengers on passengers on passengers run effect clear @s minecraft:regeneration
function ckr_vehicles:_full_hp_respawn