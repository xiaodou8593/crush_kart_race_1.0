#ckr_utils:strip_area/test/shift_vec_loop
# ckr_utils:strip_area/test/shift_vec调用

data modify storage ckr_utils:io input set from storage ckr_utils:io list[0]
data remove storage ckr_utils:io list[0]
function ckr_utils:strip_area/_proj
function ckr_utils:strip_area/_shift_vec
function ckr_utils:strip_area/_model
data modify storage ckr_utils:io list append from storage ckr_utils:io result

scoreboard players remove loop int 1
execute if score loop int matches 1.. run function ckr_utils:strip_area/test/shift_vec_loop