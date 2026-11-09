#ckr_mobs:generic/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation x int = @s x
scoreboard players operation y int = @s y
scoreboard players operation z int = @s z
scoreboard players operation hp int = @s hp
scoreboard players operation damage int = @s damage
data modify storage ckr_mobs:io entity_type set from entity @s data.entity_type
scoreboard players operation coins_min int = @s coins_min
scoreboard players operation coins_max int = @s coins_max
data modify storage ckr_mobs:io last_attacker set from entity @s data.last_attacker