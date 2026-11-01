#ckr_utils:constructors/spawn_vehicles/_render
# 渲染构造器临时对象
# 需要传入世界实体为执行者
# 需要安装math3.2_gelib，并初始化粒子选项

scoreboard players operation loop int = d int
scoreboard players operation loop int *= l int
scoreboard players remove loop int 1
execute if score loop int matches 0.. run function ckr_utils:constructors/spawn_vehicles/render_loop