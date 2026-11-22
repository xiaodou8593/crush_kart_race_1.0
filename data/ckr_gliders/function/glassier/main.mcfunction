#ckr_gliders:glassier/main
# ckr_gliders:glassier/tick调用
# 输入vve:vehicle{...}
# 输入<shift_cnt,int>
# 实体对象主程序

execute if score shift_cnt int matches 1.. run return run function ckr_gliders:glassier/_del

function ckr_gliders:glassier/_get
scoreboard players operation temp_state int = control_active int
execute if score temp_state int matches ..0 run function ckr_gliders:glassier/opening
execute if score temp_state int matches 1.. run function ckr_gliders:glassier/controlling
function ckr_gliders:glassier/_store