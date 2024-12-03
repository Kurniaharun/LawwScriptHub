-- Import GUI Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

-- Welcome UI
local playerName = game.Players.LocalPlayer.DisplayName
local playerAvatar = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"

OrionLib:MakeNotification({
    Name = "Welcome",
    Content = "Welcome "..playerName,
    Image = playerAvatar,
    Time = 2
})

wait(2)

-- Password UI
OrionLib:MakeWindow({
    Name = "LawwScriptHUB",
    HidePremium = false,
    SaveConfig = false
})

local password = nil
pcall(function()
    password = game:HttpGet("https://raw.githubusercontent.com/Kurniaharun/LawwScriptHub/refs/heads/main/pass.txt"):split("\n")[1]
end)

local Window = OrionLib:MakeWindow({Name = "LawwScriptHUB"})

local PassTab = Window:MakeTab({
    Name = "Password Validation",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

PassTab:AddTextbox({
    Name = "Enter Password",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        if value == password then
            OrionLib:MakeNotification({
                Name = "Success",
                Content = "Password Correct! Loading Scripts...",
                Time = 2
            })
            loadScriptUI()
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Invalid Password!",
                Time = 2
            })
        end
    end
})

PassTab:AddButton({
    Name = "Nyari Key? Click",
    Callback = function()
        OrionLib:Destroy() -- Close all UI
        OrionLib:MakeNotification({
            Name = "Contact Us",
            Content = "HUBUNGI TIKTOK @lawwadmin",
            Time = 5
        })
    end
})

function loadScriptUI()
    -- Script List UI
    local ScriptTab = Window:MakeTab({
        Name = "Scripts",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

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

    ScriptTab:AddButton({
        Name = "Close UI",
        Callback = function()
            OrionLib:Destroy()
        end
    })
end
