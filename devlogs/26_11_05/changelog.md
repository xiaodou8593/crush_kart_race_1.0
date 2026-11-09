1. 在start_game中重置了标题设置
2. 录入重生点数据到list_tracks[0]数据模板
3. 在_build_async_start中生成了vehicle_setup构造器，在_build_async_main中调度运行
4. _respawn重生动作包括姿态修正和动量、角动量清空
5. 添加了_respawn_async用于异步调用_respawn，并有防抖
6. 设置游戏时间为time set 22255，advance_time规则为false
7. 添加了倒计时音效
8. plane_y写进赛道数据模板
9. 修改防下车检测方案为谓词