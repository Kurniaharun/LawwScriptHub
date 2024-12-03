-- Rename Orion Lib to LawwLib
local LawwLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- LawwScriptHUB UI Configuration
local LawwScriptHUB = LawwLib:MakeWindow({
    Name = "LawwScriptHUB", 
    HidePremium = false, 
    IntroText = "LawwScriptHUB Loading...",
    SaveConfig = false, 
    ConfigFolder = "LawwScriptHUB"
})

-- Function for creating welcome notification
local function ShowWelcomeNotification()
    local player = game.Players.LocalPlayer
    local displayName = player.DisplayName
    local userId = player.UserId
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(userId) .. "&width=420&height=420&format=png"

    -- Display notification in top-right corner
    LawwLib:MakeNotification({
        Name = "Welcome " .. displayName,
        Content = "Enjoy using LawwScriptHUB!",
        Image = avatarUrl,
        Time = 2 -- Notification duration
    })
end

-- Show welcome notification with a 2-second delay before the main UI opens
ShowWelcomeNotification()
task.wait(2)

-- Main UI with list of scripts
local ScriptTab = LawwScriptHUB:MakeTab({
    Name = "Script List",
    Icon = "rbxassetid://4483345998", -- Example icon
    PremiumOnly = false
})

-- List of scripts
ScriptTab:AddButton({
    Name = "COKKA HUB NO KEY",
    Callback = function()
        _G.Key = "Xzt7M9IAfF"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "RedzHub V2 (Smooth)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "ANDEPZAI OP (TRIAL)",
    Callback = function()
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()
    end
})

ScriptTab:AddButton({
    Name = "AUTO CHEST (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam"))()
    end
})

-- Close button for UI
ScriptTab:AddButton({
    Name = "Close UI",
    Callback = function()
        LawwLib:Destroy()
    end
})

-- Animations & Theme
LawwLib:MakeNotification({
    Name = "Info",
    Content = "UI Hitam ke Biruan dengan efek pop-up.",
    Time = 5,
    Image = "rbxassetid://4483345998"
})

-- Set theme
LawwLib:SetTheme("DarkTheme")
LawwLib:MakeTab({
    Name = "Credits",
    Content = "Designed by Laww",
    Icon = "rbxassetid://4483345998"
})
