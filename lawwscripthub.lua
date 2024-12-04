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

-- Sistem Key
local Authenticated = false
local RequiredKey = "LawwXPrem"

-- Key Validation Tab
local KeyTab = LawwScriptHUB:MakeTab({
    Name = "KEY AUTH",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

KeyTab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        if value == RequiredKey then
            Authenticated = true
            LawwLib:MakeNotification({
                Name = "Success",
                Content = "Key accepted! Welcome to LawwScriptHUB!",
                Time = 5,
                Image = "rbxassetid://4483345998"
            })
        else
            LawwLib:MakeNotification({
                Name = "Invalid Key",
                Content = "Incorrect key, please try again.",
                Time = 5,
                Image = "rbxassetid://4483345998"
            })
        end
    end
})

-- Tunggu hingga key benar sebelum melanjutkan
while not Authenticated do
    task.wait(1)
end

-- Welcome Notification
local function ShowWelcomeNotification()
    local player = game.Players.LocalPlayer
    local displayName = player.DisplayName
    local userId = player.UserId
    local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. tostring(userId) .. "&width=420&height=420&format=png"

    LawwLib:MakeNotification({
        Name = "Welcome " .. displayName,
        Content = "Enjoy using LawwScriptHUB!",
        Image = avatarUrl,
        Time = 2
    })
end
ShowWelcomeNotification()
task.wait(2)

-- JOIN JOB Tab
local JoinJobTab = LawwScriptHUB:MakeTab({
    Name = "JOIN JOB",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
local AutoJoin = false
local JobID = ""

JoinJobTab:AddTextbox({
    Name = "Enter Job ID",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        JobID = value:gsub("`", "")
    end
})

JoinJobTab:AddButton({
    Name = "Join Job ID",
    Callback = function()
        if JobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
        end
    end
})

JoinJobTab:AddToggle({
    Name = "Auto Join Job ID",
    Default = false,
    Callback = function(value)
        AutoJoin = value
    end
})

task.spawn(function()
    while true do
        if AutoJoin and JobID ~= "" then
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", JobID)
        end
        task.wait(1)
    end
end)

-- SCRIPT HUB Tab
local ScriptHubTab = LawwScriptHUB:MakeTab({
    Name = "SCRIPT HUB",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

ScriptHubTab:AddButton({
    Name = "COKKA HUB NO KEY",
    Callback = function()
        _G.Key = "Xzt7M9IAfF"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()
    end
})

ScriptHubTab:AddButton({
    Name = "RedzHub V2 (Smooth)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
    end
})

ScriptHubTab:AddButton({
    Name = "ANDEPZAI OP (TRIAL)",
    Callback = function()
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()
    end
})

ScriptHubTab:AddButton({
    Name = "AUTO CHEST (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam"))()
    end
})

-- MISC Tab
local MiscTab = LawwScriptHUB:MakeTab({
    Name = "MISC",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

MiscTab:AddButton({
    Name = "Boost FPS",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FPS-BOOSTER/main/FPSBooster.txt"))()
    end
})

MiscTab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(state)
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if state then
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

MiscTab:AddSlider({
    Name = "Walk Speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Color = Color3.fromRGB(0, 102, 255),
    Callback = function(value)
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").WalkSpeed = value
    end
})
