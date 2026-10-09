#ckr_utils:_build_test_track
# 建造测试轨道
# 传入玩家为执行者

data modify storage vp_core:io field_center set value [-63.5d, -41.0d, 152.0d]
tp @s -63.5 -41.0 152.0

function iframe:_ienter {gui:"ckr_utils:guis/track_edit"}

tag @e[tag=result] remove result
summon marker 0 0 0 {Tags:["result"]}
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.uuid set from entity @s UUID
data modify storage marker_control:io result.del_func set value "ckr_utils:build_test_track"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_todel
scoreboard players set @e[tag=result,limit=1] killtime 10