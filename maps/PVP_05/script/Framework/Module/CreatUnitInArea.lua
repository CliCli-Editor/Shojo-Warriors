--#region CreatUnitInArea.lua
--Descript: 区域内创建单位
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion

--local M = Class 'CreatUnitInArea'

--M.type = 'CreatUnitInArea'

CreatUnitInArea = {}


-- 初始化
function CreatUnitInArea.Init()

end

--#region 函数内方法

--获取区域内符合类型的所有单位，返回表。
-- uArea 区域
-- tUnitList 表：单位类型的表
-- return 单位的表
function CreatUnitInArea.GetAreaAllUnit(uLua_Area,tUnitTypeList)
    --区域内的所有单位。
    local tUnitList = {}
    local tUnitInArea = y3.area.get_all_unit_in_area(uLua_Area)

    for k, uUnit in ipairs(tUnitInArea) do
        local uUnitType = y3.unit.get_key(uUnit) --获取区域内单位的单位类型的ID
        for i = 1, #tUnitTypeList do --符合单位类型一样的，存入表格。
            if uUnitType == tUnitTypeList[i] then
                table.insert(tUnitList,uUnit)
            end
        end
    end
    return tUnitList
end

--#endregion


--#region 调用

--获取区域内符合范围条件的点
-- uArea 区域
-- tUnitList 表：单位类型的表
-- nDis 和其他单位的距离>=nDis 符合条件
function CreatUnitInArea.GetRandomPointInArea(uArea,tUnitTypeList,nDis)
    local tAreaRandomPointList = {}
    --根据提供的单位类型表，获取需要比对的单位表。
    local uLua_Area = y3.area.get_by_handle(uArea)

    local tUnitList = CreatUnitInArea.GetAreaAllUnit(uLua_Area,tUnitTypeList)
    local tUnitPointList = {}
    for _, value in pairs(tUnitList) do
        local tUnitPoint = y3.unit.get_point(value)
        table.insert(tUnitPointList,tUnitPoint)
    end

    --获取随机点的函数。
    for i = 1, 10 do
    --转换成lua实例
        tAreaRandomPointList[i] = y3.area.random_point(uLua_Area)
    end
    local uReturnPoint = false
    --对比一下点的距离，超过dis就记录。
    for i = 1,#tAreaRandomPointList do 
        local bMark = true
        for k, value in ipairs(tUnitPointList) do
            local nBetweenPointDis = y3.helper.tonumber(y3.point.get_distance_with(value, tAreaRandomPointList[i])) or 0.0
            if nBetweenPointDis < nDis then
                bMark = false
            end
        end
        if bMark then
            uReturnPoint = tAreaRandomPointList[i]
            return uReturnPoint
        end
    end
    return uReturnPoint
end















--#endregion




return CreatUnitInArea