-- HΔ HOWTO HUB - FISH IT! | POP-UP EDITION (Click Logo to Toggle)
-- Based on original script + HΔ splash & clickable logo (no Insert needed)
local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")

getgenv().HubName = "HΔ HOWTO HUB"
getgenv().ColorAccent = Color3.fromRGB(220, 20, 20)
getgenv().ColorBG = Color3.fromRGB(15, 15, 15)

-- Variabel status (all default OFF)
getgenv().AutoFish = false
getgenv().AutoSell = false
getgenv().AutoBuyRod = false
getgenv().AntiAFK = false
getgenv().InfJump = false

-- ==================== HΔ SPLASH SCREEN (Like Your Screenshot) ====================
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
Logo.Image = "https://i.imgur.com/1XzK7qP.png"  -- Black HΔ logo (match your screenshot)
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
TS:Create(Logo, TweenInfo.new(0.7), {ImageTransparency = 1}):Play()
TS:Create(T1, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(T2, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(Bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
task.wait(1.1)
Splash:Destroy()

-- ==================== CLICKABLE HΔ LOGO (Always Visible, Bottom-Left) ====================
local LogoGui = Instance.new("ScreenGui")
LogoGui.Name = "HDeltaLogo"
LogoGui.Parent = game.CoreGui
LogoGui.ResetOnSpawn = false

local ClickLogo = Instance.new("ImageLabel")
ClickLogo.Size = UDim2.new(0,120,0,120)
ClickLogo.Position = UDim2.new(0,20,1,-140)  -- Bottom-left corner
ClickLogo.BackgroundTransparency = 1
ClickLogo.Image = "https://i.imgur.com/1XzK7qP.png"  -- HΔ logo
ClickLogo.Parent = LogoGui

-- ==================== MAIN GUI MENU ====================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0,460,0,580)
Main.Position = UDim2.new(0.5,-230,0.5,-290)
Main.BackgroundColor3 = getgenv().ColorBG
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
Title.Text = getgenv().HubName.." | FISH IT!"
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

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1,-20,1,-60)
Content.Position = UDim2.new(0,10,0,55)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = getgenv().ColorAccent
Content.Parent = Main

local List = Instance.new("UIListLayout")
List.Padding = UDim.new(0,10)
List.Parent = Content

-- Toggle & Button functions (English notifications)
local function NewToggle(name, callback)
    local Frame = Instance.new("Frame")
    local Btn = Instance.new("TextButton")
    local Ind = Instance.new("Frame")
    Frame.Size = UDim2.new(1,0,0,46)
    Frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Frame.Parent = Content
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,10)

    Btn.Size = UDim2.new(1,0,1,0)
    Btn.BackgroundTransparency = 1
    Btn.Text = "  "..name
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.TextSize = 17
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = Frame

    Ind.Size = UDim2.new(0,36,0,18)
    Ind.Position = UDim2.new(1,-50,0.5,-9)
    Ind.BackgroundColor3 = Color3.fromRGB(50,50,50)
    Ind.Parent = Frame
    Instance.new("UICorner", Ind).CornerRadius = UDim.new(1,0)

    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        TS:Create(Ind, TweenInfo.new(0.25), {BackgroundColor3 = state and getgenv().ColorAccent or Color3.fromRGB(50,50,50)}):Play()
        callback(state)
    end)
end

local function NewButton(name, callback)
    local Frame = Instance.new("Frame")
    local Btn = Instance.new("TextButton")
    Frame.Size = UDim2.new(1,0,0,46)
    Frame.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Frame.Parent = Content
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,10)

    Btn.Size = UDim2.new(1,0,1,0)
    Btn.BackgroundTransparency = 1
    Btn.Text = "  "..name
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.TextSize = 17
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.Parent = Frame
    Btn.MouseButton1Click:Connect(callback)
end

local function N(text)
    game.StarterGui:SetCore("SendNotification", {Title = getgenv().HubName; Text = text; Duration = 4})
end

-- CLICK LOGO TO TOGGLE MENU (No Insert!)
ClickLogo.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
end)
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

-- ==================== FEATURES (English) ====================
NewToggle("Auto Fish Ultra", function(v)
    getgenv().AutoFish = v
    N(v and "Auto Fish: ENABLED" or "Auto Fish: DISABLED")
    if v then
        spawn(function()
            while getgenv().AutoFish do
                pcall(function()
                    local rod = Player.Backpack:FindFirstChildWhichIsA("Tool") or Player.Character:FindFirstChildWhichIsA("Tool")
                    if rod then
                        Player.Character.Humanoid:EquipTool(rod)
                        task.wait(0.2)
                        VU:ClickButton1(Vector2.new())
                        task.wait(0.22)
                        for i=1,45 do VU:ClickButton1(Vector2.new()) task.wait(0.012) end
                        task.wait(0.18)
                    end
                end)
                task.wait(0.03)
            end
        end)
    end
end)

NewToggle("Auto Sell + TP", function(v)
    getgenv().AutoSell = v
    N(v and "Auto Sell + TP: ENABLED" or "Auto Sell: DISABLED")
end)
spawn(function()
    while task.wait(3) do
        if getgenv().AutoSell and #Player.Backpack:GetChildren() >= 38 then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(0,50,0)
            task.wait(2)
            for _,p in pairs(workspace:GetDescendants()) do
                if p:IsA("ProximityPrompt") and p.Parent.Name:lower():find("sell") then
                    fireproximityprompt(p)
                end
            end
            task.wait(4)
        end
        task.wait(5)
    end
end)

NewToggle("Auto Buy Best Rod", function(v)
    getgenv().AutoBuyRod = v
    N(v and "Auto Buy Rod: ENABLED" or "Auto Buy Rod: DISABLED")
end)
spawn(function()
    while true do
        if getgenv().AutoBuyRod then
            pcall(function()
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and obj.Parent and obj.Parent.Name:find("Rod") and Player.leaderstats.Money.Value >= 500000 then
                        Player.Character.HumanoidRootPart.CFrame = obj.Parent.CFrame
                        task.wait(1)
                        fireproximityprompt(obj)
                        task.wait(2)
                        break
                    end
                end
            end)
        end
        task.wait(3)
    end
end)

NewToggle("Anti-AFK", function(v)
    getgenv().AntiAFK = v
    N(v and "Anti-AFK: ENABLED" or "Anti-AFK: DISABLED")
    if v then
        Player.Idled:Connect(function()
            VU:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VU:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
end)

NewToggle("Infinite Jump", function(v)
    getgenv().InfJump = v
    N(v and "Infinite Jump: ENABLED" or "Infinite Jump: DISABLED")
end)
UIS.JumpRequest:Connect(function()
    if getgenv().InfJump then
        Player.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)

-- Teleport Buttons
NewButton("Ancient Jungle", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1247, 25, -1842) end)
NewButton("Kohana Village", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(1520, 30, -930) end)
NewButton("Bloodmoon Island", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(3200, 80, 2100) end)
NewButton("Deep Ocean", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-500, -200, -3000) end)
NewButton("Spawn / Sell", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) end)

N("HΔ HOWTO HUB Loaded 100%! Click the HΔ logo to open menu")
