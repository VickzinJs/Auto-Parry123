local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib')))()
akeWindow({
    Hub = {
      Title = "Vick Hub Beta",
      Animation = "by : vickhub"
    },
    Key = {
      KeySystem = false,
      Title = "Key System",
      Description = "Teste",
      KeyLink = "",
      Keys = {"1234"},
      Notifi = {
        Notifications = true,
        CorrectKey = "Running the Script...",
        Incorrectkey = "The key is incorrect",
        CopyKeyLink = "Copied to Clipboard"
      }
    }
  })
  
  --[[
    Hub = {
      Title = "REDz HUB" -- <string> Titulo do seu script
      Animation = "by : redz9999" -- <string> Adiciona um texto na animacão do seu HUB
    },
    Key = {
      KeySystem = <bollean> Adiciona um sistema de chaves
      Title = "Key System" <string> Adiciona um titulo ao seu sistema de chaves
      Description = "" <string> Adiciona uma descrição ao seu sistema de chaves
      KeyLink = "" <string> Adicina o Link onde pega a chave do HUB
      Keys = {"1234"} <table> Adiciona as Chaves
      Notifi = {
        Notifications = true <boolean> Adicina notificações ao sistema de chaves
        CorrectKey = "Running the Script..." <string> notificação quando a chave estiver correta
        Incorrectkey = "The key is incorrect" <string> notificação quando a chave estiver incorreta
        CopyKeyLink = "Copied to Clipboard" <string> notificação quando o link da chave fir copiado
      }
    }
  ]]
     
  MinimizeButton({
    Image = "",
    Size = {40, 40},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
  })
  
  --[[
    Image = "" <string> imagem do botão
    Size = {40, 40} <table> tamanho do botão
    Color = Color3.fromRGB(10, 10, 10) <Color3>  Cor do fundo do botäo
    Corner = true -- <boolean> Adicina um UICorner
    Stroke = false <boolean> Adiciona um UIStroke
    StrokeColor = Color3.fromRGB(255, 0, 0) <Color3> Cor do UIStroke
  ]]
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

OrionLib:Init()