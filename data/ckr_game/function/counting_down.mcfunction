#ckr_game:counting_down
# ckr_game:main调用

execute store result score temp_div int store result score temp_mod int run scoreboard players remove game_timer int 1
scoreboard players operation temp_mod int %= 20 int
scoreboard players operation temp_div int /= 20 int
execute unless score temp_mod int matches 0 run return fail

execute if score temp_div int matches 1.. as @a[tag=vp_gamer] at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 1.0 1.0
execute if score temp_div int matches 1.. run title @a[tag=vp_gamer] title {"score":{"name":"temp_div","objective":"int"}}
execute if score temp_div int matches 1.. run return fail

execute as @a[tag=vp_gamer] at @s run playsound minecraft:block.note_block.bit player @s ~ ~ ~ 1.0 1.5
title @a[tag=vp_gamer] title "GO！"
data modify storage vp_core:io game_state set value "running"