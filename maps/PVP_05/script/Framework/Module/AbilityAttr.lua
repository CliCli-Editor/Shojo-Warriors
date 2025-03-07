--#region AbilityAttr.lua
--Descript: 技能自定义属性操作
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion


-- 用于存储玩家单位身上的技能的全部属性
tAbilityAttr.tUserdata = {}

--用于存储技能的全局表
tAbilityAttr.tInitialAttr = y3.game.get_table("HERO_SKILL_PROPERTY", true)

--[[ 用于存储玩家的单位技能附加自定义属性
tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][slot][sString]["Type"] = type
tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][slot][sString]["AddValue"] = nNum
]]
tAbilityAttr.tUserAbilityPersonAttr = {}

-- 用于存储玩家的单位技能附加自定义属性初始化 
--tAbilityAttr.tUserAbilityAttrInit[nPlayerId][slot][sString] = nNum 
tAbilityAttr.tUserAbilityAttrInit = {}


--用法
--[[-- 初始化玩家状态
AbilityAttr.InitUpdate(nPlayerId, tLua_unit)

-- 增加玩家某技能槽位某自定义属性的值为某
AbilityAttr.UpdateAbilityInUnitPersonAttr(nPlayerId, tLua_unit,nSlotId,sSkillTag,sString,nNum)

]]

--技能属性类型--
-- local tAbilityAttrType = {
--     [1] = "基础伤害倍率",
--     [2] = "基础伤害充能",
--     [3] = "攻击范围",
--     [4] = "范围影响参数",
--     [5] = "子弹效果范围",
--     [6] = "子弹个数",
--     [7] = "子弹速度",
--     [8] = "弹射次数",
--     [9] = "技能持续时间",
--     [10] = "子弹碰撞",
--     [11] = "EX充能次数"
--     }
    
    --技能物编内自定义属性，与下面固定属性加起来应该是完整的技能属性类型
    local tPersonAlizeAbilityAttrType = {
        [1] = "Basicdamagemultiplier",  -- 基础伤害倍率
        [2] = "Basicdamagecharging",    -- 基础伤害充能
        [3] = "Scopeaffectsparameters", -- 范围影响参数
        [4] = "Bulleteffectrange",      -- 子弹效果范围
        [5] = "Numberofbullets",        -- 子弹个数
        [6] = "Bulletspeed",            -- 子弹速度
        [7] = "Numberofcatapults",      -- 弹射次数
        [8] = "Skillduration",          -- 技能持续时间
        [9] = "Bulletcollision",        -- 子弹碰撞
        [10] = "Exchargingtimes"        -- EX充能次数
    }
    
    --技能物编内固定属性
    local tFixedAbilityAttrTypeType = {
        [1] = "攻击范围"
    }

    
local tAbilityNum = {1, 2, 3, 4}



--初始化玩家属性。
---@param nPlayerId integer 玩家 ID
---@param tLua_unit table 单位的lua实例
function AbilityAttr.InitUpdate(nPlayerId, tLua_unit)
    if not nPlayerId or not tLua_unit then
        return
    end
    tAbilityAttr.tUserdata[nPlayerId] = tAbilityAttr.tUserdata[nPlayerId] or {}
    --获取技能表里的所有属性。
    local tInitialAttr = clone(tAbilityAttr.tInitialAttr)

    if tInitialAttr then
        for _, slot in ipairs(tAbilityNum) do
            local uAbility = y3.unit.get_ability_by_slot(tLua_unit, y3.const.AbilityType['命令'], slot)
            if uAbility then
                local nAbilityKey = y3.ability.get_key(uAbility)
                for key, _ in pairs(tInitialAttr) do
                    if nAbilityKey == tInitialAttr[key].Skill then 
                        tAbilityAttr.tUserdata[nPlayerId][slot] = tInitialAttr[key]
                    end
                end
            end
        end
    end
    -- 仅存储玩家拥有的技能属性
    local tPlayerAbilityAttr = clone(tAbilityAttr.tUserdata[nPlayerId])
--GameAPI.dump_table(tPlayerAbilityAttr)

    --记录需要初始化的自定义属性和固定属性的表。
    tAbilityAttr.tUserAbilityAttrInit[nPlayerId] = tAbilityAttr.tUserAbilityAttrInit[nPlayerId] or {}

    for i = 1,#tPlayerAbilityAttr do
        --if i == 3 then --空格技能是第四个槽位
        --    i = 4
        --end
        tAbilityAttr.tUserAbilityAttrInit[nPlayerId][i] = tAbilityAttr.tUserAbilityAttrInit[nPlayerId][i] or {}
        --tPersonAlizeAbilityAttrType表中的记录。自定义属性
        for _, value in pairs(tPersonAlizeAbilityAttrType) do
            tAbilityAttr.tUserAbilityAttrInit[nPlayerId][i][value] = tPlayerAbilityAttr[i][value]
        end
        --tFixedAbilityAttrTypeType表 固定属性 
        for _, value in pairs(tFixedAbilityAttrTypeType) do
            tAbilityAttr.tUserAbilityAttrInit[nPlayerId][i][value] = tPlayerAbilityAttr[i][value]
        end
        --value_1到value_8的记录。
        local sValue = tPlayerAbilityAttr[i]["value"] or "[]"
--print("sValue的值："..tostring(sValue))
        local tValueTable = rwAllToolsFunc.AbilitysValueToTable(sValue)
--GameAPI.dump_table(tValueTable)
        if tValueTable and #tValueTable > 0 then
            local nTableLength = #tValueTable
            local tPersonAbilityAttrType = {}
            for j = 1,nTableLength do 
                tPersonAbilityAttrType[j] = "value_" ..j
            end
            --修改单位身上的技能的自定义属性。
            for k, value in pairs(tValueTable) do
                tAbilityAttr.tUserAbilityAttrInit[nPlayerId][i][tPersonAbilityAttrType[k]] = value
            end
        end
    end
    --记录完毕，开始存数据。GameAPI.dump_table(tAbilityAttr.tUserAbilityAttrInit) --非固定属性的，都调用kv_save
    --修改单位身上的技能的自定义属性。
    for _, slot in ipairs(tAbilityNum) do
        local uAbility = y3.unit.get_ability_by_slot(tLua_unit, y3.const.AbilityType['命令'], slot)
        if uAbility then
            for key, value in pairs(tAbilityAttr.tUserAbilityAttrInit[nPlayerId][slot]) do
                if type(key) == "string" then
                    if  key == "攻击范围" then --固定属性的攻击范围特殊处理一下。
                        uAbility:set_range(value)
                    else
                        if key ~= "Exchargingtimes" then
                            value = value * 1.0
                        end
                        uAbility:kv_save(key, value)
                    end
                end
            end
        end
    end
    --加完之后，检查一下修改表，是否有玩家数据，有的话，另外加一下。 --前面的逻辑都OK了，有单次修改后，再初始化的时候，记得看看这段逻辑。
    local tUserAbilityPersonAttr = tAbilityAttr.tUserAbilityPersonAttr
    if #tUserAbilityPersonAttr > 0 then
        tUserAbilityPersonAttr[nPlayerId] = {}
        for _, slot in ipairs(tAbilityNum) do
            local uAbility = y3.unit.get_ability_by_slot(tLua_unit, y3.const.AbilityType['命令'], slot)
            if uAbility then
                for key, tTable in pairs(tUserAbilityPersonAttr[nPlayerId][slot]) do
                    if type(key) == "string" then
                        if tTable["AddValue"] and tTable["AddValue"] ~= 0 then
                            if  key == "攻击范围" then --固定属性的攻击范围特殊处理一下。
                                tUserAbilityPersonAttr[nPlayerId][slot][key]["Type"] = "number"
                                local nOldRange = uAbility:get_range() or 0
                                local nNewRange = nOldRange + tTable["AddValue"]
                                uAbility:set_range(nNewRange)
                            else
                                local nOldValue = uAbility:kv_load(key, tTable["Type"])
                                local nNewValue = tTable["AddValue"] + nOldValue
                                uAbility:kv_save(key, nNewValue)
                            end
                        end
                    end
                end
            end
        end
    end
end

--增减单位技能的自定义属性值
---@param nPlayerId integer 玩家 ID
---@param tLua_unit table 单位的lua实例
---@param nSlotId integer 单位技能槽位id
---@param sSkillTag string 技能标签
---@param sString string 更改的属性名
---@param nAttrNum integer 更改的属性值
function AbilityAttr.UpdateAbilityInUnitPersonAttr(nPlayerId, tLua_unit,nSlotId,sSkillTag,sString,nAttrNum)
    if not nPlayerId or not tLua_unit then
        return
    end
    local tUserAbilityPersonNumType = tAbilityAttr.tUserAbilityAttrInit
    tUserAbilityPersonNumType[nPlayerId] = tUserAbilityPersonNumType[nPlayerId] or {}
    --判断有没有，没有的话初始化一下。
    if #tUserAbilityPersonNumType[nPlayerId] < 1 then
        AbilityAttr.InitUpdate(nPlayerId, tLua_unit)
        --初始化结束之后需要再赋值一下。
        tUserAbilityPersonNumType = tAbilityAttr.tUserAbilityAttrInit
    end
    --判断初始化结束之后，就需要单加。

    local uAbility = tLua_unit:get_ability_by_slot(y3.const.AbilityType['命令'], nSlotId)
    if uAbility then
        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId] = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId] or {}
        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId] = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId] or {}
        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString] = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString] or {}
        local bMark = uAbility:kv_has(tostring(sString))
        for _, value in pairs(tFixedAbilityAttrTypeType) do
            if sString == value then
                bMark = true
            end
        end
        if not bMark then
            print("err:单位第"..nSlotId.."号槽位技能无:"..sString.."。这个自定义属性")
         else
            --判断是否符合符合 'value_' 后跟数字的形式
            local bMark2 = rwAllToolsFunc.IsValue_WithNumber(sString)
            if bMark2 then
                local nOldNum = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] or 0
                local nOldAttrNum = tAbilityAttr.tUserAbilityAttrInit[nPlayerId][nSlotId][sString]
                local nAttrNum2 = nAttrNum + nOldNum + nOldAttrNum
                local nAttrNum3 = nAttrNum + nOldNum
                tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] = nAttrNum3
                local nNumType = math.type(nAttrNum2)
                if nNumType then
                    if nNumType == "float" then
                        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = "number"
                    else
                        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = nNumType
                    end
                end
                uAbility:kv_save(tostring(sString), nAttrNum2)
            else
                local bMark3 = true
                for _, value in pairs(tPersonAlizeAbilityAttrType) do
                    if sString == value then
                        local nOldNum = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] or 0
                        local nOldAttrNum = tAbilityAttr.tUserAbilityAttrInit[nPlayerId][nSlotId][sString]
                        local nAttrNum2 = nAttrNum + nOldNum + nOldAttrNum
                        local nAttrNum3 = nAttrNum + nOldNum
                        tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] = nAttrNum3
                        local nNumType = math.type(nAttrNum2)
                        if nNumType then
                            if nNumType == "float" then
                                tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = "number"
                            else
                                tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = nNumType
                            end
                        end
                        uAbility:kv_save(tostring(sString), nAttrNum2)
                        bMark3 = false
                        break
                    end
                end
                if bMark3 then
                    for _, value in pairs(tFixedAbilityAttrTypeType) do
                        if sString == tFixedAbilityAttrTypeType[1] then
                            local nOldNum = tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] or 0
                            local nOldAttrNum = tAbilityAttr.tUserAbilityAttrInit[nPlayerId][nSlotId][sString]
                            local nAttrNum2 = nAttrNum + nOldNum + nOldAttrNum
                            local nAttrNum3 = nAttrNum + nOldNum
                            tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["AddValue"] = nAttrNum3
                            local nNumType = math.type(nAttrNum2)
                            if nNumType then
                                if nNumType == "float" then
                                    tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = "number"
                                else
                                    tAbilityAttr.tUserAbilityPersonAttr[nPlayerId][nSlotId][sString]["Type"] = nNumType
                                end
                            end
                            uAbility:set_range(nAttrNum2)
                            break
                        elseif sString == tFixedAbilityAttrTypeType[2] then
                            --冷却时间暂时不动。
                        end
                    end
                end
            end
        end
    else
        print("err:单位第"..nSlotId.."号槽位没有技能。")
    end
end


return AbilityAttr