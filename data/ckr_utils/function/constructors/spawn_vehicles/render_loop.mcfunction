#ckr_utils:constructors/spawn_vehicles/render_loop
# ckr_utils:constructors/spawn_vehicles/_render调用

execute store result score w int run scoreboard players operation u int = loop int
scoreboard players operation u int %= d int
scoreboard players operation w int /= d int
scoreboard players operation u int *= 40000 int
scoreboard players operation w int *= 50000 int
scoreboard players add u int 20000
scoreboard players add w int 25000
scoreboard players set v int 0
function math:uvw/_tovec_high

function ckr_utils:constructors/spawn_vehicles/_push
# 构造math:rectangle并渲染
scoreboard players operation x int = vec_x int
scoreboard players operation y int = vec_y int
scoreboard players operation z int = vec_z int
scoreboard players set d int 12000
scoreboard players set l int 20000
#data modify storage math:io render_command set from storage math:class particle_commands.red_dust
scoreboard players set r int 255
scoreboard players set g int 0
scoreboard players set b int 0
data modify storage math:io render_command set value "function math:rgb/_render_debug_2"
scoreboard players set render_density int 10
function math:rectangle/_render
function ckr_utils:constructors/spawn_vehicles/_pop

scoreboard players remove loop int 1
execute if score loop int matches 0.. run function ckr_utils:constructors/spawn_vehicles/render_loop