#vve_tutor:simulator/init
# 初始化simulator模拟器

data modify storage vve:io tick_funcs set value []
data modify storage vve:io sync_funcs set value []

function vve_tutor:simulator/_class