--玩家状态
PlayerState = {
    Normal = 1,     --空闲
    Matching = 2,   --匹配
}

--队伍状态
TeamState = {
    Normal = 1,     --正常
    Matching = 2,   --匹配中
}

--聊天频道 = {
ChannelType = {
    Team = 4,       --队伍聊天
}

---@class CallInfo
---@field public call_id integer 'call id'
---@field public service_uuid integer 'service uuid'
---@field public method_index integer 'method index'
---@field public request_data string 'request proto data'

---@class PlayerInfo
---@field public aid integer '玩家ID'
---@field public head_icon string '头像'
---@field public name string '玩家昵称'
---@field public state integer '玩家状态'
---@field public score integer '玩家分数
---@field public map_id string '当前地图版本id'
---@field public in_game boolean '是否在游戏中'
---@field public state_change_reason? 0|1|2|3 # 状态改变的原因，0：无；1：匹配成功；2：取消匹配；3: 开始匹配

---@class MatchInfo
---@field public map_id string '地图版本ID'
---@field public level_id string 'level id'
---@field public game_mode integer 'game mode'
---@field public game_play_id string '地图固定id'

---@class ChatSender
---@field public aid integer '发送者ID'
---@field nickname string '发送者昵称'
---@field head_icon string '发送者头像'
