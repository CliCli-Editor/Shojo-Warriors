---@diagnostic disable-next-line: deprecated
local local_player = y3.player.get_local()

---@enum(key) Bob.PlayerState
local player_state = {
    ['空闲'] = 1,
    ['匹配中'] = 2,
    ['游戏中'] = 3,
}

---@enum(key) Bob.TeamState
local team_state = {
    ['空闲'] = 1,
    ['匹配中'] = 2,
}

---@enum(key) Bob.LeaveReason
local leave_reason = {
    ['离开'] = 1,
    ['踢出'] = 2,
    ['解散'] = 3,
}

---@alias Bob.State
---| 'none'
---| 'connecting'
---| 'connected'
---| 'disconnect'
---| 'login'

---@class Bob: CustomEvent, GCHost
---@field event_on fun(self: Bob, event: '准备就绪', callback: fun(trg: Trigger)): Trigger
---@field event_on fun(self: Bob, event: '在线状态变化', callback: fun(trg: Trigger, state: Bob.State)): Trigger
---@field event_on fun(self: Bob, event: '匹配状态变化', callback: fun(trg: Trigger, state: boolean)): Trigger
---@field event_on fun(self: Bob, event: '启动状态变化', callback: fun(trg: Trigger, state: boolean)): Trigger
---@field event_on fun(self: Bob, event: '队伍变化', callback: fun(trg: Trigger, data: Bob.TeamInfo)): Trigger
---@field event_on fun(self: Bob, event: '加入队伍', callback: fun(trg: Trigger)): Trigger
---@field event_on fun(self: Bob, event: '离开队伍', callback: fun(trg: Trigger, reason: Bob.LeaveReason, last_team_info: Bob.TeamInfo)): Trigger
---@field event_on fun(self: Bob, event: '有人加入队伍', callback: fun(trg: Trigger, data: Bob.PlayerInfo)): Trigger
---@field event_on fun(self: Bob, event: '有人离开队伍', callback: fun(trg: Trigger, data: Bob.PlayerInfo)): Trigger
---@field event_on fun(self: Bob, event: '客户端需要更新', callback: fun(trg: Trigger)): Trigger
---@overload fun():Bob
local M = Class 'Bob'

Extends('Bob', 'CustomEvent')
Extends('Bob', 'GCHost')

---@type Bob.State
M.state = 'none'

---@type string
M.ip = ''
---@type integer
M.port = 0
---@type string
M.token = nil
---@type string
M.map_id = ''
---@type string
M.game_play_id = ''
---@type string
M.level_id = ''

--我的分数
M.score = 0

function M:__init()
    log.debug('【BOB】正在初始化bob')
    --我的平台唯一id
    self.aid = y3.steam.get_player_aid()
    log.debug('【BOB】aid:', self.aid)
    --我的昵称
    self.name = y3.steam.get_nickname()
    log.debug('【BOB】name:', self.name)
    --我的头像
    self.icon = y3.steam.get_avatar_url()
    log.debug('【BOB】icon:', self.icon)
    --我的商城token
    pcall(function ()
        log.debug('【BOB】token:', self.token)
        log.debug('【BOB】map_id:', self.map_id)
        log.debug('【BOB】game_play_id:', self.game_play_id)
        log.debug('【BOB】level_id:', self.level_id)
    end)
    --缓存请求回包处理
    ---@private
    self.request_handlers = {}
    --已知的玩家信息
    ---@private
    ---@type table<integer, Bob.PlayerInfo>
    self.player_infos = {}
end

function M:__del()
end

---@private
M._in_game = false

---@param in_game boolean
function M:set_in_game(in_game)
    log.debug('【BOB】设置游戏状态：', in_game)
    self._in_game = in_game
end

function M:start()
    if not IsValid(self) then
        return
    end
    log.debug('【BOB】启动匹配系统')
    if not IsValid(self) then
        return
    end
    self:register_methods()

    if y3.steam.get_player_state() > 1 then
        self:login()
    end
end

---@private
function M:login()
    log.debug('【BOB】开始登录')
    self:get_team_info(self.aid, function (result)
        self.team_info = result
        self._matching_state = y3.steam.get_player_state() == 4
        log.debug('【BOB】发起事件：准备就绪')
        self:event_notify('准备就绪')
    end)
end

---@return boolean
function M:is_valid()
    return true
end

---@private
---@type fun(msg: string, errid: integer)?
M.error_handler = log.warn

---@param handler fun(msg: string, errid: integer)
function M:set_error_handler(handler)
    self.error_handler = handler
end

--创建队伍
---@param done? fun(suc: boolean, error_code?: integer) # 创建完成后调用
function M:create_team(done)
    log.debug('【BOB】尝试创建队伍')
    y3.steam.request_create_team(8, function (suc, error_code)
        log.debug('【BOB】创建队伍回包', suc, error_code)
        if not suc then
            self.error_handler('创建队伍失败', error_code)
        end
        if done then
            done(suc, error_code)
        end
    end)
end

--离开队伍
---@param done? fun(suc: boolean, error_code?: integer) # 离开完成后调用
function M:leave_team(done)
    log.debug('【BOB】尝试离开队伍')
    local last_team = self.team_info
    y3.steam.request_quit_team(function (success, error_code)
        log.debug('【BOB】离开队伍回包', success, error_code)
        if not success then
            self.error_handler('离开队伍失败', error_code)
        end
        if success then
            self.team_info = nil
            self:event_notify('离开队伍', '离开', last_team)
        end
        if done then
            done(success, error_code)
        end
    end)
end

--加入队伍
---@param team_id integer
---@param done? fun(suc: boolean, error_code: integer) # 加入完成后调用
function M:join_team(team_id, done)
    log.debug('【BOB】尝试加入队伍', team_id)
    y3.steam.request_join_team(team_id, function (success, error_code)
        log.debug('【BOB】加入队伍回包', success, error_code)
        if not success then
            self.error_handler('加入队伍失败', error_code)
        end
        if done then
            done(success, error_code)
        end
    end)
end

---解散队伍，steam版接口不能解散队伍，改为退出队伍
---@deprecated
---@param done? fun(suc: boolean, error_code: integer) # 解散完成后调用
function M:dismiss_team(done)
    log.warn('【BOB】steam版本不能解散队伍，改为退出队伍')
    self:leave_team(done)
end

--踢出队伍
---@param kick_aid integer
function M:team_kick(kick_aid)
    log.debug('【BOB】尝试踢出队伍', kick_aid)
    y3.steam.request_kick_member(kick_aid, function (success, error_code)
        log.debug('【BOB】踢出队伍回包', success, error_code)
        if not success then
            self.error_handler('踢出队伍失败', error_code)
        end
    end)
end

--转移队长
---@param new_leader_aid integer
---@param done? fun(suc: boolean, error_code: integer) # 转移完成后调用
function M:change_captain(new_leader_aid, done)
    log.debug('【BOB】尝试转移队长', new_leader_aid)
    y3.steam.request_transfer_captain(new_leader_aid, function (success, error_code)
        log.debug('【BOB】转移队长回包', success, error_code)
        if not success then
            self.error_handler('转移队长失败', error_code)
        end
        if done then
            done(success, error_code)
        end
    end)
end

---@class Bob.PlayerInfo
---@field aid integer
---@field head_icon string
---@field name string
---@field team_id integer
---@field score integer
---@field state Bob.PlayerState

---@class Bob.TeamInfo
---@field member_limit integer
---@field team_id integer
---@field team_state Bob.TeamState
---@field captain integer
---@field members Bob.PlayerInfo[]
---@field version integer

---@param member_info Steam.MemberInfo
---@return Bob.PlayerInfo
function M:convert_player_info(member_info)
    ---@type Bob.PlayerInfo
    local player_info = {
        aid = member_info.account_id,
        head_icon = member_info.head_icon,
        name = member_info.nickname,
        team_id = member_info.team_id,
        score = 0,
        state = '空闲',
    }
    if member_info.state == 1
    or member_info.state == 2
    or member_info.state == 3 then
        player_info.state = '空闲'
    elseif member_info.state ==4 then
        player_info.state = '匹配中'
    elseif member_info.state == 5 then
        player_info.state = '游戏中'
    end
    self.player_infos[player_info.aid] = player_info
    return player_info
end

---@private
---@param member_infos Steam.MemberInfo[]
---@return Bob.TeamInfo
function M:convert_team_info(member_infos)
    local captain = 0
    local members = y3.util.map(member_infos, function (member_info)
        if member_info.is_captain then
            captain = member_info.account_id
        end
        return self:convert_player_info(member_info)
    end)
    local first_member = members[1]
    ---@type Bob.TeamInfo
    local team_info = {
        member_limit = 8,
        team_id = first_member.team_id,
        team_state = first_member.state == '匹配中' and '匹配中' or '空闲',
        captain = captain,
        members = members,
        version = 0,
    }
    return team_info
end

--获取队伍信息
---@param aid integer
---@param response fun(result?: Bob.TeamInfo)
function M:get_team_info(aid, response)
    log.debug('【BOB】请求队伍信息', aid)
    y3.steam.request_team_info(aid, function (result, error_code)
        if not result then
            if error_code == 0 then
                log.debug('【BOB】玩家没有队伍')
            else
                log.debug('【BOB】获取队伍信息失败：', error_code)
            end
            response(nil)
            return
        end
        local team_info = self:convert_team_info(result)
        log.debug('【BOB】获取队伍信息成功：', y3.inspect(team_info))
        response(team_info)
    end)
end

--获取玩家信息
---@param aid integer
---@param done fun(result: Bob.PlayerInfo?)
function M:get_player_info(aid, done)
    log.debug('【BOB】请求玩家信息', aid)
    if self.player_infos[aid] then
        log.debug('【BOB】从缓存中掏出玩家信息', y3.inspect(self.player_infos[aid]))
        done(self.player_infos[aid])
        return
    end
    log.debug('【BOB】将通过队伍信息获取玩家信息', aid)
    self:get_team_info(aid, function (team_info)
        log.debug('【BOB】获取玩家信息成功：', y3.inspect(self.player_infos[aid]))
        done(self.player_infos[aid])
    end)
end

--是否可以匹配
---@return boolean
---@return ('不是队长' | '正在匹配' | '失去连接' | '有人在游戏中' | '有人在匹配' | '正在启动')?
function M:can_match()
    if self.team_info and not self:is_captain() then
        return false, '不是队长'
    end
    if self:is_matching() then
        return false, '正在匹配'
    end
    if self:is_launching() then
        return false, '正在启动'
    end
    if not self:is_valid() then
        return false, '失去连接'
    end
    if self.team_info then
        for _, member in ipairs(self.team_info.members) do
            if member.state == '游戏中' then
                return false, '有人在游戏中'
            end
            if member.state == '匹配' then
                return false, '有人在匹配'
            end
        end
    end
    return true
end

---@private
M._matching_state = false

---@private
---@param matching_state boolean
function M:update_matching_state(matching_state)
    if matching_state == self:is_matching() then
        return
    end
    self._matching_state = matching_state
    log.debug('【BOB】匹配状态变化：', matching_state)
    self:event_notify('匹配状态变化', matching_state)
end

--是否正在匹配
function M:is_matching()
    return self._matching_state
end

---@private
M._is_launching = false

---是否正在启动游戏
function M:is_launching()
    return self._is_launching
end

---开始匹配
---目标关卡可以通过设置 `bob.level_id` 来配置
---@param game_mode integer # 匹配成功后进入的游戏模式
---@param score integer? # 匹配分数，默认使用平均分
---@param done? fun(suc: boolean, error_code?: integer)
function M:start_match(game_mode, score, done)
    log.debug('【BOB】尝试开始匹配', game_mode, score)
    if self.team_info then
        log.debug('【BOB】在队伍中')
        if not score then
            score = 0
            for _, player_info in ipairs(self.team_info.members) do
                score = score + player_info.score
            end
            score = score // #self.team_info.members
            log.debug('【BOB】没有设置分数，使用队伍平均分', score)
        end
    else
        log.debug('【BOB】不在队伍中')
        if not score then
            score = self.score
            log.debug('【BOB】没有设置分数，使用自己的分数', score)
        end
    end
    log.debug('【BOB】开始请求匹配')
    y3.steam.request_start_match(score or self.score, self.level_id, game_mode, function (success, error_code)
        if not success then
            log.debug('【BOB】请求匹配失败：', error_code)
            if done then done(success, error_code) end
            return
        end
        log.debug('【BOB】请求匹配成功')
        if done then done(success, error_code) end
    end)
end

--取消匹配
---@param done? fun(suc: boolean, error_code?: integer) # 取消完成后调用
function M:cancel_match(done)
    log.debug('【BOB】尝试取消匹配')
    y3.steam.request_cancel_match(function (success, error_code)
        log.debug('【BOB】取消匹配回包', success, error_code)
        if not success then
            self.error_handler('取消匹配失败', error_code)
        end
        if done then
            done(success, error_code)
        end
    end)
end

--发送聊天消息
---@deprecated
---@param message string
function M:send_chat(message)
    log.warn('请改用相关的UI组件发送聊天消息：', message)
end

--格式化聊天消息
---@deprecated
---@param chat_data any
---@return string
function M:format_message(chat_data)
    return ''
end

--发送系统消息
---@deprecated
---@param message string
function M:display_message(message)
end

--我是否在队伍中
function M:is_in_team()
    return self.team_info ~= nil
end

--我是否是队长
function M:is_captain()
    if not self.team_info then
        return false
    end
    return self.team_info.captain == self.aid
end

--修改自己的分数
---@param score integer
function M:set_score(score)
    log.debug('【BOB】设置分数', score)
    self.score = score
end

---@private
function M:notify_update_team_info(data)
    self:get_team_info(self.aid, function (new_team_info)
        local old_team_info = self.team_info
        self.team_info = new_team_info
        log.debug('【BOB】触发队伍变化', y3.inspect(new_team_info))
        if not new_team_info then
            return
        end
        self:event_notify('队伍变化', new_team_info)

        if not old_team_info or old_team_info.team_id ~= new_team_info.team_id then
            log.debug('【BOB】触发加入队伍')
            self:event_notify('加入队伍')
            return
        end

        local old_members = {}
        local new_members = {}
        if old_team_info then
            for _, member in ipairs(old_team_info.members) do
                old_members[member.aid] = true
            end
        end
        for _, member in ipairs(new_team_info.members) do
            new_members[member.aid] = true
        end

        if old_team_info then
            for _, member in ipairs(old_team_info.members) do
                if not new_members[member.aid] and member.aid ~= self.aid then
                    log.debug('【BOB】触发有人离开队伍', y3.inspect(member))
                    self:event_notify('有人离开队伍', member)
                end
            end
        end

        for _, member in ipairs(new_team_info.members) do
            if not old_members[member.aid] and member.aid ~= self.aid then
                log.debug('【BOB】触发有人加入队伍', y3.inspect(member))
                self:event_notify('有人加入队伍', member)
            end
        end
    end)
end

---@private
function M:notify_ret(method_name, errid, arg, ret)
    local handler = self.request_handlers[method_name]
    if handler then
        handler.callback(errid, ret, arg)
    end
end

---@private
function M:register_methods()
    y3.game:event('steam-开始匹配', function (trg, data)
        self:update_matching_state(true)
    end)

    y3.game:event('steam-取消匹配', function (trg, data)
        self:update_matching_state(false)
    end)

    y3.game:event('steam-进入大厅', function (trg, data)
        self:login()
    end)

    y3.game:event('steam-本地玩家队伍变化', function (trg, data)
        self:notify_update_team_info()
    end)

    ---@diagnostic disable-next-line: param-type-mismatch
    y3.game:event('ET_MALL_NOTIFY_TEAM_KICK_OFF', function (trg, data)
        local last_team = self.team_info
        self.team_info = nil
        self:event_notify('离开队伍', '踢出', last_team)
    end)
end
