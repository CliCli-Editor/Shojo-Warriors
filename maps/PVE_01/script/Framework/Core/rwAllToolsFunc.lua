--#region rwAllToolsFunc.lua
--Descript: 全局工具函数表
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion




function rwAllToolsFunc.GetRandomElement(t)
    -- 检查表是否为空
    if #t == 0 then
        return false
    end

    -- 检查表中是否只有一个元素
    if #t == 1 then
        for _, v in ipairs(t) do
            return v
        end
    end

    -- 表中有多个元素，随机选取一个
    local index = math.random(1, #t)
    return t[index]
end

--[1,0.5,300]中括号字符串转成对应表返回。
function rwAllToolsFunc.AbilitysValueToTable(input)
-- 去掉方括号
input = input:sub(2, -2)

-- 使用逗号分隔字符串
local tValueTable = {}
for sValue in input:gmatch("%s*([^,]+)%s*") do
    -- 将每个元素转换为数字
    local num = tonumber(sValue)
    if num then
        table.insert(tValueTable, num)
    end
end

-- 将结果赋值给 tValueTable
    return tValueTable
end

-- 定义一个函数来判断字符串是否符合 "value" 后跟数字的形式
function rwAllToolsFunc.IsValue_WithNumber(sString)
    -- 使用模式匹配来检查字符串是否符合 "value" 后跟一个或多个数字的形式
    local pattern = "^value_%d+$"
    return sString:match(pattern) ~= nil
end


return rwAllToolsFunc