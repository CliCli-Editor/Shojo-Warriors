--#region AbilityAttr.lua
--Descript: 玩家属性操作
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion

UnitAttrCtrl = {}


--初始化
function UnitAttrCtrl.Initialize(uPy_Player,uPy_Unit)
    if not uPy_Player then
        return
    end
    local uLua_unit = y3.unit.get_by_handle(uPy_Unit)

    -- 打出单位的属性
    local nHeroId = uLua_unit:get_id() or 0

    local nPlayerId = uPy_Player:get_role_id_num() or 0
    -- 初始化玩家状态
    AttrBoost.InitializePlayerState(nPlayerId)
end

-- 检测玩家是否有记录数据
function UnitAttrCtrl.HasPlayerData(uPy_Player)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    return AttrBoost.HasPlayerData(nPlayerId)
end

--设置玩家某增益所有属性值。
function UnitAttrCtrl.SetAllBoosts(uPy_Player,uPy_Unit)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    AttrBoost.SetAllBoosts(nPlayerId,uPy_Unit)
end

-- 获取某个玩家的所有类型数据的表格
function UnitAttrCtrl.GetAllBoosts(uPy_Player)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    return AttrBoost.GetAllBoosts(nPlayerId)
end

-- 获取属性增益数值
function UnitAttrCtrl.GetAPartBoosts(uPy_Player, sBoostType)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0

    return AttrBoost.GetAPartBoosts(nPlayerId, sBoostType)
end

-- 获取属性增益数值
function UnitAttrCtrl.GetBoost(uPy_Player, sBoostType, sAttributeName)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0

    return AttrBoost.GetBoost(nPlayerId, sBoostType, sAttributeName)
end


--操作技能属性。
--玩家，单位，技能槽位，技能标签，更改的属性名：更改值
function UnitAttrCtrl.CtrlAbilityAttr(uPy_Player,uPy_Unit,nSlotId,sSkillTag,sAttrType)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    local tLua_unit = y3.unit.get_by_handle(uPy_Unit)

    -- 使用分隔符“：”来分割字符串
    local sString, nNumStr = tostring(sAttrType):match("([^,]+),(.+)")

    -- 将 nNumStr 转换为数字
    local nNum = tonumber(nNumStr)
    if sString == "初始化" then
        AbilityAttr.InitUpdate(nPlayerId, tLua_unit)
    else
        AbilityAttr.UpdateAbilityInUnitPersonAttr(nPlayerId, tLua_unit,nSlotId,sSkillTag,sString,nNum)
    end
end

--获取AI名字表
function UnitAttrCtrl.GetAINameTable()
    return clone(rwAllAIName)
end

--#region GM测试用函数。

-- 获取某个玩家的所有类型数据的表格并打印
function UnitAttrCtrl.Test_GetAllBoosts(uPy_Player)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    local tTable = AttrBoost.GetAllBoosts(nPlayerId)
    print("玩家的所有类型属性表如下：")
    GameAPI.dump_table(tTable)
end

-- 获取某个玩家的某个类型数据的表格并打印
function UnitAttrCtrl.Test_GetAPartBoosts(uPy_Player,sBoostType)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0
    local tTable = AttrBoost.GetAPartBoosts(nPlayerId,sBoostType)
    print("玩家的"..sBoostType.."类型属性表如下：")
    GameAPI.dump_table(tTable)
end


--打印玩家技能自定义属性。
function UnitAttrCtrl.Test_GetNumAbilityAttr(uPy_Player,nNum)
    if not uPy_Player then
        return
    end
    local nPlayerId = uPy_Player:get_role_id_num() or 0

    tAbilityAttr.tUserAbilityAttrInit[nPlayerId] = tAbilityAttr.tUserAbilityAttrInit[nPlayerId] or {}
    local tTable = clone(tAbilityAttr.tUserAbilityAttrInit[nPlayerId][nNum]) or {}
    print("玩家".. nPlayerId.."第"..nNum.."个技能槽位的技能自定义属性表如下：")
    GameAPI.dump_table(tTable)
end

--#endregion














return UnitAttrCtrl