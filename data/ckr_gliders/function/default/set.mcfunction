#ckr_gliders:default/set
# ckr_gliders:default/_new调用

execute store result score @s control_active run data get storage ckr_gliders:io input.control_active
execute store result score @s vve_euler_k run data get storage ckr_gliders:io input.damp_params[0]
execute store result score @s vve_euler_b run data get storage ckr_gliders:io input.damp_params[1]
execute store result score @s vve_euler_f run data get storage ckr_gliders:io input.damp_params[2]
execute store result score @s vve_euler_max run data get storage ckr_gliders:io input.damp_params[3]
execute store result score @s vve_euler_vmax run data get storage ckr_gliders:io input.damp_params[4]
execute store result score @s target_theta run data get storage ckr_gliders:io input.target_euler[0] 10000
execute store result score @s target_phi run data get storage ckr_gliders:io input.target_euler[1] 10000
execute store result score @s target_psi run data get storage ckr_gliders:io input.target_euler[2] 10000