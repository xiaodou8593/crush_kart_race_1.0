#ckr_game:_pop
# 临时对象出栈

data modify storage ckr_game:io input set from storage ckr_game:io rec[0]
data remove storage ckr_game:io rec[0]
function ckr_game:_proj