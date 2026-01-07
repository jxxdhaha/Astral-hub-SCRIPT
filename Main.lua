loadstring([=[-- ASTRONIMIA HUB - DRAGGABLE & BUTTONS FIXED (2026 BYFRON SAFE)

local p = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local sg = Instance.new("ScreenGui", p:WaitForChild("PlayerGui"))
sg.ResetOnSpawn = false
sg.IgnoreGuiInset = true

local main = Instance.new("Frame", sg)
main.Size = UDim2.new(0, 360, 0, 600)
main.Position = UDim2.new(0.02, 0, 0.15, 0)
main.BackgroundColor3 = Color3.fromRGB(8, 12, 45)
main.Active = true  -- FIX 1
main.ZIndex = 10
local mc = Instance.new("UICorner", main); mc.CornerRadius = UDim.new(0,14)
local grad = Instance.new("UIGradient", main)
grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(15,25,90)), ColorSequenceKeypoint.new(1, Color3.fromRGB(5,10,70))}
local stroke = Instance.new("UIStroke", main); stroke.Color = Color3.fromRGB(0,220,255); stroke.Thickness = 3

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,50)
title.BackgroundTransparency = 1
title.Text = "ASTRONIMIA HUB - FIXED"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 24
title.ZIndex = 11

-- Example toggle button (repeat this pattern for all your toggles)
local testBtn = Instance.new("TextButton", main)
testBtn.Size = UDim2.new(0.85,0,0,50)
testBtn.Position = UDim2.new(0.075,0,0,60)
testBtn.BackgroundColor3 = Color3.fromRGB(15,25,70)
testBtn.Text = "TEST BUTTON: OFF"
testBtn.TextColor3 = Color3.fromRGB(200,200,255)
testBtn.Font = Enum.Font.GothamBold
testBtn.TextSize = 18
testBtn.Active = true  -- FIX 2
testBtn.ZIndex = 12
local tc = Instance.new("UICorner", testBtn); tc.CornerRadius = UDim.new(0,8)

local toggleState = false
testBtn.MouseButton1Click:Connect(function()
    print("TEST BUTTON CLICKED - WORKING!")  -- Debug to console
    toggleState = not toggleState
    testBtn.Text = "TEST BUTTON: " .. (toggleState and "ON" or "OFF")
    testBtn.BackgroundColor3 = toggleState and Color3.fromRGB(0,150,0) or Color3.fromRGB(15,25,70)
end)

-- Add all your other toggles/buttons the same way (Active = true, high ZIndex)

-- FIXED DRAGGABLE (offset fix + touch support)
local dragging = false
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            updateInput(input)
        end
    end
end)

print("Astronimia Hub Loaded - Drag the title bar, click TEST BUTTON to check if fixed.")
]=])()
