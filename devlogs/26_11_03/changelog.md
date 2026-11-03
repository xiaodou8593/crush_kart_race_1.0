1. 添加了ckr_vehicles:_respawn
2. 修改了vve_tutor:_detect_plane,低于虚空线后调用ckr_vehicles:_respawn
3. 在_build_async_start中设置虚空线为-50.0