-- Open Soucre
local MacLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/getscript-vn/Api/refs/heads/main/uilibrary'))()
local Window = MacLib:Window({
Title = "MMB Hub",
Subtitle = "Cộng Đồng Việt Nam [HitboxMode]",
Size = UDim2.fromOffset(550, 300),
DragStyle = 1,
DisabledWindowControls = {},
ShowUserInfo = true,
Keybind = Enum.KeyCode.RightControl,
AcrylicBlur = true,
})
local tabGroups = {
TabGroup1 = Window:TabGroup()
}
local tabs = {
Main = tabGroups.TabGroup1:Tab({ Name = "Hitbox", Image = "rbxassetid://10723407389" }),
}     
local sections = {
MainSection1 = tabs.Main:Section({ Side = "Left" ,a=true}),
}
sections.MainSection1:SubLabel({
    Text = "HitBox Weapon."
})
getgenv().HitboxX = 50
getgenv().HitboxY = 50
getgenv().HitboxZ = 50
getgenv().HitboxX1 = 50
getgenv().HitboxY1 = 50
getgenv().HitboxZ1 = 50
sections.MainSection1:Slider({
    Name = "Hitbox Size X.",
    Default = 50,
    Minimum = 0,
    Maximum = 150,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(Value)
        getgenv().HitboxX = Value
    end
}, "HitBoxCombat")
sections.MainSection1:Slider({
    Name = "Hitbox Size Y.",
    Default = 50,
    Minimum = 0,
    Maximum = 150,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(Value)
        getgenv().HitboxY = Value
    end
}, "HitBoxCombat")
sections.MainSection1:Slider({
    Name = "Hitbox Size Z.",
    Default = 50,
    Minimum = 0,
    Maximum = 150,
    DisplayMethod = "Value",
    Precision = 0,
    Callback = function(Value)
        getgenv().HitboxZ = Value
    end
}, "HitBoxCombat")

sections.MainSection1:Button({
    Name = "Bật Hitbox Cho Vũ Khí Đang Cầm",
    Callback = function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Tool') then
        local acombat = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass('Tool')
            if acombat:FindFirstChild('Handle') then
            acombat.Handle.Size = Vector3.new(getgenv().HitboxX,getgenv().HitboxY,getgenv().HitboxZ)
            acombat.Handle.Transparency = 0.8
            local selectionBox = Instance.new("SelectionBox")
            selectionBox.Adornee = acombat.Handle
            selectionBox.Parent = acombat.Handle
            selectionBox.Name = 'WeldConstraint'
            selectionBox.LineThickness = 0.05
            selectionBox.Color3 = Color3.fromRGB(0, 170, 255)
            selectionBox.SurfaceTransparency = 1
            Window:Notify({
                Title = "getscript-vn",
                Description = "Added Hitbox."
            })
        else
            Window:Notify({
                Title = "getscript-vn",
                Description = "Can't Add Hitbox."
            })
        end
        end
    end,
})

        local VirtualUser = cloneref(game:GetService("VirtualUser"))
        game.Players.LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        warn('Anti AFK Select Mode 2')
