---@enum(key, partial) y3.Const.UnitAttr
local UnitAttr = {
    ["脱战回复倍率"] = "qPbv2GXVEe+aqpv0nYyeE1",
    ["装弹速度"] = "uldEmWXkEe+EmClcEb2Qzl",
    ["最大能量值"] = "7naUwWXkEe+mYylcEb2Qzm",
    ["当前能量值"] = "qT47W2XuEe+mefkeJMyiJ-",
    ["力量"] = "strength",
    ["敏捷"] = "agility",
    ["智力"] = "intelligence",
    ["主属性"] = "main",
}

y3.util.tableMerge(y3.const.UnitAttr or {}, UnitAttr)
