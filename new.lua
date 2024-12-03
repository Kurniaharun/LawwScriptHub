-- Library UI (Programmer Style)
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local WelcomeText = Instance.new("TextLabel")
local ScriptSelectionFrame = Instance.new("Frame")
local ScriptListTitle = Instance.new("TextLabel")
local ScriptButtons = {}

-- ScreenGui Settings
ScreenGui.Name = "LawwScriptHUB"
ScreenGui.Parent = game.CoreGui

-- Main Frame Settings
Frame.Name = "MainFrame"
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0.4, 0, 0.2, 0)
Frame.Visible = true

-- Welcome Text Settings
WelcomeText.Name = "WelcomeText"
WelcomeText.Parent = Frame
WelcomeText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Size = UDim2.new(1, 0, 0.5, 0)
WelcomeText.Font = Enum.Font.Code
WelcomeText.Text = "Welcome, " .. game.Players.LocalPlayer.DisplayName
WelcomeText.TextColor3 = Color3.fromRGB(85, 170, 255)
WelcomeText.TextScaled = true

-- Show Welcome UI for 2 Seconds
wait(2)
Frame.Visible = false

-- Script Selection UI
ScriptSelectionFrame.Name = "ScriptSelectionFrame"
ScriptSelectionFrame.Parent = ScreenGui
ScriptSelectionFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
ScriptSelectionFrame.BorderSizePixel = 0
ScriptSelectionFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
ScriptSelectionFrame.Size = UDim2.new(0.4, 0, 0.4, 0)

-- Script List Title
ScriptListTitle.Name = "ScriptListTitle"
ScriptListTitle.Parent = ScriptSelectionFrame
ScriptListTitle.BackgroundColor3 = Color3.fromRGB(15, 15, 30)
ScriptListTitle.BorderSizePixel = 0
ScriptListTitle.Size = UDim2.new(1, 0, 0.2, 0)
ScriptListTitle.Font = Enum.Font.Code
ScriptListTitle.Text = "Pilih Script yang Sesuai Buat Kamu"
ScriptListTitle.TextColor3 = Color3.fromRGB(85, 170, 255)
ScriptListTitle.TextScaled = true

-- Function to Create Buttons for Scripts
local scripts = {
    {
        name = "COKKA HUB NO KEY",
        lua = '_G.Key = "Xzt7M9IAfF"\nloadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()'
    },
    {
        name = "RedzHub V2 (Smooth)",
        lua = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()'
    },
    {
        name = "ANDEPZAI OP (TRIAL)",
        lua = 'repeat wait() until game:IsLoaded() and game.Players.LocalPlayer\nloadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()'
    },
    {
        name = "AUTO CHEST (OP)",
        lua = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam"))()'
    }
}

for i, script in ipairs(scripts) do
    local Button = Instance.new("TextButton")
    Button.Name = script.name
    Button.Parent = ScriptSelectionFrame
    Button.BackgroundColor3 = Color3.fromRGB(30, 30, 60)
    Button.BorderSizePixel = 0
    Button.Position = UDim2.new(0.1, 0, 0.25 + (i - 1) * 0.15, 0)
    Button.Size = UDim2.new(0.8, 0, 0.1, 0)
    Button.Font = Enum.Font.Code
    Button.Text = script.name
    Button.TextColor3 = Color3.fromRGB(85, 170, 255)
    Button.TextScaled = true

    Button.MouseButton1Click:Connect(function()
        -- Run Lua Script
        loadstring(script.lua)()
        -- Close UI
        ScriptSelectionFrame.Visible = false
    end)
end
