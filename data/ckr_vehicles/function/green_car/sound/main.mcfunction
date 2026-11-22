#ckr_vehicles:green_car/sound/main
# 预设声音主程序
# 输入<bounce_layer_response,int>
# 输入<grab_layer_response,int>
# 输入<material_response,int>
# 输入<friction_response,int>
# 输入<impulse_response,int>
# 输入impulse{...}
# 输入<shift_cnt,int>
# 传入世界实体为执行者

scoreboard players operation temp_mod int = vve_sound_timer int
scoreboard players operation temp_mod int %= 5 int
# 获取发动机功率
execute if score temp_mod int matches 0 if score target_power int matches 1.. run playsound vve:bca.006 player @a ~ ~ ~ 1.0 1.0

# 计算前向速度
execute store result score stemp_v int run compute default float vve:vehicle/_calc_forward_v

scoreboard players operation temp_mod int = vve_sound_timer int
scoreboard players operation temp_mod int %= 6 int
scoreboard players operation temp_turn int = input_a int
scoreboard players operation temp_turn int > input_d int
execute if score temp_mod int matches 3 \
	if score stemp_v int matches 2000.. \
	if score input_w int matches 0 \
	if score input_s int matches 0 \
	if score temp_turn int matches 1 \
	if score shift_cnt int matches 1.. \
	run playsound vve:turn_0 player @a ~ ~ ~ 0.5 1.0
execute if score temp_mod int matches 3 \
	if score stemp_v int matches 2000.. \
	if score input_s int matches 1 \
	if score shift_cnt int matches 1.. \
	run playsound vve:turn_0 player @a ~ ~ ~ 0.5 1.0

scoreboard players operation temp_mod int = vve_sound_timer int
scoreboard players operation temp_mod int %= 17 int
execute if score temp_mod int matches 7 if score target_power int matches ..-1 run playsound vve:bca.001 player @a ~ ~ ~ 1.0 1.0

scoreboard players add vve_sound_timer int 1
scoreboard players operation vve_last_material int = material_response int