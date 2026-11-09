#ckr_mobs:generic/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"x", "objective":"int"}}, ", " ,{"score":{"name":"y", "objective":"int"}}, ", " ,{"score":{"name":"z", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "health: ", {"score":{"name":"hp", "objective":"int"}}, ","]
tellraw @a ["    ", "damage: ", {"score":{"name":"damage", "objective":"int"}}, ","]
tellraw @a ["    ", "entity_type: ", {"nbt":"entity_type", "storage":"ckr_mobs:io"}, ","]
tellraw @a ["    ", "coins_range: ", "[", {"score":{"name":"coins_min", "objective":"int"}}, ", " ,{"score":{"name":"coins_max", "objective":"int"}}, "]", ","]
tellraw @a ["    ", "last_attacker: ", {"nbt":"last_attacker", "storage":"ckr_mobs:io"}]
tellraw @a "}"