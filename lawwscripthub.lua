-- Rename Orion Lib to LawwLib
local LawwLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kurniaharun/Orion/main/source"))()

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
        Content = "LawwScriptHub On The Fire",
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

-- Tab for Auto Join Job ID
local JoinJobTab = LawwScriptHUB:MakeTab({
    Name = "JOIN JOB",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

-- Variables for Auto Join
local AutoJoin = false
local JobID = ""

-- Input for Job ID
JoinJobTab:AddTextbox({
    Name = "Enter Job ID",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        -- Remove backtick (`) from input
        JobID = value:gsub("`", "")
        LawwLib:MakeNotification({
            Name = "Job ID Updated",
            Content = "Job ID set to: " .. (JobID ~= "" and JobID or "None"),
            Time = 3,
            Image = "rbxassetid://4483345998"
        })
    end
})

-- Toggle Auto Join Job ID
JoinJobTab:AddToggle({
    Name = "Auto Join Job ID",
    Default = false,
    Callback = function(value)
        AutoJoin = value
        if AutoJoin then
            LawwLib:MakeNotification({
                Name = "Auto Join Activated",
                Content = "Attempting to join Job ID: " .. (JobID ~= "" and JobID or "None"),
                Time = 3,
                Image = "rbxassetid://4483345998"
            })
        else
            LawwLib:MakeNotification({
                Name = "Auto Join Deactivated",
                Content = "Stopped attempting to join Job ID.",
                Time = 3,
                Image = "rbxassetid://4483345998"
            })
        end
    end
})

-- Auto Join Logic
task.spawn(function()
    while true do
        if AutoJoin and JobID ~= "" then
            -- Attempt to join Job ID
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
        end
        task.wait(1) -- Delay between attempts (1 second)
    end
end)

-- Animations & Theme
LawwLib:MakeNotification({
    Name = "Info",
    Content = "Sc Ini Dibuat Oleh Tiktok lawwadmin",
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
