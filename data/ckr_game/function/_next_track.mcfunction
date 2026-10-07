#ckr_game:_next_track
# 转动赛道列表

data modify storage ckr_game:io list_tracks append from storage ckr_game:io list_tracks[0]
data remove storage ckr_game:io list_tracks[0]