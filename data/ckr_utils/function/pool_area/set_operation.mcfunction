#ckr_utils:pool_area/set_operation
# ckr_utils:pool_area/_new调用

#function ckr_utils:pool_area/_get
#function ckr_utils:pool_area/_update_display

scoreboard players add #ckr_utils:pool_area/ vp_modular 1
execute store result score @s vp_modular run scoreboard players operation #ckr_utils:pool_area/ vp_modular %= 10 int