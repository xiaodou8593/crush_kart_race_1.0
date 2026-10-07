#ckr_gliders:default/_model
# 使用临时对象构建数据模板
# 输出数据模板storage ckr_gliders:io result

data modify storage ckr_gliders:io result set value {control_active:0, damp_params:[0.0d, 0.0d, 0.0d, 0.0d, 0.0d], target_euler:[0.0d, 0.0d, 0.0d]}

execute store result storage ckr_gliders:io result.control_active int 1 run scoreboard players get control_active int
execute store result storage ckr_gliders:io result.damp_params[0] double 1 run scoreboard players get vve_euler_k int
execute store result storage ckr_gliders:io result.damp_params[1] double 1 run scoreboard players get vve_euler_b int
execute store result storage ckr_gliders:io result.damp_params[2] double 1 run scoreboard players get vve_euler_f int
execute store result storage ckr_gliders:io result.damp_params[3] double 1 run scoreboard players get vve_euler_max int
execute store result storage ckr_gliders:io result.damp_params[4] double 1 run scoreboard players get vve_euler_vmax int
execute store result storage ckr_gliders:io result.target_euler[0] double 0.0001 run scoreboard players get target_theta int
execute store result storage ckr_gliders:io result.target_euler[1] double 0.0001 run scoreboard players get target_phi int
execute store result storage ckr_gliders:io result.target_euler[2] double 0.0001 run scoreboard players get target_psi int