#ckr_utils:pool_area/_render
# 渲染临时对象
# 需要传入世界实体为执行者

scoreboard players set r int 0
scoreboard players set g int 255
scoreboard players set b int 0
data modify storage math:io render_command set value "function math:rgb/_render_debug_2"
scoreboard players set render_density int 10
function math:rectangle/_render

# 区块安全
tp @s 0 0 0