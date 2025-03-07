---@class ECAHelper
---@field call fun(name: '【全局】进入玩法关卡', GameMode: integer)
---@field call fun(name: '【全局】PVP流程控制', 下一阶段: string, Round: integer, Index_1: integer)
---@field call fun(name: '【单位】触发普攻', 技能目标点: Point, 英雄: Unit)
---@field call fun(name: '【玩家】3选1装备随机', Player: Player, Random_Color: integer, Random_Times: integer, Random_Type: string)
---@field call fun(name: '【玩家】PVE商店界面显示', Player: Player, type: string)
---@field call fun(name: '【玩家】PVP首回合自选界面显示', Player: Player)
---@field call fun(name: '【玩家】3选1消耗品随机', Player: Player, Random_Color: integer, Random_Times: integer, isBonus: boolean)
---@field call fun(name: '【玩家】商店刷新奖励物品', Player: Player)
---@field call fun(name: '【玩家】PVP玩法主界面刷新', Player: Player)
---@field call fun(name: '【玩家】PVE玩法主界面刷新', Player: Player)
---@field call fun(name: '【玩家】进入大厅', Player: Player)
---@field call fun(name: '选择角色_测试')
---@field call fun(name: '【玩家】PVP商店显示', Player: Player, type: string)
---@field call fun(name: '【单位】拾取场景物品', Unit: Unit)
---@field call fun(name: '【单位】使用消耗品', Unit: Unit, Item: Item)
---@field call fun(name: '【单位】触发格挡', Unit: Unit)
---@field call fun(name: '【全局】计星板UI刷新')
---@field call fun(name: '【单位】草丛模型不透明度初始化', 单位: Unit)
---@field call fun(name: '【单位】开启探草视野', 单位: Unit)
---@field call fun(name: '【单位】切换角色完成', Unit: Unit)
---@field call fun(name: '【单位】切换角色前', Unit: Unit)
---@field call fun(name: '【全局】准备进入战斗关卡')
---@field call fun(name: '【玩家】PVP_单位初始化', Player: Player)
---@field call fun(name: '【玩家】PVP_机器人单位初始化', Player: Player)
---@field call fun(name: '【玩家】PVP_玩家初始化', Player: Player)
---@field call fun(name: '【玩家】PVP_UI初始化', Player: Player)
---@field call fun(name: '【玩家】PVE_UI初始化', Player: Player)
---@field call fun(name: '【单位】击杀板UI', 凶手单位: Unit, 死亡单位: Unit, 抢夺星星数: integer, 连杀数: integer, 是否终结: boolean)
---@field call fun(name: '【单位】进入草丛时', Unit: Unit)
---@field call fun(name: '【单位】离开草丛时', Unit: Unit)
---@field call fun(name: '【玩家】PVP_存档初始化', Player: Player)
---@field call fun(name: '【全局】初始化触摸动作')
---@field call fun(name: '【全局】进入大厅')
---@field call fun(name: '【玩家】PVE_单位初始化', Player: Player)
---@field call fun(name: '【玩家】PVE_玩家初始化', Player: Player)
---@field call fun(name: '【全局】PVE流程控制', 阶段: string, index: integer)
---@field call fun(name: '【全局】PVE刷怪')
---@field call fun(name: '【全局】PVE_怪物AI初始化')
---@field call fun(name: '【单位】PVE_怪物AI状态', Monster: Unit, Key: integer, 当前状态: string, 切换后状态: string, Target: Unit)
---@field call fun(name: '【单位】PVE_单位开启自动攻击', 单位: Unit, 类型: string)
---@field call fun(name: '【单位】使用大招', Unit: Unit, 使用的技能: Ability)
---@field call fun(name: '【玩家】PVP_机器人AI初始化', 玩家: Player)
---@field call fun(name: '【玩家】PVP死斗_机器人AI初始化', 玩家: Player)
---@field call fun(name: '【单位】PVP_单位AI自动攻击', Unit: Unit, 自动攻击开关: boolean)
---@field call fun(name: '【玩家】开始观战', Player: Player)
---@field call fun(name: '【玩家】生涯界面初始化', Player: Player)
---@field call fun(name: '【玩家】刷新存档成就-英雄皮肤数量', Player: Player)
---@field call fun(name: '【玩家】刷新外观收藏品数量', Player: Player)
---@field call fun(name: '【玩家】PVP死斗_玩家初始化', Player: Player)
---@field call fun(name: '【玩家】PVP死斗_选人界面显示', Player: Player)
---@field call fun(name: '【玩家】PVP死斗_单位初始化', Player: Player)
---@field call fun(name: '【玩家】PVP死斗_机器人单位初始化', Player: Player)
---@field call fun(name: '【全局】PVP死斗_流程控制', 下一阶段: string)
---@field call fun(name: '【玩家】PVP死斗_UI初始化', Player: Player)
---@field call fun(name: '【全局】PVP死斗_结算')
---@field call fun(name: '【玩家】PVP死斗_塔罗牌随机', Player: Player)
---@field call fun(name: '【玩家】PVP死斗_塔罗牌选择界面显示', Player: Player)
---@field call fun(name: '【单位】造成击杀', Unit: Unit, Target: Unit)
---@field call fun(name: '【玩家】PVP死斗_获得塔罗牌', Unit: Unit)
---@field call fun(name: '【Lua】玩家被踢出队伍', Player: Player)

---@diagnostic disable: invisible

y3.eca = y3.eca or {}
y3.eca.register_custom_event_impl = y3.eca.register_custom_event_impl or function (name, impl) end
y3.eca.register_custom_event_resolve = y3.eca.register_custom_event_resolve or function (name, resolve) end

y3.eca.register_custom_event_impl('【全局】进入玩法关卡', function (_, GameMode)
    y3.game.send_custom_event(1244318582, {
        ["GameMode"] = GameMode
    })
end)

y3.eca.register_custom_event_impl('【全局】PVP流程控制', function (_, 下一阶段, Round, Index_1)
    y3.game.send_custom_event(2022825531, {
        ["下一阶段"] = 下一阶段,
        ["Round"] = Round,
        ["Index_1"] = Index_1
    })
end)

y3.eca.register_custom_event_impl('【单位】触发普攻', function (_, 技能目标点, 英雄)
    y3.game.send_custom_event(2103055217, {
        ["技能目标点"] = y3.py_converter.lua_to_py_by_lua_type('Point', 技能目标点),
        ["英雄"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 英雄)
    })
end)

y3.eca.register_custom_event_impl('【玩家】3选1装备随机', function (_, Player, Random_Color, Random_Times, Random_Type)
    y3.game.send_custom_event(1575180411, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player),
        ["Random_Color"] = Random_Color,
        ["Random_Times"] = Random_Times,
        ["Random_Type"] = Random_Type
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVE商店界面显示', function (_, Player, type)
    y3.game.send_custom_event(1662117940, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player),
        ["type"] = type
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP首回合自选界面显示', function (_, Player)
    y3.game.send_custom_event(1559050532, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】3选1消耗品随机', function (_, Player, Random_Color, Random_Times, isBonus)
    y3.game.send_custom_event(1135135753, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player),
        ["Random_Color"] = Random_Color,
        ["Random_Times"] = Random_Times,
        ["isBonus"] = isBonus
    })
end)

y3.eca.register_custom_event_impl('【玩家】商店刷新奖励物品', function (_, Player)
    y3.game.send_custom_event(1387333236, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP玩法主界面刷新', function (_, Player)
    y3.game.send_custom_event(1080282760, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVE玩法主界面刷新', function (_, Player)
    y3.game.send_custom_event(1084281599, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】进入大厅', function (_, Player)
    y3.game.send_custom_event(1887233000, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('选择角色_测试', function (_)
    y3.game.send_custom_event(1295387967, {

    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP商店显示', function (_, Player, type)
    y3.game.send_custom_event(1633734028, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player),
        ["type"] = type
    })
end)

y3.eca.register_custom_event_impl('【单位】拾取场景物品', function (_, Unit)
    y3.game.send_custom_event(1834774170, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【单位】使用消耗品', function (_, Unit, Item)
    y3.game.send_custom_event(1319858183, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit),
        ["Item"] = y3.py_converter.lua_to_py_by_lua_type('Item', Item)
    })
end)

y3.eca.register_custom_event_impl('【单位】触发格挡', function (_, Unit)
    y3.game.send_custom_event(1355728485, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【全局】计星板UI刷新', function (_)
    y3.game.send_custom_event(2104074048, {

    })
end)

y3.eca.register_custom_event_impl('【单位】草丛模型不透明度初始化', function (_, 单位)
    y3.game.send_custom_event(1851837939, {
        ["单位"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 单位)
    })
end)

y3.eca.register_custom_event_impl('【单位】开启探草视野', function (_, 单位)
    y3.game.send_custom_event(1032865563, {
        ["单位"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 单位)
    })
end)

y3.eca.register_custom_event_impl('【单位】切换角色完成', function (_, Unit)
    y3.game.send_custom_event(1580098022, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【单位】切换角色前', function (_, Unit)
    y3.game.send_custom_event(1656669678, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【全局】准备进入战斗关卡', function (_)
    y3.game.send_custom_event(1302278976, {

    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_单位初始化', function (_, Player)
    y3.game.send_custom_event(1469993022, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_机器人单位初始化', function (_, Player)
    y3.game.send_custom_event(1624383491, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_玩家初始化', function (_, Player)
    y3.game.send_custom_event(1372240475, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_UI初始化', function (_, Player)
    y3.game.send_custom_event(1580803121, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVE_UI初始化', function (_, Player)
    y3.game.send_custom_event(1614346688, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【单位】击杀板UI', function (_, 凶手单位, 死亡单位, 抢夺星星数, 连杀数, 是否终结)
    y3.game.send_custom_event(1950033043, {
        ["凶手单位"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 凶手单位),
        ["死亡单位"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 死亡单位),
        ["抢夺星星数"] = 抢夺星星数,
        ["连杀数"] = 连杀数,
        ["是否终结"] = 是否终结
    })
end)

y3.eca.register_custom_event_impl('【单位】进入草丛时', function (_, Unit)
    y3.game.send_custom_event(1436179319, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【单位】离开草丛时', function (_, Unit)
    y3.game.send_custom_event(1734147887, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_存档初始化', function (_, Player)
    y3.game.send_custom_event(1809621322, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【全局】初始化触摸动作', function (_)
    y3.game.send_custom_event(1046129302, {

    })
end)

y3.eca.register_custom_event_impl('【全局】进入大厅', function (_)
    y3.game.send_custom_event(1086095944, {

    })
end)

y3.eca.register_custom_event_impl('【玩家】PVE_单位初始化', function (_, Player)
    y3.game.send_custom_event(1028039216, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVE_玩家初始化', function (_, Player)
    y3.game.send_custom_event(1928559659, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【全局】PVE流程控制', function (_, 阶段, index)
    y3.game.send_custom_event(1510852819, {
        ["阶段"] = 阶段,
        ["index"] = index
    })
end)

y3.eca.register_custom_event_impl('【全局】PVE刷怪', function (_)
    y3.game.send_custom_event(1989476762, {

    })
end)

y3.eca.register_custom_event_impl('【全局】PVE_怪物AI初始化', function (_)
    y3.game.send_custom_event(1685905375, {

    })
end)

y3.eca.register_custom_event_impl('【单位】PVE_怪物AI状态', function (_, Monster, Key, 当前状态, 切换后状态, Target)
    y3.game.send_custom_event(1070045092, {
        ["Monster"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Monster),
        ["Key"] = Key,
        ["当前状态"] = 当前状态,
        ["切换后状态"] = 切换后状态,
        ["Target"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Target)
    })
end)

y3.eca.register_custom_event_impl('【单位】PVE_单位开启自动攻击', function (_, 单位, 类型)
    y3.game.send_custom_event(1649931097, {
        ["单位"] = y3.py_converter.lua_to_py_by_lua_type('Unit', 单位),
        ["类型"] = 类型
    })
end)

y3.eca.register_custom_event_impl('【单位】使用大招', function (_, Unit, 使用的技能)
    y3.game.send_custom_event(1943849775, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit),
        ["使用的技能"] = y3.py_converter.lua_to_py_by_lua_type('Ability', 使用的技能)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP_机器人AI初始化', function (_, 玩家)
    y3.game.send_custom_event(1961613111, {
        ["玩家"] = y3.py_converter.lua_to_py_by_lua_type('Player', 玩家)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_机器人AI初始化', function (_, 玩家)
    y3.game.send_custom_event(1120645767, {
        ["玩家"] = y3.py_converter.lua_to_py_by_lua_type('Player', 玩家)
    })
end)

y3.eca.register_custom_event_impl('【单位】PVP_单位AI自动攻击', function (_, Unit, 自动攻击开关)
    y3.game.send_custom_event(2002448406, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit),
        ["自动攻击开关"] = 自动攻击开关
    })
end)

y3.eca.register_custom_event_impl('【玩家】开始观战', function (_, Player)
    y3.game.send_custom_event(1599637021, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】生涯界面初始化', function (_, Player)
    y3.game.send_custom_event(1681437929, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】刷新存档成就-英雄皮肤数量', function (_, Player)
    y3.game.send_custom_event(2085693599, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】刷新外观收藏品数量', function (_, Player)
    y3.game.send_custom_event(1731414453, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_玩家初始化', function (_, Player)
    y3.game.send_custom_event(1456070651, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_选人界面显示', function (_, Player)
    y3.game.send_custom_event(2030247139, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_单位初始化', function (_, Player)
    y3.game.send_custom_event(1600646209, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_机器人单位初始化', function (_, Player)
    y3.game.send_custom_event(1858843075, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【全局】PVP死斗_流程控制', function (_, 下一阶段)
    y3.game.send_custom_event(1218706458, {
        ["下一阶段"] = 下一阶段
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_UI初始化', function (_, Player)
    y3.game.send_custom_event(1443265178, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【全局】PVP死斗_结算', function (_)
    y3.game.send_custom_event(1464217556, {

    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_塔罗牌随机', function (_, Player)
    y3.game.send_custom_event(1604401632, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_塔罗牌选择界面显示', function (_, Player)
    y3.game.send_custom_event(1831133406, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.eca.register_custom_event_impl('【单位】造成击杀', function (_, Unit, Target)
    y3.game.send_custom_event(1513256612, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit),
        ["Target"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Target)
    })
end)

y3.eca.register_custom_event_impl('【玩家】PVP死斗_获得塔罗牌', function (_, Unit)
    y3.game.send_custom_event(1516818342, {
        ["Unit"] = y3.py_converter.lua_to_py_by_lua_type('Unit', Unit)
    })
end)

y3.eca.register_custom_event_impl('【Lua】玩家被踢出队伍', function (_, Player)
    y3.game.send_custom_event(1505692330, {
        ["Player"] = y3.py_converter.lua_to_py_by_lua_type('Player', Player)
    })
end)

y3.const.CustomEventName = y3.const.CustomEventName or {}

y3.const.CustomEventName['【全局】进入玩法关卡'] = 1244318582
y3.const.CustomEventName['【全局】PVP流程控制'] = 2022825531
y3.const.CustomEventName['【单位】触发普攻'] = 2103055217
y3.const.CustomEventName['【玩家】3选1装备随机'] = 1575180411
y3.const.CustomEventName['【玩家】PVE商店界面显示'] = 1662117940
y3.const.CustomEventName['【玩家】PVP首回合自选界面显示'] = 1559050532
y3.const.CustomEventName['【玩家】3选1消耗品随机'] = 1135135753
y3.const.CustomEventName['【玩家】商店刷新奖励物品'] = 1387333236
y3.const.CustomEventName['【玩家】PVP玩法主界面刷新'] = 1080282760
y3.const.CustomEventName['【玩家】PVE玩法主界面刷新'] = 1084281599
y3.const.CustomEventName['【玩家】进入大厅'] = 1887233000
y3.const.CustomEventName['选择角色_测试'] = 1295387967
y3.const.CustomEventName['【玩家】PVP商店显示'] = 1633734028
y3.const.CustomEventName['【单位】拾取场景物品'] = 1834774170
y3.const.CustomEventName['【单位】使用消耗品'] = 1319858183
y3.const.CustomEventName['【单位】触发格挡'] = 1355728485
y3.const.CustomEventName['【全局】计星板UI刷新'] = 2104074048
y3.const.CustomEventName['【单位】草丛模型不透明度初始化'] = 1851837939
y3.const.CustomEventName['【单位】开启探草视野'] = 1032865563
y3.const.CustomEventName['【单位】切换角色完成'] = 1580098022
y3.const.CustomEventName['【单位】切换角色前'] = 1656669678
y3.const.CustomEventName['【全局】准备进入战斗关卡'] = 1302278976
y3.const.CustomEventName['【玩家】PVP_单位初始化'] = 1469993022
y3.const.CustomEventName['【玩家】PVP_机器人单位初始化'] = 1624383491
y3.const.CustomEventName['【玩家】PVP_玩家初始化'] = 1372240475
y3.const.CustomEventName['【玩家】PVP_UI初始化'] = 1580803121
y3.const.CustomEventName['【玩家】PVE_UI初始化'] = 1614346688
y3.const.CustomEventName['【单位】击杀板UI'] = 1950033043
y3.const.CustomEventName['【单位】进入草丛时'] = 1436179319
y3.const.CustomEventName['【单位】离开草丛时'] = 1734147887
y3.const.CustomEventName['【玩家】PVP_存档初始化'] = 1809621322
y3.const.CustomEventName['【全局】初始化触摸动作'] = 1046129302
y3.const.CustomEventName['【全局】进入大厅'] = 1086095944
y3.const.CustomEventName['【玩家】PVE_单位初始化'] = 1028039216
y3.const.CustomEventName['【玩家】PVE_玩家初始化'] = 1928559659
y3.const.CustomEventName['【全局】PVE流程控制'] = 1510852819
y3.const.CustomEventName['【全局】PVE刷怪'] = 1989476762
y3.const.CustomEventName['【全局】PVE_怪物AI初始化'] = 1685905375
y3.const.CustomEventName['【单位】PVE_怪物AI状态'] = 1070045092
y3.const.CustomEventName['【单位】PVE_单位开启自动攻击'] = 1649931097
y3.const.CustomEventName['【单位】使用大招'] = 1943849775
y3.const.CustomEventName['【玩家】PVP_机器人AI初始化'] = 1961613111
y3.const.CustomEventName['【玩家】PVP死斗_机器人AI初始化'] = 1120645767
y3.const.CustomEventName['【单位】PVP_单位AI自动攻击'] = 2002448406
y3.const.CustomEventName['【玩家】开始观战'] = 1599637021
y3.const.CustomEventName['【玩家】生涯界面初始化'] = 1681437929
y3.const.CustomEventName['【玩家】刷新存档成就-英雄皮肤数量'] = 2085693599
y3.const.CustomEventName['【玩家】刷新外观收藏品数量'] = 1731414453
y3.const.CustomEventName['【玩家】PVP死斗_玩家初始化'] = 1456070651
y3.const.CustomEventName['【玩家】PVP死斗_选人界面显示'] = 2030247139
y3.const.CustomEventName['【玩家】PVP死斗_单位初始化'] = 1600646209
y3.const.CustomEventName['【玩家】PVP死斗_机器人单位初始化'] = 1858843075
y3.const.CustomEventName['【全局】PVP死斗_流程控制'] = 1218706458
y3.const.CustomEventName['【玩家】PVP死斗_UI初始化'] = 1443265178
y3.const.CustomEventName['【全局】PVP死斗_结算'] = 1464217556
y3.const.CustomEventName['【玩家】PVP死斗_塔罗牌随机'] = 1604401632
y3.const.CustomEventName['【玩家】PVP死斗_塔罗牌选择界面显示'] = 1831133406
y3.const.CustomEventName['【单位】造成击杀'] = 1513256612
y3.const.CustomEventName['【玩家】PVP死斗_获得塔罗牌'] = 1516818342
y3.const.CustomEventName['【Lua】玩家被踢出队伍'] = 1505692330

---@enum(key, partial) y3.Const.CustomEventName
local CustomEventName = {
    ['【全局】进入玩法关卡'] = 1244318582,
    ['【全局】PVP流程控制'] = 2022825531,
    ['【单位】触发普攻'] = 2103055217,
    ['【玩家】3选1装备随机'] = 1575180411,
    ['【玩家】PVE商店界面显示'] = 1662117940,
    ['【玩家】PVP首回合自选界面显示'] = 1559050532,
    ['【玩家】3选1消耗品随机'] = 1135135753,
    ['【玩家】商店刷新奖励物品'] = 1387333236,
    ['【玩家】PVP玩法主界面刷新'] = 1080282760,
    ['【玩家】PVE玩法主界面刷新'] = 1084281599,
    ['【玩家】进入大厅'] = 1887233000,
    ['选择角色_测试'] = 1295387967,
    ['【玩家】PVP商店显示'] = 1633734028,
    ['【单位】拾取场景物品'] = 1834774170,
    ['【单位】使用消耗品'] = 1319858183,
    ['【单位】触发格挡'] = 1355728485,
    ['【全局】计星板UI刷新'] = 2104074048,
    ['【单位】草丛模型不透明度初始化'] = 1851837939,
    ['【单位】开启探草视野'] = 1032865563,
    ['【单位】切换角色完成'] = 1580098022,
    ['【单位】切换角色前'] = 1656669678,
    ['【全局】准备进入战斗关卡'] = 1302278976,
    ['【玩家】PVP_单位初始化'] = 1469993022,
    ['【玩家】PVP_机器人单位初始化'] = 1624383491,
    ['【玩家】PVP_玩家初始化'] = 1372240475,
    ['【玩家】PVP_UI初始化'] = 1580803121,
    ['【玩家】PVE_UI初始化'] = 1614346688,
    ['【单位】击杀板UI'] = 1950033043,
    ['【单位】进入草丛时'] = 1436179319,
    ['【单位】离开草丛时'] = 1734147887,
    ['【玩家】PVP_存档初始化'] = 1809621322,
    ['【全局】初始化触摸动作'] = 1046129302,
    ['【全局】进入大厅'] = 1086095944,
    ['【玩家】PVE_单位初始化'] = 1028039216,
    ['【玩家】PVE_玩家初始化'] = 1928559659,
    ['【全局】PVE流程控制'] = 1510852819,
    ['【全局】PVE刷怪'] = 1989476762,
    ['【全局】PVE_怪物AI初始化'] = 1685905375,
    ['【单位】PVE_怪物AI状态'] = 1070045092,
    ['【单位】PVE_单位开启自动攻击'] = 1649931097,
    ['【单位】使用大招'] = 1943849775,
    ['【玩家】PVP_机器人AI初始化'] = 1961613111,
    ['【玩家】PVP死斗_机器人AI初始化'] = 1120645767,
    ['【单位】PVP_单位AI自动攻击'] = 2002448406,
    ['【玩家】开始观战'] = 1599637021,
    ['【玩家】生涯界面初始化'] = 1681437929,
    ['【玩家】刷新存档成就-英雄皮肤数量'] = 2085693599,
    ['【玩家】刷新外观收藏品数量'] = 1731414453,
    ['【玩家】PVP死斗_玩家初始化'] = 1456070651,
    ['【玩家】PVP死斗_选人界面显示'] = 2030247139,
    ['【玩家】PVP死斗_单位初始化'] = 1600646209,
    ['【玩家】PVP死斗_机器人单位初始化'] = 1858843075,
    ['【全局】PVP死斗_流程控制'] = 1218706458,
    ['【玩家】PVP死斗_UI初始化'] = 1443265178,
    ['【全局】PVP死斗_结算'] = 1464217556,
    ['【玩家】PVP死斗_塔罗牌随机'] = 1604401632,
    ['【玩家】PVP死斗_塔罗牌选择界面显示'] = 1831133406,
    ['【单位】造成击杀'] = 1513256612,
    ['【玩家】PVP死斗_获得塔罗牌'] = 1516818342,
    ['【Lua】玩家被踢出队伍'] = 1505692330,
}

y3.eca.register_custom_event_resolve("【全局】进入玩法关卡", function (data)
    data.name = "【全局】进入玩法关卡"
    data.data = {
        ["GameMode"] = data.c_param_dict["GameMode"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVP流程控制", function (data)
    data.name = "【全局】PVP流程控制"
    data.data = {
        ["下一阶段"] = data.c_param_dict["下一阶段"],
        ["Round"] = data.c_param_dict["Round"],
        ["Index_1"] = data.c_param_dict["Index_1"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】触发普攻", function (data)
    data.name = "【单位】触发普攻"
    data.data = {
        ["技能目标点"] = y3.py_converter.py_to_lua_by_lua_type('Point', data.c_param_dict["技能目标点"]),
        ["英雄"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["英雄"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】3选1装备随机", function (data)
    data.name = "【玩家】3选1装备随机"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
        ["Random_Color"] = data.c_param_dict["Random_Color"],
        ["Random_Times"] = data.c_param_dict["Random_Times"],
        ["Random_Type"] = data.c_param_dict["Random_Type"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVE商店界面显示", function (data)
    data.name = "【玩家】PVE商店界面显示"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
        ["type"] = data.c_param_dict["type"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP首回合自选界面显示", function (data)
    data.name = "【玩家】PVP首回合自选界面显示"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】3选1消耗品随机", function (data)
    data.name = "【玩家】3选1消耗品随机"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
        ["Random_Color"] = data.c_param_dict["Random_Color"],
        ["Random_Times"] = data.c_param_dict["Random_Times"],
        ["isBonus"] = data.c_param_dict["isBonus"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】商店刷新奖励物品", function (data)
    data.name = "【玩家】商店刷新奖励物品"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP玩法主界面刷新", function (data)
    data.name = "【玩家】PVP玩法主界面刷新"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVE玩法主界面刷新", function (data)
    data.name = "【玩家】PVE玩法主界面刷新"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】进入大厅", function (data)
    data.name = "【玩家】进入大厅"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("选择角色_测试", function (data)
    data.name = "选择角色_测试"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP商店显示", function (data)
    data.name = "【玩家】PVP商店显示"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
        ["type"] = data.c_param_dict["type"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】拾取场景物品", function (data)
    data.name = "【单位】拾取场景物品"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】使用消耗品", function (data)
    data.name = "【单位】使用消耗品"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
        ["Item"] = y3.py_converter.py_to_lua_by_lua_type('Item', data.c_param_dict["Item"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】触发格挡", function (data)
    data.name = "【单位】触发格挡"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】计星板UI刷新", function (data)
    data.name = "【全局】计星板UI刷新"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】草丛模型不透明度初始化", function (data)
    data.name = "【单位】草丛模型不透明度初始化"
    data.data = {
        ["单位"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["单位"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】开启探草视野", function (data)
    data.name = "【单位】开启探草视野"
    data.data = {
        ["单位"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["单位"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】切换角色完成", function (data)
    data.name = "【单位】切换角色完成"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】切换角色前", function (data)
    data.name = "【单位】切换角色前"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】准备进入战斗关卡", function (data)
    data.name = "【全局】准备进入战斗关卡"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_单位初始化", function (data)
    data.name = "【玩家】PVP_单位初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_机器人单位初始化", function (data)
    data.name = "【玩家】PVP_机器人单位初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_玩家初始化", function (data)
    data.name = "【玩家】PVP_玩家初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_UI初始化", function (data)
    data.name = "【玩家】PVP_UI初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVE_UI初始化", function (data)
    data.name = "【玩家】PVE_UI初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】击杀板UI", function (data)
    data.name = "【单位】击杀板UI"
    data.data = {
        ["凶手单位"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["凶手单位"]),
        ["死亡单位"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["死亡单位"]),
        ["抢夺星星数"] = data.c_param_dict["抢夺星星数"],
        ["连杀数"] = data.c_param_dict["连杀数"],
        ["是否终结"] = data.c_param_dict["是否终结"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】进入草丛时", function (data)
    data.name = "【单位】进入草丛时"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】离开草丛时", function (data)
    data.name = "【单位】离开草丛时"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_存档初始化", function (data)
    data.name = "【玩家】PVP_存档初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】初始化触摸动作", function (data)
    data.name = "【全局】初始化触摸动作"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】进入大厅", function (data)
    data.name = "【全局】进入大厅"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVE_单位初始化", function (data)
    data.name = "【玩家】PVE_单位初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVE_玩家初始化", function (data)
    data.name = "【玩家】PVE_玩家初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVE流程控制", function (data)
    data.name = "【全局】PVE流程控制"
    data.data = {
        ["阶段"] = data.c_param_dict["阶段"],
        ["index"] = data.c_param_dict["index"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVE刷怪", function (data)
    data.name = "【全局】PVE刷怪"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVE_怪物AI初始化", function (data)
    data.name = "【全局】PVE_怪物AI初始化"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】PVE_怪物AI状态", function (data)
    data.name = "【单位】PVE_怪物AI状态"
    data.data = {
        ["Monster"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Monster"]),
        ["Key"] = data.c_param_dict["Key"],
        ["当前状态"] = data.c_param_dict["当前状态"],
        ["切换后状态"] = data.c_param_dict["切换后状态"],
        ["Target"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Target"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】PVE_单位开启自动攻击", function (data)
    data.name = "【单位】PVE_单位开启自动攻击"
    data.data = {
        ["单位"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["单位"]),
        ["类型"] = data.c_param_dict["类型"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】使用大招", function (data)
    data.name = "【单位】使用大招"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
        ["使用的技能"] = y3.py_converter.py_to_lua_by_lua_type('Ability', data.c_param_dict["使用的技能"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP_机器人AI初始化", function (data)
    data.name = "【玩家】PVP_机器人AI初始化"
    data.data = {
        ["玩家"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["玩家"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_机器人AI初始化", function (data)
    data.name = "【玩家】PVP死斗_机器人AI初始化"
    data.data = {
        ["玩家"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["玩家"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】PVP_单位AI自动攻击", function (data)
    data.name = "【单位】PVP_单位AI自动攻击"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
        ["自动攻击开关"] = data.c_param_dict["自动攻击开关"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】开始观战", function (data)
    data.name = "【玩家】开始观战"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】生涯界面初始化", function (data)
    data.name = "【玩家】生涯界面初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】刷新存档成就-英雄皮肤数量", function (data)
    data.name = "【玩家】刷新存档成就-英雄皮肤数量"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】刷新外观收藏品数量", function (data)
    data.name = "【玩家】刷新外观收藏品数量"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_玩家初始化", function (data)
    data.name = "【玩家】PVP死斗_玩家初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_选人界面显示", function (data)
    data.name = "【玩家】PVP死斗_选人界面显示"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_单位初始化", function (data)
    data.name = "【玩家】PVP死斗_单位初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_机器人单位初始化", function (data)
    data.name = "【玩家】PVP死斗_机器人单位初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVP死斗_流程控制", function (data)
    data.name = "【全局】PVP死斗_流程控制"
    data.data = {
        ["下一阶段"] = data.c_param_dict["下一阶段"],
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_UI初始化", function (data)
    data.name = "【玩家】PVP死斗_UI初始化"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【全局】PVP死斗_结算", function (data)
    data.name = "【全局】PVP死斗_结算"
    data.data = {

    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_塔罗牌随机", function (data)
    data.name = "【玩家】PVP死斗_塔罗牌随机"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_塔罗牌选择界面显示", function (data)
    data.name = "【玩家】PVP死斗_塔罗牌选择界面显示"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【单位】造成击杀", function (data)
    data.name = "【单位】造成击杀"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
        ["Target"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Target"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【玩家】PVP死斗_获得塔罗牌", function (data)
    data.name = "【玩家】PVP死斗_获得塔罗牌"
    data.data = {
        ["Unit"] = y3.py_converter.py_to_lua_by_lua_type('Unit', data.c_param_dict["Unit"]),
    }
    return data
end)
y3.eca.register_custom_event_resolve("【Lua】玩家被踢出队伍", function (data)
    data.name = "【Lua】玩家被踢出队伍"
    data.data = {
        ["Player"] = y3.py_converter.py_to_lua_by_lua_type('Player', data.c_param_dict["Player"]),
    }
    return data
end)

---@alias EventParam.游戏-消息.【全局】进入玩法关卡 { c_param_1: 1244318582, c_param_dict: py.Dict, event: "【全局】进入玩法关卡", data: { ["GameMode"]: integer } }
---@alias EventParam.游戏-消息.【全局】PVP流程控制 { c_param_1: 2022825531, c_param_dict: py.Dict, event: "【全局】PVP流程控制", data: { ["下一阶段"]: string, ["Round"]: integer, ["Index_1"]: integer } }
---@alias EventParam.游戏-消息.【单位】触发普攻 { c_param_1: 2103055217, c_param_dict: py.Dict, event: "【单位】触发普攻", data: { ["技能目标点"]: Point, ["英雄"]: Unit } }
---@alias EventParam.游戏-消息.【玩家】3选1装备随机 { c_param_1: 1575180411, c_param_dict: py.Dict, event: "【玩家】3选1装备随机", data: { ["Player"]: Player, ["Random_Color"]: integer, ["Random_Times"]: integer, ["Random_Type"]: string } }
---@alias EventParam.游戏-消息.【玩家】PVE商店界面显示 { c_param_1: 1662117940, c_param_dict: py.Dict, event: "【玩家】PVE商店界面显示", data: { ["Player"]: Player, ["type"]: string } }
---@alias EventParam.游戏-消息.【玩家】PVP首回合自选界面显示 { c_param_1: 1559050532, c_param_dict: py.Dict, event: "【玩家】PVP首回合自选界面显示", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】3选1消耗品随机 { c_param_1: 1135135753, c_param_dict: py.Dict, event: "【玩家】3选1消耗品随机", data: { ["Player"]: Player, ["Random_Color"]: integer, ["Random_Times"]: integer, ["isBonus"]: boolean } }
---@alias EventParam.游戏-消息.【玩家】商店刷新奖励物品 { c_param_1: 1387333236, c_param_dict: py.Dict, event: "【玩家】商店刷新奖励物品", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP玩法主界面刷新 { c_param_1: 1080282760, c_param_dict: py.Dict, event: "【玩家】PVP玩法主界面刷新", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVE玩法主界面刷新 { c_param_1: 1084281599, c_param_dict: py.Dict, event: "【玩家】PVE玩法主界面刷新", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】进入大厅 { c_param_1: 1887233000, c_param_dict: py.Dict, event: "【玩家】进入大厅", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.选择角色_测试 { c_param_1: 1295387967, c_param_dict: py.Dict, event: "选择角色_测试", data: {  } }
---@alias EventParam.游戏-消息.【玩家】PVP商店显示 { c_param_1: 1633734028, c_param_dict: py.Dict, event: "【玩家】PVP商店显示", data: { ["Player"]: Player, ["type"]: string } }
---@alias EventParam.游戏-消息.【单位】拾取场景物品 { c_param_1: 1834774170, c_param_dict: py.Dict, event: "【单位】拾取场景物品", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【单位】使用消耗品 { c_param_1: 1319858183, c_param_dict: py.Dict, event: "【单位】使用消耗品", data: { ["Unit"]: Unit, ["Item"]: Item } }
---@alias EventParam.游戏-消息.【单位】触发格挡 { c_param_1: 1355728485, c_param_dict: py.Dict, event: "【单位】触发格挡", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【全局】计星板UI刷新 { c_param_1: 2104074048, c_param_dict: py.Dict, event: "【全局】计星板UI刷新", data: {  } }
---@alias EventParam.游戏-消息.【单位】草丛模型不透明度初始化 { c_param_1: 1851837939, c_param_dict: py.Dict, event: "【单位】草丛模型不透明度初始化", data: { ["单位"]: Unit } }
---@alias EventParam.游戏-消息.【单位】开启探草视野 { c_param_1: 1032865563, c_param_dict: py.Dict, event: "【单位】开启探草视野", data: { ["单位"]: Unit } }
---@alias EventParam.游戏-消息.【单位】切换角色完成 { c_param_1: 1580098022, c_param_dict: py.Dict, event: "【单位】切换角色完成", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【单位】切换角色前 { c_param_1: 1656669678, c_param_dict: py.Dict, event: "【单位】切换角色前", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【全局】准备进入战斗关卡 { c_param_1: 1302278976, c_param_dict: py.Dict, event: "【全局】准备进入战斗关卡", data: {  } }
---@alias EventParam.游戏-消息.【玩家】PVP_单位初始化 { c_param_1: 1469993022, c_param_dict: py.Dict, event: "【玩家】PVP_单位初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP_机器人单位初始化 { c_param_1: 1624383491, c_param_dict: py.Dict, event: "【玩家】PVP_机器人单位初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP_玩家初始化 { c_param_1: 1372240475, c_param_dict: py.Dict, event: "【玩家】PVP_玩家初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP_UI初始化 { c_param_1: 1580803121, c_param_dict: py.Dict, event: "【玩家】PVP_UI初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVE_UI初始化 { c_param_1: 1614346688, c_param_dict: py.Dict, event: "【玩家】PVE_UI初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【单位】击杀板UI { c_param_1: 1950033043, c_param_dict: py.Dict, event: "【单位】击杀板UI", data: { ["凶手单位"]: Unit, ["死亡单位"]: Unit, ["抢夺星星数"]: integer, ["连杀数"]: integer, ["是否终结"]: boolean } }
---@alias EventParam.游戏-消息.【单位】进入草丛时 { c_param_1: 1436179319, c_param_dict: py.Dict, event: "【单位】进入草丛时", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【单位】离开草丛时 { c_param_1: 1734147887, c_param_dict: py.Dict, event: "【单位】离开草丛时", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【玩家】PVP_存档初始化 { c_param_1: 1809621322, c_param_dict: py.Dict, event: "【玩家】PVP_存档初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【全局】初始化触摸动作 { c_param_1: 1046129302, c_param_dict: py.Dict, event: "【全局】初始化触摸动作", data: {  } }
---@alias EventParam.游戏-消息.【全局】进入大厅 { c_param_1: 1086095944, c_param_dict: py.Dict, event: "【全局】进入大厅", data: {  } }
---@alias EventParam.游戏-消息.【玩家】PVE_单位初始化 { c_param_1: 1028039216, c_param_dict: py.Dict, event: "【玩家】PVE_单位初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVE_玩家初始化 { c_param_1: 1928559659, c_param_dict: py.Dict, event: "【玩家】PVE_玩家初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【全局】PVE流程控制 { c_param_1: 1510852819, c_param_dict: py.Dict, event: "【全局】PVE流程控制", data: { ["阶段"]: string, ["index"]: integer } }
---@alias EventParam.游戏-消息.【全局】PVE刷怪 { c_param_1: 1989476762, c_param_dict: py.Dict, event: "【全局】PVE刷怪", data: {  } }
---@alias EventParam.游戏-消息.【全局】PVE_怪物AI初始化 { c_param_1: 1685905375, c_param_dict: py.Dict, event: "【全局】PVE_怪物AI初始化", data: {  } }
---@alias EventParam.游戏-消息.【单位】PVE_怪物AI状态 { c_param_1: 1070045092, c_param_dict: py.Dict, event: "【单位】PVE_怪物AI状态", data: { ["Monster"]: Unit, ["Key"]: integer, ["当前状态"]: string, ["切换后状态"]: string, ["Target"]: Unit } }
---@alias EventParam.游戏-消息.【单位】PVE_单位开启自动攻击 { c_param_1: 1649931097, c_param_dict: py.Dict, event: "【单位】PVE_单位开启自动攻击", data: { ["单位"]: Unit, ["类型"]: string } }
---@alias EventParam.游戏-消息.【单位】使用大招 { c_param_1: 1943849775, c_param_dict: py.Dict, event: "【单位】使用大招", data: { ["Unit"]: Unit, ["使用的技能"]: Ability } }
---@alias EventParam.游戏-消息.【玩家】PVP_机器人AI初始化 { c_param_1: 1961613111, c_param_dict: py.Dict, event: "【玩家】PVP_机器人AI初始化", data: { ["玩家"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_机器人AI初始化 { c_param_1: 1120645767, c_param_dict: py.Dict, event: "【玩家】PVP死斗_机器人AI初始化", data: { ["玩家"]: Player } }
---@alias EventParam.游戏-消息.【单位】PVP_单位AI自动攻击 { c_param_1: 2002448406, c_param_dict: py.Dict, event: "【单位】PVP_单位AI自动攻击", data: { ["Unit"]: Unit, ["自动攻击开关"]: boolean } }
---@alias EventParam.游戏-消息.【玩家】开始观战 { c_param_1: 1599637021, c_param_dict: py.Dict, event: "【玩家】开始观战", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】生涯界面初始化 { c_param_1: 1681437929, c_param_dict: py.Dict, event: "【玩家】生涯界面初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】刷新存档成就_英雄皮肤数量 { c_param_1: 2085693599, c_param_dict: py.Dict, event: "【玩家】刷新存档成就-英雄皮肤数量", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】刷新外观收藏品数量 { c_param_1: 1731414453, c_param_dict: py.Dict, event: "【玩家】刷新外观收藏品数量", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_玩家初始化 { c_param_1: 1456070651, c_param_dict: py.Dict, event: "【玩家】PVP死斗_玩家初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_选人界面显示 { c_param_1: 2030247139, c_param_dict: py.Dict, event: "【玩家】PVP死斗_选人界面显示", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_单位初始化 { c_param_1: 1600646209, c_param_dict: py.Dict, event: "【玩家】PVP死斗_单位初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_机器人单位初始化 { c_param_1: 1858843075, c_param_dict: py.Dict, event: "【玩家】PVP死斗_机器人单位初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【全局】PVP死斗_流程控制 { c_param_1: 1218706458, c_param_dict: py.Dict, event: "【全局】PVP死斗_流程控制", data: { ["下一阶段"]: string } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_UI初始化 { c_param_1: 1443265178, c_param_dict: py.Dict, event: "【玩家】PVP死斗_UI初始化", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【全局】PVP死斗_结算 { c_param_1: 1464217556, c_param_dict: py.Dict, event: "【全局】PVP死斗_结算", data: {  } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_塔罗牌随机 { c_param_1: 1604401632, c_param_dict: py.Dict, event: "【玩家】PVP死斗_塔罗牌随机", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_塔罗牌选择界面显示 { c_param_1: 1831133406, c_param_dict: py.Dict, event: "【玩家】PVP死斗_塔罗牌选择界面显示", data: { ["Player"]: Player } }
---@alias EventParam.游戏-消息.【单位】造成击杀 { c_param_1: 1513256612, c_param_dict: py.Dict, event: "【单位】造成击杀", data: { ["Unit"]: Unit, ["Target"]: Unit } }
---@alias EventParam.游戏-消息.【玩家】PVP死斗_获得塔罗牌 { c_param_1: 1516818342, c_param_dict: py.Dict, event: "【玩家】PVP死斗_获得塔罗牌", data: { ["Unit"]: Unit } }
---@alias EventParam.游戏-消息.【Lua】玩家被踢出队伍 { c_param_1: 1505692330, c_param_dict: py.Dict, event: "【Lua】玩家被踢出队伍", data: { ["Player"]: Player } }

---@class Game
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】进入玩法关卡", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】进入玩法关卡))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVP流程控制", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVP流程控制))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】触发普攻", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】触发普攻))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】3选1装备随机", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】3选1装备随机))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVE商店界面显示", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVE商店界面显示))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP首回合自选界面显示", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP首回合自选界面显示))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】3选1消耗品随机", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】3选1消耗品随机))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】商店刷新奖励物品", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】商店刷新奖励物品))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP玩法主界面刷新", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP玩法主界面刷新))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVE玩法主界面刷新", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVE玩法主界面刷新))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】进入大厅", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】进入大厅))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "选择角色_测试", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.选择角色_测试))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP商店显示", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP商店显示))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】拾取场景物品", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】拾取场景物品))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】使用消耗品", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】使用消耗品))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】触发格挡", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】触发格挡))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】计星板UI刷新", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】计星板UI刷新))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】草丛模型不透明度初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】草丛模型不透明度初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】开启探草视野", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】开启探草视野))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】切换角色完成", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】切换角色完成))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】切换角色前", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】切换角色前))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】准备进入战斗关卡", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】准备进入战斗关卡))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_单位初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_单位初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_机器人单位初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_机器人单位初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_玩家初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_玩家初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_UI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_UI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVE_UI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVE_UI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】击杀板UI", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】击杀板UI))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】进入草丛时", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】进入草丛时))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】离开草丛时", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】离开草丛时))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_存档初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_存档初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】初始化触摸动作", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】初始化触摸动作))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】进入大厅", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】进入大厅))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVE_单位初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVE_单位初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVE_玩家初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVE_玩家初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVE流程控制", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVE流程控制))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVE刷怪", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVE刷怪))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVE_怪物AI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVE_怪物AI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】PVE_怪物AI状态", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】PVE_怪物AI状态))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】PVE_单位开启自动攻击", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】PVE_单位开启自动攻击))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】使用大招", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】使用大招))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP_机器人AI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP_机器人AI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_机器人AI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_机器人AI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】PVP_单位AI自动攻击", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】PVP_单位AI自动攻击))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】开始观战", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】开始观战))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】生涯界面初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】生涯界面初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】刷新存档成就-英雄皮肤数量", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】刷新存档成就_英雄皮肤数量))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】刷新外观收藏品数量", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】刷新外观收藏品数量))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_玩家初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_玩家初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_选人界面显示", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_选人界面显示))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_单位初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_单位初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_机器人单位初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_机器人单位初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVP死斗_流程控制", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVP死斗_流程控制))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_UI初始化", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_UI初始化))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【全局】PVP死斗_结算", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【全局】PVP死斗_结算))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_塔罗牌随机", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_塔罗牌随机))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_塔罗牌选择界面显示", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_塔罗牌选择界面显示))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【单位】造成击杀", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【单位】造成击杀))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【玩家】PVP死斗_获得塔罗牌", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【玩家】PVP死斗_获得塔罗牌))
---@diagnostic disable-next-line: duplicate-doc-field
---@field event fun(self: Game, event: "游戏-消息", event_id: "【Lua】玩家被踢出队伍", callback: fun(trigger: Trigger, data: EventParam.游戏-消息.【Lua】玩家被踢出队伍))
