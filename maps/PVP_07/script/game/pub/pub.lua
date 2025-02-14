local err_msg = {
    [1] = 'baka~baka~',
    [110] = '登陆失败',
    [113] = '账号不存在',
    [625] = '房间已解散',
    [626] = '房间已满',
    [1005] = '玩家不存在',
    [1071] = '操作太频繁',
    [1300] = '聊天太频繁',
    [1401] = '已在房间中',
    [1404] = '队伍不存在',
    [1405] = '队伍已满',
    [1406] = '只能由队长操作',
    [1407] = '队伍正在匹配中',
    [1408] = '正在匹配中',
    [1409] = '有玩家正在游戏中',
    [1410] = '正在房间中',
}

local function get_prod_ip()
    local old = '47.97.23.172'
    local new = '223.252.200.35'
    local time = y3.game.get_current_server_time().timestamp
    local target_time_stamp = 1728504000 -- 北京时间2024年10月10日4点
    if time >= target_time_stamp then
        return new
    else
        return old
    end
end

local function create_bob()
    if BOB then
        Delete(BOB)
    end
    BOB = New 'Bob' ()
    BOB.score = 10000
    if y3.game.is_debug_mode(true) then
        if os.getenv then
            BOB.name = os.getenv('USERNAME')
            BOB.aid = y3.hash(BOB.name)
        end
        BOB.ip = '42.186.213.132'
        BOB.port = 8092
        BOB.token = '79ae3ecbcabdce7c446ac2286d4ce7a89dea6908833f55e1a17124545656b8b43c76f7af7375f491603cff545bb5a0f2' --prod
        --BOB.token = 'a1698b48c455d2435420ae18488a264229e0c994b3b964f1101a1f4057aa7a7e499eb2001efdec8a6b22fd8c93c6c56d'  --pre&qa
        BOB.map_id = 'NjcyZTI4NTA4YjA5YWMyY2M5N2ZmZWRk'
    else
        local mod = GameAPI.get_dungeon_info and GameAPI.get_dungeon_info().env
        mod = tostring(mod)
        BOB.ip = get_prod_ip() --prod
        --BOB.ip = '42.186.215.253'  --qa
        --BOB.ip = '121.41.41.22' --pre
        BOB.port = 8092
        if mod == 'qa' then
            BOB.ip = '42.186.215.253'
        elseif mod == 'pre' then
            BOB.ip = '42.186.213.132'
        elseif mod == 'prod' then
            BOB.ip = get_prod_ip()
        end
    end
    log.debug('【BOB】手动设置ip:', BOB.ip)
    log.debug('【BOB】手动设置port:', BOB.port)
    BOB.game_play_id = '196764'
    log.debug('【BOB】手动设置game_play_id:', BOB.game_play_id)

    function GetTimeAsNumbers()
        local timeStr = os.date("%H:%M")
        local hour, minute = timeStr:match("(%d+):(%d+)")
        return tonumber(hour), tonumber(minute)
    end
    local nHour, nMinute = GetTimeAsNumbers()
    local tTable = {4,1,3,5,2,4,1,3,5,2,1,4,2,5,3,1,4,2,5,3,2,5,1,3,4,2,5,1,3,4,5,3,2,4,1,5,3,2,4,1,3,1,5,2,4,3,1,5,2,4,1,4,2,5,3,1,4,2,5,3,2,5,1,3,4,2,5,1,3,4,2,1}
    local nRandom = nHour * 3 + math.ceil(nMinute / 20)
    if nRandom < 1 then
        nRandom = 1
    end
    local tPVP_Map_Id = {
        [1] = '110820841736516761627997407224785988583', --PVP地图1
        [2] = '329014476848767048873080574908054904993', --PVP_04
        [3] = '225071830061101721282187863364520802439', --PVP_04
        [4] = '309196634101328253120000367900295394556', --PVP_04
        [5] = '307813389453980271721215548408096925117'  --PVP_04
    }
    BOB.level_id = tPVP_Map_Id[tTable[nRandom]] --'265178097636107606569052244875827922690' --主关卡
    log.debug('【BOB】手动设置level_id:', BOB.level_id)

    BOB:set_error_handler(function (msg, errid)
        y3.player.with_local(function (local_player)
            if err_msg[errid] then
                msg = err_msg[errid]
            else
                msg = '未知错误,id:'..errid
            end
            y3.eca.call('玩家-提示文本', local_player, msg)
        end)
    end)
end

local function create_bob_in_lobby()
    create_bob()
    BOB:event_on('准备就绪', function (trg)
        UI = include 'game.pub.ui'
        UI.init()
        if BeHappy then
            UI.set_welfare_mode(true)
        end
    end)

    BOB:event_on('客户端需要更新', function (trg)
        y3.eca.call('系统-引擎更新')
    end)

    BOB:event_on('在线状态变化', function (trg, state)
        if state == 'disconnect' then
            y3.ctimer.wait(1, function ()
                create_bob_in_lobby()
            end)
        end
    end)

    BOB:set_in_game(false)
    BOB:start()
end

local function create_bob_in_game()
    create_bob()

    BOB:set_in_game(true)
    BOB:start()
end

y3.game:event('玩家-加入游戏', function (trg, data)
    y3.player.with_local(function (local_player)
        if data.player == local_player then
            if y3.game.get_current_game_mode() == 1002 then
                create_bob_in_game()
            else
                create_bob_in_lobby()
            end
            local ui = y3.ui.get_ui(local_player, 'Lobby_Main.Matching Hall.Match Game.Match_Start')
            if ui then
                ui:set_button_enable(false)
            end
        end
    end)
end)

y3.game:event('玩家-发送消息', function (trg, data)
    if not BOB or not BOB:is_in_team() then
        return
    end
    y3.player.with_local(function (local_player)
        if data.player == local_player then
            BOB:send_chat(data.str1)
        end
    end)
end)

---创建匹配大厅
CreateBobInLobby = create_bob_in_lobby

---设置玩家的分数
---@param score integer
SetScore = function (score)
    BOB:set_score(score)
end

-- 调用后会链接VSCode
function ConnectVSCode()
    y3.develop.helper.init(59846)
    y3.config.code.enable_local = true
    y3.config.code.enable_remote = true
end

---渲染战斗画面
function 启用场景()
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.visual_pyexec("import MRender;MRender.SetOnlyDrawUIs(False)")
end

---关闭战斗画面，只渲染UI
function 关闭场景()
    ---@diagnostic disable-next-line: undefined-field
    GameAPI.visual_pyexec("import MRender;MRender.SetOnlyDrawUIs(True)")
end

---重置游戏，需要在本地玩家环境中调用
function 重置游戏()
    y3.player.with_local(function (local_player)
        xpcall(function ()
            local_player.handle:request_create_private_dungeon(y3.game.get_level(), 1001, 1)
        end, log.warn)
    end)
end

---设置本地玩家下次单人匹配为福利局（假匹配，自己切换到单人副本）
function 福利局()
    BeHappy = true
    if UI then
        UI.set_welfare_mode(true)
    end
end
