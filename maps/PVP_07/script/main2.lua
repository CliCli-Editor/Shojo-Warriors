-- 游戏启动后会自动运行此文件

--在开发模式下，将日志打印到游戏中
if y3.game.is_debug_mode() then
    y3.config.log.toGame = false --true
    y3.config.log.level  = 'info' --'debug'
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
    

-- 显式加载
require("Framework.Core.rwDataPool")
local rwAllRequire = require("Framework.Core.rwAllRequire")
require 'game'
include 'game.pub'