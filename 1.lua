-- Rename Orion Lib to LawwLib
local LawwLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- LawwScriptHUB UI Configuration
local LawwScriptHUB = LawwLib:MakeWindow({
    Name = "LawwScriptHUB", 
    HidePremium = false, 
    IntroText = "SABAR WIRR......",
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
        Name = "Selamat Datang " .. displayName,
        Content = "Anjay Make LawwScriptHUB!",
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


-- Tab for JOIN JOB
local JoinJobTab = LawwScriptHUB:MakeTab({
    Name = "JOIN JOB",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Input for Job ID
local JobID = ""
JoinJobTab:AddTextbox({
    Name = "Enter Job ID",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        -- Remove backtick (`) from input
        JobID = value:gsub("`", "")
    end
})

-- Button to join Job ID
JoinJobTab:AddButton({
    Name = "Join Job ID",
    Callback = function()
        if JobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
            LawwLib:MakeNotification({
                Name = "Success",
                Content = "Joining Job ID: " .. JobID,
                Time = 3,
                Image = "rbxassetid://4483345998"
            })
        else
            LawwLib:MakeNotification({
                Name = "Error",
                Content = "Please enter a valid Job ID!",
                Time = 3,
                Image = "rbxassetid://4483345998"
            })
        end
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
