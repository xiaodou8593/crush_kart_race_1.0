#ckr_utils:constructors/spawn_vehicles/_print
# 打印临时对象数据

tellraw @a ["spawn_vehicles: ", "{"]
tellraw @a ["    ", "progress: ", {"score":{"name":"vp_progress", "objective":"int"}}, ","]
tellraw @a ["    ", "list_uuids: ", {"nbt":"list_uuids", "storage":"ckr_utils:io"}, ","]
tellraw @a ["    ", "vehicles_cnt: ", {"score":{"name":"vehicles_cnt", "objective":"int"}}, ","]
tellraw @a ["    ", "range: ", "[", {"score":{"name":"d", "objective":"int"}}, ", " ,{"score":{"name":"l", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"x", "objective":"int"}}, ", " ,{"score":{"name":"y", "objective":"int"}}, ", " ,{"score":{"name":"z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "uvw_coord: ", "{"]
tellraw @a ["    ", "    ", "ivec: ", "[", {"score":{"name":"ivec_x", "objective":"int"}}, ", " ,{"score":{"name":"ivec_y", "objective":"int"}}, ", " ,{"score":{"name":"ivec_z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "jvec: ", "[", {"score":{"name":"jvec_x", "objective":"int"}}, ", " ,{"score":{"name":"jvec_y", "objective":"int"}}, ", " ,{"score":{"name":"jvec_z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "kvec: ", "[", {"score":{"name":"kvec_x", "objective":"int"}}, ", " ,{"score":{"name":"kvec_y", "objective":"int"}}, ", " ,{"score":{"name":"kvec_z", "objective":"int"}}, "]"]
tellraw @a ["    ", "}", ","]
tellraw @a ["    ", "quaternion: ", "{"]
tellraw @a ["    ", "    ", "xyzw: ", "[", {"score":{"name":"quat_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "start_xyzw: ", "[", {"score":{"name":"quat_start_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_start_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "orth_xyzw: ", "[", {"score":{"name":"quat_orth_x", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_y", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_z", "objective":"int"}}, ", " ,{"score":{"name":"quat_orth_w", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "    ", "phi: ", {"score":{"name":"quat_phi", "objective":"int"}}]
tellraw @a ["    ", "}"]
tellraw @a "}"