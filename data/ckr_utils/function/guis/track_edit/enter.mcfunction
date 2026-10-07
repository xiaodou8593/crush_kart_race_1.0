#ckr_utils:guis/track_edit/enter

function iframe:player_space/_get
execute unless data storage iframe:io player.slope_cnt run data modify storage iframe:io player.slope_cnt set value 0
execute unless data storage iframe:io player.plane_cnt run data modify storage iframe:io player.plane_cnt set value 0
function iframe:player_space/_store
execute unless data storage iframe:io player.cache_inv run function iframe:_inv
function ckr_utils:guis/track_edit/items