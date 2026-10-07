#ckr_gliders:default/init
# 初始化default模块


scoreboard objectives add control_active dummy
scoreboard objectives add vve_euler_k dummy
scoreboard objectives add vve_euler_b dummy
scoreboard objectives add vve_euler_f dummy
scoreboard objectives add vve_euler_max dummy
scoreboard objectives add vve_euler_vmax dummy
scoreboard objectives add target_theta dummy
scoreboard objectives add target_phi dummy
scoreboard objectives add target_psi dummy

function ckr_gliders:default/_consts

function ckr_gliders:default/_class

function ckr_gliders:default/init_operation