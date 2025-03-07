require 'y3'
require 'game.service.define'
local const = require "game.network.protocol"
local fsm = require "game.network.fsm"

---@class Client
---@field public ClientPush_ClientRegister fun(self: Client, aid: integer):boolean, string
---comment '注册客户端，注册成功后可收到服务器推送消息，游戏初始化时调用'
---param aid 玩家id
---return boolean, string
---@field public ClientPush_ClientUnregister fun(self: Client, aid: integer):boolean, string
---comment 注销客户端'
---param aid 玩家id
---return boolean, string
---@field public Team_UpdatePlayerInfo fun(self: Client, player_info: PlayerInfo):boolean, string
---comment '上报/更新玩家信息，一切业务依赖玩家信息，游戏初始化时上报'
---param player_info 玩家信息 
---return boolean, string
---@field public Team_Login fun(self: Client, player_info: PlayerInfo): boolean, string
---comment '登录'
---param player_info 玩家信息 
---return boolean, string
---@field public Team_DelPlayerInfo fun(self: Client, aid: integer):boolean, string
---comment '移除玩家信息，请在退出游戏前调用'
---param aid 玩家id
---return boolean, string
----------------队伍相关----------------
---@field public Team_CreateTeam fun(self: Client, aid: integer):boolean, string
---comment '请求创建队伍，队长为aid'
---param aid 玩家id
---return boolean, string
---@field public Team_LeaveTeam fun(self: Client, aid: integer):boolean, string
---comment '请求离开队伍'
---param aid 玩家id
---return boolean, string
---@field public Team_JoinTeam fun(self: Client, aid: integer, team_id: integer):boolean, string
---comment '请求加入队伍'
---param aid 玩家id
---param team_id 队伍id
---return boolean, string
---@field public Team_TeamKick fun(self: Client, aid: integer, kicki_aid: integer):boolean, string
---comment '请求踢出队伍'
---param aid 玩家id
---param kicki_aid 踢出的目标玩家id
---return boolean, string
---@field public Team_ChangeTeamLeader fun(self: Client, aid: integer, new_leader_aid: integer):boolean, string
---comment '请求转移队长'
---param aid 玩家id
---param new_leader_aid 转移的队长玩家id
---return boolean, string
---@field public Team_GetTeamInfoByAid fun(self: Client, aid: integer):boolean, string
---comment '请求玩家所在队伍信息'
---param aid 玩家id
---return boolean, string
---@field public Team_DismissTeam fun(self: Client, aid: integer):boolean, string
---comment '请求解散队伍'
---param aid 玩家id
---return boolean, string
----------------队伍相关----------------
----------------匹配相关----------------
---@field public Match_startMatch fun(self: Client, unit_id: integer, score: integer, is_team: boolean, match_info: MatchInfo):boolean, string
---comment '请求开始匹配'
---param unit_id 匹配单元id，单人为玩家id，多人为队伍id
---param score 分数
---param is_team 是否为队伍
---param match_info 匹配信息
---return boolean, string
---@field public Match_cancelMatch fun(self: Client, unit_id: integer):boolean, string
---comment '请求离开匹配'
---param unit_id 匹配单元id，单人为玩家id，多人为队伍id
---return boolean, string
----------------匹配相关----------------
----------------聊天相关----------------
---@field public Chat_SendChatMsg fun(self: Client, sender: ChatSender, chat_msg: string, channel_type: integer, dst_id: integer, flag: integer):boolean, string
---comment '发送聊天消息'
---param sender 发送者玩家信息
---param chat_msg 聊天信息
---param channel_type 聊天频道类型，队伍频道填4 ChannelType.Team
---param dst_id 频道id, 队伍聊天即为队伍id
---param flag 暂时不用，填0即可
---return boolean, string
----------------聊天相关----------------

---@class Client
---@field public call_table table<string, CallInfo> 'call table'
local M = Class 'Client'
local pb = require 'game.proto.proto_helper'
local msg_handler_api = require 'game.network.message_handler'
function M:__init(ip, port, aid, token)
    self.ip = ip
    self.port = port
    self.aid = aid
    self.token = token
    self.call_table = {}
    self.event_handler = nil
    log.info("[Client] new client ", self.aid, self.token, self.ip, self.port)
    self.message_handler = msg_handler_api.new(self.ip, self.port, 60)
    self.message_handler:set_network_event_handle(function(event)
        M.handle_net_event(self, event)
    end)
    self.proto_helper = pb.init_pb()
    local mt = {
        __index = function(obj, func_name)
            if obj.proto_helper:is_service_method(func_name) then
                return function(...)
                    local args = {...}
                    local pb_args = {}
                    for i = 2, #args do
                        pb_args["arg" .. (i - 1)] = args[i]
                    end
                    local pb_type = "protocol." .. func_name ..'_args'
                    return M.send_data(obj, pb_type, pb_args)
                end
            else
                return M[func_name]
            end
        end
    }
    setmetatable(self, mt)
    self:init_state_machine()
end

---@private
-- initialize the state machine
function M:init_state_machine()
    self.state_machine = fsm:new()

    self.state_machine:init()
    -- add state
    self.state_machine:add_state("connecting", function() return self:do_connect() end, nil)
    self.state_machine:add_state("connected", function () return self:login_auth() end, nil)
    self.state_machine:add_state("login", function() return self:do_client_register() end, nil)
    self.state_machine:add_state("disconnect", function() return self:do_disconnect() end, nil)

    -- add transition
    self.state_machine:add_transition("connecting", "connected")
    self.state_machine:add_transition("connected", "disconnect")
    self.state_machine:add_transition("disconnect", "connecting")
    self.state_machine:add_transition("connected", "login")
    self.state_machine:add_transition("login", "disconnect")
end

---注册事件回调
---@param event_handler fun(net_event, ...) # network event handle
function M:on_event(event_handler)
    self.event_handle = event_handler
end

---调用事件回调
---@param event string # event name
---@param ... any
function M:notify_event_handler(event, ...)
    if self.event_handle ~= nil then
        self.event_handle(event, ...)
    end
end

---@private
--- client register
---@return boolean # success or false
function M:do_client_register()
    log.info("[Client] start client register ", self.ip, self.port)
    self:notify_event_handler("login")
    self:ClientPush_ClientRegister(self.aid)
    return true
end

---@private
--- connect
---@return boolean # success or false
function M:do_connect()
    self:notify_event_handler("connecting")
    log.info("[Client] start connect ", self.ip, self.port)
    self.message_handler:start()
    return true
end

---@private
---disconnect
---@return boolean # success or false
function M:do_disconnect()
    self:notify_event_handler("disconnect")
    log.info("[Client] disconnect")
    self:start()
    return true
end

function M:start()
    log.info("[Client] client start ", self.ip, self.port, self.aid)
    self.state_machine:change_state("connecting")
end

function M:__del()
    Delete(self.message_handler)
    return true
end

--唯一id生成器
local function createUniqueIdGenerator()
    local id = 0
    return function()
        id = id + 1
        return id
    end
end
local generateUniqueId = createUniqueIdGenerator()

--发送消息
---@param pb_type string pb类型
---@param data table    pb数据
---@return boolean, string|nil
function M:send_data(pb_type, data)
    local pb_encoded_data = self.proto_helper:encode(pb_type, data)
    local pb_desc = self.proto_helper:get_pb_desc(pb_type)
    if pb_desc == nil then
        log.warn("pb_type not found")
        return false, "pb_type not found"
    end
    local new_call_id = generateUniqueId()
    self.call_table[new_call_id] = {
        call_id = new_call_id,
        service_uuid = pb_desc['service_uuid'],
        method_index = pb_desc['method_index'],
        request_data = data
    }
    return self.message_handler:send_request(pb_desc['service_uuid'], new_call_id, pb_desc['method_index'], pb_encoded_data)
end

local function printTable(t)
    print(y3.util.dump(t))
end

function M:handle_net_event(event)
    if event.protocol_type == const.msgtype.RPC_RETURN then
        local call_id = event.call_id
        local call_info = self.call_table[call_id]
        self.call_table[call_id] = nil
        if call_info == nil then
            log.warn("call_info not found")
            return
        end
        local ret_pb_type = self.proto_helper:get_pb_ret_type(call_info.service_uuid, call_info.method_index)
        if ret_pb_type == nil then
            log.warn("pb_desc not found", call_info.service_uuid, call_info.method_index)
            return
        end
        local pb_data = self.proto_helper:decode(ret_pb_type, event.proto_data)
        if pb_data == nil then
            log.warn("pb_data decode failed", ret_pb_type)
            return
        end
        local method_name = string.gsub(ret_pb_type, 'protocol.', '')
        M[method_name](self, event.error_id, call_info.request_data, pb_data)
        return
    end
    if event.protocol_type == const.msgtype.RPC_CALL then
        local method_info = self.proto_helper:get_method_info(event.message_id, event.method_id)
        if method_info == nil then
            log.warn("method_info not found", event.message_id, event.method_id)
            return
        end
        local pb_type = method_info['args_pb_name']
        local pb_data = self.proto_helper:decode(pb_type, event.proto_data)
        if pb_data == nil then
            log.warn("pb_data decode failed", pb_type)
            return
        end
        local method_name = method_info['method_name']
        M[method_name](self, pb_data)
        return
    end
    if event.protocol_type == const.msgtype.RPC_EVENT then
        if event.sub_type == const.event_subtype.ON_RUNNING then
            self.state_machine:change_state("connected")
            return
        elseif event.sub_type == const.event_subtype.LOSE_CONNECTION then
            --断开链接，请求重连
            self.state_machine:change_state("disconnect")
        end
        return
    end
    if event.protocol_type == const.msgtype.RAW_PROTOCOL then
        printTable(event)
        self.state_machine:change_state("login")
    end
end

-------------------回包消息-------------------
--登录回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_Login_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_Login_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_Login', error_id, request_data, response_data)
end


---上报玩家信息回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_UpdatePlayerInfo_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_UpdatePlayerInfo_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_UpdatePlayerInfo', error_id, request_data, response_data)
end

---创建队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_CreateTeam_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_CreateTeam_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_CreateTeam', error_id, request_data, response_data)
end

---离开队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_LeaveTeam_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_LeaveTeam_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_LeaveTeam', error_id, request_data, response_data)
end

---加入队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_JoinTeam_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_JoinTeam_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_JoinTeam', error_id, request_data, response_data)
end

---踢出队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_TeamKick_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_TeamKick_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_TeamKick', error_id, request_data, response_data)
end

---创建队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_ChangeTeamLeader_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_ChangeTeamLeader_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_ChangeTeamLeader', error_id, request_data, response_data)
end

---获取队伍信息回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_GetTeamInfoByAid_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_GetTeamInfoByAid_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_GetTeamInfoByAid', error_id, request_data, response_data)
end

---解散队伍回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Team_DismissTeam_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Team_DismissTeam_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Team_DismissTeam', error_id, request_data, response_data)
end

---开始匹配回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Match_startMatch_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Match_startMatch_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Match_startMatch', error_id, request_data, response_data)
end

---取消匹配回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Match_cancelMatch_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Match_cancelMatch_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Match_cancelMatch', error_id, request_data, response_data)
end

---发送聊天消息回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:Chat_SendChatMsg_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("Chat_SendChatMsg_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'Chat_SendChatMsg', error_id, request_data, response_data)
end

---注册客户端回包
---@param error_id integer 错误id
---@param request_data table 请求消息
---@param response_data table 回包消息
function M:ClientPush_ClientRegister_ret(error_id, request_data, response_data)
    if error_id ~= 1 then
        log.warn("ClientPush_ClientRegister_ret failed", error_id)
    end
    self:notify_event_handler('ret', 'ClientPush_ClientRegister', error_id, request_data, response_data)
end

-------------------回包消息-------------------

-------------------推送消息-------------------
---聊天消息推送
---@param data table 消息
function M:NotiChat(data)
    self:notify_event_handler('chat', data)
end

---队伍信息推送
---@param data table 消息
function M:UpdateTeamInfo(data)
    print("update team info ==================== ")
    printTable(data)
    self:notify_event_handler('update_team_info', data)
end

---离开队伍通知推送
---@param data table 消息
function M:LeaveTeam(data)
    self:notify_event_handler('leave_team', data)
end

---玩家信息通知
---@param data table 消息
function M:NotifyPlayerInfo(data)
    self:notify_event_handler('notify_player_info', data)
end
-------------------推送消息-------------------

--rpc网关鉴权
---@return boolean, string|nil
function M:login_auth()
    log.info("[Client] start login ", self.ip, self.port, self.token)
    self:notify_event_handler("connected")
    local data = {
        token = self.token
    }
    local pb_encoded_data = self.proto_helper:encode('protocol.LoginAuthReq', data)
    return self.message_handler:send_raw_message(const.msgtype.LOGIN_AUTH, pb_encoded_data)
end

---@class client.API
local API = {}

--建立一个socket客户端，连接到目标服务器上
---@param ip string # IP地址
---@param port integer # 端口号
---@param aid integer # 玩家id
---@param token string # token
---@return Client
function API.new_client(ip, port, aid, token)
    local client = New 'Client' (ip, port, aid, token)
    return client
end

return API
