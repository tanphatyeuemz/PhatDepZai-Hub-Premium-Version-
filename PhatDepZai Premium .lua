-- Load thư viện UI
local RimusLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Duc18-code/scriptducv3/refs/heads/main/UInew.lua"))()

-- Danh sách key hợp lệ
local UsedKeys = {} -- Lưu trữ key đã dùng

for i = 1, 100 do
    UsedKeys["phatbeohub-" .. i] = false
end

-- Tạo UI nhập key
local KeyGUI = Instance.new("ScreenGui")
KeyGUI.Parent = game:GetService("CoreGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame.Parent = KeyGUI

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "Nhập Key để tiếp tục"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Parent = Frame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -20, 0, 30)
KeyBox.Position = UDim2.new(0, 10, 0, 50)
KeyBox.PlaceholderText = "Nhập key ở đây..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(0, 0, 0)
KeyBox.BackgroundColor3 = Color3.new(1, 1, 1)
KeyBox.Parent = Frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(1, -20, 0, 30)
SubmitButton.Position = UDim2.new(0, 10, 0, 90)
SubmitButton.Text = "Xác nhận"
SubmitButton.TextColor3 = Color3.new(1, 1, 1)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
SubmitButton.Parent = Frame

local function CheckKey()
    local inputKey = KeyBox.Text
    if UsedKeys[inputKey] == false then
        UsedKeys[inputKey] = true -- Đánh dấu đã dùng
        KeyGUI:Destroy() -- Xóa UI nhập key

        -- Hiển thị thông báo thành công
        local Notify = RimusLib:MakeNotify({
            Title = "Thông Báo",
            Content = "Key hợp lệ! Đang tải giao diện...",
            Image = "rbxassetid://100756646036568",
            Time = 1,
            Delay = 5
        })

        -- Load UI chính
        local RimusHub = RimusLib:MakeGui({
            NameHub = "PhatDepZai Hub",
            NameGam = "     [Main]",
            Icon = "rbxassetid://100756646036568"
        })

        ----------------------------------------
        -- Tab: Main
        ----------------------------------------
        local TabMain = RimusHub:CreateTab({
            Name = "Main",
            Icon = "rbxassetid://100756646036568"
        })

        -- Auto Farm Level (Chưa có)
        TabMain:AddLabel({
            Title = "Auto Farm Level: Will coming soon!",
            Icon = "rbxassetid://100756646036568"
        })

        -- Auto Bone
        TabMain:AddToggle({
            Title = "Auto Bone",
            Default = false,
            Callback = function(value)
                if value then
                    print("Auto Bone: Bật")
                else
                    print("Auto Bone: Tắt")
                end
            end
        })

        -- Auto Kata
        TabMain:AddToggle({
            Title = "Auto Kata",
            Default = false,
            Callback = function(value)
                if value then
                    print("Auto Kata: Bật")
                else
                    print("Auto Kata: Tắt")
                end
            end
        })

        ----------------------------------------
        -- Tab: Setting Farm
        ----------------------------------------
        local TabSetting = RimusHub:CreateTab({
            Name = "Setting Farm",
            Icon = "rbxassetid://100756646036568"
        })

        -- Fast Attack
        TabSetting:AddToggle({
            Title = "Fast Attack",
            Default = false,
            Callback = function(value)
                if value then
                    print("Fast Attack: Bật")
                else
                    print("Fast Attack: Tắt")
                end
            end
        })

        -- Bring Mob
        TabSetting:AddToggle({
            Title = "Bring Mob",
            Default = false,
            Callback = function(value)
                if value then
                    print("Bring Mob: Bật")
                else
                    print("Bring Mob: Tắt")
                end
            end
        })

        -- Speed Tween (Chưa có)
        TabSetting:AddLabel({
            Title = "Speed Tween: Will coming soon!",
            Icon = "rbxassetid://100756646036568"
        })

        -- Use Portal Teleport (Chưa có)
        TabSetting:AddLabel({
            Title = "Use Portal Teleport: Will coming soon!",
            Icon = "rbxassetid://100756646036568"
        })

        ----------------------------------------
        -- Tab: Race V4
        ----------------------------------------
        local TabRaceV4 = RimusHub:CreateTab({
            Name = "Race v4",
            Icon = "rbxassetid://100756646036568"
        })

        -- Kill Player After Trial
        TabRaceV4:AddToggle({
            Title = "Kill Player After Trial",
            Default = false,
            Callback = function(value)
                if value then
                    print("Kill Player After Trial: Bật")
                else
                    print("Kill Player After Trial: Tắt")
                end
            end
        })

        -- Auto Finish Trial
        TabRaceV4:AddToggle({
            Title = "Auto Finish Trial",
            Default = false,
            Callback = function(value)
                if value then
                    print("Auto Finish Trial: Bật")
                else
                    print("Auto Finish Trial: Tắt")
                end
            end
        })
    else
        KeyBox.Text = "Key sai hoặc đã dùng!"
    end
end

SubmitButton.MouseButton1Click:Connect(CheckKey)
