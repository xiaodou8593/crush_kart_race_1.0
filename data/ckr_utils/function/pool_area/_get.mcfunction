#ckr_utils:pool_area/_get
# 实体对象赋值到临时对象
# 输入执行实体

scoreboard players operation x int = @s x
scoreboard players operation y int = @s y
scoreboard players operation z int = @s z
scoreboard players operation d int = @s d
scoreboard players operation l int = @s l
scoreboard players operation spawn_interval int = @s spawn_interval
scoreboard players operation spawn_timer int = @s spawn_timer
scoreboard players operation spawn_max int = @s spawn_max
data modify storage ckr_utils:io spawn_plates set from entity @s data.spawn_plates