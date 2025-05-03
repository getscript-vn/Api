
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NPCHealthGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Name = "HealthLabel"
textLabel.Size = UDim2.new(1, 0, 0.6, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Text = "Đang tìm NPC..."
textLabel.Parent = frame

-- Tạo TextButton (nút xóa GUI)
local deleteButton = Instance.new("TextButton")
deleteButton.Name = "DeleteButton"
deleteButton.Size = UDim2.new(1, 0, 0.4, 0)
deleteButton.Position = UDim2.new(0, 0, 0.6, 0)
deleteButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.Text = "Xoá GUI"
deleteButton.Parent = frame

deleteButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

local npc = workspace:FindFirstChild("GiangHo2")
if npc and npc:FindFirstChild("NPCs") and npc.NPCs:FindFirstChild("NPC2") then
	local npc2 = npc.NPCs.NPC2
	local humanoid = npc2:FindFirstChildOfClass("Humanoid")
	if humanoid then
		while humanoid and humanoid.Parent and humanoid.Health > 0 do
			textLabel.Text = "Máu NPC2: " .. math.floor(humanoid.Health)
			wait(0.2)
		end
		textLabel.Text = "NPC đã chết"
	else
		textLabel.Text = "Không tìm thấy Humanoid"
	end
else
	textLabel.Text = "Không tìm thấy NPC2"
end
