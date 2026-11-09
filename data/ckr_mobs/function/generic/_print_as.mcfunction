#ckr_mobs:generic/_print_as
# 打印实例数据

tellraw @a ["_entity: ", "{"]
tellraw @a ["    ", "center: ", "[", {"score":{"name":"@s", "objective":"x"}}, ", " ,{"score":{"name":"@s", "objective":"y"}}, ", " ,{"score":{"name":"@s", "objective":"z"}}, "]", ","]
tellraw @a ["    ", "health: ", {"score":{"name":"@s", "objective":"hp"}}, ","]
tellraw @a ["    ", "damage: ", {"score":{"name":"@s", "objective":"damage"}}, ","]
tellraw @a ["    ", "entity_type: ", {"nbt":"data.entity_type", "entity":"@s"}, ","]
tellraw @a ["    ", "coins_range: ", "[", {"score":{"name":"@s", "objective":"coins_min"}}, ", " ,{"score":{"name":"@s", "objective":"coins_max"}}, "]", ","]
tellraw @a ["    ", "last_attacker: ", {"nbt":"data.last_attacker", "entity":"@s"}]
tellraw @a "}"