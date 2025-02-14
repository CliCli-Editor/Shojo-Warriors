---@enum(key, partial) y3.Const.UIAnimKey
local UIAnimKey = {
    ["开战"] = "0cd9327d-2b63-407e-a54e-40f64f0f2edc",
    ["呼吸"] = "a3d6d043-dc79-41f5-9211-79c76817b6f6",
}

y3.util.tableMerge(y3.const.UIAnimKey or {}, UIAnimKey)
