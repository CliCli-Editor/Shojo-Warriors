---@enum(key, partial) y3.Const.PlayerAttr
local PlayerAttr = {
    ["gold"] = "official_res_1",
    ["血量"] = "jLMeeF+EEe+RSYUUiWCtoY",
    ["分数"] = "cd37+V+hEe+GLVvj7goV-A",
}

y3.util.tableMerge(y3.const.PlayerAttr or {}, PlayerAttr)
