#ckr_game:running
# ckr_game:main调用

# 游戏主要逻辑

# 运行载具模拟器
function vve_tutor:simulator/main

# 防止玩家下车
execute as @e[tag=vve_tutor_blue_car,predicate=!ckr_vehicles:_player_on] run function ckr_vehicles:_drag_back

# 游戏计时
execute store result score temp_modular int run scoreboard players add game_timer int 1
scoreboard players operation temp_modular int %= 10 int
# 降频调度刷怪区
execute as @e[tag=ckr_utils_pool_area,tag=vp_instance,predicate=vp_core:_match_modular] run function ckr_utils:pool_area/main

# 怪物受伤更新
execute as @e[tag=ckr_mobs_update] run function ckr_mobs:generic/main_update

# 玩家低频函数
execute as @a[tag=vp_gamer,scores={vp_modular=0}] run function ckr_player:main_low

# 获取玩家人数
execute store result score temp_cnt int if entity @a[tag=vp_gamer]

# 玩家人数不足则游戏直接结束
execute if score temp_cnt int matches 0 run data modify storage vp_core:io game_state set value "over"

# 游戏仅剩一名玩家胜利（逻辑可改写）
return fail
execute unless score temp_cnt int matches 1 run return fail
tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer,limit=1]","color":"gray"}]
data modify storage vp_core:io game_state set value "rewarding"
# 奖励计时器
summon marker 0 0 0 {Tags:["vp_rewarding"],CustomName:"vp_rewarding"}
scoreboard players set @e[tag=vp_rewarding,limit=1] killtime 300