#ckr_utils:wall_area/_print
# 打印临时对象数据

tellraw @a ["wall_area: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"x", "objective":"int"}}, ", " ,{"score":{"name":"y", "objective":"int"}}, ", " ,{"score":{"name":"z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "size: ", "[", {"score":{"name":"d", "objective":"int"}}, ", " ,{"score":{"name":"h", "objective":"int"}}, ", " ,{"score":{"name":"l", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "nvec: ", "[", {"score":{"name":"nvec_x", "objective":"int"}}, ", " ,{"score":{"name":"nvec_y", "objective":"int"}}, ", " ,{"score":{"name":"nvec_z", "objective":"int"}}, "]"]
tellraw @a "}"