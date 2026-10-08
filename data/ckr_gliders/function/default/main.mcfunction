#ckr_gliders:default/main
# ckr_gliders:default/tick调用
# 输入vve:vehicle{...}
# 输入<shift_cnt,int>
# 实体对象主程序

execute if score shift_cnt int matches 1.. run return run function ckr_gliders:default/_del
function ckr_gliders:default/_get
scoreboard players operation temp_state int = control_active int
execute if score temp_state int matches ..0 run function ckr_gliders:default/opening
execute if score temp_state int matches 1.. run function ckr_gliders:default/controlling
function ckr_gliders:default/_store