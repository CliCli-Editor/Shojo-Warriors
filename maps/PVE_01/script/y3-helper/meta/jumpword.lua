---@enum(key, partial) y3.Const.FloatTextJumpType
local jumpWords = {
    ["伤害_左上"] = 934231441,
    ["伤害_4"] = 934252831,
    ["伤害_右上"] = 934266669,
    ["伤害_中上"] = 934269508,
    ["金币跳字"] = 934277693,
}

y3.util.tableMerge(y3.const.FloatTextJumpType or {}, jumpWords)
