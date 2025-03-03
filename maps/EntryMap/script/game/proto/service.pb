
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
playerinfo.protoprotocol"�

PlayerInfo
aid (Raid
	head_icon (	RheadIcon
name (	Rname
state (Rstate
team_id (RteamId
score (Rscore
map_id (	RmapIdBZprotocol/commonbproto3
�
teaminfo.protoprotocolplayerinfo.proto"�
TeamInfo
team_id (RteamId!
member_limit (RmemberLimit
captain (Rcaptain
state (Rstate
map_id (	RmapId.
members (2.protocol.PlayerInfoRmembersBZprotocol/commonbproto3
�
teamchangeinfo.protoprotocolteaminfo.proto"�
TeamChangeInfo

new_member (	R	newMember!
leave_member (	RleaveMember/
	team_info (2.protocol.TeamInfoRteamInfoBZprotocol/commonbproto3
�
errcode.protoprotocol*�
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
LOGIN_REFRESH_TOKEN_FAIL�
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
PLAYER_CHAT_BLOCK�
DB_OPERATION_FAIL�
DB_NO_DOCUMENTS�
INVALID_COLLECTION_NAME�BZprotocol/commonbproto3
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
�
team/team.protoprotocolplato.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protoerrcode.protoplayerstate.prototeamstate.protoleaveteamtype.proto"�
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
baserankintinfo.protoprotocol"K
BaseRankIntInfo
rank_key (	RrankKey

rank_score (R	rankScoreBZprotocol/commonbproto3
�
baserankinfolist.protoprotocolbaserankintinfo.proto"S
BaseRankInfoList?
rank_info_list (2.protocol.BaseRankIntInfoRrankInfoListBZprotocol/commonbproto3
�

camp.protoprotocol"y
Camp!
share_vision (RshareVision
roles (Rroles
	camp_name (	RcampName
	least_num (RleastNumBZprotocol/commonbproto3
�

role.protoprotocol"x
Role

role_color (	R	roleColor
	role_name (	RroleName
camp_id (RcampId
	role_type (RroleTypeBZprotocol/commonbproto3
�
messiahmailbox.protoprotocol"k
MessiahMailbox
hostnum (Rhostnum
port (Rport
	entity_id (	RentityId
ip (	RipBZprotocol/commonbproto3
�
platlogininfo.protoprotocol"�
PlatLoginInfo
ip (	Rip
port (Rport
sec_key (	RsecKey
hostnum (	Rhostnum

battle_str (	R	battleStr
aid (	RaidBZprotocol/commonbproto3
�
battlespacecreatecontext.protoprotocolmessiahmailbox.protoplatlogininfo.proto"�
BattleSpaceCreateContext
space_id (	RspaceId3
space_mb (2.protocol.MessiahMailboxRspaceMb
hostnum (	Rhostnum
region (	Rregion
host (	Rhost
gid (Rgid8
login_infos (2.protocol.PlatLoginInfoR
loginInfos0
major_version_number (	RmajorVersionNumberBZprotocol/commonbproto3
�
assignreply.protoprotocolbattlespacecreatecontext.proto"o
AssignReply
errcode (Rerrcode
msg (	Rmsg4
ctx (2".protocol.BattleSpaceCreateContextRctxBZprotocol/commonbproto3
�
matchplayerstate.protoprotocol"O
MatchPlayerState

account_id (R	accountId
	confirmed (R	confirmedBZprotocol/commonbproto3
�
matchstatus.protoprotocol*�
MatchStatus
default_MatchStatus 
MatchStatusNone
MatchStatusFinding
MatchStatusFound
MatchStatusConfirmed
MatchStatusCanceled
MatchStatusTimeoutBZprotocol/commonbproto3
�
matchteamstate.protoprotocolmatchplayerstate.protomatchstatus.proto"�
MatchTeamState
team_id (RteamId4
players (2.protocol.MatchPlayerStateRplayers-
status (2.protocol.MatchStatusRstatus
map_id (	RmapIdBZprotocol/commonbproto3
�
querymatchstatereply.protoprotocolmatchteamstate.protoerrcode.proto"m
QueryMatchStateReply'
errnu (2.protocol.ErrCodeRerrnu,
team (2.protocol.MatchTeamStateRteamBZprotocol/commonbproto3
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
client_push/clientpush.protoprotocolplato.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protofriendofflinemsg.protogetfriendofflinemsgret.protochatsender.protochatmsginfo.protosendchatmsgret.protoerrcode.protoplayerstate.prototeamstate.protoleaveteamtype.protochanneltype.protochanneloptype.proto"�
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
ClientPush_ClientRegister_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZclient_push/clientpushbproto3
�
matchteam.protoprotocolmatchteamstate.proto";
	MatchTeam.
teams (2.protocol.MatchTeamStateRteamsBZprotocol/commonbproto3
�
matchresult.protoprotocolmatchteam.proto"C
MatchResult4
match_teams (2.protocol.MatchTeamR
matchTeamsBZprotocol/commonbproto3
g
strnode.protoprotocol"1
StrNode
key (Rkey
value (	RvalueBZprotocol/commonbproto3
g
intnode.protoprotocol"1
IntNode
key (Rkey
value (RvalueBZprotocol/commonbproto3
�
mapstuff.protoprotocolintnode.protostrnode.proto"�
MapStuff
stuff_id (	RstuffId 
game_play_id (	R
gamePlayId
store_no (RstoreNo
store_id (	RstoreId
name (	Rname 
description (	Rdescription
icon (	Ricon!
consume_type (RconsumeType"
max_stack_cnt	 (RmaxStackCnt
state
 (Rstate
create_time (R
createTime
update_time (R
updateTime
type (Rtype
sub_type (RsubType
thr_type (RthrType
quality (Rquality'
flags (2.protocol.IntNodeRflags8
obtain_methods (2.protocol.StrNodeRobtainMethods0

use_limits (2.protocol.IntNodeR	useLimits.
	use_bonus (2.protocol.IntNodeRuseBonus.
	own_bonus (2.protocol.IntNodeRownBonus.
	res_infos (2.protocol.StrNodeRresInfos
	plat_info (	RplatInfo
prop_str (	RpropStr

other_attr (	R	otherAttr!
data_version (RdataVersionBZprotocol/commonbproto3
�
stufftemplate.protoprotocol"h
StuffTemplate
stuff_id (	RstuffId
store_id (	RstoreId!
consume_type (RconsumeTypeBZprotocol/commonbproto3
�
stuff.protoprotocol"�
Stuff
stuff_id (	RstuffId
	stack_cnt (RstackCnt
obtain_time (R
obtainTime
expiry_time (R
expiryTime
slot_id (RslotId!
data_version (RdataVersionBZprotocol/commonbproto3
�
battlemaparchiveinfo.protoprotocol"f
BattleMapArchiveInfo
key (Rkey
name (	Rname
type (Rtype
value (	RvalueBZprotocol/commonbproto3
�
battlemapstuffinfo.protoprotocol"�
BattleMapStuffInfo
item_id (	RitemId
store_id (	RstoreId
	stack_cnt (RstackCnt
can_use (RcanUse!
expired_time (RexpiredTime"
max_stack_cnt (RmaxStackCntBZprotocol/commonbproto3
�
battlestufffield.protoprotocol"b
BattleStuffField
key (Rkey
ct (Rct
cnt (Rcnt
consumed (RconsumedBZprotocol/commonbproto3
�
stuffrepo.protoprotocolstuff.proto"�
	StuffRepo
aid (	Raid 
game_play_id (	R
gamePlayId'
stuffs (2.protocol.StuffRstuffs
capacity (Rcapacity!
data_version (RdataVersionBZprotocol/commonbproto3
�
battlerolesyncfield.protoprotocolbattlestufffield.protostuffrepo.proto"�
BattleRoleSyncField'
repo (2.protocol.StuffRepoRrepo;
plat_stuffs (2.protocol.BattleStuffFieldR
platStuffs!
leave_reason (	RleaveReasonBZprotocol/commonbproto3
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
stufforderinfo.protoprotocol"�
StuffOrderInfo 
game_play_id (	R
gamePlayId
stuff_id (	RstuffId
	stuff_cnt (RstuffCnt
expiry_time (R
expiryTimeBZprotocol/commonbproto3
�
stufforder.protoprotocolstufforderinfo.proto"v

StuffOrder
order_id (	RorderId
aid (	Raid;
order_stuffs (2.protocol.StuffOrderInfoRorderStuffsBZprotocol/commonbproto3
s
commonreply.protoprotocol"9
CommonReply
errcode (Rerrcode
msg (	RmsgBZprotocol/commonbproto3
�
querymapcreatestuffsreply.protoprotocolmapstuff.proto"s
QueryMapCreateStuffsReply
errcode (Rerrcode
msg (	Rmsg*
stuffs (2.protocol.MapStuffRstuffsBZprotocol/commonbproto3
�
client/client.protoprotocolplato.protofriendofflinemsg.protogetfriendofflinemsgret.protochatsender.protochatmsginfo.protosendchatmsgret.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protoerrcode.protochanneltype.protochanneloptype.protoplayerstate.prototeamstate.protoleaveteamtype.proto"�
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
ctx (2.protocol.ContextRctxBZclient/clientbproto3
�
playermaparchivedata.protoprotocol"o
PlayerMapArchiveData
	data_type (RdataType

data_value (	R	dataValue
	day_value (RdayValueBZprotocol/commonbproto3
�
multibattleslotfield.protoprotocolstuffrepo.protoplayermaparchivedata.proto"�
MultiBattleSlotField
aid (	Raid
role_id (RroleId
camp_id (RcampId
nickname (	Rnickname'
repo (2.protocol.StuffRepoRrepoH
archives (2,.protocol.MultiBattleSlotField.ArchivesEntryRarchives[
ArchivesEntry
key (Rkey4
value (2.protocol.PlayerMapArchiveDataRvalue:8BZprotocol/commonbproto3
�
querymapstuffreply.protoprotocolmapstuff.proto"j
QueryMapStuffReply
errcode (Rerrcode
msg (	Rmsg(
stuff (2.protocol.MapStuffRstuffBZprotocol/commonbproto3
�
storeinfo.protoprotocol"L
	StoreInfo
key (	Rkey
store_no (	RstoreNo
name (	RnameBZprotocol/commonbproto3
�
clientonlysection.protoprotocol"�
ClientOnlySection
data_md5 (	RdataMd5!
storage_size (RstorageSize#
original_size (RoriginalSize
	pack_size (RpackSize
	data_list (	RdataList
uri (	Ruri
	data_size (RdataSizeBZprotocol/commonbproto3
�
campinfo.protoprotocol
camp.proto
role.proto"�
CampInfo0
camp (2.protocol.CampInfo.CampEntryRcamp0
role (2.protocol.CampInfo.RoleEntryRrole

camp_limit (R	campLimitG
	CampEntry
key (Rkey$
value (2.protocol.CampRvalue:8G
	RoleEntry
key (Rkey$
value (2.protocol.RoleRvalue:8BZprotocol/commonbproto3
�
mapdroppoolsingleconfig.protoprotocol"q
MapDropPoolSingleConfig
slot_id (RslotId
	add_value (RaddValue 
probability (RprobabilityBZprotocol/commonbproto3
�
mapdropconfig.protoprotocolmapdroppoolsingleconfig.proto"�
MapDropConfig
daily_limit (R
dailyLimit

drop_count (R	dropCount
	drop_name (	RdropNameK
drop_pool_config (2!.protocol.MapDropPoolSingleConfigRdropPoolConfig)
trigger_interval (RtriggerIntervalBZprotocol/commonbproto3
�
$onlyaddarchivesinglegameconfig.protoprotocol"]
OnlyAddArchiveSingleGameConfig
	game_time (RgameTime
max_add_num (R	maxAddNumBZprotocol/commonbproto3
�
onlyaddarchiveconfig.protoprotocol$onlyaddarchivesinglegameconfig.proto"�
OnlyAddArchiveConfig
day_max (RdayMaxT
single_game_limit (2(.protocol.OnlyAddArchiveSingleGameConfigRsingleGameLimit
week_max (RweekMax,
daily_growth_value (RdailyGrowthValueBZprotocol/commonbproto3
�
timeintervalconfig.protoprotocol"N
TimeIntervalConfig

start_time (R	startTime
end_time (RendTimeBZprotocol/commonbproto3
�
maparchiveconf.protoprotocolonlyaddarchiveconfig.prototimeintervalconfig.proto"�
MapArchiveConf
key (Rkey
type (Rtype
name (	Rname
value (	Rvalue.
billboard_sort_type (RbillboardSortType3
billboard_max_item_num (RbillboardMaxItemNum
encrypt (Rencrypt
only_add (RonlyAddS
only_add_detail	 (2+.protocol.MapArchiveConf.OnlyAddDetailEntryRonlyAddDetail/
max_value_limit_type
 (RmaxValueLimitTypeL
time_interval_limit (2.protocol.TimeIntervalConfigRtimeIntervalLimit&
week_date_limit (RweekDateLimit`
OnlyAddDetailEntry
key (Rkey4
value (2.protocol.OnlyAddArchiveConfigRvalue:8BZprotocol/commonbproto3
�
battlemapinfo.protoprotocolclientonlysection.protocampinfo.protostoreinfo.protomapdropconfig.protomaparchiveconf.proto"�
BattleMapInfo
map_id (	RmapId 
game_play_id (	R
gamePlayId
map_type (RmapTypea
client_only_sections (2/.protocol.BattleMapInfo.ClientOnlySectionsEntryRclientOnlySections,
other_sections_md5 (	RotherSectionsMd5
	logic_fps (RlogicFps/
	camp_info (2.protocol.CampInfoRcampInfoL
rank_key_info (2(.protocol.BattleMapInfo.RankKeyInfoEntryRrankKeyInfo
	store_ids	 (	RstoreIds0
major_version_number
 (	RmajorVersionNumber2

store_info (2.protocol.StoreInfoR	storeInfoB
	drop_info (2%.protocol.BattleMapInfo.DropInfoEntryRdropInfo;
archive_info (2.protocol.MapArchiveConfRarchiveInfob
ClientOnlySectionsEntry
key (Rkey1
value (2.protocol.ClientOnlySectionRvalue:8>
RankKeyInfoEntry
key (	Rkey
value (Rvalue:8T
DropInfoEntry
key (Rkey-
value (2.protocol.MapDropConfigRvalue:8BZprotocol/commonbproto3
w
matchplayerinfo.protoprotocol"9
MatchPlayerInfo
aid (Raid
score (RscoreBZprotocol/commonbproto3
�
msgmatchok.protoprotocolmatchresult.proto"=

MsgMatchOk/
results (2.protocol.MatchResultRresultsBZprotocol/commonbproto3
�
msgmatchfinish.protoprotocolmatchteamstate.proto"@
MsgMatchFinish.
teams (2.protocol.MatchTeamStateRteamsBZprotocol/commonbproto3
�
querymapstuffsreply.protoprotocolmapstuff.proto"�
QueryMapStuffsReply
errcode (Rerrcode
msg (	RmsgA
stuffs (2).protocol.QueryMapStuffsReply.StuffsEntryRstuffsM
StuffsEntry
key (	Rkey(
value (2.protocol.MapStuffRvalue:8BZprotocol/commonbproto3
�
querystufftemplatesreply.protoprotocolstufftemplate.proto"�
QueryStuffTemplatesReply
errcode (Rerrcode
msg (	Rmsg^
stuffTemplates (26.protocol.QueryStuffTemplatesReply.StuffTemplatesEntryRstuffTemplatesZ
StuffTemplatesEntry
key (	Rkey-
value (2.protocol.StuffTemplateRvalue:8BZprotocol/commonbproto3
�
querystuffreporeply.protoprotocolstuffrepo.proto"j
QueryStuffRepoReply
errcode (Rerrcode
msg (	Rmsg'
repo (2.protocol.StuffRepoRrepoBZprotocol/commonbproto3
�
querystuffreply.protoprotocolstuff.proto"d
QueryStuffReply
errcode (Rerrcode
msg (	Rmsg%
stuff (2.protocol.StuffRstuffBZprotocol/commonbproto3
�
querystuffsreply.protoprotocolstuff.proto"g
QueryStuffsReply
errcode (Rerrcode
msg (	Rmsg'
stuffs (2.protocol.StuffRstuffsBZprotocol/commonbproto3
�
querystuffreposreply.protoprotocolstuffrepo.proto"�
QueryStuffReposReply
errcode (Rerrcode
msg (	Rmsg?
repos (2).protocol.QueryStuffReposReply.ReposEntryRreposM

ReposEntry
key (	Rkey)
value (2.protocol.StuffRepoRvalue:8BZprotocol/commonbproto3
~
migratereply.protoprotocol"C
MigrateReply
migrate_ret (R
migrateRet
host (	RhostBZprotocol/commonbproto3
�
globalmaparchiveconf.protoprotocol"u
GlobalMapArchiveConf#
default_value (	RdefaultValue
	data_type (RdataType
	only_read (RonlyReadBZprotocol/commonbproto3
�
playermapdropdata.protoprotocol"f
PlayerMapDropData
	day_value (RdayValue4
last_trigger_timestamp (RlastTriggerTimestampBZprotocol/commonbproto3
�
platroomproxyfield.protoprotocol"�
PlatRoomProxyField

pt_hostnum (R	ptHostnum 
pt_stub_name (	R
ptStubName
pt_room_cid (	R	ptRoomCid`
plat_internal_info (22.protocol.PlatRoomProxyField.PlatInternalInfoEntryRplatInternalInfoC
PlatInternalInfoEntry
key (	Rkey
value (	Rvalue:8BZprotocol/commonbproto3
�
platroomslotinternalinfo.protoprotocol"�
PlatRoomSlotInternalInfo 
is_honor_vip (R
isHonorVipV
decorate_ids (23.protocol.PlatRoomSlotInternalInfo.DecorateIdsEntryRdecorateIds
	map_level (RmapLevel$
map_level_rank (RmapLevelRank!
played_times (RplayedTimes.
is_community_master (RisCommunityMaster0
community_like_count (RcommunityLikeCount;
community_elite_post_count (RcommunityElitePostCount2
community_reply_count	 (RcommunityReplyCount.
community_joy_count
 (RcommunityJoyCount)
community_posted (RcommunityPosted6
community_subject_count (RcommunitySubjectCount
signin_days (R
signinDays=
signin_max_consecutive_days (RsigninMaxConsecutiveDays=
signin_cur_consecutive_days (RsigninCurConsecutiveDays
	is_author (RisAuthor.
is_returning_player (RisReturningPlayer5
is_bookmark_current_map (RisBookmarkCurrentMapY
ladder_points (24.protocol.PlatRoomSlotInternalInfo.LadderPointsEntryRladderPointsP

i32_values (21.protocol.PlatRoomSlotInternalInfo.I32ValuesEntryR	i32ValuesP

i64_values (21.protocol.PlatRoomSlotInternalInfo.I64ValuesEntryR	i64ValuesY
string_values (24.protocol.PlatRoomSlotInternalInfo.StringValuesEntryRstringValues>
DecorateIdsEntry
key (Rkey
value (Rvalue:8?
LadderPointsEntry
key (	Rkey
value (Rvalue:8<
I32ValuesEntry
key (	Rkey
value (Rvalue:8<
I64ValuesEntry
key (	Rkey
value (Rvalue:8?
StringValuesEntry
key (	Rkey
value (	Rvalue:8BZprotocol/commonbproto3
�
platroomslotfield.protoprotocolbattlestufffield.protoplatroomslotinternalinfo.proto"�
PlatRoomSlotField
role_id (RroleId
	role_type (RroleType
aid (	Raid
nickname (	Rnickname

avatar_img (	R	avatarImg

avatar_obj (	R	avatarObj
name_tag (	RnameTag2
stuffs (2.protocol.BattleStuffFieldRstuffsP
slot_internal_info	 (2".protocol.PlatRoomSlotInternalInfoRslotInternalInfoBZprotocol/commonbproto3
�
platmaplevelrankiteminfo.protoprotocol"S
PlatMapLevelRankItemInfo
nickname (	Rnickname
	map_level (RmapLevelBZprotocol/commonbproto3
�
platroomfield.protoprotocolplatroomproxyfield.protoplatroomslotfield.protoplatmaplevelrankiteminfo.proto"�
PlatRoomField9
	plat_args (2.protocol.PlatRoomProxyFieldRplatArgs
game_map_id (	R	gameMapId 
game_play_id (	R
gamePlayId
	game_mode (RgameMode
channel (	Rchannel
region (	Rregion(
room_virtual_bag (RroomVirtualBag5
map_archive_table_index (RmapArchiveTableIndex:

room_slots	 (2.protocol.PlatRoomSlotFieldR	roomSlots"
watch_delay_s
 (RwatchDelayS
upenv (RupenvH
map_level_rank (2".protocol.PlatMapLevelRankItemInfoRmapLevelRank"
owner_role_id (RownerRoleIdBZprotocol/commonbproto3
�
multibattlefield.protoprotocolbattlemapinfo.protostufftemplate.protomultibattleslotfield.proto"�
MultiBattleField
	owner_aid (	RownerAid
	timestamp (R	timestamp
region (	Rregion
	game_mode (RgameMode
token (	Rtoken4
slots (2.protocol.MultiBattleSlotFieldRslots2
map_info (2.protocol.BattleMapInfoRmapInfoW
stuff_templates (2..protocol.MultiBattleField.StuffTemplatesEntryRstuffTemplatesZ
StuffTemplatesEntry
key (	Rkey-
value (2.protocol.StuffTemplateRvalue:8BZprotocol/commonbproto3
�
battlerolesetupfield.protoprotocolbattlestufffield.protoplatroomslotinternalinfo.protoplayermapdropdata.protobattlemapstuffinfo.protoplayermaparchivedata.protostuffrepo.proto"�

BattleRoleSetupField
role_id (RroleId
camp_id (RcampId
	role_type (RroleType
nickname (	Rnickname;

map_stuffs (2.protocol.BattleMapStuffInfoR	mapStuffsR
map_archives (2/.protocol.BattleRoleSetupField.MapArchivesEntryRmapArchives
plat_aid (	RplatAid

avatar_img (	R	avatarImg

avatar_obj	 (	R	avatarObjS
role_rank_num
 (2/.protocol.BattleRoleSetupField.RoleRankNumEntryRroleRankNum'
repo (2.protocol.StuffRepoRrepo
name_tag (	RnameTag;
plat_stuffs (2.protocol.BattleStuffFieldR
platStuffsY
plat_slot_internal_info (2".protocol.PlatRoomSlotInternalInfoRplatSlotInternalInfo\
archive_rank_num (22.protocol.BattleRoleSetupField.ArchiveRankNumEntryRarchiveRankNumI
	drop_data (2,.protocol.BattleRoleSetupField.DropDataEntryRdropDatan
archive_rank_blacklist (28.protocol.BattleRoleSetupField.ArchiveRankBlacklistEntryRarchiveRankBlacklist^
MapArchivesEntry
key (Rkey4
value (2.protocol.PlayerMapArchiveDataRvalue:8>
RoleRankNumEntry
key (	Rkey
value (Rvalue:8A
ArchiveRankNumEntry
key (Rkey
value (Rvalue:8X
DropDataEntry
key (Rkey1
value (2.protocol.PlayerMapDropDataRvalue:8G
ArchiveRankBlacklistEntry
key (Rkey
value (Rvalue:8BZprotocol/commonbproto3
�
battlespacesetupfield.protoprotocolbattlerolesetupfield.protobattlemapstuffinfo.protoplatroomproxyfield.protobaserankinfolist.protostufftemplate.protoplatmaplevelrankiteminfo.protomaparchiveconf.protobattlemapinfo.proto"�
BattleSpaceSetupField2
map_info (2.protocol.BattleMapInfoRmapInfoS
role_players (20.protocol.BattleSpaceSetupField.RolePlayersEntryRrolePlayers
	game_mode (RgameMode(
virtual_bag_flag (RvirtualBagFlag;

map_stuffs (2.protocol.BattleMapStuffInfoR	mapStuffs9
	plat_args (2.protocol.PlatRoomProxyFieldRplatArgs5
map_archive_table_index (RmapArchiveTableIndexc
global_map_archive (25.protocol.BattleSpaceSetupField.GlobalMapArchiveEntryRglobalMapArchive]
player_rank_list	 (23.protocol.BattleSpaceSetupField.PlayerRankListEntryRplayerRankList\
stuff_templates
 (23.protocol.BattleSpaceSetupField.StuffTemplatesEntryRstuffTemplates"
watch_delay_s (RwatchDelayS
upenv (RupenvH
map_level_rank (2".protocol.PlatMapLevelRankItemInfoRmapLevelRankF
archive_slots_conf (2.protocol.MapArchiveConfRarchiveSlotsConf`
archive_rank_info (24.protocol.BattleSpaceSetupField.ArchiveRankInfoEntryRarchiveRankInfo+
room_owner_role_id (RroomOwnerRoleId
battle_type (R
battleType
	owner_aid (	RownerAidv
string_global_map_archive (2;.protocol.BattleSpaceSetupField.StringGlobalMapArchiveEntryRstringGlobalMapArchive
level_id (	RlevelId^
RolePlayersEntry
key (Rkey4
value (2.protocol.BattleRoleSetupFieldRvalue:8C
GlobalMapArchiveEntry
key (	Rkey
value (Rvalue:8]
PlayerRankListEntry
key (	Rkey0
value (2.protocol.BaseRankInfoListRvalue:8Z
StuffTemplatesEntry
key (	Rkey-
value (2.protocol.StuffTemplateRvalue:8^
ArchiveRankInfoEntry
key (Rkey0
value (2.protocol.BaseRankInfoListRvalue:8I
StringGlobalMapArchiveEntry
key (	Rkey
value (	Rvalue:8BZprotocol/commonbproto3
�
clusterstat.protoprotocol"�
ClusterStat
hostnum (Rhostnum&
total_space_cnt (RtotalSpaceCnt"
game_proc_cnt (RgameProcCnt
loads (Rloads
region (	Rregion

lease_time (R	leaseTime
gids (	Rgids$
host_cpu_usage (RhostCpuUsage0
major_version_number	 (	RmajorVersionNumberBZprotocol/commonbproto3
�
battlemessagesenderinfo.protoprotocol"h
BattleMessageSenderInfo
aid (	Raid
nickname (	Rnickname
sender_type (R
senderTypeBZprotocol/commonbproto3
�
spectatespaceinfo.protoprotocol"s
SpectateSpaceInfo
setup (	Rsetup$
frame_msgs_all (	RframeMsgsAll"
watch_delay_s (RwatchDelaySBZprotocol/commonbproto3
�
playerbattleendinfo.protoprotocolbattlestufffield.proto"�
PlayerBattleEndInfo
win_camp_id (R	winCampId

is_invalid (R	isInvalid
ts (Rts2
stuffs (2.protocol.BattleStuffFieldRstuffsBZprotocol/commonbproto3
�
matchinfo.protoprotocol"|
	MatchInfo
map_id (	RmapId
level_id (	RlevelId
	game_mode (RgameMode 
game_play_id (	R
gamePlayIdBZprotocol/commonbproto3
�
matchfinishreason.protoprotocol*�
MatchFinishReason
default_MatchFinishReason 
MatchConfirmTimeout
MatchPlayerCancel
	MatchStop
MatchTimeout
MatchInternalErrorBZprotocol/commonbproto3
�
battleerrcode.protoprotocol*�
BattleErrCode
default_BattleErrCode 
ServerInnerErrorb
MapNotExist�
QueryMapItemFailed�
ParamsInvalid�

PlayerLost�
PlayerNotExist�
AssignClusterFailed�
ClusterCreateSpaceFailed�
SpaceNotExist�
UploadInfoSyntaxError�
MultiBattleAuthFailed�BZprotocol/commonbproto3
�
match/match.protoprotocolplato.protomatchplayerstate.protomatchteamstate.protomatchteam.protomatchresult.protomsgmatchok.protomsgmatchfinish.protomessiahmailbox.protobaserankintinfo.protostrnode.protointnode.protomapstuff.protostufftemplate.protostuff.protostuffrepo.protostufforderinfo.protostufforder.protocommonreply.protoquerymapstuffreply.protoquerymapstuffsreply.protoquerymapcreatestuffsreply.protoquerystufftemplatesreply.protoquerystuffreporeply.protoquerystuffreply.protoquerystuffsreply.protoquerystuffreposreply.protomigratereply.protoclientonlysection.proto
camp.proto
role.protocampinfo.protomapdroppoolsingleconfig.protomapdropconfig.proto$onlyaddarchivesinglegameconfig.prototimeintervalconfig.protoonlyaddarchiveconfig.protomaparchiveconf.protoglobalmaparchiveconf.protostoreinfo.protobattlemapinfo.protoplayermaparchivedata.protoplayermapdropdata.protobattlestufffield.protoplatroomproxyfield.protoplatroomslotinternalinfo.protoplatroomslotfield.protoplatmaplevelrankiteminfo.protoplatroomfield.protomultibattleslotfield.protomultibattlefield.protobattlemapstuffinfo.protobattlemaparchiveinfo.protobattlerolesetupfield.protobattlerolesyncfield.protobaserankinfolist.protobattlespacesetupfield.protoplatlogininfo.protoclusterstat.protoassignreply.protobattlespacecreatecontext.protobattlemessagesenderinfo.protospectatespaceinfo.protoplayerbattleendinfo.protoquerymatchstatereply.protomatchinfo.protomatchplayerinfo.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protoerrcode.protomatchstatus.protomatchfinishreason.protobattleerrcode.protoplayerstate.prototeamstate.protoleaveteamtype.proto"�
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
�
match/teammatch.protoprotocolplato.protomatchplayerstate.protomatchteamstate.protomatchteam.protomatchresult.protomsgmatchok.protomsgmatchfinish.protomessiahmailbox.protobaserankintinfo.protostrnode.protointnode.protomapstuff.protostufftemplate.protostuff.protostuffrepo.protostufforderinfo.protostufforder.protocommonreply.protoquerymapstuffreply.protoquerymapstuffsreply.protoquerymapcreatestuffsreply.protoquerystufftemplatesreply.protoquerystuffreporeply.protoquerystuffreply.protoquerystuffsreply.protoquerystuffreposreply.protomigratereply.protoclientonlysection.proto
camp.proto
role.protocampinfo.protomapdroppoolsingleconfig.protomapdropconfig.proto$onlyaddarchivesinglegameconfig.prototimeintervalconfig.protoonlyaddarchiveconfig.protomaparchiveconf.protoglobalmaparchiveconf.protostoreinfo.protobattlemapinfo.protoplayermaparchivedata.protoplayermapdropdata.protobattlestufffield.protoplatroomproxyfield.protoplatroomslotinternalinfo.protoplatroomslotfield.protoplatmaplevelrankiteminfo.protoplatroomfield.protomultibattleslotfield.protomultibattlefield.protobattlemapstuffinfo.protobattlemaparchiveinfo.protobattlerolesetupfield.protobattlerolesyncfield.protobaserankinfolist.protobattlespacesetupfield.protoplatlogininfo.protoclusterstat.protoassignreply.protobattlespacecreatecontext.protobattlemessagesenderinfo.protospectatespaceinfo.protoplayerbattleendinfo.protoquerymatchstatereply.protomatchinfo.protomatchplayerinfo.protoplayerinfo.prototeaminfo.prototeamchangeinfo.protoerrnureply.protogetteaminforeply.protoerrcode.protomatchstatus.protomatchfinishreason.protobattleerrcode.protoplayerstate.prototeamstate.protoleaveteamtype.proto"�
TeamMatch_startMatch_args&
arg1 (2.protocol.TeamInfoRarg1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
TeamMatch_cancelMatch_args
arg1 (	Rarg1
arg2 (Rarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
TeamMatch_queryMatchState_args
arg1 (	Rarg1
arg2 (Rarg2<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo#
ctx (2.protocol.ContextRctx"�
TeamMatch_startMatch_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
TeamMatch_cancelMatch_ret%
ret1 (2.protocol.ErrCodeRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctx"�
TeamMatch_queryMatchState_ret2
ret1 (2.protocol.QueryMatchStateReplyRret1<

trace_info (2.protocol.ServiceBoxTraceInfoR	traceInfo4
	exec_info (2.protocol.ExceptionInfoRexecInfo#
ctx (2.protocol.ContextRctxBZmatch/teammatchbproto3
�
loginauth.protoprotocol"$
LoginAuthReq
token (	Rtoken"E
LoginAuthReply
result (Rresult
	error_msg (	RerrorMsgbproto3