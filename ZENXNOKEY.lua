--// Khởi tạo GUI nhập key
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")

local KEY_URL = "https://raw.githubusercontent.com/ngheo6677/Dung/refs/heads/main/key.txt" -- Thay bằng link RAW GitHub chứa key

-- Tạo GUI nhập key
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "KeyCheckGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, -150, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.BackgroundTransparency = 0.1

local uicorner = Instance.new("UICorner", frame)
uicorner.CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "NHẬP KEY ĐỂ TIẾP TỤC"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -40, 0, 35)
textbox.Position = UDim2.new(0, 20, 0, 50)
textbox.PlaceholderText = "Nhập key tại đây..."
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 16
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.ClearTextOnFocus = false
textbox.Text = ""
local corner2 = Instance.new("UICorner", textbox)
corner2.CornerRadius = UDim.new(0, 8)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.5, -25, 0, 35)
button.Position = UDim2.new(0.5, 5, 1, -45)
button.Text = "XÁC NHẬN"
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
local corner3 = Instance.new("UICorner", button)
corner3.CornerRadius = UDim.new(0, 8)

-- Hàm gửi thông báo nhỏ
local function notify(title, text, duration)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title or "Thông báo",
			Text = text or "",
			Duration = duration or 5
		})
	end)
end

-- Hàm lấy danh sách key từ GitHub
local function getKeyList()
	local success, response = pcall(function()
		return game:HttpGet(KEY_URL)
	end)

	if success and response then
		local keyList = {}
		for line in response:gmatch("[^\r\n]+") do
			local clean = line:match("^%s*(.-)%s*$")
			if clean ~= "" then
				table.insert(keyList, clean)
			end
		end
		return keyList
	else
		notify("Lỗi", "Không thể tải key từ GitHub", 5)
		return {}
	end
end

-- Hàm kiểm tra key nhập vào
local function isValidKey(input)
	if not input or input == "" then
		notify("Lỗi", "Bạn chưa nhập key!", 4)
		return false
	end

	local keys = getKeyList()
	for _, k in ipairs(keys) do
		if input == k then
			return true
		end
	end

	return false
end

-- 📌 CHỖ NÀY BẠN DÁN SCRIPT GỐC
function loadFarmBoss()
	-- Bạn xóa đoạn dưới đây và dán toàn bộ script farm boss stealth ZENmode X của bạn vào
	loadstring([[

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- Tạo GUI ZENmode X
local gui = Instance.new("ScreenGui")
gui.Name = "FarmBossGUI"
pcall(function()
	gui.Parent = game:FindFirstChildOfClass("CoreGui")
end)
if not gui.Parent then
	gui.Parent = lp:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 150)
frame.Position = UDim2.new(0, 20, 0, 100)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "💀ZENX💀"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextScaled = true

local toggle = Instance.new("TextButton", frame)
toggle.Size = UDim2.new(0, 200, 0, 30)
toggle.Position = UDim2.new(0, 25, 0, 40)
toggle.Text = "Bật Farm Boss"
toggle.BackgroundColor3 = Color3.fromRGB(60,60,60)
toggle.TextColor3 = Color3.new(1,1,1)
toggle.Font = Enum.Font.Gotham
toggle.TextScaled = true
Instance.new("UICorner", toggle)

local distanceBox = Instance.new("TextBox", frame)
distanceBox.Size = UDim2.new(0, 200, 0, 25)
distanceBox.Position = UDim2.new(0, 25, 0, 80)
distanceBox.PlaceholderText = "Khoảng cách (VD: 12)"
distanceBox.Text = ""
distanceBox.ClearTextOnFocus = false
distanceBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
distanceBox.TextColor3 = Color3.new(1,1,1)
distanceBox.Font = Enum.Font.Gotham
distanceBox.TextScaled = true
Instance.new("UICorner", distanceBox)

local speedBox = Instance.new("TextBox", frame)
speedBox.Size = UDim2.new(0, 200, 0, 25)
speedBox.Position = UDim2.new(0, 25, 0, 110)
speedBox.PlaceholderText = "Tốc độ vòng (VD: 2)"
speedBox.Text = ""
speedBox.ClearTextOnFocus = false
speedBox.BackgroundColor3 = Color3.fromRGB(45,45,45)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.Font = Enum.Font.Gotham
speedBox.TextScaled = true
Instance.new("UICorner", speedBox)

-- Script Farm Stealth
local active = false
local orbitConnection, attackConnection
local character, hrp

function getBoss()
	local bosses = workspace:FindFirstChild("GiangHo2") and workspace.GiangHo2:FindFirstChild("NPCs")
	if not bosses then return nil end
	for _, boss in pairs(bosses:GetChildren()) do
		if boss:FindFirstChild("HumanoidRootPart") and boss:FindFirstChildOfClass("Humanoid") then
			if boss.Humanoid.Health > 0 then
				return boss
			end
		end
	end
	return nil
end

function getTool()
	for _, tool in pairs(lp.Character:GetChildren()) do
		if tool:IsA("Tool") then
			return tool
		end
	end
	return nil
end

function attachStealthMover(hrp)
	local bg = Instance.new("BodyGyro", hrp)
	bg.Name = "ZENgyro"
	bg.MaxTorque = Vector3.new(1e6,1e6,1e6)
	bg.P = 1e4

	local bp = Instance.new("BodyPosition", hrp)
	bp.Name = "ZENpos"
	bp.MaxForce = Vector3.new(1e6,1e6,1e6)
	bp.P = 1e4
	bp.D = 100
end

function removeStealthMover()
	if hrp then
		local bg = hrp:FindFirstChild("ZENgyro")
		local bp = hrp:FindFirstChild("ZENpos")
		if bg then bg:Destroy() end
		if bp then bp:Destroy() end
	end
end

function updateMover(pos, faceTarget)
	if not hrp then return end
	local bg = hrp:FindFirstChild("ZENgyro")
	local bp = hrp:FindFirstChild("ZENpos")
 if bg and faceTarget then
	local direction = (faceTarget - hrp.Position).Unit
	local offsetAngle = math.rad(-10) -- chỉnh góc lệch tại đây (độ, dương lệch phải, âm lệch trái)
	local rotatedDirection = CFrame.Angles(0, offsetAngle, 0):VectorToWorldSpace(direction)
	bg.CFrame = CFrame.new(hrp.Position, hrp.Position + rotatedDirection)
end	
	if bp then
		bp.Position = pos + Vector3.new(0, math.sin(tick()*5)*0.5, 0)
	end
end

function startFarm()
	active = true
	character = lp.Character
	hrp = character and character:FindFirstChild("HumanoidRootPart")
	if not character or not hrp then print("[DEBUG][Character]: Mất") return end

	attachStealthMover(hrp)

	orbitConnection = RunService.Heartbeat:Connect(function()
		local boss = getBoss()
		if not boss then print("[DEBUG][Boss]: Không tìm thấy") stopFarm() return end
		local bossHRP = boss:FindFirstChild("HumanoidRootPart")
		if not bossHRP then print("[DEBUG][Boss HRP]: Mất") stopFarm() return end
		if not character or not character:FindFirstChild("HumanoidRootPart") then
			character = lp.Character
			hrp = character and character:FindFirstChild("HumanoidRootPart")
			if not hrp then print("[DEBUG][Character]: bị reset mới") stopFarm() return end
			attachStealthMover(hrp)
		end

		local distance = tonumber(distanceBox.Text) or 10
		local speed = tonumber(speedBox.Text) or 2
		local angle = tick() * speed
		local offset = Vector3.new(math.cos(angle)*distance, 0, math.sin(angle)*distance)
		local targetPos = bossHRP.Position + offset
		updateMover(targetPos, bossHRP.Position)
	end)

	attackConnection = RunService.Heartbeat:Connect(function()
		local tool = getTool()
		if tool and tool:FindFirstChild("Handle") then
			tool:Activate()
		end
	end)
end

function stopFarm()
	active = false
	removeStealthMover()
	if orbitConnection then orbitConnection:Disconnect() orbitConnection = nil end
	if attackConnection then attackConnection:Disconnect() attackConnection = nil end
end

toggle.MouseButton1Click:Connect(function()
	active = not active
	if active then
		toggle.Text = "Đang Farm Boss..."
		startFarm()
	else
		toggle.Text = "Bật Farm Boss"
		stopFarm()
	end
end)

-- Hiển thị máu boss ngoài GUI
local hpGUI = Instance.new("ScreenGui", lp:WaitForChild("PlayerGui"))
hpGUI.Name = "BossHealthDisplay"

local hpLabel = Instance.new("TextLabel", hpGUI)
hpLabel.Size = UDim2.new(0, 200, 0, 35)
hpLabel.Position = UDim2.new(1, -210, 0, 10)
hpLabel.BackgroundTransparency = 0.4
hpLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
hpLabel.TextColor3 = Color3.fromRGB(255, 70, 70)
hpLabel.Font = Enum.Font.GothamBold
hpLabel.TextSize = 20
hpLabel.Text = "Máu Boss: Đang tìm..."
Instance.new("UICorner", hpLabel)

-- Cập nhật máu boss liên tục
task.spawn(function()
	while true do
		local boss = getBoss()
		if boss and boss:FindFirstChild("Humanoid") then
			local hp = math.floor(boss.Humanoid.Health)
			local max = math.floor(boss.Humanoid.MaxHealth)
			hpLabel.Text = "Máu Boss: " .. hp .. " / " .. max
		else
			hpLabel.Text = "Máu Boss: Không tìm thấy"
		end
		task.wait(0.2)
	end
end)]])()
end

-- Bắt sự kiện khi bấm nút
button.MouseButton1Click:Connect(function()
	local key = textbox.Text
	if isValidKey(key) then
		notify("✅ Thành công", "Key hợp lệ! Đang chạy script...", 4)
		gui:Destroy()
		loadFarmBoss()
	else
		notify("❌ Sai key", "Key không đúng hoặc hết hạn", 4)
	end
end)

notify("✅ Thành công", "Key hợp lệ! Đang chạy script...", 4)
gui:Destroy()
loadFarmBoss()
