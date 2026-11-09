#ckr_mobs:generic/set
# ckr_mobs:generic/_new调用

execute store result score @s x run data get storage ckr_mobs:io input.center[0] 10000
execute store result score @s y run data get storage ckr_mobs:io input.center[1] 10000
execute store result score @s z run data get storage ckr_mobs:io input.center[2] 10000
execute store result score @s hp run data get storage ckr_mobs:io input.hp
execute store result score @s damage run data get storage ckr_mobs:io input.damage
data modify entity @s data.entity_type set from storage ckr_mobs:io input.entity_type
execute store result score @s coins_min run data get storage ckr_mobs:io input.coins_range[0]
execute store result score @s coins_max run data get storage ckr_mobs:io input.coins_range[1]
data modify entity @s data.last_attacker set from storage ckr_mobs:io input.last_attacker