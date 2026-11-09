#ckr_mobs:generic/_class
# 生成预设静态数据模板

data modify storage ckr_mobs:class generic_plates set value []

function ckr_mobs:generic/_zero
scoreboard players set hp int 20
data modify storage ckr_mobs:io entity_type set value "minecraft:zombie"
scoreboard players set coins_min int 3
scoreboard players set coins_max int 5
function ckr_mobs:generic/_model
data modify storage ckr_mobs:class generic_plates append from storage ckr_mobs:io result

function ckr_mobs:generic/_zero
scoreboard players set hp int 20
data modify storage ckr_mobs:io entity_type set value "minecraft:skeleton"
scoreboard players set coins_min int 3
scoreboard players set coins_max int 5
function ckr_mobs:generic/_model
data modify storage ckr_mobs:class generic_plates append from storage ckr_mobs:io result

function ckr_mobs:generic/_zero
scoreboard players set hp int 20
data modify storage ckr_mobs:io entity_type set value "minecraft:creeper"
scoreboard players set coins_min int 3
scoreboard players set coins_max int 5
function ckr_mobs:generic/_model
data modify storage ckr_mobs:class generic_plates append from storage ckr_mobs:io result

function ckr_mobs:generic/_zero
scoreboard players set hp int 16
data modify storage ckr_mobs:io entity_type set value "minecraft:spider"
scoreboard players set coins_min int 3
scoreboard players set coins_max int 5
function ckr_mobs:generic/_model
data modify storage ckr_mobs:class generic_plates append from storage ckr_mobs:io result

data modify storage ckr_mobs:class generic_plates[].module_prefix set value "ckr_mobs:generic/"