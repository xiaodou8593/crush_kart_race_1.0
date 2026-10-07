#ckr_game:watch_build
# ckr_game:_build_async_start调用

function ckr_game:_get_tp_points
data modify entity @s Pos set from storage ckr_game:io result[0]
execute at @s run tp @a[tag=vp_joiner] ~ ~48 ~

tp @s 0 0 0