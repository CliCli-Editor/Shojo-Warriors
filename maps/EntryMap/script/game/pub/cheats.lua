local inputed = {}

local function push_key(key)
    inputed[#inputed+1] = key
    if #inputed > 10 then
        table.remove(inputed, 1)
    end
    if #inputed == 10 then
        local str = table.concat(inputed)
        if str == '↑↑↓↓←→←→BA' then
            print('已启用控制台！')
            ConnectVSCode()
        end
    end
end

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['UPARROW'], function (trg, data)
    push_key('↑')
end)

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['DOWNARROW'], function (trg, data)
    push_key('↓')
end)

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['LEFTARROW'], function (trg, data)
    push_key('←')
end)

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['RIGHTARROW'], function (trg, data)
    push_key('→')
end)

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['A'], function (trg, data)
    push_key('A')
end)

y3.game:event('本地-键盘-按下', y3.const.KeyboardKey['B'], function (trg, data)
    push_key('B')
end)
