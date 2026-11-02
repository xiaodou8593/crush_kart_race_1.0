1. _set_player函数实现玩家骑乘自己的载具
2. 新建vehicle_setup构造器
3. strip_area添加index字段，每个数据模板同步更新，标号0~4
4. 游戏添加了strips_cnt字段
5. 调整了构造器顺序，不再使用player_teleport构造器
6. 游戏添加了game_time字段，实现了counting_down状态
7. _build_async_start时调用模拟器_stop，确保模拟器不会异步加载
8. running状态下调用模拟器主函数
9. running状态下实现了玩家防下车逻辑
10. strip_area添加重生点字段respawn_pos，跟随_shift_vec接口同步平移
11. vehicle_setup构造器，将车辆初始化后带ckr_vehicle_init
    * 初始化重生点数据storage marker_control:io result.respawn_pos
    * 初始化已过检查点数据storage marker_control:io result.last_index
    * 初始化圈数数据storage marker_control:io result.laps
12. track_edit界面添加了_enter_manager和_pop_manager
    * 用于临时进入structure_manager界面，使用相对坐标工具
13. 添加了strip_area/funcs/下的abcd四种检查点回调函数