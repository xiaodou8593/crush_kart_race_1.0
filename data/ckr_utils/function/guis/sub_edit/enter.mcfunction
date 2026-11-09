#ckr_utils:guis/sub_edit/enter

function iframe:player_space/_get
execute unless data storage iframe:io player.wall_cnt run data modify storage iframe:io player.wall_cnt set value 0
execute unless data storage iframe:io player.pool_cnt run data modify storage iframe:io player.pool_cnt set value 0
function iframe:player_space/_store
execute unless data storage iframe:io player.cache_inv run function iframe:_inv
function ckr_utils:guis/sub_edit/items