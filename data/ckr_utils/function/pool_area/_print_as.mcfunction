#ckr_utils:pool_area/_print_as
# 打印实例数据

tellraw @a ["_entity: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"@s", "objective":"x"}}, ", " ,{"score":{"name":"@s", "objective":"y"}}, ", " ,{"score":{"name":"@s", "objective":"z"}}, "]", ","]
tellraw @a ["    ", "size: ", "[", {"score":{"name":"@s", "objective":"d"}}, ", " ,{"score":{"name":"@s", "objective":"l"}}, "]", ","]
tellraw @a ["    ", "spawn_interval: ", {"score":{"name":"@s", "objective":"spawn_interval"}}, ","]
tellraw @a ["    ", "spawn_timer: ", {"score":{"name":"@s", "objective":"spawn_timer"}}, ","]
tellraw @a ["    ", "spawn_max: ", {"score":{"name":"@s", "objective":"spawn_max"}}, ","]
tellraw @a ["    ", "spawn_plates: ", {"nbt":"data.spawn_plates", "entity":"@s"}]
tellraw @a "}"