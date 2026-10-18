#ckr_utils:strip_area/_shift_vec
# 应用向量vec偏移
# 输入math:vec{<vec_x,int,1w>,<vec_y,int,1w>,<vec_z,int,1w>}

scoreboard players operation x int += vec_x int
scoreboard players operation y int += vec_y int
scoreboard players operation z int += vec_z int

function ckr_utils:strip_area/_calc_chunk_range