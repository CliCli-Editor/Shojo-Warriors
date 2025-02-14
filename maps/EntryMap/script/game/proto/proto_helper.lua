require 'y3'
local pb = require("pb")

---@class ProtoHelper
local M = Class 'ProtoHelper'


function M:__init()
    self.pb_desc = require 'game.proto.proto_desc'
    return true
end

function M:__del()
    return true
end

function M:init()
    local result, err_message = nil, nil
    if y3.game.is_debug_mode() then
        local script_path = lua_script_path .. '/../../../custom/protocol/'
        if script_path == nil then
            script_path = ""
        end
        local pb_path = script_path .. "protocol.pb"
        result, err_message = pb.loadfile(pb_path)
    else
        result, err_message = pb.loadCustomProtocol()
    end
    log.info("loadCustomProtocol", result, err_message)
    if result == false or result == nil then
        error(err_message)
    end
    for name, basename, pb_type in pb.types() do
        log.info(name, basename, pb_type)
    end
    pb.option("enum_as_value", true)
    self.pb = pb
end

--序列化pb
---@param pb_type string # pb类型
---@param data table # pb数据
---@return string #pb二进制数据
function M:encode(pb_type, data)
    return self.pb.encode(pb_type, data)
end

--反序列化pb
---@param pb_type string # pb类型
---@param data string # pb二进制
---@return string #pb数据
function M:decode(pb_type, data)
    return self.pb.decode(pb_type, data)
end

function M:get_pb_desc(pb_type)
    return self.pb_desc["args"][pb_type]
end

function M:get_pb_ret_type(service_uuid, method_index)
    local methods = self.pb_desc["ret"][service_uuid]
    if methods == nil then
        return nil
    end
    local method = methods[method_index]
    if method == nil then
        return nil
    end
    return method['ret_pb_name']
end

function M:get_method_info(service_uuid, method_index)
    local methods = self.pb_desc["ret"][service_uuid]
    if methods == nil then
        return nil
    end
    local method = methods[method_index]
    if method == nil then
        return nil
    end
    return method
end

function M:is_service_method(func_name)
    return self.pb_desc["method"][func_name] ~= nil
end

local API = {}
---@class proto_helper.API

---@return ProtoHelper
function API.init_pb()
    local pb_helper = New 'ProtoHelper' ()
    pb_helper:init()
    return pb_helper
end
return API
