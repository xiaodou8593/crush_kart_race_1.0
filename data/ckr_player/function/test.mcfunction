#ckr_player:test

tellraw @a ["Health_1: ", {"nbt":"Health","entity":"@s"}]
effect give @s minecraft:instant_health 1 5 true
tellraw @a ["Health_2: ", {"nbt":"Health","entity":"@s"}]

schedule function ckr_player:test_async 2t replace