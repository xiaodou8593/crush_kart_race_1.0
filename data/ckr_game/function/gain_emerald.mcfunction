#ckr_game:gain_emerald
# ckr_game:rewarding调用

execute store result score inp int run random value 10..15
tellraw @a ["",{"text":"emerald: ","color":"dark_green","bold":true},{"text":"+","color":"gray"},{"score":{"name":"inp","objective":"int"},"color":"gray"}]
function vp_core:emerald/_add