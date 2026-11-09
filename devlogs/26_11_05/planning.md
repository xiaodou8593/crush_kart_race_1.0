# crush_kart_race 1.0 — 子编辑器与刷怪系统规划

> 版本：26_11_05
> 状态：规划稿（未开始实现）
> 关联：`devlogs/26_11_05/changelog.md`（当日已完成的倒计时/重生改动）

---

## 0. 本轮决策快照

| # | 决策 | 对架构的影响 |
|---|---|---|
| 1 | 墙体几何 = **内侧法向 + 两层屏障 + 最外层品红玻璃** | wall plate 必须带 `facing`；构造器铺 3 层，玻璃在法向反侧 |
| 2 | 怪物用**虚拟血量**（记分板 hp），扣血与死亡走函数接口 | 不需要原版 DeathLootTable / advancement 归属；怪必须 `Invulnerable:1b` 防止被原版打死绕过逻辑 |
| 3 | 刷怪区上限**只统计本区** | 每只怪带 `ckr_area` 分数，区域按分数比对计数 |
| 4 | 会话数据继续用 `ckr_utils:io temp`，**父界面统一保存** | 子 UI 只 append，父 `save_button` 修掉整体覆盖 |
| 5 | 金币 = **虚拟记分板直接入账** | 新 objective `ckr_coin`；不做掉落物 |
| 6 | **车撞怪是主要玩法** | 伤害主入口在 `blue_car/main_damage`；归属 = 驾驶员槽位 |
| 7 | 每个区域有自己的**怪物模板池** | spawn_area plate 内嵌 `mob_pool` 数组 |

---

## 1. 范围

**做**：`ckr_utils:guis/sub_edit` 子界面（取点 → 造墙 plate / 刷怪区 plate → 追加到会话数据）；两个构造器；区域刷怪；虚拟血量；车撞扣血；死亡结算金币；清理。

**不做**：怪物 AI 定制、波次/难度曲线、掉落物金币、墙体材质皮肤、多边形赛道、近战打怪（预留接口，见 §9）。

---

## 2. 可复用的现成机制

| 需求 | 现成实现 | 复用方式 |
|---|---|---|
| 子 UI 进出 | `track_edit/structure_manager.mcfunction` | `iframe:gui_stack/_push` → 写 `iframe:io input` → `iframe:_enter` |
| 子 UI 返回 | `vp_core:guis/structure_manager/exit.mcfunction` | `iframe:gui_stack/_empty` → 非空则 `_pop`，空则 `_exit_inv` |
| 父界面重绘 | `iframe:update_gui.mcfunction` | `_pop` 会打 `iframe_update`，父 `enter` 自动重跑 |
| 按钮/取点 | `track_edit/items.mcfunction` + `iframe_crc_state` + `sel.components.custom_data` | 潜影贝当取点器，与 `ckr_slope_point` 同构 |
| 两点 → AABB | `track_edit/place_plane.mcfunction` + `strip_area/_calc_chunk_range` | 墙与刷怪区共用同一套换算 |
| 场地相对坐标 | `track_edit/append_plane.mcfunction` | 减去 `field_center` 再入 plate |
| 半透明预览 | `math:visual_plane/_model` + `_new` | 墙 = 1 个竖面；刷怪区 = 6 面或 `math:particle` 线框 |
| 异步构造 | `_build_async_start` / `_build_async_main` 顺序表 | 新构造器打 `vp_constructor` + 专属 tag，插进顺序表 |
| 实例清理 | `del_loop.mcfunction` | 怪与区域打 `vp_instance`；无 `module_id` 的直接被 kill |
| 墙体碰撞 | `vve_tutor:_detect_plane` → `barrier_wall` | 真屏障方块即可，无需新物理 |

---

## 3. 数据流

```
[编辑期]
track_edit ──按钮──> sub_edit
                       ├ 两点取点 → wall_plate        ─┐
                       ├ 两点取点 → spawn_area_plate   ├→ ckr_utils:io temp.*
                       └ 模板池点选 → 区域 mob_pool    ─┘
                                              ↓
                      track_edit/save_button → 箱子物品 custom_data（完整赛道）
                                              ↓ 人工粘贴
                      ckr_game:_init → list_tracks[0].{wall_plates, spawn_area_plates}

[运行期]
_build_async_start → wall_builder  → fill 屏障 + 玻璃
                   → spawn_area    → 生成区域 marker（存 AABB + 模板池）
_build_async_main  → 顺序调度（墙必须在 area_clear 之后）

running 每 tick
  └ spawn_area/main：计时 → 数本区怪 → 未满 → 从池里抽模板 → 随机点校验 → summon → 注册

车撞
  └ blue_car/main_damage → 命中怪 → 打 ckr_hitter（驾驶员） → ckr_mobs:_damage
        └ hp -= dmg → hp<=0 → ckr_mobs:_die
              └ 金币给 last_hitter → 区域计数 -1 → 特效 → kill @s
```

---

## 4. 数据模型

### 4.1 `list_tracks[0].wall_plates[n]`

```jsonc
{
  "coord": [-63.5, 6.0, 108.0],   // 内侧屏障层 AABB 中心（相对 field_center）
  "size":  [0.5, 3.0, 12.0],      // 三方向半尺寸；法向轴固定 0.5（=2 层屏障）
  "chunk_range": [-5, 6, -4, 7],
  "facing": "north",              // 内侧法向（轨道在墙的这一侧）
  "block": "minecraft:barrier"    // 预留：换玻璃墙/岩浆墙
}
```

**三层几何**（以 `facing = south`、法向 n=(0,0,1) 为例，从轨道向外）：

```
[轨道]  屏障 L1（coord）  屏障 L2（coord - n）  品红玻璃（coord - 2n）  [场外]
```

- L1、L2：`fill barrier`，厚度 2 格。两层是为高速载具的隧穿冗余——载具用 8 个离散 cpoint 采样，单层在高速下可能整步跨过。
- 玻璃：`fill magenta_stained_glass`，只在法向反侧铺一层，作用见 §6.1。
- `facing = up`（天花板）不铺玻璃，由 `barrier_wall_up` 的法向 +Y 兜底。

### 4.2 `list_tracks[0].spawn_area_plates[n]`

```jsonc
{
  "coord": [-40.0, 8.0, -60.0],   // AABB 中心（相对 field_center）
  "size":  [8.0, 4.0, 8.0],       // 半尺寸
  "chunk_range": [-3, -4, -1, -2],
  "mob_max": 4,                   // 本区同时存活上限
  "interval": 100,                // 生成间隔（tick）
  "mob_pool": [                   // 本区专属模板池
    { "type":"minecraft:zombie",   "hp":40, "coin":3, "weight":3, "nbt":"" },
    { "type":"minecraft:skeleton", "hp":30, "coin":5, "weight":1, "nbt":"" }
  ]
}
```

- `weight`：权重抽取，`random value 1..Σweight` 后逐项累减。
- `hp`：虚拟血量上限；`coin`：击杀奖励金币数。
- `nbt`：可选 SNBT 覆盖（装备、`NoAI`、`Attributes` 等），空串表示用默认。

### 4.3 怪物运行时数据（`@s data`，走 `marker_control:data`）

```jsonc
{
  "area": 2,            // 归属区域索引（供计数与清理）
  "hp": 40, "hp_max": 40,
  "coin": 3,
  "last_hitter_slot": 1 // 驾驶员槽位号（对应 ckr_vehicle_slot）
}
```

> 归属用**槽位号**而不是 UUID：项目已有"玩家 ↔ `ckr_vehicle_slot`"映射（`spawn_vehicles/_iter`），死亡时 `@a[scores={ckr_vehicle_slot=N}]` 一步定位，无需解析 UUID。

---

## 5. 任务分解

### M1 编辑器外壳

| # | 任务 | 产出 | 规模 |
|---|---|---|---|
| T1 | 建 `ckr_utils:guis/sub_edit/{enter,items,main,exit}` 骨架，照抄 track_edit 的缓存/物品逻辑 | 4 函数 | S |
| T2 | track_edit 加两个入口按钮（`button:6` 墙 / `button:7` 刷怪区），`main` 里 `_push` + `_enter` | 改 2 处 | S |
| T3 | `exit` 走 `gui_stack/_empty` → `_pop` 或 `_exit_inv`，并清掉本界面的取点器与预览 | 1 函数 | S |
| T4 | **修 `save_button` 覆盖坑**：现在是 `data modify ... temp set value {slope_plates:[],plane_plates:[]}`，会整体覆盖子 UI 刚追加的数组。改成只重置自己那两个键，或在 `main` 进入时用 `unless data` 兜底初始化 | 改 1 函数 | S |

**验收**：进出子界面物品栏正常恢复；在子界面造的墙/区退出后仍在 `temp` 里，父界面保存能一并输出。

### M2 墙体

| # | 任务 | 产出 | 规模 |
|---|---|---|---|
| T5 | `place_wall`：两点 → AABB → 薄轴归一化（半尺寸锁 0.5）→ `facing` 取玩家朝向 → 减 `field_center` → `chunk_range` → 追加 `temp.wall_plates` | 1 函数 | M |
| T6 | `items` 加"翻转法向"按钮：`facing` 取反后重算（避免玩家站错侧） | 1 函数 | S |
| T7 | 墙预览：按 plate 造 1 个 `math:visual_plane`（青色半透明，法向 = `facing`）；保存后也要能刷出来；`exit` 全部 `_del` | 1 函数 | S |
| T8 | `wall_builder` 构造器（MOT）：`_iter` 对单个 plate 铺 3 层，带 `vp_progress`；单次 `fill` 受 32768 上限约束，超限按 `chunk_range` 切片 | 1 模块 ≈12 函数 | M |
| T9 | `_build_async_start` 造构造器；`_build_async_main` 顺序表插在 **`spawn_strips` 之后**（必须晚于 `area_clear`，否则被 `vp_core:void` 清掉） | 改 2 处 | S |

**验收**：构造后墙真实存在；载具撞内侧面有正确反弹；从场外一侧撞外侧也应弹回（法向判断正确）。

### M3 刷怪区与刷怪

| # | 任务 | 产出 | 规模 |
|---|---|---|---|
| T10 | `place_spawn_area`：两点 → AABB → plate（`mob_max`/`interval` 给默认值）→ 追加 `temp.spawn_area_plates` | 1 函数 | M |
| T11 | 模板池编辑：`items` 提供预设模板潜影贝（僵尸/骷髅/蜘蛛…），点选 → `mob_pool` 追加一项；已选项再点 → 带出"移除"逻辑（用 `data remove` 按 `type` 匹配） | 2 函数 | M |
| T12 | 区域预览：6 面 `math:visual_plane` 线框（或 `math:particle`），`exit` 清空 | 1 函数 | M |
| T13 | `ckr_utils:spawn_area` 运行期模块：`_new` 造 marker（`0 8 0` 索引位，坐标进分数，`data` 存 `interval`/`mob_max`/`mob_pool`/`area_index`）、`_del`、`_update_display` | 1 模块 ≈10 函数 | M |
| T14 | `ckr_mobs:area/main`：`@s ckr_timer` 自增 → 到 `interval` 清零 → 数本区怪 → 未满 → 抽模板 → 随机点 → 校验 → `summon` | 3 函数 | M |
| T15 | 计数（只算本区）：`#ckr_idx` = 本区 index，`@e[tag=ckr_mob]` 里 `if score @s ckr_area = #ckr_idx` 累加；结果写回 `@s ckr_mob_cnt` | 1 函数 | S |
| T16 | 随机点 + 落点校验：`random value` 取三轴偏移 → 换算成世界坐标 → 3 次重试，要求 `#vve:pass` 或空气，失败则跳过本周期 | 1 函数 | M |
| T17 | `ckr_mobs:mob/register`：补 `ckr_mob` + `vp_instance` 标签、`Invulnerable:1b`、`Silent`、`PersistenceRequired:1b`、`DeathLootTable:""`、写 `data.*` 与 `ckr_area` 分数 | 1 函数 | S |
| T18 | `running` 里驱动区域：`execute as @e[tag=ckr_spawn_area] run function ckr_mobs:area/main`（只在 running 刷怪） | 改 1 处 | S |

**验收**：区域按 `interval` 出怪，且本区怪数不超过 `mob_max`；`kill @e[tag=ckr_mob]` 后能自动回补（证明计数不依赖死亡回调）。

### M4 虚拟血量与击杀归属

| # | 任务 | 产出 | 规模 |
|---|---|---|---|
| T19 | `ckr_mobs:_damage`：输入 `inp` 伤害值，执行者为怪；`hp -= inp`、写 `last_hitter_slot`、播放受击音效 + 沿载具速度方向的 `Motion` 位移（补偿 `Invulnerable` 没有原版击退）、`hp<=0` 调 `_die` | 1 函数 | M |
| T20 | `ckr_mobs:_die`：按 `last_hitter_slot` 找玩家 → `ckr_coin += data.coin` → 区域计数 -1 → 粒子/音效 → `kill @s` | 1 函数 | S |
| T21 | **打通车撞入口**：`blue_car/main_damage` 的选择器 `@e[dx=0,dy=0,dz=0,type=!player,tag=]` 里 `tag=` 表示"无任何标签"，会把打了 `ckr_mob` 的怪全部排除——必须改成显式白名单或 `tag=!ckr_vehicle` 之类 | 改 1 函数 | S |
| T22 | 伤害数值映射：`main_c` 已算出 `temp_max`（速度 L∞ 范数），按常量表映射成 `inp`，并给驾驶员打 `ckr_hitter` + 写 `#hitter_slot` | 改 2 处 | S |
| T23 | 金币展示：`rewarding` 里 `tellraw` 输出各玩家 `ckr_coin`；（可选）结算时换算成 `vp_core:emerald/_add` 一次性入账 | 2 函数 | S |

**验收**：开车撞怪 → 怪掉血 → 撞死时驾驶员金币增加且聊天栏有提示；换另一个玩家撞最后一下，钱给最后那个人。

### M5 收尾

| # | 任务 | 产出 |
|---|---|---|
| T24 | `_del_async_start`：按 `wall_plates` 回填空气（含玻璃层），幂等 | 改 1 处 |
| T25 | `ckr_mobs:_init`（objectives：`ckr_coin`/`ckr_area`/`ckr_hp`/`ckr_mob_cnt`…）并进初始化链 | 1 函数 |
| T26 | 回归：整局 `_reg → build → countdown → running → over` 四链全验 | — |
| T27 | 更新 `devlogs/26_11_06/changelog.md` | 文档 |

---

## 6. 易错点（实现时优先看这节）

### 6.1 玻璃是法向的唯一依据

`barrier_wall_geo` 只认四个**水平邻居**里的 `magenta_stained_glass`，据此反推法向：

| 玻璃位置 | 得到的法向 |
|---|---|
| `~1 ~ ~`（东） | `nvec_x = -10000`（法向朝西） |
| `~-1 ~ ~`（西） | `nvec_x = +10000` |
| `~ ~ ~1`（南） | `nvec_z = -10000` |
| `~ ~ ~-1`（北） | `nvec_z = +10000` |
| 两个方向都有 | 走 `barrier_wall_2`，`grab_depth` 按 √2 放大 |
| 都没有 | 走 `barrier_wall_up`（法向 +Y） |

所以：**玻璃必须在法向的反侧（外侧），且不能同时出现在两个朝向的邻居位上**，否则会被判成墙角（法向取对角，反弹方向就错了）。两层屏障保证探针一般落在屏障块内；玻璃层只做标记，不参与碰撞。

> 待实现时验证：`facing` 与 `barrier_wall_{east,west,north,south}` 的命名对应关系（四个文件各自检查哪个邻居位），当前 `barrier_wall_north` 检查的是 `~ ~ ~-1`，与 `geo` 里 `~ ~ ~1 → nvec_z=-10000 → north` 的映射存在命名歧义，需以实际撞墙测试为准。

### 6.2 `main_damage` 的 `tag=` 会漏怪

`@e[...,tag=]` 的语义是"**没有任何标签**的实体"。刷出来的怪一律带 `ckr_mob`，在当前选择器下**一只都撞不到**。必须改选择器，这是 T21 的核心。

### 6.3 虚拟血量必须配 `Invulnerable:1b`

否则玩家一拳、岩浆、摔落都能绕过 `_damage` 直接打死怪，导致"没掉金币也没减计数"。代价是没有原版受击反馈，需在 `_damage` 里手动补音效 + `Motion`。

### 6.4 区域计数只用分数比对

不要用 `scores={ckr_area=N}` 这种写法（选择器里不能取分数值），也不要用宏拼 AABB。用一次 `@e[tag=ckr_mob]` 扫描 + `if score @s ckr_area = #ckr_idx int` 比对即可，20t 一次，成本可忽略。

### 6.5 `temp` 的生命周期

`ckr_utils:io temp` 是**一次编辑会话**的容器：

- 子 UI 只负责 append 自己的键，绝不 `set value` 整个 compound。
- 父 `save_button` 只重置自己负责的 `slope_plates`/`plane_plates`。
- 只有"保存并输出"之后才整体清空。

### 6.6 墙体清理时机

`area_clear` 用 `vp_core:void` 模板覆盖 `field_size × field_height` 的范围，会把场地内的墙一起清掉。但**这场游戏结束后、下一场构造前**，墙仍然留在地图上。所以 T24 要显式回填空气，避免残留影响别的游戏。

---

## 7. 风险

| 风险 | 对策 |
|---|---|
| `fill` 超 32768（`max_block_modifications` 同为 32768） | T8 按 `chunk_range` 切片，单次 ≤ 32×32×层高 |
| 墙建在 `field_size` 之外，`area_clear` 覆盖不到 | 编辑器限制取点在场地内 + T24 显式回填 |
| 刷怪点落在墙体/空气边缘 | T16 三次重试，失败跳过本周期 |
| 高速载具隧穿 | 两层屏障；若仍穿，加到三层并同步 `barrier_wall_*` 的 `grab_depth` 补偿 |
| 怪卡在未加载区块 | 区域在场地内，`chunk_loader` 已加载；可选给怪加 `killtime` 寿命 |
| 区域数量变多后每 tick 扫描开销 | 计数改为 20t 一次；生成计时用 `@s` 分数，不落 storage |

---

## 8. 验收清单

```mcfunction
# 1 编辑器
function ckr_game:_reg
# 进 track_edit → 点"墙" → 两个点 → 翻转法向试一次 → 保存
# 检查箱子 custom_data 里 wall_plates / spawn_area_plates 非空

# 2 构造
# 进入游戏后：飞到墙边看三层结构（2 barrier + 1 magenta glass）
# 撞内侧面 → 正确反弹；从外侧撞 → 也应弹回

# 3 刷怪
# 站进区域，20t 内应看到 build 后的怪；区域内怪数 ≤ mob_max
# /kill @e[tag=ckr_mob] 后应在一个 interval 内回补

# 4 虚拟血量
# 开车撞怪：怪应被推开且有受击音效，血量下降
# 反复撞同一只：金币应只入账一次，且给最后撞击的驾驶员

# 5 金币
# tellraw 输出各玩家 ckr_coin

# 6 清理
# 结束游戏后：墙已被回填空气，@e[tag=ckr_mob] 为空
```

---

## 9. 待验证 / 预留

| 项 | 说明 |
|---|---|
| `facing` ↔ `barrier_wall_*` 命名 | 四个分支文件各自检查哪个邻居，需要一次实撞测试确认（§6.1） |
| 近战打怪 | 当前不做。若要做：给怪挂 `interaction` 命中盒（`iframe:ilc` 已有 `nbt={attack:{}}` 检测先例），命中时调 `_damage` |
| 怪物攻击玩家 | v1 保持原版 AI；如要"纯障碍物"，在模板 `nbt` 里写 `NoAI:1b` |
| 金币与大厅绿宝石打通 | 若金币要带出本局，在 `rewarding` 里按 `ckr_coin` 一次性调 `vp_core:emerald/_add` |
| 模板池图形化编辑 | v1 用"预设模板点选"，不做自由输入类型/NBT |

---

## 10. 建议执行顺序

1. **M1**（T1–T4）：一天内可见"子界面进得去出得来、保存不丢数据"。
2. **M2**（T5–T9）：墙能落地，先跑通"编辑器 → plate → 构造 → 撞墙"的完整闭环，这个闭环打通后 M3 只是换一种 plate。
3. **M3**（T10–T18）：刷怪区与刷怪，先只放一种怪，确认计数与上限。
4. **M4**（T19–T23）：虚拟血量与归属，最后接金币。
5. **M5**：清理与回归。

M2 与 M3 之间只有 `_build_async_*` 两处共同改动，注意不要同时改同两行。
