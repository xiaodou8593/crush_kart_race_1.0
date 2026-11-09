# 2026-11-07 测试计划

> 目标：把 11/06 新增的「墙 / 刷怪区」整条链路在游戏里跑一遍，只测不开发（除 F1 一处小修）。
> 链路：编辑（sub_edit）→ 存档（save_button / append_*）→ 回填（list_tracks[0]）→ 异步构建（spawn_walls / spawn_pools）→ 运行时（pool_area 刷怪）→ 清理（_del_async_*）。
> 结论以「现象 + 复现步骤 + 线索位置」记录，`changelog.md` 当天写。

## 0. 完成标准

- T1–T10 每项都有明确结论：通过 / 失败（附复现与定位线索）。
- F1 已修且回归通过；F2 只登记，不动代码。
- 当天 `devlogs/26_11_07/changelog.md` 完成。

## 1. 前置准备（约 30 分钟）

1. **备份**：把 `saves/vcs_party_2027` 整个复制一份（`_bak_1107`），或至少 `/save-off` 后备份 `datapacks/`。
2. **环境**：`/reload` → `/datapack list` 确认 `crush_kart_race_1.0`、`iframe_1.2`、`vp_core`（vcs_party_1.1）、`marker_control`、`math3.2` 均 enabled。
3. **标签**（条件检查要看它们）：
   - `/tag @s add vp_gamer`（`_start_check` 用）
   - `/tag @s add vp_joiner`（`_enter_check` 用；构建期会被切旁观）
4. **进测试场地 / 打开编辑器**：
   - `/function ckr_utils:_build_test_track`
   - 它会把 `vp_core:io field_center` 设为 `[-63.5, -41.0, 152.0]`、tp 玩家过去，并 `iframe:_ienter` 打开 `ckr_utils:guis/track_edit`。
   - 注意：之后的编辑坐标都以这个 `field_center` 为基准，存档/重建时会被加减平移。
5. **调试窗口**：
   - `/scoreboard objectives setdisplay sidebar int`
   - `/data get storage ckr_game:io list_tracks[0].wall_plates`
   - `/data get storage ckr_utils:io temp`
   - `/execute if entity @e[tag=ckr_utils_wall_area]`、`@e[tag=ckr_utils_pool_area]`、`@e[tag=vp_instance]`、`@e[tag=vp_constructor]`
6. **每轮清场**（避免上轮残留误导计数）：
   - `/kill @e[tag=ckr_wall_point]`、`/kill @e[tag=ckr_pool_point]`
   - `/function ckr_game:_del_async_start`（正常清理）或 `/kill @e[tag=vp_instance]`（暴力）

## 2. 用例

### T1 编辑器进入 / 退出（回归）
- **步骤**：`/function ckr_utils:_build_test_track` → 点 8 号退出。
- **预期**：界面打开、8 号是 barrier 图标的退出；退出后 slope / plane / 其 point 实体、`ckr_utils_wall_area`、`ckr_utils_pool_area`、`ckr_utils_strip_area`、`spawn_vehicles` 全被清掉，背包还原。
- **失败时看**：`/execute if entity @e[tag=ckr_utils_wall_area]` 是否仍为 1；`track_edit/exit` 的 11–16 行。

### T2 手工进子编辑器 + 初始计数
- **步骤**：在 track_edit 内执行 `/function ckr_utils:guis/track_edit/_enter_sub`。
- **预期**：`iframe:gui_stack` 入栈、界面切到 sub_edit；背包变成两个 shulker_spawn_egg（0 号 wall_point 红、1 号 pool_point 绿）+ 铁剑 + 8 号 clay_ball；`player.wall_cnt` / `player.pool_cnt` 初始为 0。
- **检查**：`/data get storage iframe:io player`、`/data get storage iframe:io gui_stack`。
- **反向**：`/function ckr_utils:guis/track_edit/_pop_sub` 能否回到 track_edit（这是 F1 的手工对照组）。

### T3 两点成墙（place_wall）
- **步骤**：用 0 号蛋放 2 个 `ckr_wall_point`，先试正交方向（一条边沿 x、一条边沿 z），再试斜向。
- **预期**：满 2 点触发 `place_wall`，点被清、生成 1 个 `ckr_utils_wall_area` 实例 + 显示体，`player.wall_cnt` +1。
- **检查**：`/data get entity @e[tag=ckr_utils_wall_area,limit=1]` 的 center / size{d,h,l} / nvec 是否与两点几何相符；斜向时 nvec 是否归一化、有无取整误差。
- **失败时看**：`/data get storage ckr_utils:io`（`_shulker_to` 的中间产物）、`wall_area/_model` 输出。

### T4 两点成池（place_pool）
- **步骤**：用 1 号蛋放 2 个 `ckr_pool_point`。
- **预期**：生成 1 个 `ckr_utils_pool_area` 实例 + 显示体，`player.pool_cnt` +1；`spawn_interval` / `spawn_timer` / `spawn_max` 有初始值。
- **重点**：pool 是 `size{d,l}`（没有 h），确认 d 对应 x、l 对应 z，且 y 由 `center.y` 决定；两个方向各放一次对比。
- **失败时看**：`pool_area/_shulker_to`、`_new`、`_get`。

### T5 存档（save_button）
- **步骤**：回 track_edit（或就在原位），点 4 号保存。
- **预期**：脚下生成 1 个 chest，`Items[0]` 是玻璃，`custom_data.track_data` 里含 `slope_plates` / `plane_plates` / `wall_plates` / `pool_plates` 四个数组，数量与场上实例一致，坐标已减去 `field_center`。
- **检查**：`/data get block <x> <y> <z> Items[0].components."minecraft:custom_data".track_data`
- **重点**：
  - 连按两次保存，第二次结果应与第一次一致（`tmp` 标签是否清干净）。
  - 空类别应保持空数组，不报错。

### T6 重建（_spawn_track）
- **步骤（A，推荐）** 先把 T5 箱子里的 `track_data` 手工写进 `ckr_game:io list_tracks[0]`，再 `/function ckr_utils:build_test_track`；**（B）** 也可以直接 `execute as 0-0-0-0-1 on origin run function ckr_utils:guis/track_edit/_spawn_track`（需 `ckr_utils:io input` 已就绪）。
- **预期**：先清掉旧实例与显示体 → 依次跑 `spawn_planes / spawn_slopes / spawn_strips / spawn_walls / spawn_pools` → 重打 `ckr_plane` / `ckr_slope` / `ckr_utils_wall_area` / `ckr_utils_pool_area` 标签 → `player_space` 四个 count 刷新 → 所有 `vve_slope_display` 亮度设 15。
- **检查**：实例数、位置误差（应 ≤ 1 格）、`wall/pool` 实例与存档数量一致。
- **注意**：`_spawn_track` 末尾的 `pool_cnt/wall_cnt` 用的是 `execute store result ... if entity`，值可能是「是否有」而非「有几个」，确认一下预期语义。

### T7 异步构建时序（_build_async_start / _build_async_main）
- **步骤**：`/function ckr_game:_build_async_start`（确认 `list_tracks[0]` 与 `field_center` 已就绪）。
- **预期**：
  - 立即生成 chunk_loader / area_clear / spawn_planes / spawn_slopes / spawn_strips / spawn_walls / spawn_pools / spawn_vehicles 等构造器；
  - `schedule ckr_game:_build_async_main 1t` 起循环；
  - 构造器按 21–31 行的固定顺序逐个拿 `running`，`vp_progress` 0→100；
  - 全部结束后 `game_state` 置 `prepare done`，下一 tick 变 `prepared`；玩家从旁观恢复。
- **检查**：`/scoreboard players get vp_progress int`（应为 0→100 单调）、`/data get storage vp_core:io game_state`（prepare done → prepared）、`@e[tag=vp_constructor,tag=running]` 会逐个交接。
- **边界**：`wall_plates` / `pool_plates` 为空列表时，两个构造器应被 `execute unless data ... [0]` 的兜底 kill 掉，**不卡流程**（这是预期行为，不算失败）。

### T8 运行时刷怪（pool_area）
- **步骤**：进 `running`（走完整流程或 `/data modify storage vp_core:io game_state set value "running"`），把某个 pool 的 `spawn_interval` 改 20、`spawn_max` 改 1。
- **预期**：`spawn_timer` 每 tick +1 并对 `spawn_interval` 取模；归零时以 `0-0-0-0-0` 执行 `try_spawn`；执行点被设到区域角点；`try_spawn_cnt` 统计区域实体；`res ≥ spawn_max` 后不再生成；`_spawn_a_mob` 生成 1 只。
- **检查**：`/data get entity @e[tag=ckr_utils_pool_area,limit=1] spawn_timer`；`/scoreboard players get spawn_timer int`；实际生物数。
- **重点**：确认 `try_spawn_cnt` 的口径——玩家、载具、显示体、刷怪板是否被算进「区域实体数」，会不会一开始就判定「已满」。

### T9 清理链（_del_async_start）
- **步骤**：`/function ckr_game:_del_async_start`。
- **预期**：`game_state` 走 `clear done` → `cleared`；每 tick `del_loop` 销毁 15 个；普通实例先清空，`vp_instance_protected` 摘标记后最后销毁；chunk_area 最后消失；pool/wall 显示体被 `_delete_display` 收掉。
- **检查**：`/execute if entity @e[tag=vp_instance,tag=!vp_instance_protected]` 数量递减；结束后 `@e[tag=vp_instance]` 为 0；有没有残留的显示体。

### T10 距离判定（_get_here_instance / get_here_check）
- **步骤**：站进墙/池中心、边界外 1 格、外 5 格、y 方向 ±9 / ±11 各一次，每次 `/execute as @e[tag=math_marker,limit=1] run function ckr_utils:pool_area/_get_here_instance`。
- **预期**：`_max_dis` 结果为 `max(|c_x−x|−d, |c_y−y|−10, |c_z−z|−l)`；`res ≥ 1` 判 `return fail`，`res = 0` 给 `result` 标签；墙版用 `h` 代替固定 10。
- **失败时看**：`/scoreboard players get res int`、`/tag <实体> list`。

## 3. 修复项

- **F1（当天做）** `sub_edit/exit` 退出后不回到 track_edit：在 `exit` 里补 `function ckr_utils:guis/track_edit/_pop_sub`。
  - 要试两个顺序：`pop → _exit_inv` 与 `_exit_inv → pop`，看哪个背包/界面状态正确（`_pop_sub` 只做 `gui_stack/_pop`，真正重进界面靠 iframe 的栈机制）。
- **F2（只记录，11/08 处理）** `vp_core:guis/structure_manager` 存在同类「退出不回上层」问题；先登记现象与调用链，不动代码。

## 4. 时间盒

| 时段 | 内容 |
|---|---|
| 上午前半 | 备份 + 准备 + T1 / T2 |
| 上午后半 | T3 / T4（编辑器产出，最可能出问题的地方） |
| 下午前半 | T5 / T6（存档、重建） |
| 下午中段 | T7 / T8（构建时序、刷怪） |
| 下午后段 | T9 / T10 + F1 修复与回归 |
| 收尾 | 写 changelog，整理截图与线索 |

任一项卡住超过 45 分钟就先记录现象跳过，别在单项上耗掉整天。

## 5. 记录模板（每项 5 行）

```
T?: 结论（通过/失败）
现象：
复现：
线索：storage/scoreboard 值、实体标签、截图
猜测：
```

## 6. 风险与易踩的坑

- `_build_test_track` 会改 `field_center` 到 `[-63.5,-41,152]`；换场地后所有坐标平移基准都变，比对存档数据时先确认这一点。
- 构建期 `_build_async_start` 会把 `vp_joiner` 切成旁观；测运行期前要恢复游戏模式。
- 反复 `/reload` 会留下未清理的 `vp_instance`，构造器的 `temp_cnt` 统计会被污染；每轮先清场。
- 单人要手动打 `vp_gamer` / `vp_joiner`，否则 `_start_check` / `_enter_check` 返回 0，游戏会直接跳 `over`。
- 空列表导致构造器被 kill 是设计内的兜底，别当成 bug 记。

## 7. 待确认的问题（测到就记一笔）

1. `spawn_interval` / `spawn_max` 的默认值来自哪里（`_shulker_to` / `_new` / `_model`）？编辑器里放下的池，默认多久刷一次、上限几只？
2. `pool_area` 只有 `size{d,l}`，y 方向靠 `center.y`，那 d/l 与 x/z 的对应关系是否稳定？斜放两个点时会不会翻转。
3. `try_spawn_cnt` 的统计口径（玩家 / 载具 / 显示体 / 刷怪板是否计入）。
4. `spawn_plates` 什么时候被填（`pull_spawn_plate` / `use_spawn_plate` 的触发条件），刷怪板是编辑器放的还是运行时拿的。
5. 编辑器产出怎么回到 `list_tracks[0]`：目前 `save_button` 只把 `track_data` 写进箱子物品，全库没有任何函数读 `track_data`——是设计成手工抄 NBT，还是缺一个导入函数？（今天先按「手工写回」走通 T6，并把结论记下来。）
6. `_spawn_track` 末尾的 `pool_cnt` / `wall_cnt` 用 `execute store result ... if entity` 写入，值是「有没有」还是「有几个」。
7. 墙的 `nvec` 在两点连成斜线时是否归一化，`build/loop_*` 用整数步进是否会漏格或出锯齿。

## 8. 有余力再做（非必须）

- 给 `append_wall` / `append_pool` 的空列表与异常（实例无 `int` 分数）加保护，避免递归不收敛。
- `sub_edit` 退出后自动回 track_edit（F1）扩展到 `structure_manager`（F2 的预研）。
- 记录一次完整构建的耗时（从 `_build_async_start` 到 `prepared` 的 tick 数），给后续性能优化留基线。
