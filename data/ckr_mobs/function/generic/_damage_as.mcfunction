#ckr_mobs:generic/_damage_as
# 给实例造成伤害
# 输入伤害量<inp,int>
# 输入攻击者storage ckr_mobs:io input_uuid
# 传入实例为执行者

execute if entity @s[tag=ckr_mobs_dead] run return fail
tag @s[tag=!ckr_mobs_update] add ckr_mobs_update

# 更新血量
scoreboard players operation @s hp -= inp int

# 更新攻击者
data modify entity @s data.last_attacker set from storage ckr_mobs:io input_uuid

# 更新伤害累积
scoreboard players operation @s damage += inp int

# 检查死亡
execute if score @s hp matches ..0 run tag @s add ckr_mobs_dead