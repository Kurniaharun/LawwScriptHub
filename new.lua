local userDisplayName = game.Players.LocalPlayer.DisplayName
local userAvatar = game.Players.LocalPlayer.AvatarUrl
local passwordCorrect = false
local passwordInput = ""

-- UI Setup
local ui = Instance.new("ScreenGui")
ui.Parent = game.Players.LocalPlayer.PlayerGui

-- Welcome Notification
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(0, 300, 0, 100)
welcomeFrame.Position = UDim2.new(1, -350, 0, 10)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeFrame.BackgroundTransparency = 0.5
welcomeFrame.Parent = ui

local welcomeText = Instance.new("TextLabel")
welcomeText.Text = "Welcome " .. userDisplayName
welcomeText.Size = UDim2.new(1, 0, 1, 0)
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.TextSize = 24
welcomeText.Parent = welcomeFrame

local avatarImage = Instance.new("ImageLabel")
avatarImage.Image = userAvatar
avatarImage.Size = UDim2.new(0, 40, 0, 40)
avatarImage.Position = UDim2.new(0, 10, 0.5, -20)
avatarImage.Parent = welcomeFrame

-- Animation to close after 2 seconds
wait(2)
welcomeFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)

-- Password Prompt
local passwordFrame = Instance.new("Frame")
passwordFrame.Size = UDim2.new(0, 400, 0, 200)
passwordFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
passwordFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
passwordFrame.BackgroundTransparency = 0.8
passwordFrame.Parent = ui

local passwordLabel = Instance.new("TextLabel")
passwordLabel.Text = "Enter Password"
passwordLabel.Size = UDim2.new(1, 0, 0, 40)
passwordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
passwordLabel.TextSize = 24
passwordLabel.Parent = passwordFrame

local passwordTextbox = Instance.new("TextBox")
passwordTextbox.Size = UDim2.new(1, -40, 0, 40)
passwordTextbox.Position = UDim2.new(0, 20, 0, 60)
passwordTextbox.PlaceholderText = "Enter password"
passwordTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
passwordTextbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
passwordTextbox.Parent = passwordFrame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 100, 0, 40)
submitButton.Position = UDim2.new(0.5, -50, 1, -60)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
submitButton.Parent = passwordFrame

submitButton.MouseButton1Click:Connect(function()
    if passwordTextbox.Text == "lawwvip" then
        passwordCorrect = true
        passwordFrame:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.5, true)
        -- Display Script List
    else
        -- Show incorrect password message
    end
end)

-- Script Buttons
local function createScriptButton(scriptName, code)
    local button = Instance.new("TextButton")
    button.Text = scriptName
    button.Size = UDim2.new(1, -20, 0, 40)
    button.Position = UDim2.new(0, 10, 0, 10)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    button.Parent = ui

    button.MouseButton1Click:Connect(function()
        loadstring(code)()
    end)
end

createScriptButton("COKKA HUB NO KEY", '_G.Key = "Xzt7M9IAfF"\nloadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()')
createScriptButton("RedzHub V2 (Smooth)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()')
createScriptButton("ANDEPZAI OP (TRIAL)", 'repeat wait() until game:IsLoaded() and game.Players.LocalPlayer \nloadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()')
createScriptButton("AUTO CHEST (OP)", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam"))()')

-- Close UI Button
local closeButton = Instance.new("TextButton")
closeButton.Text = "Close UI"
closeButton.Size = UDim2.new(0, 100, 0, 40)
closeButton.Position = UDim2.new(1, -110, 1, -50)
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Parent = ui

closeButton.MouseButton1Click:Connect(function()
    ui:Destroy()
end)
