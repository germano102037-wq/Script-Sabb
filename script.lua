local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Settings = {
    Enabled = false,
    Invisible = false,
    HitboxSize = 50,
    Transparency = 0.7,
    OpenKey = Enum.KeyCode.Insert,
    IsMinimized = false,
    CorrectKey = "OVER"
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "UltraHitbox_GermanoXz"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local KeyFrame = Instance.new("Frame")
KeyFrame.Name = "KeySystem"
KeyFrame.Parent = ScreenGui
KeyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
KeyFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
KeyFrame.Size = UDim2.new(0, 250, 0, 150)
KeyFrame.BorderSizePixel = 0

local KeyCorner = Instance.new("UICorner", KeyFrame)
KeyCorner.CornerRadius = UDim.new(0, 10)

local KeyStroke = Instance.new("UIStroke", KeyFrame)
KeyStroke.Color = Color3.fromRGB(80, 80, 100)
KeyStroke.Thickness = 1.5

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Text = "KEY SYSTEM"
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 16

local KeyInput = Instance.new("TextBox", KeyFrame)
KeyInput.PlaceholderText = "Insira a chave aqui..."
KeyInput.Text = ""
KeyInput.Size = UDim2.new(0, 200, 0, 35)
KeyInput.Position = UDim2.new(0.5, -100, 0, 50)
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 12
Instance.new("UICorner", KeyInput)

local VerifyBtn = Instance.new("TextButton", KeyFrame)
VerifyBtn.Text = "VERIFICAR"
VerifyBtn.Size = UDim2.new(0, 200, 0, 35)
VerifyBtn.Position = UDim2.new(0.5, -100, 0, 95)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.TextSize = 14
Instance.new("UICorner", VerifyBtn)

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.Position = UDim2.new(0.5, -150, 0.4, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = false

local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(60, 60, 70)
UIStroke.Thickness = 1.5

local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
TopBar.BorderSizePixel = 0

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel", TopBar)
Title.Text = "ULTRA ENGINE | BY GERMANOXZ"
Title.Size = UDim2.new(1, -80, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 12

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Text = "X"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CloseBtn)

local MinBtn = Instance.new("TextButton", TopBar)
MinBtn.Text = "-"
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -70, 0.5, -15)
MinBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", MinBtn)

local Content = Instance.new("Frame", MainFrame)
Content.Name = "Content"
Content.Size = UDim2.new(1, 0, 1, -40)
Content.Position = UDim2.new(0, 0, 0, 40)
Content.BackgroundTransparency = 1

local ToggleBtn = Instance.new("TextButton", Content)
ToggleBtn.Text = "HITBOX: DISABLED"
ToggleBtn.Size = UDim2.new(0, 260, 0, 45)
ToggleBtn.Position = UDim2.new(0.5, -130, 0, 15)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamSemibold
ToggleBtn.TextSize = 14
Instance.new("UICorner", ToggleBtn)

local InvisibleBtn = Instance.new("TextButton", Content)
InvisibleBtn.Text = "HITBOX INVISIBLE: DISABLED"
InvisibleBtn.Size = UDim2.new(0, 260, 0, 45)
InvisibleBtn.Position = UDim2.new(0.5, -130, 0, 70)
InvisibleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
InvisibleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisibleBtn.Font = Enum.Font.GothamSemibold
InvisibleBtn.TextSize = 14
Instance.new("UICorner", InvisibleBtn)

local InfoText = Instance.new("TextLabel", Content)
InfoText.Text = "SIZE: " .. Settings.HitboxSize .. " STUDS\nPRESS INSERT TO HIDE/SHOW"
InfoText.Size = UDim2.new(1, 0, 0, 60)
InfoText.Position = UDim2.new(0, 0, 0, 125)
InfoText.BackgroundTransparency = 1
InfoText.TextColor3 = Color3.fromRGB(150, 150, 160)
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 12

local function CheckAndVerify()
    if KeyInput.Text == Settings.CorrectKey then
        KeyFrame:Destroy()
        MainFrame.Visible = true
    else
        VerifyBtn.Text = "CHAVE INCORRETA!"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
        task.wait(1)
        VerifyBtn.Text = "VERIFICAR"
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
    end
end

VerifyBtn.MouseButton1Click:Connect(CheckAndVerify)

KeyInput.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        CheckAndVerify()
    end
end)

local function ResetHitboxes()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local root = player.Character:FindFirstChild("HumanoidRootPart")
            if root then
                root.Size = Vector3.new(2, 2, 1)
                root.Transparency = 1
                root.CanCollide = true
            end
        end
    end
end

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Settings.OpenKey then
        if MainFrame.Visible or not ScreenGui:FindFirstChild("KeySystem") then
            MainFrame.Visible = not MainFrame.Visible
        end
    end
end)

MinBtn.MouseButton1Click:Connect(function()
    Settings.IsMinimized = not Settings.IsMinimized
    local targetSize = Settings.IsMinimized and UDim2.new(0, 300, 0, 40) or UDim2.new(0, 300, 0, 300)
    TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = targetSize}):Play()
    Content.Visible = not Settings.IsMinimized
end)

ToggleBtn.MouseButton1Click:Connect(function()
    Settings.Enabled = not Settings.Enabled
    Settings.Invisible = false
    ToggleBtn.Text = Settings.Enabled and "HITBOX: ENABLED" or "HITBOX: DISABLED"
    ToggleBtn.BackgroundColor3 = Settings.Enabled and Color3.fromRGB(0, 180, 100) or Color3.fromRGB(40, 40, 45)
    InvisibleBtn.Text = "HITBOX INVISIBLE: DISABLED"
    InvisibleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    if not Settings.Enabled then ResetHitboxes() end
end)

InvisibleBtn.MouseButton1Click:Connect(function()
    Settings.Invisible = not Settings.Invisible
    Settings.Enabled = false
    InvisibleBtn.Text = Settings.Invisible and "HITBOX INVISIBLE: ENABLED" or "HITBOX INVISIBLE: DISABLED"
    InvisibleBtn.BackgroundColor3 = Settings.Invisible and Color3.fromRGB(80, 0, 180) or Color3.fromRGB(40, 40, 45)
    ToggleBtn.Text = "HITBOX: DISABLED"
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    if not Settings.Invisible then ResetHitboxes() end
end)

CloseBtn.MouseButton1Click:Connect(function()
    Settings.Enabled = false
    Settings.Invisible = false
    ResetHitboxes()
    ScreenGui:Destroy()
end)

local dragging, dragInput, dragStart, startPos
local function update(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true; dragStart = input.Position; startPos = MainFrame.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then update(input) end
end)

RunService.RenderStepped:Connect(function()
    if Settings.Enabled or Settings.Invisible then
        local transparencyValue = Settings.Invisible and 1 or Settings.Transparency
        local colorValue = Settings.Invisible and BrickColor.new("Medium stone grey") or BrickColor.new("Neon orange")
        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    root.Size = Vector3.new(Settings.HitboxSize, Settings.HitboxSize, Settings.HitboxSize)
                    root.Transparency = transparencyValue
                    root.BrickColor = colorValue
                    root.CanCollide = false
                end
            end
        end
    end
end)
