--#region GameTools.lua
--Descript: 工具函数
--Creater: 甘嘉诚
--CreateDate:2024.9.25
--#endregion

GameTools = {}



--读表中value的字符串值，转换成表格返回
--@param tTable 要读的表
--@param nKey id
--@param sName 键值
function GameTools.MakerValueReturnTable(tTable,nKey,sName)
    local tNewTable = {}
    if tTable then
        if tTable[nKey] and tTable[nKey][sName] then
            local sString = tTable[nKey][sName]
            tNewTable = rwAllToolsFunc.AbilitysValueToTable(sString)
        else
            -- print("err: key ["..nKey.."] or ["..sName.."] not in talbe !")
        end
    end
    return tNewTable
end

return GameTools
