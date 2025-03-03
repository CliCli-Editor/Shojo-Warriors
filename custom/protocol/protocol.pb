
�
plato.protoprotocol"�
ServiceBoxTraceInfo
	tracer_id (	RtracerId
span_id (RspanId$
parent_span_id (RparentSpanId
	user_data (	RuserData";
ExceptionInfo
name (	Rname
detail (	Rdetail"2
KeyValue
key (	Rkey
value (	Rvalue"1
Context&
info (2.protocol.KeyValueRinfoBZprotocol/commonbproto3
�
statechangereason.protoprotocol*e
StateChangeReason
default_StateChangeReason 
MatchSuccess
CancelMatch

StartMatchBZprotocol/commonbproto3
�
playerinfo.protoprotocolstatechangereason.proto"�

PlayerInfo
aid (Raid
	head_icon (	RheadIcon
name (	Rname
state (Rstate
team_id (RteamId
score (Rscore
map_id (	RmapId!
global_index (RglobalIndex
in_game	 (RinGameK
state_change_reason
 (2.protocol.StateChangeReasonRstateChangeReasonBZprotocol/commonbproto3
�
teaminfo.protoprotocolplayerinfo.proto"�
TeamInfo
team_id (RteamId!
member_limit (RmemberLimit
captain (Rcaptain
state (Rstate
map_id (	RmapId.
members (2.protocol.PlayerInfoRmembers
version (RversionBZprotocol/commonbproto3
�
teamchangeinfo.protoprotocolteaminfo.proto"�
TeamChangeInfo

new_member (	R	newMember!
leave_member (	RleaveMember/
	team_info (2.protocol.TeamInfoRteamInfoBZprotocol/commonbproto3
�
errcode.protoprotocol*�
ErrCode
default_ErrCode 
INVALID_PARAMETER
REDIS_FAILD
SERVER_INNER_ERRORb
	AUTH_FAILn
TOKEN_PARSE_FAILEDo
TOKEN_HAS_EXPIREDp
ACCOUNT_NOT_EXISTq
ACCOUNT_HAS_REGISTEREDr
ACCOUNT_REGISTER_FAILEDs
MAILBOX_INVALIDt
CODE_SEND_LIMITu
VERIFY_CODE_ERRORv
PASSWD_INVALIDw
PASSWD_NOT_MATCHx
NICKNAME_INVALIDy
ACCOUNT_NOT_ONLINEz
ACCOUNT_RECONNECT_FAILED{
MAP_NOT_EXIST�
MAP_VERSION_MISMATCH�
LOGIN_UNKNOWN_PROVIDER�
LOGIN_AUTH_FAIL�
LOGIN_NEED_LOGIN�
LOGIN_ALREADY_LOGIN�
LOGIN_ALREADY_ASSOCIATE�"
LOGIN_ASSOCIATE_ACCOUNT_EXIST�)
$LOGIN_ASSOCIATE_ACCOUNT_INCONSISTENT�
LOGIN_ASSOCIATE_FAIL�
LOGIN_REFRESH_TOKEN_FAIL�
LOGIN_URS_EMPTY�"
LOGIN_AUTHENTICATION_REQ_FAIL�#
LOGIN_AUTHENTICATION_NO_DEMAND�
LOGIN_INNER_ERROR�
REGISTER_NICKNAME_INVALID�
REGISTER_NICKNAME_ILLEGAL�
REGISTER_NICKNAME_EXIST�
REGISTER_NICKNAME_LEN�
REGISTER_INNER_ERROR�
QUERY_MAP_ITEM_FAILED�
PLAYER_LOST�
PLAYER_NOT_IN_BATTLE�
ASSIGN_CLUSTER_FAILED� 
CLUSTER_CREATE_SPACE_FAILED�
SPACE_NOT_EXIST�
UPLOAD_INFO_SYNTAX_ERROR�
MULTI_BATTLE_AUTH_FAILED�
ROOM_NOT_FOUND�
ROOM_IS_FULL�
PLAYER_NOT_EXISTS�

FLOW_LIMIT�
FRIEND_PLAYER_OFFLINE�	
FRIEND_GROUP_EXISTS�	
FRIEND_GROUP_NOT_EXISTS�	#
FRIEND_SYS_GROUP_CANNOT_DELETE�	
FRIEND_IN_GROUP�	!
FRIEND_WAIT_INVITEE_RESPONSE�	
FRIEND_INVITEE_REFUSED�	
FRIEND_CAN_NOT_ADD_SELF�	$
FRIEND_INVITEE_RESPONSE_TIMEOUT�	
FRIEND_INVITE_INFO_EXPIRE�	
FRIEND_TOO_MUCH�	
PLAYER_NAME_IS_DUPLICATE�	
FRIEND_GROUP_TOO_MUCH�	
FRIEND_DIV_GROUPS_TOO_MUCH�	!
TARGET_FRIEND_GROUP_TOO_MUCH�	
TARGET_IN_YOUR_BLACKLIST�	!
TARGET_HAS_IN_YOUR_BLACKLIST�	
BLACK_GROUP_TOO_MUCH�	
ADD_TO_BLACKLIST�	!
TARGET_NOT_IN_YOUR_BLACKLIST�	
DELETE_TO_BLACKLIST�	
ADD_NEW_GROUP�	
GROUP_IS_NOT_EMPUTY�	
TARGET_IS_NOT_YOUR_FRIEND�	
TARGET_HAS_IN_AIM_GROUP�	
TARGET_MOVE_GROUP�	
PLAYER_IS_MUTED�	
TARGET_IS_MUTED�	
ALREADY_BINDED_BN�	
TARGET_FRIEND_TOO_MUCH�	
DB_UPDATE_ROWS_ZERO�	
CHAT_INTERVAL_LIMIT�
"
CHAT_FRIEND_OFFLINE_MSG_LIMIT�

PLAYER_HAS_TEAM�

PLAYER_HAS_NO_TEAM�

PLAYER_TEAM_INVITE_IN_CD�

TEAM_NOT_EXIST�

TEAM_IS_FULL�

PLAYER_IS_NOT_TEAM_CAPTAIN�

TEAM_IS_MATCHING�

PLAYER_IS_MATCHING�
PLAYER_IS_GAMING�
PLAYER_IS_IN_ROOM�
DB_SELECT_OR_UPDATE_ERROR�
MATCH_INVALID_PLAYER� 
MATCH_INVALID_PLAYER_STATUS�
MATCH_PLAYER_IN_BAN�
MATCH_INVALID_STATUS�
MATCH_INVALID_MAP_INFO�
MATCH_PLAYER_NOT_IN_MATCH�

MATCH_BUSY�
MATCH_INNER_ERROR�
UPLOAD_FAILED�
FILE_NOT_EXIST�
DOWNLOAD_FAILED�
PLAT_CHAT_CLOSED�
PLAYER_CHAT_BLOCK�
SF_PROCESS_TIMEOUT�
SF_SERVICE_UNAVALIABLE�
SF_PROCESS_FAILED�
DB_OPERATION_FAIL�
DB_NO_DOCUMENTS�
INVALID_COLLECTION_NAME�
BM_SERVICE_UNAVAILABLE�
PROMO_CODE_NOT_NEW_USER�
PROMO_CODE_NEW_USER_VALID�
PROMO_CODE_EXPIRED�
PROMO_CODE_USED�
GET_USER_FAIL�
PROMO_CODE_CONFIG_FAIL�
PROMO_CODE_NOT_EXIST�BZprotocol/commonbproto3
}
errnureply.protoprotocolerrcode.proto"5

ErrnuReply'
errnu (2.protocol.ErrCodeRerrnuBZprotocol/commonbproto3
�
getteaminforeply.protoprotocolerrcode.prototeaminfo.proto"l
GetTeamInfoReply'
errnu (2.protocol.ErrCodeRerrnu/
	team_info (2.protocol.TeamInfoRteamInfoBZprotocol/commonbproto3
�
loginreply.protoprotocolerrcode.protoplayerinfo.proto"l

LoginReply'
errnu (2.protocol.ErrCodeRerrnu5
player_info (2.protocol.PlayerInfoR
playerInfoBZprotocol/commonbproto3
�
playerstate.protoprotocol*m
PlayerState
default_PlayerState 
PlayerStateNormal
PlayerStateMatching
PlayerStateInGameBZprotocol/commonbproto3
�
teamstate.protoprotocol*g
	TeamState
default_TeamState 
TeamStateNormal
TeamStateMatching
TeamStateConfirmingBZprotocol/commonbproto3
�
leaveteamtype.protoprotocol*N
LeaveTeamType
default_LeaveTeamType 	
Leave

Kicked
DismissBZprotocol/commonbproto3
�$
team/team.protoprotocolplato.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protologinreply.protoerrcode.protoplayerstate.protostatechangereason.prototeamstate.protoleaveteamtype.proto"�
Team_Login_args(
arg1 (2.protocol.PlayerInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_UpdatePlayerInfo_args(
arg1 (2.protocol.PlayerInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_DelPlayerInfo_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_CreateTeam_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_LeaveTeam_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_JoinTeam_args
arg1 (Rarg1
arg2 (Rarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_TeamKick_args
arg1 (Rarg1
arg2 (Rarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_ChangeTeamLeader_args
arg1 (Rarg1
arg2 (Rarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_GetTeamInfoByAid_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_GetTeamInfoByTeamId_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_DismissTeam_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_SetTeamState_args
arg1 (Rarg1'
arg2 (2.protocol.TeamStateRarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_BatchSetPlayerState_args
arg1 (Rarg1)
arg2 (2.protocol.PlayerStateRarg2/
arg3 (2.protocol.StateChangeReasonRarg3<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Team_Login_ret(
ret1 (2.protocol.LoginReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_UpdatePlayerInfo_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_CreateTeam_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_LeaveTeam_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_JoinTeam_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_TeamKick_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_ChangeTeamLeader_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_GetTeamInfoByAid_ret.
ret1 (2.protocol.GetTeamInfoReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_GetTeamInfoByTeamId_ret.
ret1 (2.protocol.GetTeamInfoReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Team_DismissTeam_ret(
ret1 (2.protocol.ErrnuReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZ	team/teambproto3
�
friendofflinemsg.protoprotocol"}
FriendOfflineMsg

friend_aid (R	friendAid
chat_msg (	RchatMsg
	send_time (RsendTime
flag (RflagBZprotocol/commonbproto3
�
getfriendofflinemsgret.protoprotocolerrcode.protofriendofflinemsg.proto"�
GetFriendOfflineMsgRet0

error_code (2.protocol.ErrCodeR	errorCode;
offline_msg (2.protocol.FriendOfflineMsgR
offlineMsgBZprotocol/commonbproto3
�
chatsender.protoprotocol"W

ChatSender
aid (Raid
nickname (	Rnickname
	head_icon (	RheadIconBZprotocol/commonbproto3
�
chatmsginfo.protoprotocolchatsender.proto"�
ChatMsgInfo,
sender (2.protocol.ChatSenderRsender!
chat_message (	RchatMessage
	chat_time (RchatTime
	chat_type (RchatType
dest_aid (RdestAid
flag (RflagBZprotocol/commonbproto3
�
sendchatmsgret.protoprotocolerrcode.protochatmsginfo.proto"}
SendChatMsgRet0

error_code (2.protocol.ErrCodeR	errorCode9
chat_msg_info (2.protocol.ChatMsgInfoRchatMsgInfoBZprotocol/commonbproto3
�
channeltype.protoprotocol*V
ChannelType
default_ChannelType 

friend
room

room_group
teamBZprotocol/commonbproto3
�
channeloptype.protoprotocol*W
ChannelOpType
default_ChannelOpType 

create
join	
leave

removeBZprotocol/commonbproto3
�	
chat/chat.protoprotocolplato.protofriendofflinemsg.protogetfriendofflinemsgret.protochatsender.protochatmsginfo.protosendchatmsgret.protoerrcode.protochanneltype.protochanneloptype.proto"�
Chat_UpdateChannel_args+
arg1 (2.protocol.ChannelOpTypeRarg1)
arg2 (2.protocol.ChannelTypeRarg2
arg3 (Rarg3
arg4 (Rarg4<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Chat_SendChatMsg_args(
arg1 (2.protocol.ChatSenderRarg1
arg2 (	Rarg2)
arg3 (2.protocol.ChannelTypeRarg3
arg4 (Rarg4
arg5 (Rarg5<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Chat_UpdateChannel_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Chat_SendChatMsg_ret,
ret1 (2.protocol.SendChatMsgRetRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZ	chat/chatbproto3
�
matchinfo.protoprotocol"|
	MatchInfo
map_id (	RmapId
level_id (	RlevelId
	game_mode (RgameMode 
game_play_id (	R
gamePlayIdBZprotocol/commonbproto3
w
matchplayerinfo.protoprotocol"9
MatchPlayerInfo
aid (Raid
score (RscoreBZprotocol/commonbproto3
�
match/match.protoprotocolplato.protomatchinfo.protomatchplayerinfo.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protologinreply.protoerrcode.protoplayerstate.protostatechangereason.prototeamstate.protoleaveteamtype.proto"�
Match_startMatch_args
arg1 (Rarg1
arg2 (Rarg2
arg3 (Rarg3'
arg4 (2.protocol.MatchInfoRarg4<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Match_cancelMatch_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Match_startMatch_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
Match_cancelMatch_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZmatch/matchbproto3
�
client_push/clientpush.protoprotocolplato.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protologinreply.protofriendofflinemsg.protogetfriendofflinemsgret.protochatsender.protochatmsginfo.protosendchatmsgret.protoerrcode.protoplayerstate.protostatechangereason.prototeamstate.protoleaveteamtype.protochanneltype.protochanneloptype.proto"�
ClientPush_ClientRegister_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
 ClientPush_ClientUnregister_args
arg1 (Rarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
ClientPush_NotiChat_args
arg1 (Rarg1)
arg2 (2.protocol.ChatMsgInfoRarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
ClientPush_UpdateTeamInfo_args
arg1 (Rarg1,
arg2 (2.protocol.TeamChangeInfoRarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
ClientPush_LeaveTeam_args
arg1 (Rarg1+
arg2 (2.protocol.LeaveTeamTypeRarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
 ClientPush_NotifyPlayerInfo_args
arg1 (Rarg1(
arg2 (2.protocol.PlayerInfoRarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
ClientPush_ClientRegister_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZclient_push/clientpushbproto3
�
client/client.protoprotocolplato.protofriendofflinemsg.protogetfriendofflinemsgret.protochatsender.protochatmsginfo.protosendchatmsgret.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protologinreply.protoerrcode.protochanneltype.protochanneloptype.protoplayerstate.protostatechangereason.prototeamstate.protoleaveteamtype.proto"�
Client_NotiChat_args)
arg1 (2.protocol.ChatMsgInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Client_UpdateTeamInfo_args,
arg1 (2.protocol.TeamChangeInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Client_LeaveTeam_args+
arg1 (2.protocol.LeaveTeamTypeRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
Client_NotifyPlayerInfo_args(
arg1 (2.protocol.PlayerInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctxBZclient/clientbproto3
�
loginauth.protoprotocol"$
LoginAuthReq
token (	Rtoken"E
LoginAuthReply
result (Rresult
	error_msg (	RerrorMsgbproto3