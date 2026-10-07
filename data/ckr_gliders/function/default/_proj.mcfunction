#ckr_gliders:default/_proj
# 把数据模板投射到临时对象
# 输入数据模板storage ckr_gliders:io input

execute store result score control_active int run data get storage ckr_gliders:io input.control_active
execute store result score vve_euler_k int run data get storage ckr_gliders:io input.damp_params[0]
execute store result score vve_euler_b int run data get storage ckr_gliders:io input.damp_params[1]
execute store result score vve_euler_f int run data get storage ckr_gliders:io input.damp_params[2]
execute store result score vve_euler_max int run data get storage ckr_gliders:io input.damp_params[3]
execute store result score vve_euler_vmax int run data get storage ckr_gliders:io input.damp_params[4]
execute store result score target_theta int run data get storage ckr_gliders:io input.target_euler[0] 10000
execute store result score target_phi int run data get storage ckr_gliders:io input.target_euler[1] 10000
execute store result score target_psi int run data get storage ckr_gliders:io input.target_euler[2] 10000