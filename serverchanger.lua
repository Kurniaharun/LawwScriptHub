-- Load Library (Simple UI Framework)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/Library.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua"))()

-- Create Window
local Window = Library:CreateWindow({
    Title = "SERVER CHANGER V1",
    Center = true,
    AutoShow = true,
})

-- General Groupbox
local MainGroupbox = Window:AddTab("Main"):AddLeftGroupbox("Server Changer")

-- Status Script
MainGroupbox:AddLabel("Status: Active")
MainGroupbox:AddDivider()
MainGroupbox:AddLabel("By: LawwAdmin")

-- Variables
local AutoJoin = false
local JobID = ""

-- Input Job ID
MainGroupbox:AddInput("JobIDInput", {
    Label = "Input Job ID",
    Placeholder = "Enter Job ID...",
    Text = "",
    Callback = function(value)
        JobID = value:gsub("`", "") -- Filter invalid characters
    end,
})

-- Join Job Button
MainGroupbox:AddButton("Join Job", function()
    if JobID ~= "" then
        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
    else
        Library:Notify("Please enter a Job ID first!", 3)
    end
end)

-- Auto Join Toggle
MainGroupbox:AddToggle("AutoJoinToggle", {
    Label = "Auto Join Job",
    Default = false,
    Callback = function(state)
        AutoJoin = state
    end,
})

-- Hop to Random Server
MainGroupbox:AddButton("Hop Random Server", function()
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    for _, server in ipairs(servers.data) do
        if server.id ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
            break
        end
    end
end)

-- Hop to Lower Player Server
MainGroupbox:AddButton("Hop to Lower Player Server", function()
    local servers = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
    for _, server in ipairs(servers.data) do
        if server.playing < server.maxPlayers and server.id ~= game.JobId then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
            break
        end
    end
end)

-- Auto Join Logic
task.spawn(function()
    while true do
        if AutoJoin and JobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
        end
        task.wait(1) -- Wait to prevent spamming
    end
end)

-- Initialize UI
Library:Notify("SERVER CHANGER V1 Loaded! By LawwAdmin", 5)
Library:OnUnload(function()
    print("Unloaded!")
    Library:Notify("Script Unloaded.", 3)
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

ThemeManager:ApplyToTab(Window)
