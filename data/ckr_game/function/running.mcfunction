#ckr_game:running
# ckr_game:main调用

# 游戏主要逻辑

# 获取玩家人数
execute store result score temp_cnt int if entity @a[tag=vp_gamer]

# 玩家人数不足则游戏直接结束
execute if score temp_cnt int matches 0 run data modify storage vp_core:io game_state set value "over"

# 游戏仅剩一名玩家胜利（逻辑可改写）
execute unless score temp_cnt int matches 1 run return fail
tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer,limit=1]","color":"gray"}]
data modify storage vp_core:io game_state set value "rewarding"
# 奖励计时器
summon marker 0 0 0 {Tags:["vp_rewarding"],CustomName:"vp_rewarding"}
scoreboard players set @e[tag=vp_rewarding,limit=1] killtime 300