---@class PubUI
local M = {}

--组队系统
local Lobby_Main_MAIN = y3.local_ui.create('Lobby_Main')
local MAIN = y3.local_ui.create('Lobby_Main.Matching Hall')

-- local MEMBER = y3.local_ui.prefab('组队玩家控件')

local nMatch2 = BOB_Match_Module or 1

-- MEMBER:on_refresh('', function (ui, local_player, instance)
--     if BOB.team_info then
--         ui:set_visible(true)
--     else
--         ui:set_visible(false)
--     end
--     local index = instance:storage_get('index')
--     if index < 5 then
--         ui:set_pos(-75 + 125 * index , 300 )
--     else
--         ui:set_pos(-75 + 125 * (index - 4), 125)
--     end
-- end)

-- MEMBER:on_refresh('队长图标', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         ui:set_visible(false)
--         return
--     end
--     if member.aid == BOB.team_info.captain then
--         ui:set_visible(true)
--     else
--         ui:set_visible(false)
--     end
-- end)

-- MEMBER:on_refresh('控件.图标.Icon', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         return
--     end
--     ui:set_image_url(member.head_icon)
-- end)

-- MEMBER:on_refresh('控件.名字', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         return
--     end
--     ui:set_text(member.name)
-- end)

-- MEMBER:on_refresh('控件.描述', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         ui:set_text('伪人')
--         return
--     end
--     if member.state == '空闲' then
--         ui:set_text('就绪')
--     else
--         ui:set_text(member.state)
--     end
-- end)

-- MEMBER:on_refresh('设为队长', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         return
--     end
--     if BOB:is_captain() and BOB.aid ~= member.aid then
--         ui:set_visible(true)
--     else
--         ui:set_visible(false)
--     end
-- end)

-- MEMBER:on_refresh('踢出', function (ui, local_player, instance)
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         return
--     end
--     if BOB:is_captain() and BOB.aid ~= member.aid then
--         ui:set_visible(true)
--     else
--         ui:set_visible(false)
--     end
-- end)

-- MAIN:bind_prefab('Team interface', MEMBER)

-- MAIN:on_init('player_info.Player_Name', function (ui, local_player, instance)
--     ui:set_text(BOB.name)
-- end)

-- MAIN:on_init('player_info.image_1.Select_head.Player_Icon', function (ui, local_player, instance)
--     ui:set_image_url(BOB.icon)
-- end)

-- MAIN:on_refresh('Team interface', function (ui, local_player, instance)
    -- local nMatch2 = BOB_Match_Module or 1
    -- if BOB:is_in_team() and nMatch2 == 2 then
        -- --超过人数就离开队伍
        -- if not BOB:is_captain() then
            -- if M.is_matching() or M.is_launching() then
                -- return
            -- end
            -- for index = 1, #BOB.team_info.members do
                -- local member = BOB.team_info and BOB.team_info.members[index]
                -- if index >= 3 then
                    -- print(member)
                    -- if not member then
                        -- return
                    -- end
                    -- --BOB:team_kick(member.aid)
                    -- if BOB:is_Eq_MemberId(member.aid) then
                        -- BOB:leave_team()
                        -- y3.eca.call('【Lua】玩家被踢出队伍', local_player)
                    -- end
                -- end
            -- end
        -- end
        -- ui:set_visible(true)
        -- MAIN:refresh_prefab(MEMBER, #BOB.team_info.members)
    -- else
        -- ui:set_visible(false)
    -- end
-- end)

-- MAIN:on_refresh('Team interface.背景.房间号', function (ui, local_player, instance)
    -- if BOB.team_info then
        -- ui:set_text('房间号:' .. BOB.team_info.team_id)
    -- end
-- end)

-- MAIN:on_refresh('Team interface.背景.解散队伍', function (ui, local_player, instance)
    -- if M.is_matching() then
        -- ui:set_button_enable(false)
    -- else
        -- ui:set_button_enable(true)
    -- end
    -- if BOB:is_captain() then
        -- ui:set_visible(true)
    -- else
        -- ui:set_visible(false)
    -- end
-- end)

-- MAIN:on_refresh('Team interface.背景.离开队伍', function (ui, local_player, instance)
    -- if M.is_matching() then
        -- ui:set_button_enable(false)
    -- else
        -- ui:set_button_enable(true)
    -- end
-- end)

-- MAIN:on_refresh('多人游戏', function (ui, local_player, instance)
--     local nMatch2 = BOB_Match_Module or 1
--     if nMatch2 == 2 then
--         if BOB:is_in_team() then
--             ui:set_visible(false)
--         else
--             ui:set_visible(true)
--         end
--     else
--         ui:set_visible(false)
--     end
-- end)

-- MAIN:on_refresh('多人游戏.创建队伍', function (ui, local_player, instance)
--     ui:set_visible(true)
--     if BOB:is_valid() and not M.is_matching() then
--         ui:set_button_enable(true)
--     else
--         ui:set_button_enable(false)
--     end
-- end)

-- MAIN:on_refresh('多人游戏.加入队伍', function (ui, local_player, instance)
--     ui:set_visible(true)
--     if BOB:is_valid() and not M.is_matching() then
--         ui:set_button_enable(true)
--     else
--         ui:set_button_enable(false)
--     end
-- end)

-- ---@type UI?
-- local team_id_ui = nil
-- MAIN:on_init('多人游戏.输入框', function (ui, local_player, instance)
--     team_id_ui = ui
-- end)

-- --以下是界面刷新事件
-- MAIN:on_event('多人游戏.创建队伍', '左键-点击', function (ui, local_player, instance)
--     if M.is_matching() or M.is_launching() then
--         return
--     end
--     ui:set_button_enable(false)
--     BOB:create_team(function ()
--         ui:set_button_enable(true)
--     end)
-- end)

-- MAIN:on_event('多人游戏.加入队伍', '左键-点击', function (ui, local_player, instance)
--     if M.is_matching() or M.is_launching() then
--         return
--     end
--     ui:set_button_enable(false)
--     if not team_id_ui then
--         y3.ctimer.wait(0.5, function ()
--             ui:set_button_enable(true)
--         end)
--         return
--     end
--     local text = team_id_ui:get_input_field_content()
--     local team_id = math.tointeger(text)
--     if not team_id then
--         y3.ctimer.wait(0.5, function ()
--             ui:set_button_enable(true)
--         end)
--         return
--     end
--     BOB:join_team(team_id, function ()
--         ui:set_button_enable(true)
--     end)
-- end)

-- MAIN:on_event('Team interface.背景.解散队伍', '左键-点击', function (ui, local_player, instance)
    -- if M.is_matching() or M.is_launching() then
        -- return
    -- end
    -- BOB:dismiss_team()
-- end)

-- MAIN:on_event('Team interface.背景.离开队伍', '左键-点击', function (ui, local_player, instance)
    -- if M.is_matching() or M.is_launching() then
        -- return
    -- end
    -- BOB:leave_team()
-- end)

MAIN:on_event('Match Game.Match_Start', '左键-点击', function (ui, local_player, instance)
    local nMatch2 = BOB_Match_Module or 1
    if M.is_launching() then
        return
    end
    if nMatch2 == 2 then
        if BOB:is_in_team() then
            if BOB:is_captain() then
                --当前所在的队伍信息
                local nMemberNum = #BOB.team_info.members
                if nMemberNum > 2 then
                    local ui2 = y3.ui.get_ui(local_player,'Lobby_Main.Matching Hall.Match Game.Matching_Tips')
                    if ui2 then
                        y3.ui.set_visible(ui2,true)
                        y3.timer.wait(3, function ()
                            y3.ui.set_visible(ui2,false)
                        end) 
                    end
                end
            end
        end
    end
    if M.is_matching() then
        ui:set_button_enable(false)
        M.cancel_match(function ()
            ui:set_button_enable(true)
        end)
    else
        ui:set_button_enable(false)
        M.start_match(1002, nil, function ()
            ui:set_button_enable(true)
        end)
    end
end)

--匹配中禁止点击的界面
Lobby_Main_MAIN:on_refresh('Select_Game_Mode.image_21', function (ui, local_player, instance)
    if M.is_matching() then
        ui:set_visible(true)
    else
        ui:set_visible(false)
    end
end)

Lobby_Main_MAIN:on_event('Select_Game_Mode.Game_ModeSelect_1', '左键-点击', function (ui, local_player, instance)
    if M.is_matching() then

    else
        if nMatch2 == 1 then
            if M.is_launching() then
                return
            end
            if BOB:is_in_team() then
                if BOB:is_captain() then
                    BOB:dismiss_team()
                else
                    BOB:leave_team()
                end
            end
        end
    end
end)

MAIN:on_refresh('Match Game.Match_Start', function (ui, local_player, instance)
    if BOB.state ~= 'connected' then
        ui:set_button_enable(false)
    end
    if M.is_launching() then
        ui:set_button_enable(false)
        return
    end
    if BOB:is_in_team() and not BOB:is_captain() then
        ui:set_button_enable(false)
    else
        ui:set_button_enable(true)
    end
end)

MAIN:on_refresh('Match Game.Match_Start.text', function (ui, local_player, instance)
    if BOB.state == 'connecting' then
        ui:set_text('connecting')
    elseif BOB.state == 'disconnect' then
        ui:set_text('disconnect')
    elseif M.is_matching() then
        ui:set_text('cancel')
    elseif M.is_launching() then
        ui:set_text('launching')
    else
        ui:set_text('Start matching')
    end
end)

MAIN:on_refresh('Match Game.Matching', function (ui, local_player, instance)
    if M.is_matching() then
        ui:set_visible(true)
    else
        ui:set_visible(false)
    end
end)

-- MEMBER:on_event('设为队长', '左键-点击', function (ui, local_player, instance)
--     if M.is_matching() or M.is_launching() then
--         return
--     end
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     if not member then
--         return
--     end
--     BOB:change_captain(member.aid)
-- end)

-- MEMBER:on_event('踢出', '左键-点击', function (ui, local_player, instance)
--     if M.is_matching() or M.is_launching() then
--         return
--     end
--     local index = instance:storage_get('index')
--     local member = BOB.team_info and BOB.team_info.members[index]
--     print(member)
--     if not member then
--         return
--     end
--     BOB:team_kick(member.aid)
-- end)

function M.init()
    BOB:event_on('准备就绪', function (trg)
        MAIN:refresh('*')
    end)

    -- BOB:event_on('加入队伍', function (trg)
        -- MAIN:refresh('Match Game.Match_Start')
        -- -- MAIN:refresh('Team interface')
        -- MAIN:refresh('多人游戏')
    -- end)

    -- BOB:event_on('队伍变化', function (trg)
        -- MAIN:refresh('Match Game.Match_Start')
        -- MAIN:refresh('Team interface')
    -- end)

    ---@type LocalTimer?
    local mathing_timer

    BOB:event_on('匹配状态变化', function (trg, state)
        local nMatch2 = BOB_Match_Module or 1
        Lobby_Main_MAIN:refresh('Select_Game_Mode.image_21')
        MAIN:refresh('Match Game.Match_Start')
        MAIN:refresh('Match Game.Matching')
        -- MAIN:refresh('Team interface')
        -- MAIN:refresh('多人游戏')
        if mathing_timer then
            mathing_timer:remove()
        end
        if state == true then
            y3.player.with_local(function (local_player)
                local ui2 = y3.ui.get_ui(local_player, 'Lobby_Main.Matching Hall.Match Game.Matching.background.estimated time')
                if nMatch2 == 2 then
                    ui2:set_text("Estimated : ".."01:"..tostring(math.random(40, 59)))
                else
                    ui2:set_text("Estimated : ".."00:"..tostring(math.random(40, 59)))
                end
                local ui = y3.ui.get_ui(local_player, 'Lobby_Main.Matching Hall.Match Game.Matching.background.time')
                ui:set_text(string.format('%02d:%02d', 0, 0))
                mathing_timer = y3.ltimer.loop(1, function (timer, count)
                    if ui then
                        ui:set_text(string.format('%02d:%02d', count // 60, count % 60))
                    end
                end)
            end)
        end
    end)

    BOB:event_on('启动状态变化', function (trg, launching)
        MAIN:refresh('Match Game.Match_Start')
        MAIN:refresh('Match Game.Matching')
        -- MAIN:refresh('Team interface')
        -- MAIN:refresh('多人游戏')
    end)

    --以下是系统消息
    -- BOB:event_on('收到消息', function (trg, data)
    --     y3.player.with_local(function (local_player)
    --         if data.chat and data.chat.sender.aid == BOB.aid then
    --             return
    --         end
    --         local ui = y3.ui.get_ui(local_player, 'Lobby_Main.Matching Hall.聊天.scroll_view_chat')
    --         local text = y3.ui_prefab.create(local_player, '聊天文本', ui):get_child()
    --         if text then
    --             text:set_text(BOB:format_message(data))
    --         end
    --         print(ui:get_slider_current_value())
    --         --ui:set_slider_value(1)
    --     end)
    -- end)

    -- BOB:event_on('加入队伍', function (trg)
    --     if BOB:is_captain() then
    --         BOB:display_message('你创建了队伍')
    --     else
    --         BOB:get_player_info(BOB.team_info.captain, function (result)
    --             if result then
    --                 BOB:display_message(string.format('你加入了[%s]的队伍', result.name))
    --             end
    --         end)
    --     end
    -- end)

    -- BOB:event_on('离开队伍', function (trg)
    --     MAIN:refresh('Match Game.Match_Start')
    --     -- MAIN:refresh('Team interface')
    --     -- MAIN:refresh('多人游戏')
    -- end)

    -- BOB:event_on('离开队伍', function (trg, reason)
    --     if reason == '离开' then
    --         BOB:display_message('你退出了队伍')
    --     elseif reason == '踢出' then
    --         BOB:display_message('你被踢出了队伍')
    --     elseif reason == '解散' then
    --         BOB:display_message('队伍已被解散')
    --     end
    -- end)

    -- BOB:event_on('有人加入队伍', function (trg, data)
    --     BOB:display_message(string.format('[%s]加入了队伍', data.name))
    -- end)

    -- BOB:event_on('有人离开队伍', function (trg, data)
    --     BOB:display_message(string.format('[%s]离开了队伍', data.name))
    -- end)

    -- BOB:event_on('在线状态变化', function (trg, state)
    --     MAIN:refresh('Match Game.Match_Start')
    -- end)

    MAIN:refresh('*')
end

---@param state boolean
function M.set_welfare_mode(state)
    M.welfare_mode = state
    log.debug('福利模式已设置为', state)
end

function M.is_welfare_valid()
    if not M.welfare_mode then
        return false
    end
    if BOB:is_in_team() and #BOB.team_info.members > 1 then
        return false
    end
    return true
end

---@param game_mode integer
---@param score? integer
---@param done? fun()
function M.start_match(game_mode, score, done)
    if M.is_welfare_valid() then
        log.info('【福利模式】请求匹配')
        y3.ctimer.wait(0.3, function ()
            if done then
                done()
            end
            log.info('【福利模式】开始匹配')
            M.welfare_matching = y3.ctimer.wait(math.random_banned(6, 12), function ()
                M.welfare_matching = nil
                log.info('【福利模式】正在启动')
                BOB:event_notify('匹配状态变化', false)
                M.welfare_launching = y3.ctimer.wait(math.random_banned(1, 3), function (timer, count, local_player)
                    M.welfare_launching = nil
                    log.info('【福利模式】已启动')
                    local_player.handle:request_create_private_dungeon(y3.game.get_level(), 1002, 1)
                end)
                BOB:event_notify('启动状态变化', true)
            end)
            BOB:event_notify('匹配状态变化', true)
        end)
    else
        BOB:start_match(game_mode, score, done)
    end
end

---@param done? fun()
function M.cancel_match(done)
    if M.welfare_matching then
        log.info('【福利模式】请求取消匹配')
        y3.ctimer.wait(0.3, function ()
            if done then
                done()
            end
            if not M.welfare_matching then
                log.info('【福利模式】取消匹配失败，已经进入启动流程')
                return
            end
            M.welfare_matching:remove()
            M.welfare_matching = nil
            BOB:event_notify('匹配状态变化', false)
        end)
    else
        BOB:cancel_match(done)
    end
end

function M.is_launching()
    return M.welfare_launching ~= nil
        or BOB:is_launching()
end

function M.is_matching()
    return M.welfare_matching ~= nil
        or BOB:is_matching()
end

return M
