local Player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", Player.PlayerGui)
gui.Name = "LawwScriptHUB"
local welcomeFrame = Instance.new("Frame", gui)
local welcomeText = Instance.new("TextLabel", welcomeFrame)
local avatarImage = Instance.new("ImageLabel", welcomeFrame)
local passwordFrame = Instance.new("Frame", gui)
local passwordInput = Instance.new("TextBox", passwordFrame)
local submitButton = Instance.new("TextButton", passwordFrame)
local findKeyText = Instance.new("TextButton", passwordFrame)
local scriptFrame = Instance.new("Frame", gui)

-- Styling
gui.ResetOnSpawn = false
gui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
gui.Size = UDim2.new(1, 0, 1, 0)

welcomeFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
welcomeFrame.Position = UDim2.new(0.25, 0, 0.35, 0)
welcomeFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
welcomeFrame.BackgroundTransparency = 0.5

welcomeText.Size = UDim2.new(0.8, 0, 0.2, 0)
welcomeText.Position = UDim2.new(0.1, 0, 0.1, 0)
welcomeText.Text = "Welcome " .. Player.DisplayName
welcomeText.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeText.TextScaled = true
welcomeText.BackgroundTransparency = 1

avatarImage.Size = UDim2.new(0.2, 0, 0.6, 0)
avatarImage.Position = UDim2.new(0.8, 0, 0.2, 0)
avatarImage.Image = "https://www.roblox.com/bust-thumbnail/image?userId=" .. Player.UserId .. "&width=420&height=420&format=png"

wait(2)
welcomeFrame:Destroy() -- Close welcome UI after 2 seconds

-- Password Frame
passwordFrame.Size = UDim2.new(0.5, 0, 0.3, 0)
passwordFrame.Position = UDim2.new(0.25, 0, 0.35, 0)
passwordFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
passwordFrame.BackgroundTransparency = 0.7

passwordInput.Size = UDim2.new(0.8, 0, 0.2, 0)
passwordInput.Position = UDim2.new(0.1, 0, 0.1, 0)
passwordInput.PlaceholderText = "Enter Password"
passwordInput.TextColor3 = Color3.fromRGB(255, 255, 255)

submitButton.Size = UDim2.new(0.8, 0, 0.2, 0)
submitButton.Position = UDim2.new(0.1, 0, 0.6, 0)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)

submitButton.MouseButton1Click:Connect(function()
    if passwordInput.Text == "lawwvip" then
        passwordFrame:Destroy()
        showScriptButtons()
    else
        passwordInput.Text = "Incorrect Password"
    end
end)

findKeyText.Size = UDim2.new(0.8, 0, 0.2, 0)
findKeyText.Position = UDim2.new(0.1, 0, 0.8, 0)
findKeyText.Text = "Find key? Click"
findKeyText.TextColor3 = Color3.fromRGB(255, 255, 255)

findKeyText.MouseButton1Click:Connect(function()
    passwordFrame:Destroy()
    local contactMessage = Instance.new("TextLabel", gui)
    contactMessage.Size = UDim2.new(0.5, 0, 0.3, 0)
    contactMessage.Position = UDim2.new(0.25, 0, 0.35, 0)
    contactMessage.Text = "HUBUNGI TIKTOK @lawwadmin"
    contactMessage.TextColor3 = Color3.fromRGB(255, 255, 255)
    contactMessage.TextScaled = true
end)

-- Show Script Buttons
function showScriptButtons()
    scriptFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
    scriptFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
    scriptFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    scriptFrame.BackgroundTransparency = 0.5

    local scripts = {
        {name = "COKKA HUB NO KEY", code = "_G.Key = \"Xzt7M9IAfF\" loadstring(game:HttpGet(\"https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua\"))()"},
        {name = "RedzHub V2 (Smooth)", code = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua\"))()"},
        {name = "ANDEPZAI OP (TRIAL)", code = "repeat wait() until game:IsLoaded() and game.Players.LocalPlayer loadstring(game:HttpGet(\"https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua\"))()"},
        {name = "AUTO CHEST (OP)", code = "loadstring(game:HttpGet(\"https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam\"))()"}
    }

    for _, script in ipairs(scripts) do
        local button = Instance.new("TextButton", scriptFrame)
        button.Size = UDim2.new(0.8, 0, 0.2, 0)
        button.Position = UDim2.new(0.1, 0, 0.1 * _, 0)
        button.Text = script.name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)

        button.MouseButton1Click:Connect(function()
            loadstring(script.code)()
        end)
    end

    -- Close UI Button
    local closeButton = Instance.new("TextButton", scriptFrame)
    closeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    closeButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    closeButton.Text = "Close UI"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
end
