local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local backpack = player:WaitForChild("Backpack")
local function moveToTargetObjects(targetName)

    local humanoidRootPart = player.Character.HumanoidRootPart
    local _WorldOrigin = workspace._WorldOrigin

    for _, obj in ipairs(_WorldOrigin:GetChildren()) do
        if obj:IsA('Model') and string.find(obj.Name, targetName) then
            for _, obj1 in ipairs(obj:GetChildren()) do
                if obj1:IsA("BasePart") and obj1.Name == "Box" then
                    
                    obj1.Position = 1548.75, 52.8307, -2983.67
                    local targetPosition = obj1.Position
                    local direction = (targetPosition - humanoidRootPart.Position).unit
                    local distance = (targetPosition - humanoidRootPart.Position).Magnitude

                    -- Tạo Part biểu thị đường di chuyển
                    local part = Instance.new("Part")
                    part.Size = Vector3.new(1, 1, distance)
                    part.Position = humanoidRootPart.Position + Vector3.new(0, -3, 0) + (direction * (distance / 2))
                    part.Anchored = true
                    part.BrickColor = BrickColor.new("Bright red")
                    part.Parent = Workspace
                    part.CFrame = CFrame.new(part.Position, targetPosition)

                    -- Tạo Tween để di chuyển
                    local speed = 300
                    local time = distance / speed

                    local tweenInfo = TweenInfo.new(
                        time,
                        Enum.EasingStyle.Linear,
                        Enum.EasingDirection.Out
                    )

                    local tween = TweenService:Create(
                        humanoidRootPart,
                        tweenInfo,
                        {CFrame = CFrame.new(targetPosition)}
                    )

                    -- Chạy Tween
                    tween:Play()
                    tween.Completed:Wait()

                    -- Xóa Part
                    part:Destroy()
                    game:service('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                    wait(.1)
                    for _, tool in ipairs(backpack:GetChildren()) do
                        if tool:IsA("Tool") and string.find(tool.Name, "Gift") then
                            -- Di chuyển tool từ Backpack đến Character
                            tool.Parent = player.Character
                            print("Đã trang bị tool:", tool.Name)
                            break
                        end
                    end

                    print("Di chuyển đến Box tại vị trí:", targetPosition)
                end
            end
        end
    end
end
moveToTargetObjects("Present")
