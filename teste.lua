if game.PlaceId == 13772394625 then

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Zetra Cheetz", HidePremium = false, SaveConfig = true, ConfigFolder = "ZetraCfg", IntroEnabled = false,})

--Valores
_G.AutoClick = true



--Funcoes

function AutoClick()
    while _G.AutoClick == true do
        local Event5= game:GetService("ReplicatedStorage").Remotes.Combat5
        Event5:FireServer()
        local Event4 = game:GetService("ReplicatedStorage").Remotes.Combat4
        Event4:FireServer()
        local Event3 = game:GetService("ReplicatedStorage").Remotes.Combat3
        Event3:FireServer()
        local Event2 = game:GetService("ReplicatedStorage").Remotes.Combat2
        Event2:FireServer()
        local Event = game:GetService("ReplicatedStorage").Remotes.Combat
        Event:FireServer()
        wait(.00000000000000000000000000000000000000000000001)
        end
end


--Frame

local Main = Window:MakeTab({
	Name = "Auto-Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Section = Main:AddSection({
	Name = "PRINCIPAIS"
})
Main:AddToggle({
	Name = "Auto-Click",
	Default = false,
	Callback = function(Value)
		_G.AutoClick = Value
        AutoClick()
	end    
})

elseif game.PlaceId == 7235547883 then

    --FV

    local plr = game.Players.LocalPlayer

    --HUB

    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

    local Window = OrionLib:MakeWindow({Name = "Zetra Cheetz", HidePremium = false, SaveConfig = true, ConfigFolder = "ZetraCfg", IntroEnabled = false,})



    --Valores






    --Funcoes
    function Antikick()
        plr.UserId = 1216025046
        print("Alterado com sucesso")
        end

    function ForceTP()
        plr.Backpack.Antbug:Destroy()
    end


    --Abas
    local PlayerTab = Window:MakeTab({
        Name = "Player",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
    local Section = PlayerTab:AddSection({
        Name = "Jogador"
    })
    PlayerTab:AddButton({
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
    PlayerTab:AddButton({
        Name = "Force TP",
        Callback = function()
            ForceTP()
          end  
    })

end
