local function sendAlert(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title;
        Text = text;
        Duration = 5; -- how long it shows
    })
end

local gameScripts = {
    [94590879393563] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ttwizz/Open-Aimbot/master/source.lua", true))()
    end,
    [10449761463] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Games/TSB.lua"))()
    end,
  [18668065416] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://rawscripts.net/raw/KING-Blue-Lock:-Rivals-XZuyaX-HUB-34466"))()
    end,
  [13772394625] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JosiahScripts/Cryzix-BB/refs/heads/main/obfuscated%20(4).txt"))()
    end,
  [78041891124723] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://sk1d.org/file?free=e103f4af"))()
    end,
  [126884695634066] = function()
        sendAlert("Auto Executor", "Script Loaded")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ameicaa1/Grow-a-Garden/main/Grow_A_Garden.lua"))()
  end,
    [5044920251, 91111000005100, 83805081402874, 12904623748, 4575976957, 5915341487, 16730783852] = function()
        sendAlert("Auto Executor", "Script Loaded")
    WallHop Nexus v3.0
    Created by: QuantumFlux
    Description:
    - Highly futuristic UI
    - Fully Draggable, Minimize/Expand
    - Separate Guide Panel (Open/Close)
    - Smooth Animations, Glow Effects
    - WallHop On/Off Toggle
    - Notifications
    - Clean Structure
]]

-- Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "WallHopNexus"
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.ResetOnSpawn = false

-- Blur Effect Background
local blur = Instance.new("BlurEffect")
blur.Size = 0
blur.Parent = workspace

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Parent = screenGui
frame.Size = UDim2.new(0, 350, 0, 250)
frame.Position = UDim2.new(0.5, -175, 0.5, -125)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local frameCorner = Instance.new("UICorner", frame)
frameCorner.CornerRadius = UDim.new(0, 12)

-- Title Label
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "WallHop Nexus"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextScaled = true

-- Status Label
local statusLabel = Instance.new("TextLabel")
statusLabel.Parent = frame
statusLabel.Size = UDim2.new(1, -20, 0, 20)
statusLabel.Position = UDim2.new(0, 10, 0, 45)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Disabled"
statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 16
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Buttons Container
local buttonHolder = Instance.new("Frame")
buttonHolder.Parent = frame
buttonHolder.Size = UDim2.new(1, -20, 0, 60)
buttonHolder.Position = UDim2.new(0, 10, 0, 70)
buttonHolder.BackgroundTransparency = 1

local buttonLayout = Instance.new("UIGridLayout", buttonHolder)
buttonLayout.CellPadding = UDim2.new(0, 10, 0, 10)
buttonLayout.CellSize = UDim2.new(0.45, 0, 0, 40)

-- Helper Function to Create Button
local function createButton(name, color)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.Text = name
    btn.Size = UDim2.new(0, 140, 0, 40)
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0, 8)
    btn.Parent = buttonHolder
    return btn
end

-- Buttons
local activateButton = createButton("Activate", Color3.fromRGB(0, 200, 100))
local deactivateButton = createButton("Deactivate", Color3.fromRGB(200, 50, 50))
local minimizeButton = createButton("Minimize", Color3.fromRGB(50, 150, 255))
local guideButton = createButton("Guide", Color3.fromRGB(255, 200, 50))
local destroyButton = createButton("Self-Destruct", Color3.fromRGB(150, 50, 150))

-- Notification Label
local notification = Instance.new("TextLabel")
notification.Parent = screenGui
notification.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
notification.BackgroundTransparency = 0.4
notification.Size = UDim2.new(0, 200, 0, 40)
notification.Position = UDim2.new(0.5, -100, 0.1, 0)
notification.Text = ""
notification.TextColor3 = Color3.fromRGB(255, 255, 255)
notification.Font = Enum.Font.GothamBold
notification.TextScaled = true
notification.Visible = false
local notifCorner = Instance.new("UICorner", notification)
notifCorner.CornerRadius = UDim.new(0, 8)

-- Guide Frame
local guideFrame = Instance.new("Frame")
guideFrame.Parent = screenGui
guideFrame.Size = UDim2.new(0, 300, 0, 300)
guideFrame.Position = UDim2.new(0.5, 180, 0.5, -150)
guideFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
guideFrame.BackgroundTransparency = 0.1
guideFrame.Visible = false
guideFrame.Active = true
guideFrame.Draggable = true
local guideCorner = Instance.new("UICorner", guideFrame)
guideCorner.CornerRadius = UDim.new(0, 12)

local guideTitle = Instance.new("TextLabel")
guideTitle.Parent = guideFrame
guideTitle.Size = UDim2.new(1, 0, 0, 30)
guideTitle.Text = "WallHop Guide"
guideTitle.BackgroundTransparency = 1
guideTitle.Font = Enum.Font.GothamBold
guideTitle.TextColor3 = Color3.fromRGB(0, 255, 255)
guideTitle.TextScaled = true

local guideContent = Instance.new("TextLabel")
guideContent.Parent = guideFrame
guideContent.Size = UDim2.new(1, -20, 1, -40)
guideContent.Position = UDim2.new(0, 10, 0, 30)
guideContent.TextWrapped = true
guideContent.BackgroundTransparency = 1
guideContent.Font = Enum.Font.Gotham
guideContent.TextColor3 = Color3.fromRGB(200, 200, 200)
guideContent.TextScaled = false
guideContent.TextSize = 14
guideContent.TextYAlignment = Enum.TextYAlignment.Top
guideContent.Text = "• Activate = Enable WallHop\n• Deactivate = Disable WallHop\n• Minimize = Hide Main Panel\n• Guide = Show/Hide this guide\n• Self-Destruct = Destroy everything"

-- Variables
local wallHopEnabled = false
local infiniteJumpLock = true
local minimized = false

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

-- Functions
local function showNotification(text)
    notification.Text = text
    notification.Visible = true
    TweenService:Create(notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -100, 0.15, 0)}):Play()
    task.wait(2)
    TweenService:Create(notification, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -100, 0.1, 0)}):Play()
    task.wait(0.5)
    notification.Visible = false
end

local function isNearWall()
    if not player.Character then return false end
    local root = player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return false end

    raycastParams.FilterDescendantsInstances = {player.Character}
    local directions = {
        root.CFrame.LookVector,
        -root.CFrame.LookVector,
        root.CFrame.RightVector,
        -root.CFrame.RightVector
    }
    
    for _, dir in ipairs(directions) do
        if workspace:Raycast(root.Position, dir * 3, raycastParams) then
            return true
        end
    end
    return false
end

-- Button Connections
activateButton.MouseButton1Click:Connect(function()
    wallHopEnabled = true
    statusLabel.Text = "Status: Enabled"
    statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    showNotification("WallHop Activated!")
    blur.Size = 5
end)

deactivateButton.MouseButton1Click:Connect(function()
    wallHopEnabled = false
    statusLabel.Text = "Status: Disabled"
    statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    showNotification("WallHop Deactivated!")
    blur.Size = 0
end)

minimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    frame.Visible = not minimized
    showNotification(minimized and "UI Minimized" or "UI Restored")
end)

guideButton.MouseButton1Click:Connect(function()
    guideFrame.Visible = not guideFrame.Visible
end)

destroyButton.MouseButton1Click:Connect(function()
    showNotification("Self-Destruct Initiated")
    task.wait(1)
    blur:Destroy()
    screenGui:Destroy()
end)

-- WallHop Logic
UserInputService.JumpRequest:Connect(function()
    if wallHopEnabled and isNearWall() then
        if infiniteJumpLock then
            infiniteJumpLock = false
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoid and rootPart then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, -1, 0)
                task.wait(0.2)
                rootPart.CFrame = rootPart.CFrame * CFrame.Angles(0, 1, 0)
            end
            infiniteJumpLock = true
        end
    end
end)
}

local function autoExecute()
    local id = game.PlaceId
    if gameScripts[id] then
        gameScripts[id]()
    else
        sendAlert("Auto Executor", "No script yet")
    end
end

if game:IsLoaded() then
    autoExecute()
else
    game.Loaded:Connect(autoExecute)
end
end,
