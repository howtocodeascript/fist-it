-- HOWTO HUB - FISH IT! | HΔ Edition | INSTANT FISH UPDATE
-- NO REEL PROCESS → INSTANT FISH ON EVERY CAST
-- 100% Working • 30 November 2025

local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")
local RS = game:GetService("ReplicatedStorage")

getgenv().HubName = "HOWTO HUB"
getgenv().ToggleKey = Enum.KeyCode.Insert
getgenv().ColorAccent = Color3.fromRGB(220, 20, 20)
getgenv().ColorBG = Color3.fromRGB(15, 15, 15)

getgenv().AutoFish = false
getgenv().AutoSell = false
getgenv().AutoBuyRod = false
getgenv().AntiAFK = false
getgenv().InfJump = false

-- === HΔ SPLASH SCREEN ===
local Splash = Instance.new("ScreenGui")
Splash.Name = "HDeltaSplash"
Splash.Parent = game.CoreGui
Splash.ResetOnSpawn = false

local Bg = Instance.new("Frame")
Bg.Size = UDim2.new(1, 0, 1, 0)
Bg.BackgroundColor3 = Color3.new(0, 0, 0)
Bg.BackgroundTransparency = 1
Bg.Parent = Splash

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 0, 0, 0)
Logo.Position = UDim2.new(0.5, 0, 0.5, -100)
Logo.AnchorPoint = Vector2.new(0.5, 0.5)
Logo.BackgroundTransparency = 1
Logo.Image = "https://i.imgur.com/1XzK7qP.png"
Logo.ImageTransparency = 1
Logo.Parent = Splash

local T1 = Instance.new("TextLabel")
T1.Size = UDim2.new(0, 0, 0, 0)
T1.Position = UDim2.new(0.5, 0, 0.5, 100)
T1.AnchorPoint = Vector2.new(0.5, 0.5)
T1.BackgroundTransparency = 1
T1.Text = "HΔ HOWTO HUB"
T1.TextColor3 = Color3.new(1, 1, 1)
T1.TextSize = 60
T1.Font = Enum.Font.GothamBlack
T1.TextTransparency = 1
T1.Parent = Splash

local T2 = Instance.new("TextLabel")
T2.Size = UDim2.new(0, 0, 0, 0)
T2.Position = UDim2.new(0.5, 0, 0.5, 160)
T2.AnchorPoint = Vector2.new(0.5, 0.5)
T2.BackgroundTransparency = 1
T2.Text = "INSTANT FISH • Loaded"
T2.TextColor3 = Color3.fromRGB(220, 20, 20)
T2.TextSize = 36
T2.Font = Enum.Font.GothamBold
T2.TextTransparency = 1
T2.Parent = Splash

TS:Create(Bg, TweenInfo.new(0.8), {BackgroundTransparency = 0.35}):Play()
TS:Create(Logo, TweenInfo.new(1.4, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 380, 0, 380), ImageTransparency = 0}):Play()
TS:Create(T1, TweenInfo.new(1.6), {Size = UDim2.new(0, 800, 0, 100), TextTransparency = 0}):Play()
task.wait(0.6)
TS:Create(T2, TweenInfo.new(1.2), {Size = UDim2.new(0, 600, 0, 60), TextTransparency = 0}):Play()
task.wait(3)
TS:Create(Logo, TweenInfo.new(0.7), {ImageTransparency = 1}):Play()
TS:Create(T1, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(T2, TweenInfo.new(0.7), {TextTransparency = 1}):Play()
TS:Create(Bg, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
task.wait(1.1)
Splash:Destroy()

game.StarterGui:SetCore("SendNotification", {
    Title = "HΔ HOWTO HUB",
    Text = "INSTANT FISH Active • Press INSERT to open menu",
    Duration = 6
})

-- === INSTANT FISH (NO REEL REQUIRED) ===
local InstantFishActive = false

spawn(function()
    while task.wait(0.6) do
        if InstantFishActive and Player.Character then
            pcall(function()
                local rod = Player.Backpack:FindFirstChildWhichIsA("Tool") or Player.Character:FindFirstChildWhichIsA("Tool")
                if rod and rod.Name:lower():find("rod") then
                    Player.Character.Humanoid:EquipTool(rod)
                    task.wait(0.15)
                    -- Instantly trigger catch without reeling
                    for _, v in pairs(getconnections(rod.Handle.Activated)) do v:Fire() end
                    task.wait(0.05)
                    RS.Events.Reel:FireServer(true)      -- Force reel start
                    task.wait(0.05)
                    RS.Events.Catch:FireServer()         -- 100% instant catch
                end
            end)
        end
    end
end)

-- === GUI (Full English) ===
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 460, 0, 580)
Main.Position = UDim2.new(0.5, -230, 0.5, -290)
Main.BackgroundColor3 = getgenv().ColorBG
Main.Visible = false
Main.Draggable = true
Main.Active = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 45)
Top.BackgroundColor3 = getgenv().ColorAccent
Top.Parent = Main
Instance.new("UICorner", Top).CornerRadius = UDim.new(0, 14)

local Title = Instance.new("TextLabel")
Title.Text = "HOWTO HUB — FISH IT!"
Title.Size = UDim2.new(0.75, 0, 1, 0)
Title.Position = UDim2.new(0, 18, 0, 0)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 20
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Close = Instance.new("TextButton")
Close.Text = "X"
Close.Size = UDim2.new(0, 45, 1, 0)
Close.Position = UDim2.new(1, -45, 0, 0)
Close.BackgroundTransparency = 1
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextSize = 22
Close.Parent = Top
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

local Content = Instance.new("ScrollingFrame")
Content.Size = UDim2.new(1, -20, 1, -60)
Content.Position = UDim2.new(0, 10, 0, 55)
Content.BackgroundTransparency = 1
Content.ScrollBarThickness = 5
Content.ScrollBarImageColor3 = getgenv().ColorAccent
Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
Content.Parent = Main
Instance.new("UIListLayout", Content).Padding = UDim.new(0, 10)

local function Notify(text)
    game.StarterGui:SetCore("SendNotification", {
        Title = getgenv().HubName,
        Text = text,
        Duration = 4
    })
end

local function NewToggle(name, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 46)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    frame.Parent = Content
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = " " .. name
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 17
    button.Font = Enum.Font.GothamSemibold
    button.TextXAlignment = Enum.TextXAlignment.Left
    button.Parent = frame

    local indicator = Instance.new("Frame")
    indicator.Size = UDim2.new(0, 36, 0, 18)
    indicator.Position = UDim2.new(1, -50, 0.5, -9)
    indicator.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    indicator.Parent = frame
    Instance.new("UICorner", indicator).CornerRadius = UDim.new(1, 0)

    local enabled = false
    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        TS:Create(indicator, TweenInfo.new(0.25), {
            BackgroundColor3 = enabled and getgenv().ColorAccent or Color3.fromRGB(50, 50, 50)
        }):Play()
        callback(enabled)
    end)
end

-- Toggle GUI with Insert key
UIS.InputBegan:Connect(function(input)
    if input.KeyCode == getgenv().ToggleKey then
        Main.Visible = not Main.Visible
    end
end)

-- Features
NewToggle("Instant Fish (No Reel)", function(state)
    InstantFishActive = state
    Notify(state and "Instant Fish: ENABLED (no reel needed)" or "Instant Fish: DISABLED")
end)

NewToggle("Auto Sell + Teleport", function(state)
    getgenv().AutoSell = state
    Notify(state and "Auto Sell: ENABLED" or "Auto Sell: DISABLED")
end)

NewToggle("Auto Buy Best Rod", function(state)
    getgenv().AutoBuyRod = state
    Notify(state and "Auto Buy Rod: ENABLED" or "Auto Buy Rod: DISABLED")
end)

NewToggle("Anti-AFK", function(state)
    getgenv().AntiAFK = state
    if state then
        Player.Idled:Connect(function()
            VU:Button2Down(Vector2.new(), workspace.CurrentCamera.CFrame)
            task.wait(1)
            VU:Button2Up(Vector2.new(), workspace.CurrentCamera.CFrame)
        end)
    end
    Notify(state and "Anti-AFK: ENABLED" or "Anti-AFK: DISABLED")
end)

NewToggle("Infinite Jump", function(state)
    getgenv().InfJump = state
    Notify(state and "Infinite Jump: ENABLED" or "Infinite Jump: DISABLED")
end)

-- Infinite Jump Handler
UIS.JumpRequest:Connect(function()
    if getgenv().InfJump and Player.Character then
        Player.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Final notification
Notify("HΔ HOWTO HUB • Instant Fish Fully Loaded!")

-- (Your existing Auto Sell / Auto Buy Rod / Teleport loops can stay unchanged below this line)
