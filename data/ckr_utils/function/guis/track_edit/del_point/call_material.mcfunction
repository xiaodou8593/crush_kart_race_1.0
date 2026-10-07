#ckr_utils:guis/track_edit/del_point/call_material
# ckr_utils:guis/track_edit/del_point/_detect_element调用

execute if score material_response int matches 1.. run return fail
function module_control:_call_method {path:"check_material"}
execute if score material_response int matches ..0 run return fail

# 删除逻辑
execute if data entity @s data.display_uuid run data modify entity 0-0-0-0-1 Thrower set from entity @s data.display_uuid
execute if data entity @s data.display_uuid as 0-0-0-0-1 on origin run kill @s
kill @s