local cache = {}

--Specialized whitelist for VE-TrainTable
local command_whitelist = {
    ["/spawn"] = true,
    ["/who"] = true,
    ["/home"]=true,
    ["/help"]=true,
    ["//pos1"]=true,
    ["//pos2"]=true,
    ["//p"]=true,
    ["//v"]=true,
    ["/pt"]=true,
    ["/tpr"]=true,
    ["/tpy"]=true,
    ["/tphr"]=true,
    ["/tpn"]=true,
    ["/hotbar"]=true,
    ["/ipnames"]=true,
    ["/snippets"]=true
    
}

local function on_chat_message(name, message)
    if (cache[name] and cache[name]==message) then
        local command = message:split(" ")[1]
        if(minetest.registered_chatcommands[command:sub(2)] and command_whitelist[command]) then
            cache[name] = nil
            return false
        end
        minetest.chat_send_player(
            name,
            minetest.colorize("red", "sorry, repeat messages are not allowed")
        )
        return true
    else
        cache[name] = message
        return false
    end
end

table.insert(minetest.registered_on_chat_messages, 1, on_chat_message)
