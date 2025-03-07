--#region UnitCtrl.lua
--Descript: 单位操作
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion

UnitCtrl = {}


--矩形区域内随机生成宝箱。
--@param uArea 区域
--@param tUnitList 要刷的单位类型表
--@param uDis 间隔距离
--@param nNum 数量
--@param uOwner 所属玩家
function UnitCtrl.RandomAddBox(uArea,tUnitList,uDis,nNum,uOwner)
    local uLua_Owner = y3.player.get_by_handle(uOwner)
    local tCreateUnitPoint = {}
    while #tCreateUnitPoint < nNum do
    local nDis = uDis:float()
        local uPoint = CreatUnitInArea.GetRandomPointInArea(uArea,tUnitList,nDis)
        if uPoint then
            table.insert(tCreateUnitPoint,uPoint)
        end
    end
    for k,uPoint in ipairs(tCreateUnitPoint) do
        local nUnitType = rwAllToolsFunc.GetRandomElement(tUnitList)
        if nUnitType ~= false then
            local uUnit = y3.unit.create_unit(uLua_Owner,nUnitType,uPoint,180)
        end
    end
end

--矩形区域内木箱补充初始化逻辑。--将区域范围内所有符合单位类型的单位存储在全局表里。
--@param uArea 区域
--@param tUnitTypeList 要补充的单位类型表
function UnitCtrl.InitReplenishBox(uArea,tUnitTypeList)
    local uLua_Area = y3.area.get_by_handle(uArea)
    local nAreaId = GameAPI.get_area_resource_id(uArea)
    rwAllPVPBox[nAreaId] = {}
    local tUnitList = CreatUnitInArea.GetAreaAllUnit(uLua_Area,tUnitTypeList)

    for _, v in ipairs(tUnitList) do
        local tUnitNumTable = {}
        tUnitNumTable["Id"] = y3.unit.get_id(v)
        tUnitNumTable["Type"] = y3.unit.get_key(v)
        tUnitNumTable["Point"] = y3.unit.get_point(v)
        tUnitNumTable["IsLife"] = 1
        table.insert(rwAllPVPBox[nAreaId],tUnitNumTable)
    end
end

--矩形区域内木箱补充逻辑。
--@param uArea 区域
--@param uOwner 所属玩家
function UnitCtrl.ReplenishBox(uArea,uOwner)
    local nAreaId = GameAPI.get_area_resource_id(uArea)
    local uLua_Owner = y3.player.get_by_handle(uOwner)

    --判断是否初始化过。
    if rwAllPVPBox[nAreaId] and #rwAllPVPBox[nAreaId] > 0 then
        --循环检测是否存活，若被破坏则在原位创建并记录。
        for i = 1,#rwAllPVPBox[nAreaId] do
            local nIsLife = rwAllPVPBox[nAreaId][i]["IsLife"] or 1
            if nIsLife == 0 then
                local uUnit = y3.unit.create_unit(uLua_Owner,rwAllPVPBox[nAreaId][i]["Type"],rwAllPVPBox[nAreaId][i]["Point"],0)
                if uUnit then
                    rwAllPVPBox[nAreaId][i]["Id"] = y3.unit.get_id(uUnit)
                    rwAllPVPBox[nAreaId][i]["Type"] = y3.unit.get_key(uUnit)
                    rwAllPVPBox[nAreaId][i]["Point"] = y3.unit.get_point(uUnit)
                    rwAllPVPBox[nAreaId][i]["IsLife"] = 1
                end
            end
        end
    else
        print("err：这个区域内的木箱还未初始化过，请在合适的地方调用初始化函数UnitCtrl.InitReplenishBox(uArea,tUnitTypeList)。")
    end
end

--矩形区域内木箱被杀逻辑逻辑。
--@param uArea 区域
--@param uUnit 单位
function UnitCtrl.ReplenishBoxBeKill(uArea,uUnit)
    local nAreaId = GameAPI.get_area_resource_id(uArea)
    --local uLua_Unit = y3.unit.get_by_handle(uUnit)
    local uLua_Unit = y3.unit.get_by_handle(uUnit) 
    local nUnitId = y3.unit.get_id(uLua_Unit) --2.0.75灰度包有修改调整，需要转换一下实例。
    --判断是否初始化过。
    if rwAllPVPBox[nAreaId] and #rwAllPVPBox[nAreaId] > 0 then
        --循环检测对应的唯一Id，符合的话，就置0。
        for i = 1,#rwAllPVPBox[nAreaId] do 
            if nUnitId == rwAllPVPBox[nAreaId][i]["Id"] then
                rwAllPVPBox[nAreaId][i]["IsLife"] = 0
                break
            end
        end
    else
        print("err：这个区域内的木箱还未初始化过，请在合适的地方调用初始化函数UnitCtrl.InitReplenishBox(uArea,tUnitTypeList)。")
    end

end


return UnitCtrl
