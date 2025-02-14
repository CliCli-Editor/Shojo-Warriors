---@class ECAHelper
---@field call fun(name: '【全局】进入玩法关卡', v1: integer)
---@field call fun(name: '【全局】PVP流程控制', v1: string, v2: integer, v3: integer)
---@field call fun(name: '【单位】触发普攻', v1: Point, v2: Unit)
---@field call fun(name: '【玩家】3选1装备随机', v1: Player, v2: integer, v3: integer, v4: string)
---@field call fun(name: '【玩家】PVE商店界面显示', v1: Player, v2: string)
---@field call fun(name: '【玩家】PVP首回合自选界面显示', v1: Player)
---@field call fun(name: '【玩家】3选1消耗品随机', v1: Player, v2: integer, v3: integer, v4: boolean)
---@field call fun(name: '【玩家】商店刷新奖励物品', v1: Player)
---@field call fun(name: '【玩家】PVP玩法主界面刷新', v1: Player)
---@field call fun(name: '【玩家】PVE玩法主界面刷新', v1: Player)
---@field call fun(name: '【玩家】进入大厅', v1: Player)
---@field call fun(name: '选择角色_测试')
---@field call fun(name: '【玩家】PVP商店显示', v1: Player, v2: string)
---@field call fun(name: '【单位】拾取场景物品', v1: Unit)
---@field call fun(name: '【单位】使用消耗品', v1: Unit, v2: Item)
---@field call fun(name: '【单位】触发格挡', v1: Unit)
---@field call fun(name: '【全局】计星板UI刷新')
---@field call fun(name: '【单位】草丛模型不透明度初始化', v1: Unit)
---@field call fun(name: '【单位】开启探草视野', v1: Unit)
---@field call fun(name: '【单位】切换角色完成', v1: Unit)
---@field call fun(name: '【单位】切换角色前', v1: Unit)
---@field call fun(name: '【全局】准备进入战斗关卡')
---@field call fun(name: '【玩家】PVP_单位初始化', v1: Player)
---@field call fun(name: '【玩家】PVP_机器人单位初始化', v1: Player)
---@field call fun(name: '【玩家】PVP_玩家初始化', v1: Player)
---@field call fun(name: '【玩家】PVP_UI初始化', v1: Player)
---@field call fun(name: '【玩家】PVE_UI初始化', v1: Player)
---@field call fun(name: '【单位】击杀板UI', v1: Unit, v2: Unit, v3: integer, v4: integer, v5: boolean)
---@field call fun(name: '【单位】进入草丛时', v1: Unit)
---@field call fun(name: '【单位】离开草丛时', v1: Unit)
---@field call fun(name: '【玩家】PVP_存档初始化', v1: Player)
---@field call fun(name: '【全局】初始化触摸动作')
---@field call fun(name: '【全局】进入大厅')
---@field call fun(name: '【玩家】PVE_单位初始化', v1: Player)
---@field call fun(name: '【玩家】PVE_玩家初始化', v1: Player)
---@field call fun(name: '【全局】PVE流程控制', v1: string, v2: integer)
---@field call fun(name: '【全局】PVE刷怪')
---@field call fun(name: '【全局】PVE_怪物AI初始化')
---@field call fun(name: '【单位】PVE_怪物AI状态', v1: Unit, v2: integer, v3: string, v4: string, v5: Unit)
---@field call fun(name: '【单位】PVE_单位开启自动攻击', v1: Unit, v2: string)
---@field call fun(name: '【单位】使用大招', v1: Unit, v2: Ability)
---@field call fun(name: '【玩家】PVP_机器人AI初始化', v1: Player)
---@field call fun(name: '【单位】PVP_单位AI自动攻击', v1: Unit, v2: boolean)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】进入玩法关卡', function (_, v1)
    y3.game.send_custom_event(1244318582, {
        ['GameMode'] = v1
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】PVP流程控制', function (_, v1, v2, v3)
    y3.game.send_custom_event(2022825531, {
        ['下一阶段'] = v1,
        ['Round'] = v2,
        ['Index_1'] = v3
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】触发普攻', function (_, v1, v2)
    y3.game.send_custom_event(2103055217, {
        ['技能目标点'] = y3.py_converter.lua_to_py_by_lua_type('Point', v1),
        ['英雄'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v2)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】3选1装备随机', function (_, v1, v2, v3, v4)
    y3.game.send_custom_event(1575180411, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1),
        ['Random_Color'] = v2,
        ['Random_Times'] = v3,
        ['Random_Type'] = v4
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVE商店界面显示', function (_, v1, v2)
    y3.game.send_custom_event(1662117940, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1),
        ['type'] = v2
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP首回合自选界面显示', function (_, v1)
    y3.game.send_custom_event(1559050532, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】3选1消耗品随机', function (_, v1, v2, v3, v4)
    y3.game.send_custom_event(1135135753, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1),
        ['Random_Color'] = v2,
        ['Random_Times'] = v3,
        ['isBonus'] = v4
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】商店刷新奖励物品', function (_, v1)
    y3.game.send_custom_event(1387333236, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP玩法主界面刷新', function (_, v1)
    y3.game.send_custom_event(1080282760, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVE玩法主界面刷新', function (_, v1)
    y3.game.send_custom_event(1084281599, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】进入大厅', function (_, v1)
    y3.game.send_custom_event(1887233000, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('选择角色_测试', function (_)
    y3.game.send_custom_event(1295387967, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP商店显示', function (_, v1, v2)
    y3.game.send_custom_event(1633734028, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1),
        ['type'] = v2
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】拾取场景物品', function (_, v1)
    y3.game.send_custom_event(1834774170, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】使用消耗品', function (_, v1, v2)
    y3.game.send_custom_event(1319858183, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['Item'] = y3.py_converter.lua_to_py_by_lua_type('Item', v2)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】触发格挡', function (_, v1)
    y3.game.send_custom_event(1355728485, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】计星板UI刷新', function (_)
    y3.game.send_custom_event(2104074048, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】草丛模型不透明度初始化', function (_, v1)
    y3.game.send_custom_event(1851837939, {
        ['单位'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】开启探草视野', function (_, v1)
    y3.game.send_custom_event(1032865563, {
        ['单位'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】切换角色完成', function (_, v1)
    y3.game.send_custom_event(1580098022, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】切换角色前', function (_, v1)
    y3.game.send_custom_event(1656669678, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】准备进入战斗关卡', function (_)
    y3.game.send_custom_event(1302278976, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_单位初始化', function (_, v1)
    y3.game.send_custom_event(1469993022, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_机器人单位初始化', function (_, v1)
    y3.game.send_custom_event(1624383491, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_玩家初始化', function (_, v1)
    y3.game.send_custom_event(1372240475, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_UI初始化', function (_, v1)
    y3.game.send_custom_event(1580803121, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVE_UI初始化', function (_, v1)
    y3.game.send_custom_event(1614346688, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】击杀板UI', function (_, v1, v2, v3, v4, v5)
    y3.game.send_custom_event(1950033043, {
        ['凶手单位'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['死亡单位'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v2),
        ['抢夺星星数'] = v3,
        ['连杀数'] = v4,
        ['是否终结'] = v5
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】进入草丛时', function (_, v1)
    y3.game.send_custom_event(1436179319, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】离开草丛时', function (_, v1)
    y3.game.send_custom_event(1734147887, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_存档初始化', function (_, v1)
    y3.game.send_custom_event(1809621322, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】初始化触摸动作', function (_)
    y3.game.send_custom_event(1046129302, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】进入大厅', function (_)
    y3.game.send_custom_event(1086095944, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVE_单位初始化', function (_, v1)
    y3.game.send_custom_event(1028039216, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVE_玩家初始化', function (_, v1)
    y3.game.send_custom_event(1928559659, {
        ['Player'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】PVE流程控制', function (_, v1, v2)
    y3.game.send_custom_event(1510852819, {
        ['阶段'] = v1,
        ['index'] = v2
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】PVE刷怪', function (_)
    y3.game.send_custom_event(1989476762, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【全局】PVE_怪物AI初始化', function (_)
    y3.game.send_custom_event(1685905375, {

    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】PVE_怪物AI状态', function (_, v1, v2, v3, v4, v5)
    y3.game.send_custom_event(1070045092, {
        ['Monster'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['Key'] = v2,
        ['当前状态'] = v3,
        ['切换后状态'] = v4,
        ['Target'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v5)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】PVE_单位开启自动攻击', function (_, v1, v2)
    y3.game.send_custom_event(1649931097, {
        ['单位'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['类型'] = v2
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】使用大招', function (_, v1, v2)
    y3.game.send_custom_event(1943849775, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['使用的技能'] = y3.py_converter.lua_to_py_by_lua_type('Ability', v2)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【玩家】PVP_机器人AI初始化', function (_, v1)
    y3.game.send_custom_event(1961613111, {
        ['玩家'] = y3.py_converter.lua_to_py_by_lua_type('Player', v1)
    })
end)

---@diagnostic disable-next-line: invisible
y3.eca.register_custom_event_impl('【单位】PVP_单位AI自动攻击', function (_, v1, v2)
    y3.game.send_custom_event(2002448406, {
        ['Unit'] = y3.py_converter.lua_to_py_by_lua_type('Unit', v1),
        ['自动攻击开关'] = v2
    })
end)
