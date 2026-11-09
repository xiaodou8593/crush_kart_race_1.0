#ckr_mobs:generic/main_update
# 伤害更新函数

# 声音效果

execute at @s anchored eyes positioned ^ ^-0.5 ^ run playsound minecraft:block.stone.break player @a ~ ~ ~ 1 1
execute at @s anchored eyes positioned ^ ^-0.5 ^ run playsound minecraft:block.nether_gold_ore.break player @a ~ ~ ~ 1 1

# 粒子效果
execute at @s anchored eyes positioned ^ ^-0.5 ^ run particle minecraft:block{block_state:{id:"minecraft:redstone_block"}} ~ ~ ~ 0.0 0.0 0.0 0.2 15 force @a

# 红体效果
damage @s 1
data modify entity @s Health set value 1024.0f

# 清空伤害累积
scoreboard players set @s damage 0

# 取消更新标签
tag @s remove ckr_mobs_update

# 如果死亡
execute if entity @s[tag=ckr_mobs_dead] run function ckr_mobs:generic/_die