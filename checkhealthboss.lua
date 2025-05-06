local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NPCHealthGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 130)
frame.Position = UDim2.new(0.5, -100, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local textLabel = Instance.new("TextLabel")
textLabel.Name = "HealthLabel"
textLabel.Size = UDim2.new(1, 0, 0.4, 0)
textLabel.Position = UDim2.new(0, 0, 0, 0)
textLabel.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
textLabel.Text = "Đang tìm NPC..."
textLabel.Parent = frame

-- Thêm Label hiển thị số lần giết
local killCountLabel = Instance.new("TextLabel")
killCountLabel.Name = "KillCountLabel"
killCountLabel.Size = UDim2.new(1, 0, 0.3, 0)
killCountLabel.Position = UDim2.new(0, 0, 0.4, 0)
killCountLabel.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
killCountLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
killCountLabel.Text = "Đã giết: 0"
killCountLabel.Parent = frame

-- Nút xóa GUI
local deleteButton = Instance.new("TextButton")
deleteButton.Name = "DeleteButton"
deleteButton.Size = UDim2.new(1, 0, 0.3, 0)
deleteButton.Position = UDim2.new(0, 0, 0.7, 0)
deleteButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
deleteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deleteButton.Text = "Xoá GUI"
deleteButton.Parent = frame

deleteButton.MouseButton1Click:Connect(function()
	screenGui:Destroy()
end)

-- Biến đếm số lần giết
local killCount = 0

-- Đọc kill count từ file nếu có
pcall(function()
	local saved = readfile("killboss.txt")
	if saved then
		killCount = tonumber(saved) or 0
	end
end)

killCountLabel.Text = "Đã giết: " .. killCount

spawn(function()
	while true do
		local npc = workspace:FindFirstChild("GiangHo2")
		if npc and npc:FindFirstChild("NPCs") and npc.NPCs:FindFirstChild("NPC2") then
			local npc2 = npc.NPCs.NPC2
			local humanoid = npc2:FindFirstChildOfClass("Humanoid")
			if humanoid then
				while humanoid.Health > 0 and humanoid.Parent do
					textLabel.Text = "Máu NPC2: " .. math.floor(humanoid.Health)
					wait(0.2)
				end
				textLabel.Text = "NPC đã chết"
				killCount = killCount + 1
				killCountLabel.Text = "Đã giết: " .. killCount

				pcall(function()
					writefile("killboss.txt", tostring(killCount))
				end)

				wait(2)
			else
				textLabel.Text = "Không tìm thấy Humanoid"
				wait(2)
			end
		else
			textLabel.Text = "Không tìm thấy NPC2"
			wait(2)
		end
	end
end)
