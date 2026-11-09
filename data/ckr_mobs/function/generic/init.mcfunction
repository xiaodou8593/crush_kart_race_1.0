#ckr_mobs:generic/init
# 初始化generic模块

data modify storage ckr_mobs:io entity_type set value ""
data modify storage ckr_mobs:io last_attacker set value ""

scoreboard objectives add hp dummy
scoreboard objectives add damage dummy
scoreboard objectives add coins_min dummy
scoreboard objectives add coins_max dummy

function ckr_mobs:generic/_consts

function ckr_mobs:generic/_class

function ckr_mobs:generic/init_operation