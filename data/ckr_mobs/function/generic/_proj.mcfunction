#ckr_mobs:generic/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_mobs:io input

execute store result score x int run data get storage ckr_mobs:io input.center[0] 10000
execute store result score y int run data get storage ckr_mobs:io input.center[1] 10000
execute store result score z int run data get storage ckr_mobs:io input.center[2] 10000
execute store result score hp int run data get storage ckr_mobs:io input.hp
execute store result score damage int run data get storage ckr_mobs:io input.damage
data modify storage ckr_mobs:io entity_type set from storage ckr_mobs:io input.entity_type
execute store result score coins_min int run data get storage ckr_mobs:io input.coins_range[0]
execute store result score coins_max int run data get storage ckr_mobs:io input.coins_range[1]
data modify storage ckr_mobs:io last_attacker set from storage ckr_mobs:io input.last_attacker