local whitelist_file = io.open("list.lua", "r")
if not whitelist_file then
    return "error", "Failed to open whitelist file", "scriptid: moxiaobai"
end

local content = whitelist_file:read("*a")
whitelist_file:close()

local success, list = pcall(load("return " .. content))
if not success then
    success, list = pcall(load(content))
end

if not success then
    return "error", "Failed to load whitelist", "scriptid: moxiaobai"
end

list = list()

local playerName = game.Players.LocalPlayer.Name

if list.free then
    return "free", "By Moxiaobai Content:True", "scriptid: moxiaobai"
elseif list.users and list.users[playerName] then
    return "success", "By Moxiaobai Content:True", "scriptid: moxiaobai"
else
    return "denied", "By Moxiaobai Content:False", "scriptid: moxiaobai"
end
