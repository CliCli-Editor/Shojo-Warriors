--#region AttrBoost.lua
--Descript: 单位固定属性
--Creater: 甘嘉诚
--CreateDate:2024.9.23
--#endregion

-- 初始化数据表
AttrBoost.tUserdata = {}


--用法
--[[-- 初始化玩家状态
AttrBoost.InitializePlayerState(1)

-- 检测玩家是否有记录数据
if AttrBoost.HasPlayerData(1) then
    print("玩家有记录数据")
else
    print("玩家没有记录数据")
end

-- 设置增益
AttrBoost.SetBoost(1, "增益", "力量", 10)

-- 再次检测玩家是否有记录数据
if AttrBoost.HasPlayerData(1) then
    print("玩家有记录数据")
else
    print("玩家没有记录数据")
end
]]

--类型
local tBoostType = {
[1] = '实际',
[2] = '额外',
[3] = '基础',
[4] = '基础加成',
[5] = '增益',
[6] = '增益加成',
[7] = '最终加成'
}
local tUnitAttr = {
    ['生命'] = 'hp_cur',
    ['魔法'] = 'mp_cur',
    ['最大生命'] = 'hp_max',
    ['生命恢复'] = 'hp_rec',
    ['最大魔法'] = 'mp_max',
    ['魔法恢复'] = 'mp_rec',
    ['物理攻击'] = 'attack_phy',
    ['法术攻击'] = 'attack_mag',
    ['物理防御'] = 'defense_phy',
    ['法术防御'] = 'defense_mag',
    ['攻击速度'] = 'attack_speed', --百分比
    ['冷却缩减'] = 'cd_reduce', --百分比
    ['命中率'] = 'hit_rate', --百分比
    ['躲避率'] = 'dodge_rate', --百分比
    ['暴击率'] = 'critical_chance', --百分比
    ['暴击伤害'] = 'critical_dmg', --百分比
    ['物理穿透'] = 'pene_phy',
    ['法术穿透'] = 'pene_mag',
    ['物理吸血'] = 'vampire_phy', --百分比
    ['法术吸血'] = 'vampire_mag', --百分比
    ['物理穿透比例'] = 'pene_phy_ratio', --百分比
    ['法术穿透比例'] = 'pene_mag_ratio', --百分比
    ['受伤减免'] = 'dmg_reduction', --百分比
    ['伤害加成'] = 'extra_dmg', --百分比
    ['被治疗加成'] = 'healing_effect', --百分比
    ['移动速度'] = 'ori_speed',
    ['真实视野'] = 'vision_true',
    ['攻击间隔'] = 'attack_interval',
    ['攻击范围'] = 'attack_range',
    ['白天视野'] = 'vision_rng',
    ['夜晚视野'] = 'vision_night',
    ['白天扇形视野半径'] = 'vision_sector_rng',
    ['夜晚扇形视野半径'] = 'vision_sector_night',
    ['白天扇形视野夹角'] = 'vision_sector_angle_day',
    ['夜晚扇形视野夹角'] = 'vision_sector_angle_night',
    ['百分比生命恢复'] = 'hp_rec_percent',
}

local tBoostValues = {
'生命',
'魔法',
'最大生命',
'生命恢复',
'最大魔法',
'魔法恢复',
'物理攻击',
'法术攻击',
'物理防御',
'法术防御',
'攻击速度',
'冷却缩减',
'命中率',
'躲避率',
'暴击率',
'暴击伤害',
'物理穿透',
'法术穿透',
'物理吸血',
'法术吸血',
'物理穿透比例',
'法术穿透比例',
'受伤减免',
'伤害加成',
'被治疗加成',
'移动速度',
'真实视野',
'攻击间隔',
'攻击范围',
'白天视野',
'夜晚视野',
'白天扇形视野半径',
'夜晚扇形视野半径',
'白天扇形视野夹角',
'夜晚扇形视野夹角',
'百分比生命恢复'
}

-- 初始化玩家属性增益状态
function AttrBoost.InitializePlayerState(nPlayerId)
    if not nPlayerId then
        return
    end
    AttrBoost.tUserdata[nPlayerId] = {}
end

--#region 单位增益属性
-- 设置属性增益
function AttrBoost.SetBoost(nPlayerId, sBoostType, sAttributeName, nValue)
    if not nPlayerId or not sBoostType or not sAttributeName or not nValue then
        return
    end
    if not AttrBoost.tUserdata[nPlayerId] then
        AttrBoost.InitializePlayerState(nPlayerId)
    end
    AttrBoost.tUserdata[nPlayerId] = AttrBoost.tUserdata[nPlayerId] or {}
    AttrBoost.tUserdata[nPlayerId][sBoostType] = AttrBoost.tUserdata[nPlayerId][sBoostType] or {}
    AttrBoost.tUserdata[nPlayerId][sBoostType][sAttributeName] = nValue
end

-- 读取并设置所有属性的值
function AttrBoost.SetAllBoosts(nPlayerId,uPy_Unit)
    if not nPlayerId or not uPy_Unit  or not tBoostValues then
        return
    end
    for _, sBoostType in pairs(tBoostType) do
        if not AttrBoost.tUserdata[nPlayerId] then
            AttrBoost.InitializePlayerState(nPlayerId)
        end
        local uLua_unit = y3.unit.get_by_handle(uPy_Unit)
        if uLua_unit then
            for k, value in ipairs(tBoostValues) do
                local nNum = AttrBoost.get_attr(uLua_unit,value,sBoostType) or 0 --增益
                --if nNum ~= 0 then
                    AttrBoost.tUserdata[nPlayerId] = AttrBoost.tUserdata[nPlayerId] or {}
                    AttrBoost.tUserdata[nPlayerId][sBoostType] = AttrBoost.tUserdata[nPlayerId][sBoostType] or {}
                    AttrBoost.tUserdata[nPlayerId][sBoostType][value] = nNum
                --end
            end
        end
    end
end

--所有属性。
function AttrBoost.get_attr(uLua_unit,attr_name, attr_type)
    if attr_type == '实际'
    or attr_type == nil then
        return uLua_unit:get_final_attr(attr_name)
    end
    if attr_type == '额外' then
        return uLua_unit:get_attr_other(attr_name)
    end
    if attr_type == '基础' then
        return uLua_unit:get_attr_base(attr_name)
    end
    if attr_type == '基础加成' then
        return uLua_unit:get_attr_base_ratio(attr_name)
    end
    if attr_type == '增益' then
        return uLua_unit:get_attr_bonus(attr_name)
    end
    if attr_type == '增益加成' then
        return uLua_unit:get_attr_bonus_ratio(attr_name)
    end
    if attr_type == '最终加成'
    or attr_type == '总加成' then
        return uLua_unit:get_attr_all_ratio(attr_name)
    end
    error('未知的属性类型:' .. tostring(attr_type))
end

-- 对属性增益数值进行加法操作
function AttrBoost.IncreaseBoost(nPlayerId, sBoostType, sAttributeName, nAddValue)
    if not nPlayerId or not sBoostType or not sAttributeName or not nAddValue then
        return
    end
    local tPlayerBoosts = clone(AttrBoost.tUserdata[nPlayerId]) or {}
    if tPlayerBoosts == {} then
        AttrBoost.InitializePlayerState(nPlayerId)
        tPlayerBoosts = clone(AttrBoost.tUserdata[nPlayerId])
    end
    tPlayerBoosts[sBoostType] = tPlayerBoosts[sBoostType] or {}
    local boost = tPlayerBoosts[sBoostType][sAttributeName]
    if not boost then
        tPlayerBoosts[sBoostType][sAttributeName] = nAddValue
    else
        tPlayerBoosts[sBoostType][sAttributeName] = boost + nAddValue
    end
end

-- 获取某个玩家的所有类型增益属性数据的表格
function AttrBoost.GetAllBoosts(nPlayerId)
    if not nPlayerId then
        return
    end
    local tPlayerBoosts = AttrBoost.tUserdata[nPlayerId] or {}
    if tPlayerBoosts == {} then
        AttrBoost.InitializePlayerState(nPlayerId)
        tPlayerBoosts = AttrBoost.tUserdata[nPlayerId]
    end
    return tPlayerBoosts
end

-- 获取某个玩家的某个类型增益所有数据的表格
function AttrBoost.GetAPartBoosts(nPlayerId,sBoostType)
    if not nPlayerId then
        return
    end
    local tPlayerBoosts = AttrBoost.tUserdata[nPlayerId] or {}
    if tPlayerBoosts == {} then
        AttrBoost.InitializePlayerState(nPlayerId)
        tPlayerBoosts = AttrBoost.tUserdata[nPlayerId]
    end
    return tPlayerBoosts[sBoostType]
end

-- 获取属性增益数值
function AttrBoost.GetBoost(nPlayerId, sBoostType, sAttributeName)
    if not nPlayerId or not sBoostType or not sAttributeName then
        return
    end
    local tPlayerBoosts = AttrBoost.tUserdata[nPlayerId] or {}
    if tPlayerBoosts == {} then
        AttrBoost.InitializePlayerState(nPlayerId)
        tPlayerBoosts = AttrBoost.tUserdata[nPlayerId]
    end
    return tPlayerBoosts[sBoostType][sAttributeName] or 0
end

-- 检测某个玩家是否有记录数据
function AttrBoost.HasPlayerData(nPlayerId)
    if not nPlayerId then
        return
    end
    return AttrBoost.tUserdata[nPlayerId] ~= nil
end
--#endregion



--#region  单位自定义属性。





--#endregion

return AttrBoost