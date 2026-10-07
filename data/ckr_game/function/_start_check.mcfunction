#ckr_game:_start_check
# 检查是否满足游戏开始条件
# 输出<res,int>, 是否满足?1:0

execute store result score temp_cnt int if entity @a[tag=vp_gamer]
scoreboard players set res int 0
execute if score temp_cnt int matches 3.. run scoreboard players set res int 1