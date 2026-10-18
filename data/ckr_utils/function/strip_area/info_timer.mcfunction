#ckr_utils:strip_area/info_timer
# ckr_utils:strip_area/info异步调用

scoreboard players remove @e[tag=ckr_utils_strip_area_info] ckr_utils_strip_area_info 1
tag @e[tag=ckr_utils_strip_area_info,scores={ckr_utils_strip_area_info=..0}] remove ckr_utils_strip_area_info

# 停止计时
execute unless entity @e[tag=ckr_utils_strip_area_info,limit=1] run return fail
# 继续计时
schedule function ckr_utils:strip_area/info_timer 1t replace