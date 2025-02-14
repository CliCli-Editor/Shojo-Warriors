-- 游戏启动后会自动运行此文件

--在开发模式下，将日志打印到游戏中
if y3.game.is_debug_mode() then
    y3.config.log.toGame = false --true
    y3.config.log.level  = 'debug' --'debug'
else
    y3.config.log.toGame = false
    y3.config.log.level  = 'info'
end

y3.game:event('游戏-初始化', function (trg, data)
    -- 使用示例

end)

--clone
function clone(object)
    local lookup_table = {}
    local function _copy(object)
    if type(object) ~= "table" then
        return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local newObject = {}
        lookup_table[object] = newObject
        for key, value in pairs(object) do
            newObject[_copy(key)] = _copy(value)
        end
        return setmetatable(newObject, getmetatable(object))
    end
    return _copy(object)
end
    
function GetTimeAsNumbers()
    local timeStr = os.date("%H:%M")
    local hour, minute = timeStr:match("(%d+):(%d+)")
    return tonumber(hour), tonumber(minute)
end

Match_level_id = '110820841736516761627997407224785988583' --PVP地图1

---comment
---@param Module any
---@return string
function GetModuleLevelId(Module)
    BOB_Match_Module = Module
    if Module == 1 then
        local tPVP_Map_Id = {
            [1] = '110820841736516761627997407224785988583', --PVP地图1
            [2] = '329014476848767048873080574908054904993', --PVP_04
            [3] = '225071830061101721282187863364520802439', --PVP_05
            [4] = '309196634101328253120000367900295394556', --PVP_06
            [5] = '307813389453980271721215548408096925117'  --PVP_07
        }
        local nHour, nMinute = GetTimeAsNumbers()
        local tTable = {4,1,3,5,2,4,1,3,5,2,1,4,2,5,3,1,4,2,5,3,2,5,1,3,4,2,5,1,3,4,5,3,2,4,1,5,3,2,4,1,3,1,5,2,4,3,1,5,2,4,1,4,2,5,3,1,4,2,5,3,2,5,1,3,4,2,5,1,3,4,2,1}
        local nRandom = nHour * 3 + math.ceil(nMinute / 20)
        if nRandom < 1 then
            nRandom = 1
        end
        BOB.level_id = tPVP_Map_Id[tTable[nRandom]]
    elseif Module == 2 then
        local tPVP_Map_Id = {
            [1] = '213623372932343864983163591347943838703', --PVP_03
        }
        BOB.level_id = tPVP_Map_Id[1]
    end
end

-- 显式加载
require("Framework.Core.rwDataPool")
local rwAllRequire = require("Framework.Core.rwAllRequire")
require 'game'
include 'game.pub'