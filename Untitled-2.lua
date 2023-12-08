local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Vick Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab1 = Window:MakeTab({
    Name = "MAIN",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab1:AddSection({
    Name = "Test"
})

Tab1:AddButton({
    Name = "Auto Parry",
    Callback = function()
              print("button pressed")

              local workspace = game:GetService("Workspace")
              local players = game:GetService("Players")
              local runService = game:GetService("RunService")
              local vim = game:GetService("VirtualInputManager")
              
              local ballFolder = workspace.Balls
              local indicatorPart = Instance.new("Part")
              indicatorPart.Size = Vector3.new(5, 5, 5)
              indicatorPart.Anchored = true
              indicatorPart.CanCollide = false
              indicatorPart.Transparency = 1
              indicatorPart.BrickColor = BrickColor.new("Bright red")
              indicatorPart.Parent = workspace

              local lastBallPressed = nil
local isKeyPressed = false

local function calculatePredictionTime(ball, player)
    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local rootPart = player.Character.HumanoidRootPart
        local relativePosition = ball.Position - rootPart.Position
        local velocity = ball.Velocity + rootPart.Velocity 
        local a = (ball.Size.magnitude / 2) 
        local b = relativePosition.magnitude
        local c = math.sqrt(a * a + b * b)
        local timeToCollision = (c - a) / velocity.magnitude
        return timeToCollision
    end
    return math.huge
end

local function updateIndicatorPosition(ball)
    indicatorPart.Position = ball.Position
end

local function checkProximityToPlayer(ball, player)
    local predictionTime = calculatePredictionTime(ball, player)
    local realBallAttribute = ball:GetAttribute("realBall")
    local target = ball:GetAttribute("target")

    local ballSpeedThreshold = math.max(0.4, 0.6 - ball.Velocity.magnitude * 0.01)

    if predictionTime <= ballSpeedThreshold and realBallAttribute == true and target == player.Name and not isKeyPressed then
        vim:SendKeyEvent(true, Enum.KeyCode.F, false, nil)
        wait(0.005)
        vim:SendKeyEvent(false, Enum.KeyCode.F, false, nil)
        lastBallPressed = ball
        isKeyPressed = true

    elseif lastBallPressed == ball and (predictionTime > ballSpeedThreshold or realBallAttribute ~= true or target ~= player.Name) then
        isKeyPressed = false
    end
end

local function checkBallsProximity()
    local player = players.LocalPlayer
    if player then
        for _, ball in pairs(ballFolder:GetChildren()) do
            checkProximityToPlayer(ball, player)
            updateIndicatorPosition(ball)
        end
    end
end

runService.Heartbeat:Connect(checkBallsProximity)

print("Script ran without errors")
      end
})

Tab1:AddButton({
    Name = "Clash",
    Callback = function()
              print("button pressed")

loadstring(game:HttpGet('https://pastebin.com/raw/KB4xQe4j'))()
      end
})

Tab1:AddButton({
    Name = "Anti Lag",
    Callback = function()
              print("button pressed")

loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
      end
})

Tab1:AddButton({
    Name = "Anti Afk Kick",
    Callback = function()
              print("button pressed")

              wait(0.5)local ba=Instance.new("ScreenGui")
              local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
              local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
              ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
              ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
              ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
              ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti Afk"ca.TextColor3=Color3.new(0,1,1)
              ca.TextSize=22;da.Parent=ca
              da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
              da.Size=UDim2.new(0,370,0,107)_b.Parent=da
              _b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
              _b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Made by Headshot#5868"
              _b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
              ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
              ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
              ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
              game:service'Players'.LocalPlayer.Idled:connect(function()
              bb:CaptureController()bb:ClickButton2(Vector2.new())
              ab.Text="Roblox kicked you but we didnt let them!"wait(2)ab.Text="Status : Active"end)
              end

              })

              Tab1:AddButton({
                Name = "Anti Afk Kick",
                Callback = function()
                          print("button pressed")

                          local function API_Check()
                            if Drawing == nil then
                                return "No"
                            else
                                return "Yes"
                            end
                        end
                        
                        local Find_Required = API_Check()
                        
                        if Find_Required == "No" then
                            game:GetService("StarterGui"):SetCore("SendNotification",{
                                Title = "Exunys Developer";
                                Text = "ESP script could not be loaded because your exploit is unsupported.";
                                Duration = math.huge;
                                Button1 = "OK"
                            })
                        
                            return
                        end
                        
                        local Players = game:GetService("Players")
                        local RunService = game:GetService("RunService")
                        local UserInputService = game:GetService("UserInputService")
                        local Camera = workspace.CurrentCamera
                        
                        local Typing = false
                        
                        _G.SendNotifications = true   -- If set to true then the script would notify you frequently on any changes applied and when loaded / errored. (If a game can detect this, it is recommended to set it to false)
                        _G.DefaultSettings = false   -- If set to true then the ESP script would run with default settings regardless of any changes you made.
                        
                        _G.TeamCheck = false   -- If set to true then the script would create ESP only for the enemy team members.
                        
                        _G.ESPVisible = true   -- If set to true then the ESP will be visible and vice versa.
                        _G.TextColor = Color3.fromRGB(255, 80, 10)   -- The color that the boxes would appear as.
                        _G.TextSize = 14   -- The size of the text.
                        _G.Center = true   -- If set to true then the script would be located at the center of the label.
                        _G.Outline = true   -- If set to true then the text would have an outline.
                        _G.OutlineColor = Color3.fromRGB(0, 0, 0)   -- The outline color of the text.
                        _G.TextTransparency = 0.7   -- The transparency of the text.
                        _G.TextFont = Drawing.Fonts.UI   -- The font of the text. (UI, System, Plex, Monospace) 
                        
                        _G.DisableKey = Enum.KeyCode.Q   -- The key that disables / enables the ESP.
                        
                        local function CreateESP()
                            for _, v in next, Players:GetPlayers() do
                                if v.Name ~= Players.LocalPlayer.Name then
                                    local ESP = Drawing.new("Text")
                        
                                    RunService.RenderStepped:Connect(function()
                                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
                        
                                            ESP.Size = _G.TextSize
                                            ESP.Center = _G.Center
                                            ESP.Outline = _G.Outline
                                            ESP.OutlineColor = _G.OutlineColor
                                            ESP.Color = _G.TextColor
                                            ESP.Transparency = _G.TextTransparency
                                            ESP.Font = _G.TextFont
                        
                                            if OnScreen == true then
                                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                                local Dist = (Part1 - Part2).Magnitude
                                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                                if _G.TeamCheck == true then 
                                                    if Players.LocalPlayer.Team ~= v.Team then
                                                        ESP.Visible = _G.ESPVisible
                                                    else
                                                        ESP.Visible = false
                                                    end
                                                else
                                                    ESP.Visible = _G.ESPVisible
                                                end
                                            else
                                                ESP.Visible = false
                                            end
                                        else
                                            ESP.Visible = false
                                        end
                                    end)
                        
                                    Players.PlayerRemoving:Connect(function()
                                        ESP.Visible = false
                                    end)
                                end
                            end
                        
                            Players.PlayerAdded:Connect(function(Player)
                                Player.CharacterAdded:Connect(function(v)
                                    if v.Name ~= Players.LocalPlayer.Name then 
                                        local ESP = Drawing.new("Text")
                            
                                        RunService.RenderStepped:Connect(function()
                                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                                local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)
                            
                                                ESP.Size = _G.TextSize
                                                ESP.Center = _G.Center
                                                ESP.Outline = _G.Outline
                                                ESP.OutlineColor = _G.OutlineColor
                                                ESP.Color = _G.TextColor
                                                ESP.Transparency = _G.TextTransparency
                            
                                                if OnScreen == true then
                                                    local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                                    local Dist = (Part1 - Part2).Magnitude
                                                    ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                                    ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                                    if _G.TeamCheck == true then 
                                                        if Players.LocalPlayer.Team ~= Player.Team then
                                                            ESP.Visible = _G.ESPVisible
                                                        else
                                                            ESP.Visible = false
                                                        end
                                                    else
                                                        ESP.Visible = _G.ESPVisible
                                                    end
                                                else
                                                    ESP.Visible = false
                                                end
                                            else
                                                ESP.Visible = false
                                            end
                                        end)
                            
                                        Players.PlayerRemoving:Connect(function()
                                            ESP.Visible = false
                                        end)
                                    end
                                end)
                            end)
                        end
                        
                        if _G.DefaultSettings == true then
                            _G.TeamCheck = false
                            _G.ESPVisible = true
                            _G.TextColor = Color3.fromRGB(40, 90, 255)
                            _G.TextSize = 14
                            _G.Center = true
                            _G.Outline = false
                            _G.OutlineColor = Color3.fromRGB(0, 0, 0)
                            _G.DisableKey = Enum.KeyCode.Q
                            _G.TextTransparency = 0.75
                        end
                        
                        UserInputService.TextBoxFocused:Connect(function()
                            Typing = true
                        end)
                        
                        UserInputService.TextBoxFocusReleased:Connect(function()
                            Typing = false
                        end)
                        
                        UserInputService.InputBegan:Connect(function(Input)
                            if Input.KeyCode == _G.DisableKey and Typing == false then
                                _G.ESPVisible = not _G.ESPVisible
                                
                                if _G.SendNotifications == true then
                                    game:GetService("StarterGui"):SetCore("SendNotification",{
                                        Title = "Exunys Developer";
                                        Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";
                                        Duration = 5;
                                    })
                                end
                            end
                        end)
                        
                        local Success, Errored = pcall(function()
                            CreateESP()
                        end)
                        
                        if Success and not Errored then
                            if _G.SendNotifications == true then
                                game:GetService("StarterGui"):SetCore("SendNotification",{
                                    Title = "Exunys Developer";
                                    Text = "ESP script has successfully loaded.";
                                    Duration = 5;
                                })
                            end
                        elseif Errored and not Success then
                            if _G.SendNotifications == true then
                                game:GetService("StarterGui"):SetCore("SendNotification",{
                                    Title = "Exunys Developer";
                                    Text = "ESP script has errored while loading, please check the developer console! (F9)";
                                    Duration = 5;
                                })
                            end
                            TestService:Message("The ESP script has errored, please notify Exunys with the following information :")
                            warn(Errored)
                            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
                        end

                    })

                end

OrionLib:Init()