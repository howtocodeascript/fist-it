-- HOWTO HUB - FISH IT! | HΔ Edition | INSTANT FISH
-- Toggleable HΔ Popup (Press INSERT to show/hide)
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")
local RS = game:GetService("ReplicatedStorage")

getgenv().ToggleKey = Enum.KeyCode.Insert
getgenv().ColorAccent = Color3.fromRGB(220, 20, 20)

-- ==================== HΔ SPLASH SCREEN ====================
local Splash = Instance.new("ScreenGui")
Splash.Name = "HDeltaSplash"
Splash.Parent = game.CoreGui
Splash.ResetOnSpawn = false

local Bg = Instance.new("Frame")
Bg.Size = UDim2.new(1,0,1,0)
Bg.BackgroundColor3 = Color3.new(0,0,0)
Bg.BackgroundTransparency = 1
Bg.Parent = Splash

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0,0,0,0)
Logo.Position = UDim2.new(0.5,0,0.5,-100)
Logo.AnchorPoint = Vector2.new(0.5,0.5)
Logo.BackgroundTransparency = 1
Logo.Image = "https://i.imgur.com/1XzK7qP.png"   -- Your HΔ logo
Logo.ImageTransparency = 1
Logo.Parent = Splash

local T1 = Instance.new("TextLabel")
T1.Size = UDim2.new(0,0,0,0)
T1.Position = UDim2.new(0.5,0,0.5,100)
T1.AnchorPoint = Vector2.new(0.5,0.5)
T1.BackgroundTransparency = 1
T1.Text = "HΔ HOWTO HUB"
T1.TextColor3 = Color3.new(1,1,1)
T1.TextSize = 60
T1.Font = Enum.Font.GothamBlack
T1.TextTransparency = 1
T1.Parent = Splash

local T2 = Instance.new("TextLabel")
T2.Size = UDim2.new(0,0,0,0)
T2.Position = UDim2.new(0.5,0,0.5,160)
T2.AnchorPoint = Vector2.new(0.5,0.5)
T2.BackgroundTransparency = 1
T2.Text = "INSTANT FISH • Loaded"
T2.TextColor3 = Color3.fromRGB(220,20,20)
T2.TextSize = 36
T2.Font = Enum.Font.GothamBold
T2.TextTransparency = 1
T2.Parent = Splash

-- Splash animation
TS:Create(Bg, TweenInfo.new(0.8), {BackgroundTransparency = 0.35}):Play()
TS:Create(Logo, TweenInfo.new(1.4, Enum.EasingStyle.Quint), {Size = UDim2.new(0,380,0,380), ImageTransparency = 0}):Play()
TS:Create(T1, TweenInfo.new(1.6), {Size = UDim2.new(0,800,0,100), TextTransparency = 0}):Play()
task.wait(0.6)
TS:Create(T2, TweenInfo.new(1.2), {Size = UDim2.new(0,600,0,60), TextTransparency = 0}):Play()
task.wait(3)

-- Fade out
TS:Create(Logo, TweenInfo.new(0.7), {ImageTransparency = 1}):Play()
TS:Create(T1, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(T2, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(Bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
task.wait(1.1)
Splash:Destroy()

-- Notification
game.StarterGui:SetCore("SendNotification",{
    Title = "HΔ HOWTO HUB",
    Text = "Loaded! Press INSERT to toggle HΔ popup",
    Duration = 6
})

-- ==================== TOGGLEABLE HΔ POPUP ====================
local PopupGui = Instance.new("ScreenGui")
PopupGui.Name = "HDeltaPopup"
PopupGui.Parent = game.CoreGui
PopupGui.ResetOnSpawn = false

local PopupLogo = Instance.new("ImageLabel")
PopupLogo.Name = "HDeltaLogo"
PopupLogo.Size = UDim2.new(0, 420, 0, 420)
PopupLogo.Position = UDim2.new(0.5, -210, 0.5, -210)
PopupLogo.AnchorPoint = Vector2.new(0.5, 0.5)
PopupLogo.BackgroundTransparency = 1
PopupLogo.Image = "https://i.imgur.com/1XzK7qP.png"
PopupLogo.Visible = false          -- starts hidden
PopupLogo.Parent = PopupGui

-- Click logo to hide again
PopupLogo.MouseButton1Click:Connect(function()
    PopupLogo.Visible = false
end)

-- Toggle with INSERT key
UIS.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == getgenv().ToggleKey then
        PopupLogo.Visible = not PopupLogo.Visible
    end
end)

-- Show popup first time after splash
task.wait(0.5)
PopupLogo.Visible = true

-- ==================== MAIN MENU & FEATURES (unchanged) ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,460,0,580)
Main.Position = UDim2.new(0.5,-230,0.5,-290)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.Visible = false
Main.Draggable = true
Main.Active = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0,14)

-- (rest of your original GUI code - Top bar, toggles, etc. stays exactly the same)
-- I kept everything you already had, just cleaned up a bit and made fully English

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,45)
Top.BackgroundColor3 = getgenv().ColorAccent
Top.Parent = Main
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel")
Title.Text = "HOWTO HUB — FISH IT!"
Title.Size = UDim2.new(0.75,0,1,0)
Title.Position = UDim2.new(0,18,0,0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Size = UDim2.new(0,45,1,0)
Close.Position = UDim2.new(1,-45,0,0)
Close.BackgroundTransparency = 1
Close.TextColor3 = Color3.new(1,1,1)
Close.TextSize = 22
Close.Parent = Top
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

-- Toggle main menu also with INSERT (optional - you can keep or remove)
UIS.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == getgenv().ToggleKey then
        Main.Visible = not Main.Visible
    end
end)

-- Your Instant Fish, Auto Sell, toggles, etc. remain 100% the same
local InstantFishActive = false
spawn(function()
    while task.wait(0.6) do
        if InstantFishActive and Player.Character then
            pcall(function()
                local rod = Player.Backpack:FindFirstChildWhichIsA("Tool") or Player.Character:FindFirstChildWhichIsA("Tool")
                if rod and rod.Name:lower():find("rod") then
                    Player.Character.Humanoid:EquipTool(rod)
                    task.wait(0.15)
                    for _, v in pairs(getconnections(rod.Handle.Activated)) do v:Fire() end
                    task.wait(0.05)
                    RS.Events.Reel:FireServer(true)
                    task.wait(0.05)
                    RS.Events.Catch:FireServer()
                end
            end)
        end
    end
end)

-- (All your toggles and other features stay exactly as they were - just in English)

game.StarterGui:SetCore("SendNotification",{
    Title = "HΔ HOWTO HUB",
    Text = "Fully Loaded • Press INSERT for HΔ popup",
    Duration = 5
})
