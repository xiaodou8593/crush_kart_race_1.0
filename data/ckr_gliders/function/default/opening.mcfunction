#ckr_gliders:default/opening
# ckr_gliders:default/main调用

scoreboard players operation temp_scale int = control_active int
scoreboard players operation temp_scale int *= 3 int
scoreboard players add temp_scale int 30
execute store result storage math:io scale[] float 0.1 run scoreboard players operation temp_scale int > 0 int
data modify storage ckr_gliders:io result set value {start_interpolation:0}
data modify storage ckr_gliders:io result.transformation.scale set from storage math:io scale
data modify entity @s {} merge from storage ckr_gliders:io result

scoreboard players add control_active int 1