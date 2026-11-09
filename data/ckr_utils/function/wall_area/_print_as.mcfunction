#ckr_utils:wall_area/_print_as
# 打印实例数据

tellraw @a ["wall_area as: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"@s", "objective":"x"}}, ", " ,{"score":{"name":"@s", "objective":"y"}}, ", " ,{"score":{"name":"@s", "objective":"z"}}, "]", ","]
tellraw @a ["    ", "size: ", "[", {"score":{"name":"@s", "objective":"d"}}, ", " ,{"score":{"name":"@s", "objective":"h"}}, ", " ,{"score":{"name":"@s", "objective":"l"}}, "]", ","]
tellraw @a ["    ", "nvec: ", "[", {"score":{"name":"@s", "objective":"nvec_x"}}, ", " ,{"score":{"name":"@s", "objective":"nvec_y"}}, ", " ,{"score":{"name":"@s", "objective":"nvec_z"}}, "]"]
tellraw @a "}"