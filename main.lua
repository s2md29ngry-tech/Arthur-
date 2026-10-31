-- PVP HUB | Mobile Edition
-- Para testar no Roblox Studio

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local infiniteJump = false
local fastSpeed = false

local gui = Instance.new("ScreenGui")
gui.Name = "PVP_HUB"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 260, 0, 220)
main.Position = UDim2.new(0.5, -130, 0.3, 0)
main.BackgroundColor3 = Color3.fromRGB(20, 15, 30)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 45)
title.BackgroundColor3 = Color3.fromRGB(110, 40, 220)
title.Text = "PVP HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 22
title.Font = Enum.Font.GothamBold
title.Parent = main

local function button(text, y, callback)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 42)
    b.Position = UDim2.new(0, 10, 0, y)
    b.BackgroundColor3 = Color3.fromRGB(65, 40, 100)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 15
    b.Font = Enum.Font.GothamBold
    b.Text = text
    b.Parent = main

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b

    b.Activated:Connect(function()
        callback(b)
    end)
end

button("Infinite Jump: OFF", 55, function(b)
    infiniteJump = not infiniteJump
    b.Text = "Infinite Jump: " ..
        (infiniteJump and "ON" or "OFF")
end)

UIS.JumpRequest:Connect(function()
    if not infiniteJump then return end

    local character = player.Character
    local humanoid = character
        and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        humanoid:ChangeState(
            Enum.HumanoidStateType.Jumping
        )
    end
end)

button("Speed: NORMAL", 105, function(b)
    local character = player.Character
    local humanoid = character
        and character:FindFirstChildOfClass("Humanoid")

    if humanoid then
        fastSpeed = not fastSpeed
        humanoid.WalkSpeed = fastSpeed and 24 or 16
        b.Text = fastSpeed and "Speed: FAST" or "Speed: NORMAL"
    end
end)

button("FECHAR MENU", 155, function()
    gui:Destroy()
end)
