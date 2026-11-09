# 2026-11-06 开发日志（整理版）

> 依据 11/06 改动的文件静态整理，未做游戏内运行验证。
> 规模：当天写入 110 个 mcfunction（crush_kart_race_1.0）+ 3 个（vcs_party_1.1），共 1733 行，其中 98 个为新建文件。
> 主题：赛道编辑器新增「墙 / 刷怪区」子编辑器，并补齐两者从数据模板到运行时实例的整条链路。

## 1. 编辑器：子编辑器 sub_edit（新增）

- 新增 `ckr_utils:guis/sub_edit`：`enter / main / items / exit` 四件套，外加 `place_wall / place_pool`。
  - `items`：两个 `shulker_spawn_egg` 当画笔，分别带 `ckr_wall_point`（红）与 `ckr_pool_point`（绿）标签；铁剑负责删点；8 号位粘土球是退出按钮（`item_model` 用 barrier，`consume_seconds` 设 1024 防误触）。
  - `enter`：`player.wall_cnt / pool_cnt` 不存在时置 0，首次进入用 `iframe:_inv` 备份背包。
  - `main`：沿用 track_edit 的 GUI 变动检测（比对 0~2 号槽 `custom_data.button`）；满 2 个 `ckr_wall_point` 调 `place_wall`，满 2 个 `ckr_pool_point` 调 `place_pool`。
  - `exit`：清掉两种点实体，再 `iframe:_exit_inv`。
- `place_wall / place_pool`：两点交给 `wall_area / pool_area` 的 `_shulker_to` → `_model` → 写入 `ckr_utils:io input` → `_new` 立刻出实例；随后 `player.wall_cnt / pool_cnt` +1 存回，并 `_update_display` 重画。
- 进出栈接口：`track_edit/_enter_sub`（`iframe:gui_stack/_push` + `iframe:_enter` 跳到 sub_edit）、`track_edit/_pop_sub`（`iframe:gui_stack/_pop`）。

## 2. 新模块 wall_area

- 临时对象：`center{x,y,z}`、`size{d,h,l}`、`nvec{nvec_x,nvec_y,nvec_z}`（见 `.doc.mcfo`）。
- 构建：`build/loop_barrier`、`loop_glass`、`loop_air` 三套逐格填充。
- 显示：`_shulker_new / _shulker_to` 生成边框显示体，`_update_display`、`_delete_display`（另有 `_as` 版本，按执行者而非实例）。
- 实例接口：`_get / _store / _model / _proj / _zero / _new / _del / _shift_vec`；`tick` 转 `main`；`_get_here_instance / get_here_check / _del_here` 实现「站在哪个墙里就编辑哪个」。
- 就近判定：`context_int_provider/wall_area/_max_dis.json` 取 `max(|c_x−x|−d, |c_y−y|−h, |c_z−z|−l)`，`res ≥ 1` 视为不在范围内。

## 3. 新模块 pool_area

- 临时对象：`center{x,y,z}`、`size{d,l}`、`spawn_interval / spawn_timer / spawn_max`、`spawn_plates:[ckr_utils:io spawn_plates,ListCompound]`。
- 运行：`tick` 遍历 `ckr_utils_pool_area` 实例跑 `main`；`spawn_timer` 每 tick +1 对 `spawn_interval` 取模，归零时以 `0-0-0-0-0` 假玩家为执行者调 `try_spawn`。
- `try_spawn`：`d/l × 2 / 10000` 得 dx/dz；按 `center ± size` 设置执行坐标；`try_spawn_cnt` 统计区域内实体；`res ≥ spawn_max` 直接返回，否则走 `_spawn_a_mob`。
- 刷怪板：`pull_spawn_plate`、`use_spawn_plate`、`_push / _pop` 维护 `spawn_plates` 列表。
- 显示与实例接口同 wall_area；构建只有 `build/barrier`、`build/air` 两套。
- 就近判定：`max(|c_x−x|−d, |c_y−y|−10, |c_z−z|−l)`，y 方向给固定 10 格容差。

## 4. 构造器 spawn_walls / spawn_pools

- 各 13 件 MOT 标准接口（`init/main/set/_class/_get/_del/_model/_new/_zero/_store/_iter_all/_iter/_start`）；`_class` 用 `_zero → _model` 的结果存成 `ckr_utils:class spawn_walls_plate / spawn_pools_plate`。
- 进度模型：`_start` 置 `vp_progress = 0`；`_iter` 每次取 `list_walls[0]`（或 `list_pools[0]`）并移除 → `_new` 出实例 → 打 `vp_instance` → `_get` → 按 `field_center` 经 `_shift_vec` 平移 → `_store` → `_update_display` → 重算进度（0→100）→ 满 100 调 `_del`。
- 接入：`ckr_game:_build_async_start`（61~75 行）生成两个构造器，数据源是 `ckr_game:io list_tracks[0].wall_plates / pool_plates`；列表为空时用 `execute unless data ... [0] run kill @e[tag=result,limit=1]` 兜底。
- 调度：`_build_async_main` 给 `tag=spawn_walls / spawn_pools` 的构造器打 `running`。

## 5. 存档 → 重建链路

- `track_edit/save_button`：先把 `ckr_utils:io temp` 重置为 `{slope_plates:[], plane_plates:[], wall_plates:[], pool_plates:[]}`，再按 `ckr_slope / ckr_plane / ckr_wall / ckr_pool` 逐个 `append_*`，最后把整个 `temp` 写进脚下箱子物品的 `custom_data.track_data`。
- `append_wall / append_pool`：用 `int` 分数（从 2147483647 起比）挑当前最小的实例，取完打 `tmp` 防重复；`_get` → 用反向 `field_center` 平移 → `_model` → `append` 到 `temp.wall_plates / temp.pool_plates`；递归推进到没有未标记实例为止。
- `track_edit/_spawn_track`：解析箱子里的 plates，依次跑 `spawn_planes / spawn_slopes / spawn_strips / spawn_walls / spawn_pools`，再按 `vve_slope_display` 区分实体与显示体、重打 `ckr_*` 标签，最后刷新 `player_space` 的 `slope_cnt / plane_cnt / pool_cnt / wall_cnt`。
- `running`：对 `tag=ckr_utils_pool_area,tag=vp_instance` 且满足谓词 `vp_core:_match_modular` 的实例每 tick 调 `pool_area/main`。
- `track_edit/exit`：统一清理 slope / plane / point 实体、两种 area 的实例与显示体、strip_area、spawn_vehicles。

## 6. 清理链修复（chunk_area 最后销毁）

- `_del_async_start` 置 `game_state` 并起异步循环；`_del_async_main` 每 tick 用 `schedule ... 1t replace` 自我重排；`del_loop` 每轮销毁 15 个实例。
- 场上只剩 `vp_instance_protected`（chunk_area）时先摘保护标记，把它们放进普通销毁流程；普通实例清空后才写 `clear done` → 转 `cleared`。
- 同步改了 `vcs_party_1.1`：`vp_core:utils/chunk_area/main`、`run_load_func`、`constructors/chunk_loader/unleash`，以及谓词 `vp_core:predicate/_match_modular.json`。

## 7. 数据模板与配置

- 新增 `.doc.mcfo`：`pool_area`、`constructors/spawn_pools`、`constructors/spawn_walls`。
- 新增 `context_int_provider/_max_dis.json`：`pool_area`、`wall_area`。
- MOT 记忆模板改动：`ckr_mem/templates/_shulker_to.mcfi`、`_shulker_new.mcfi`；`vp_mem_1.0/templates/del_loop.mcfi`、`_del_async_start.mcfi`、`_del_async_main.mcfi`；`vp_constructor_1.0/templates/_iter_all.mcfi`。

## 8. 遗留 / 待接（静态阅读 + 作者确认）

1. `_enter_sub / _pop_sub` 目前没有调用方——**按设计如此**，暂时由使用者手工执行，不做按钮。
2. `sub_edit/exit` 只做 `_exit_inv`，没走 `_pop_sub`，从子编辑器退出后不会自动回到 track_edit（计划 11/07 修）；`vp_core:guis/structure_manager` 有同类问题，后续一起处理。
3. `ckr_game:_init` 的 `list_tracks[0]` **已有** `wall_plates / pool_plates`，当前是空列表；`_build_async_start` 遇到空列表会用 `execute unless data ... [0]` 把构造器 kill 掉，所以内置赛道只建平面/斜面/条带，等编辑器产出回填后才会建墙和刷怪区。
4. 编辑器产出目前只落在 `save_button` 生成的箱子物品 `track_data` 里，全库没有把 `track_data` 读回 `list_tracks[0]` 的函数——回填方式待确认（手工抄 NBT，还是后续补一个导入函数）。

## 附：可直接粘贴的精简版

1. 修复了_del_async_start、_del_async_main、del_loop，用vp_instance_protected保护实例，使chunk_area最后销毁
2. 添加了ckr_utils:guis/sub_edit子编辑器（enter/main/items/exit），用shulker画笔放置wall_point和pool_point
3. 添加了ckr_utils:guis/sub_edit/place_wall、place_pool，两点成墙/成池并立即实例化
4. 添加了ckr_utils:guis/track_edit/_enter_sub、_pop_sub，基于iframe:gui_stack进退子编辑器
5. 添加了ckr_utils:wall_area（center/size/nvec，barrier、glass、air三种构建，shulker显示体）
6. 添加了ckr_utils:pool_area（center/size/spawn_interval/spawn_max/spawn_plates，按tick刷怪）
7. 添加了ckr_utils:constructors/spawn_pools、spawn_walls，按vp_progress从0到100异步实例化
8. 添加了ckr_utils:guis/track_edit/append_wall、append_pool，存档时把墙和池写入temp.wall_plates、temp.pool_plates
9. 修改了_build_async_start、_build_async_main、running、track_edit/exit，接入墙与池的生成和运行调度
10. 添加了pool_area、spawn_pools、spawn_walls的.doc.mcfo，以及pool_area、wall_area的context_int_provider/_max_dis.json
11. 修改了vcs_party_1.1的chunk_area/main、run_load_func、chunk_loader/unleash和vp_core:_match_modular谓词
