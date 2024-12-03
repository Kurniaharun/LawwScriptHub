-- Get player display name and avatar
local player = game.Players.LocalPlayer
local displayName = player.DisplayName
local avatarUrl = "https://www.roblox.com/bust-thumbnail/image?userId=" .. player.UserId .. "&width=420&height=420&format=png"

-- Create the Welcome UI
local welcomeFrame = Instance.new("Frame")
welcomeFrame.Size = UDim2.new(0, 500, 0, 300)
welcomeFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeFrame.BorderSizePixel = 0
welcomeFrame.Parent = game.Players.LocalPlayer.PlayerGui

local avatarImage = Instance.new("ImageLabel")
avatarImage.Size = UDim2.new(0, 50, 0, 50)
avatarImage.Position = UDim2.new(0, 10, 0.5, -25)
avatarImage.Image = avatarUrl
avatarImage.Parent = welcomeFrame

local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(0, 200, 0, 50)
nameLabel.Position = UDim2.new(0, 70, 0.5, -25)
nameLabel.Text = "Welcome, " .. displayName
nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLabel.BackgroundTransparency = 1
nameLabel.Font = Enum.Font.SourceSans
nameLabel.TextSize = 24
nameLabel.Parent = welcomeFrame

-- Close after 2 seconds
wait(2)
welcomeFrame:Destroy()

-- Create Password UI
local passwordFrame = Instance.new("Frame")
passwordFrame.Size = UDim2.new(0, 400, 0, 300)
passwordFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
passwordFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
passwordFrame.Parent = game.Players.LocalPlayer.PlayerGui

local passwordInput = Instance.new("TextBox")
passwordInput.Size = UDim2.new(0, 300, 0, 50)
passwordInput.Position = UDim2.new(0, 50, 0, 50)
passwordInput.PlaceholderText = "Enter Key"
passwordInput.TextColor3 = Color3.fromRGB(255, 255, 255)
passwordInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
passwordInput.Font = Enum.Font.SourceSans
passwordInput.TextSize = 20
passwordInput.Parent = passwordFrame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 100, 0, 50)
submitButton.Position = UDim2.new(0, 150, 0, 150)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
submitButton.Font = Enum.Font.SourceSans
submitButton.TextSize = 20
submitButton.Parent = passwordFrame

submitButton.MouseButton1Click:Connect(function()
    local password = passwordInput.Text
    local keyRequest = game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/Kurniaharun/LawwScriptHub/refs/heads/main/pass.txt")
    
    if password == keyRequest then
        -- Proceed to Script Selection UI
        passwordFrame:Destroy()
        createScriptSelectionUI()
    else
        -- Show error message
        local errorMessage = Instance.new("TextLabel")
        errorMessage.Size = UDim2.new(0, 400, 0, 50)
        errorMessage.Position = UDim2.new(0, 50, 0, 250)
        errorMessage.Text = "Invalid Key!"
        errorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
        errorMessage.BackgroundTransparency = 1
        errorMessage.Font = Enum.Font.SourceSans
        errorMessage.TextSize = 20
        errorMessage.Parent = passwordFrame
    end
end)

local findKeyText = Instance.new("TextButton")
findKeyText.Size = UDim2.new(0, 200, 0, 30)
findKeyText.Position = UDim2.new(0.5, -100, 0, 200)
findKeyText.Text = "Need Key? Click Here"
findKeyText.TextColor3 = Color3.fromRGB(0, 0, 255)
findKeyText.BackgroundTransparency = 1
findKeyText.Font = Enum.Font.SourceSans
findKeyText.TextSize = 18
findKeyText.Parent = passwordFrame

findKeyText.MouseButton1Click:Connect(function()
    passwordFrame:Destroy()
    local contactFrame = Instance.new("Frame")
    contactFrame.Size = UDim2.new(0, 400, 0, 200)
    contactFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
    contactFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contactFrame.Parent = game.Players.LocalPlayer.PlayerGui

    local contactText = Instance.new("TextLabel")
    contactText.Size = UDim2.new(0, 400, 0, 100)
    contactText.Position = UDim2.new(0, 0, 0, 50)
    contactText.Text = "HUBUNGI TIKTOK @lawwadmin"
    contactText.TextColor3 = Color3.fromRGB(255, 255, 255)
    contactText.BackgroundTransparency = 1
    contactText.Font = Enum.Font.SourceSans
    contactText.TextSize = 24
    contactText.Parent = contactFrame
end)

-- Create the Script Selection UI
function createScriptSelectionUI()
    local scriptFrame = Instance.new("Frame")
    scriptFrame.Size = UDim2.new(0, 400, 0, 400)
    scriptFrame.Position = UDim2.new(0.5, -200, 0.5, -200)
    scriptFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    scriptFrame.Parent = game.Players.LocalPlayer.PlayerGui

    local scripts = {
        {name = "COKKA HUB NO KEY", code = "_G.Key = 'Xzt7M9IAfF' \nloadstring(game:HttpGet('https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua'))()"},
        {name = "RedzHub V2 (Smooth)", code = "loadstring(game:HttpGet('https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua'))()"},
        {name = "ANDEPZAI OP (TRIAL)", code = "repeat wait() until game:IsLoaded() and game.Players.LocalPlayer \nloadstring(game:HttpGet('https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua'))()"},
        {name = "AUTO CHEST (OP)", code = "loadstring(game:HttpGet('https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam'))()"}
    }

    for i, script in ipairs(scripts) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(0, 350, 0, 50)
        button.Position = UDim2.new(0, 25, 0, (i - 1) * 60 + 50)
        button.Text = script.name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        button.Font = Enum.Font.SourceSans
        button.TextSize = 20
        button.Parent = scriptFrame

        button.MouseButton1Click:Connect(function()
            loadstring(script.code)()
        end)
    end

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 100, 0, 50)
    closeButton.Position = UDim2.new(0.5, -50, 0.9, -25)
    closeButton.Text = "Close"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 
