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
local KeyStorage = game:GetService("Workspace"):FindFirstChild("LawwScriptKey") -- Autosave Key di Workspace

-- Fungsi untuk menyimpan key ke Workspace
local function SaveKeyToWorkspace(key)
    if not game:GetService("Workspace"):FindFirstChild("LawwScriptKey") then
        local KeyObject = Instance.new("StringValue", game:GetService("Workspace"))
        KeyObject.Name = "LawwScriptKey"
        KeyObject.Value = key
    end
end

-- Jika Key sudah tersimpan dan valid, otomatis autentikasi
if KeyStorage and KeyStorage.Value == RequiredKey then
    Authenticated = true
    LawwLib:MakeNotification({
        Name = "Welcome Back",
        Content = "Key valid! Welcome to LawwScriptHUB!",
        Time = 5,
        Image = "rbxassetid://4483345998"
    })
else
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
                SaveKeyToWorkspace(value) -- Simpan key ke Workspace

                LawwLib:MakeNotification({
                    Name = "Success",
                    Content = "Key accepted! Welcome to LawwScriptHUB!",
                    Time = 5,
                    Image = "rbxassetid://4483345998"
                })

                -- Hapus KeyTab setelah key benar
                LawwLib:DestroyTab(KeyTab)
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

JoinJobTab:AddButton({
    Name = "Join Less Player",
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local Servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))

        for _, server in ipairs(Servers.data) do
            if server.playing < server.maxPlayers then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, server.id)
                break
            end
        end
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
