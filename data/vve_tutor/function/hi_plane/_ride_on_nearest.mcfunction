#vve_tutor:hi_plane/_ride_on_nearest
# 聊天栏快捷乘坐
# 输入执行位置
# 以乘坐者为执行者

tag @e[tag=input] remove input
tag @s add input
execute as @e[tag=vve_tutor_hi_plane,limit=1,sort=nearest] run function vve_tutor:hi_plane/_seat_on