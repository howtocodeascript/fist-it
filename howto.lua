-- HΔ HOWTO HUB - FISH IT! | CUSTOM ROBLOX ASSET (ID: 14843582131)
-- Click Logo to Toggle Menu • Mobile + PC Friendly
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")
local RS = game:GetService("ReplicatedStorage")

getgenv().ColorAccent = Color3.fromRGB(220, 20, 20)

-- ==================== SPLASH SCREEN (Custom Asset) ====================
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
Logo.Image = "rbxassetid://14843582131"  -- GAMBAR KAMU!
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

-- Animasi splash
TS:Create(Bg, TweenInfo.new(0.8), {BackgroundTransparency = 0.35}):Play()
TS:Create(Logo, TweenInfo.new(1.4, Enum.EasingStyle.Quint), {Size = UDim2.new(0,380,0,380), ImageTransparency = 0}):Play()
TS:Create(T1, TweenInfo.new(1.6), {Size = UDim2.new(0,800,0,100), TextTransparency = 0}):Play()
task.wait(0.6)
TS:Create(T2, TweenInfo.new(1.2), {Size = UDim2.new(0,600,0,60), TextTransparency = 0}):Play()
task.wait(3)
TS:Create(Logo, TweenInfo.new(0.7), {ImageTransparency = 1}):Play()
TS:Create(T1, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(T2, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(Bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
task.wait(1.1)
Splash:Destroy()

game.StarterGui:SetCore("SendNotification", {Title = "HΔ HOWTO HUB", Text = "Loaded! Click logo to open menu", Duration = 6})

-- ==================== CLICKABLE LOGO (Custom Asset) ====================
local LogoGui = Instance.new("ScreenGui")
LogoGui.Name = "HDeltaLogoGui"
LogoGui.Parent = game.CoreGui
LogoGui.ResetOnSpawn = false

local ClickLogo = Instance.new("ImageLabel")
ClickLogo.Size = UDim2.new(0,120,0,120)
ClickLogo.Position = UDim2.new(0,20,1,-140)  -- Bottom-left
ClickLogo.BackgroundTransparency = 1
ClickLogo.Image = "rbxassetid://14843582131"  -- GAMBAR KAMU LAGI!
ClickLogo.Parent = LogoGui

-- ==================== MAIN MENU ====================
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

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1,0,0,45)
Top.BackgroundColor3 = getgenv().ColorAccent
Top.Parent = Main
Instance.new("UICorner", Top).CornerRadius = UDim.new(0,14)

local Title = Instance.new("TextLabel")
Title.Text = "HΔ HOWTO HUB — FISH IT!"
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

-- KLIK LOGO = BUKA/TUTUP MENU
ClickLogo.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1,-20,1,-60)
Content.Position = UDim2.new(0,10,0,55)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = getgenv().ColorAccent
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = Main
Instance.new("UIListLayout", Content).Padding = UDim.new(0,10)

local function Notify(text)
    game.StarterGui:SetCore("SendNotification", {Title = "HΔ HOWTO HUB", Text = text, Duration = 4})
end

local function NewToggle(name, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1,0,0,46)
    frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
    frame.Parent = Content
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1,0,1,0)
    btn.BackgroundTransparency = 1
    btn.Text = "  "..name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 17
    btn.Font = Enum.Font.GothamSemibold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = frame

    local ind = Instance.new("Frame")
    ind.Size = UDim2.new(0,36,0,18)
    ind.Position = UDim2.new(1,-50,0.5,-9)
    ind.BackgroundColor3 = Color3.fromRGB(50,50,50)
    ind.Parent = frame
    Instance.new("UICorner", ind).CornerRadius = UDim.new(1,0)

    local on = false
    btn.MouseButton1Click:Connect(function()
        on = not on
        TS:Create(ind, TweenInfo.new(0.25), {BackgroundColor3 = on and getgenv().ColorAccent or Color3.fromRGB(50,50,50)}):Play()
        callback(on)
    end)
end

local function NewButton(name, callback)
    local frame = Instance.new("Frame")
    local btn = Instance.new("TextButton")
    frame.Size = UDim2.new(1,0,0,46)
    frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
    frame.Parent = Content
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,10)

    btn.Size = UDim2.new(1,0,1,0)
    btn.BackgroundTransparency = 1
    btn.Text = "  "..name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 17
    btn.Font = Enum.Font.GothamSemibold
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = frame
    btn.MouseButton1Click:Connect(callback)
end

-- ==================== FEATURES ====================
local InstantFishActive = false
NewToggle("Instant Fish (No Reel)", function(v)
    InstantFishActive = v
    Notify(v and "Instant Fish: ENABLED" or "Instant Fish: DISABLED")
end)

NewToggle("Auto Sell + Teleport", function(v)
    getgenv().AutoSell = v
    Notify(v and "Auto Sell: ENABLED" or "Auto Sell: DISABLED")
end)

NewToggle("Auto Buy Best Rod", function(v)
    getgenv().AutoBuyRod = v
    Notify(v and "Auto Buy Rod: ENABLED" or "Auto Buy Rod: DISABLED")
end)

NewToggle("Anti-AFK", function(v)
    getgenv().AntiAFK = v
    if v then
        Player.Idled:Connect(function()
            VU:Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VU:Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
        end)
    end
    Notify(v and "Anti-AFK: ENABLED" or "Anti-AFK: DISABLED")
end)

NewToggle("Infinite Jump", function(v)
    getgenv().InfJump = v
    Notify(v and "Infinite Jump: ENABLED" or "Infinite Jump: DISABLED")
end)

UIS.JumpRequest:Connect(function()
    if getgenv().InfJump and Player.Character then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Instant Fish Loop
spawn(function()
    while task.wait(0.6) do
        if InstantFishActive and Player.Character then
            pcall(function()
                local rod = Player.Backpack:FindFirstChildWhichIsA("Tool") or Player.Character:FindFirstChildWhichIsA("Tool")
                if rod and rod.Name:lower():find("rod") then
                    Player.Character.Humanoid:EquipTool(rod)
                    task.wait(0.15)
                    for _,v in pairs(getconnections(rod.Handle.Activated)) do v:Fire() end
                    task.wait(0.05)
                    RS.Events.Reel:FireServer(true)
                    task.wait(0.05)
                    RS.Events.Catch:FireServer()
                end
            end)
        end
    end
end)

-- Teleport Buttons
NewButton("Ancient Jungle", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1247, 25, -1842) end)
NewButton("Kohana Village", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(1520, 30, -930) end)
NewButton("Bloodmoon Island", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(3200, 80, 2100) end)
NewButton("Deep Ocean", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-500, -200, -3000) end)
NewButton("Spawn / Sell", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) end)

Notify("HΔ HOWTO HUB Loaded with Custom Asset! Click logo to open menu")
