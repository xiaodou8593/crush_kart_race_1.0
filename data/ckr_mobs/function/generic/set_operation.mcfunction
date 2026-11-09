#ckr_mobs:generic/set_operation
# ckr_mobs:generic/_new调用

tag @s add vp_instance
tag @s add ckr_mobs
tag @s add ckr_mobs_generic

# 防止蜘蛛骑士和鸡骑士
execute on passengers if entity @s[tag=] run function ckr_mobs:generic/_be
execute on vehicle if entity @s[tag=] run function ckr_mobs:generic/_be