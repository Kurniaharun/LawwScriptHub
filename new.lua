--[[ 
LawwScriptHUB
Author: LawwAdmin
Description: Script Hub with modern UI, password system, and Lua script execution.
--]]

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "LawwScriptHUB"

-- Helper Function to Create UI Elements
local function createUIElement(className, properties)
    local element = Instance.new(className)
    for property, value in pairs(properties) do
        element[property] = value
    end
    return element
end

-- Colors
local BackgroundColor = Color3.fromRGB(20, 20, 20)
local BorderColor = Color3.fromRGB(0, 170, 255)
local TextColor = Color3.fromRGB(255, 255, 255)

-- Create Welcome UI
local function createWelcomeUI()
    local WelcomeFrame = createUIElement("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 400, 0, 200),
        Position = UDim2.new(0.5, -200, 0.5, -100),
        BackgroundColor3 = BackgroundColor,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5)
    })

    local Border = createUIElement("UICorner", {Parent = WelcomeFrame, CornerRadius = UDim.new(0, 10)})

    local WelcomeText = createUIElement("TextLabel", {
        Parent = WelcomeFrame,
        Size = UDim2.new(1, 0, 0.5, 0),
        Position = UDim2.new(0, 0, 0, 10),
        BackgroundTransparency = 1,
        Text = "Welcome, " .. game.Players.LocalPlayer.DisplayName,
        TextColor3 = TextColor,
        Font = Enum.Font.SourceSansBold,
        TextSize = 24
    })

    local Avatar = createUIElement("ImageLabel", {
        Parent = WelcomeFrame,
        Size = UDim2.new(0, 80, 0, 80),
        Position = UDim2.new(0.5, -40, 0.5, 10),
        BackgroundTransparency = 1,
        Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
            game.Players.LocalPlayer.UserId .. "&width=150&height=150&format=png"
    })

    wait(2)
    WelcomeFrame:Destroy()
end

-- Create Password UI
local function createPasswordUI()
    local PasswordFrame = createUIElement("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 400, 0, 300),
        Position = UDim2.new(0.5, -200, 0.5, -150),
        BackgroundColor3 = BackgroundColor,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5)
    })

    local Border = createUIElement("UICorner", {Parent = PasswordFrame, CornerRadius = UDim.new(0, 10)})

    local Title = createUIElement("TextLabel", {
        Parent = PasswordFrame,
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
        Text = "Enter Password",
        TextColor3 = TextColor,
        Font = Enum.Font.SourceSansBold,
        TextSize = 24
    })

    local PasswordBox = createUIElement("TextBox", {
        Parent = PasswordFrame,
        Size = UDim2.new(0.8, 0, 0, 50),
        Position = UDim2.new(0.1, 0, 0.3, 0),
        BackgroundColor3 = BackgroundColor,
        TextColor3 = TextColor,
        Font = Enum.Font.SourceSans,
        TextSize = 18,
        PlaceholderText = "Enter your password here..."
    })

    local SubmitButton = createUIElement("TextButton", {
        Parent = PasswordFrame,
        Size = UDim2.new(0.8, 0, 0, 50),
        Position = UDim2.new(0.1, 0, 0.6, 0),
        BackgroundColor3 = BorderColor,
        Text = "Submit",
        TextColor3 = TextColor,
        Font = Enum.Font.SourceSansBold,
        TextSize = 18
    })

    local KeyHelpText = createUIElement("TextButton", {
        Parent = PasswordFrame,
        Size = UDim2.new(0.8, 0, 0, 20),
        Position = UDim2.new(0.1, 0, 0.8, 0),
        BackgroundTransparency = 1,
        Text = "Nyari Key? Click",
        TextColor3 = BorderColor,
        Font = Enum.Font.SourceSans,
        TextSize = 16
    })

    -- Password Check Logic
    SubmitButton.MouseButton1Click:Connect(function()
        local enteredPassword = PasswordBox.Text
        local validPassword = nil

        -- Get Password from URL
        pcall(function()
            validPassword = game:HttpGet("https://raw.githubusercontent.com/Kurniaharun/LawwScriptHub/refs/heads/main/pass.txt")
        end)

        if enteredPassword == validPassword then
            PasswordFrame:Destroy()
            createScriptUI()
        else
            PasswordBox.Text = ""
            PasswordBox.PlaceholderText = "Wrong Password. Try Again."
        end
    end)

    KeyHelpText.MouseButton1Click:Connect(function()
        ScreenGui:ClearAllChildren()
        local HelpText = createUIElement("TextLabel", {
            Parent = ScreenGui,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Text = "HUBUNGI TIKTOK @lawwadmin",
            TextColor3 = TextColor,
            Font = Enum.Font.SourceSansBold,
            TextSize = 24,
            TextScaled = true
        })
    end)
end

-- Create Script UI
local function createScriptUI()
    local ScriptFrame = createUIElement("Frame", {
        Parent = ScreenGui,
        Size = UDim2.new(0, 400, 0, 400),
        Position = UDim2.new(0.5, -200, 0.5, -200),
        BackgroundColor3 = BackgroundColor,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5)
    })

    local Border = createUIElement("UICorner", {Parent = ScriptFrame, CornerRadius = UDim.new(0, 10)})

    local Title = createUIElement("TextLabel", {
        Parent = ScriptFrame,
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundTransparency = 1,
        Text = "Select Your Script",
        TextColor3 = TextColor,
        Font = Enum.Font.SourceSansBold,
        TextSize = 24
    })

    -- Example Scripts
    local scripts = {
        {Name = "COKKA HUB NO KEY", LuaCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/UserDevEthical/Loadstring/main/CokkaHub.lua"))()]]},
        {Name = "RedzHub V2 (Smooth)", LuaCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()]]},
        {Name = "ANDEPZAI OP (TRIAL)", LuaCode = [[repeat wait() until game:IsLoaded() and game.Players.LocalPlayer 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AnDepZaiHub/AnDepZaiHubBeta/refs/heads/main/AnDepZaiHubNewUpdated.lua"))()]]},
        {Name = "AUTO CHEST (OP)", LuaCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/VGB-VGB-VGB/-VGB-Chest-Farm--/refs/heads/main/ChestFarmByVGBTeam"))()]]}
    }

    for i, script in ipairs(scripts) do
        local Button = createUIElement("TextButton", {
            Parent = ScriptFrame,
            Size = UDim2.new(0.8, 0, 0, 40),
            Position = UDim2.new(0.1, 0, 0.1 + (i * 0.15), 0),
            BackgroundColor3 = BorderColor,
            Text = script.Name,
            TextColor3 = TextColor,
            Font = Enum.Font.SourceSansBold,
            TextSize = 18
        })

        Button.MouseButton1Click:Connect(function()
            loadstring(script.LuaCode)()
        end)
    end
end

-- Run Welcome UI and Start the Flow
createWelcomeUI()
createPasswordUI()
