#ckr_mobs:generic/_die
# 实例死亡
# 传入实例为执行者

# 计算随机金币数量
scoreboard players operation temp_max int = @s coins_max
scoreboard players operation temp_max int -= @s coins_min
scoreboard players add temp_max int 1
execute store result score inp int run random value 0..2147483646 ckr_mobs:coins_rand
scoreboard players operation inp int %= temp_max int
scoreboard players operation inp int += @s coins_min

# 寻找攻击者奖励金币
data modify entity 0-0-0-0-1 Thrower set from entity @s data.last_attacker
execute as 0-0-0-0-1 on origin on passengers on passengers run function ckr_player:_add_coins

# 声音效果
execute at @s anchored eyes positioned ^ ^-0.5 ^ run playsound minecraft:block.netherrack.step player @a ~ ~ ~ 1 0.5

kill @s