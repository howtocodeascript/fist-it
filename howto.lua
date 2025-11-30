local Player = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local VU = game:GetService("VirtualUser")

-- Settingan kamu
getgenv().HubName = "HOWTO HUB"
getgenv().ToggleKey = Enum.KeyCode.Insert
getgenv().ColorAccent = Color3.fromRGB(220, 20, 20)
getgenv().ColorBG = Color3.fromRGB(15, 15, 15)

-- Variabel status (semua default MATI)
getgenv().AutoFish = false
getgenv().AutoSell = false
getgenv().AutoBuyRod = false
getgenv().AntiAFK = false
getgenv().InfJump = false

-- === UI SAMA PERSIS KAYAK SEBELUMNYA (aku ringkas biar cepet) ===
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

-- Toggle & Button function
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

UIS.InputBegan:Connect(function(i) if i.KeyCode == getgenv().ToggleKey then Main.Visible = not Main.Visible end end)
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

-- === SEMUA FITUR + ON/OFF SENDIRI ===
NewToggle("Auto Fish Ultra", function(v)
    getgenv().AutoFish = v
    N(v and "Auto Fish NYALA" or "Auto Fish MATI")
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
    N(v and "Auto Sell + TP NYALA" or "Auto Sell MATI")
end)
spawn(function()
    while task.wait(3)
    while true do
        if getgenv().AutoSell and #Player.Backpack:GetChildren() >= 38 then
            Player.Character.HumanoidRootPart.CFrame = CFrame.new(0,50,0) -- spawn/sell area
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
    N(v and "Auto Buy Rod NYALA" or "Auto Buy Rod MATI")
end)
spawn(function()
    while true do
        if getgenv().AutoBuyRod then
            pcall(function()
                for _,obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") and obj.Parent and obj.Parent.Name:find("Rod") and Player.leaderstats.Money.Value >= 500000 then -- contoh harga tinggi
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
    N(v and "Anti-AFK NYALA" or "Anti-AFK MATI")
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
    N(v and "Infinite Jump NYALA" or "Infinite Jump MATI")
end)
UIS.JumpRequest:Connect(function()
    if getgenv().InfJump then
        Player.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)

-- Teleport Buttons (bisa dipenc aja nyala)
NewButton("Ancient Jungle", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-1247, 25, -1842) end)
NewButton("Kohana Village", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(1520, 30, -930) end)
NewButton("Bloodmoon Island", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(3200, 80, 2100) end)
NewButton("Deep Ocean", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(-500, -200, -3000) end)
NewButton("Spawn / Sell", function() Player.Character.HumanoidRootPart.CFrame = CFrame.new(0, 50, 0) end)

N("HOWTO HUB FISH IT! Loaded 100%\nSemua fitur bisa ON/OFF sendiri\nTekan INSERT buat buka menu")
