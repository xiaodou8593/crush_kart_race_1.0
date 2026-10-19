#ckr_utils:constructors/spawn_vehicles/_pop
# 临时对象出栈

data modify storage ckr_utils:io input set from storage ckr_utils:io rec[0]
data remove storage ckr_utils:io rec[0]
function ckr_utils:constructors/spawn_vehicles/_proj