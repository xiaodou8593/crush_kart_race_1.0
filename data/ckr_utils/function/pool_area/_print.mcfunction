#ckr_utils:pool_area/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"x", "objective":"int"}}, ", " ,{"score":{"name":"y", "objective":"int"}}, ", " ,{"score":{"name":"z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "size: ", "[", {"score":{"name":"d", "objective":"int"}}, ", " ,{"score":{"name":"l", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "spawn_interval: ", {"score":{"name":"spawn_interval", "objective":"int"}}, ","]
tellraw @a ["    ", "spawn_timer: ", {"score":{"name":"spawn_timer", "objective":"int"}}, ","]
tellraw @a ["    ", "spawn_max: ", {"score":{"name":"spawn_max", "objective":"int"}}, ","]
tellraw @a ["    ", "spawn_plates: ", {"nbt":"spawn_plates", "storage":"ckr_utils:io"}]
tellraw @a "}"