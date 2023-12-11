loadstring(game:HttpGet(("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib")))()

MakeWindow({
    Hub = {
      Title = "BaryonHub",
      Animation = "by : baryonhub"
    },

    Key = {
        KeySystem = false,
        Title = "Funções",
        Description = "",
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

    MinimizeButton({
        Image = "",
        Size = {40, 40},
        Color = Color3.fromRGB(10, 10, 10),
        Corner = true,
        Stroke = false,
        StrokeColor = Color3.fromRGB(255, 0, 0)
      })

      local Main = MakeTab({Name = "Funções"})

      MakeNotifi({
        Title = "BaryonHub",
        Text = "Olá, seja bem vindo ao nosso Hub!",
        Time = 5
      })

      local section = AddSection(Main, {"Teste"})

      SetSection(section, "Funções")

      AddButton(Main, {
        Name = "Spam Parry",
        Callback = function()
          print("Olá")

          local gui = Instance.new("ScreenGui")
          gui.ResetOnSpawn = false 
          gui.Parent = game.CoreGui 
          
          local frame = Instance.new("Frame")
          frame.Position = UDim2.new(0, 10, 0, 10)
          frame.Size = UDim2.new(0, 150, 0, 75)
          frame.BackgroundColor3 = Color3.new(0, 0, 0)
          frame.BorderSizePixel = 0
          frame.Parent = gui
          
          local button = Instance.new("TextButton")
          button.Text = "Ativar Spam"
          button.Size = UDim2.new(1, -20, 1, -20)
          button.Position = UDim2.new(0, 10, 0, 10)
          button.BackgroundColor3 = Color3.new(1, 1, 1)
          button.BorderColor3 = Color3.new(0, 0, 0)
          button.BorderSizePixel = 2
          button.Font = Enum.Font.SourceSans
          button.TextColor3 = Color3.new(0, 0, 0)
          button.TextSize = 16
          button.Parent = frame
          
          local activated = false
          
          local function toggle()
              activated = not activated
              button.Text = activated and "Desativar Spam" or "Ativar Spam"
              
              while activated do
                  local args = {
                      [1] = 1.5,
                      [2] = CFrame.new(-254.2939910888672, 112.13581848144531, -119.27256774902344) * CFrame.Angles(-2.029526710510254, 0.5662040710449219, 2.314905881881714),
                      [3] = {
                          ["2617721424"] = Vector3.new(-273.400146484375, -724.8031005859375, -20.92414093017578),
                          
                      },
                      [4] = {
                          [1] = 910,
                          [2] = 154
                      }
                  }
          
                  game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))
                  game:GetService("RunService").Heartbeat:Wait()
              end
          end
          
          button.MouseButton1Click:Connect(toggle)

        end

      })


AddButton(Main, {
  Name = "Auto Parry",
  Callback = function()
    print("")

    ToggleKey = ToggleKey or Enum.KeyCode.Z;

    local Cloneref = cloneref or function(Object)return Object end;
    
    local StatsService = Cloneref(game:GetService("Stats"));
    local UserInputService = Cloneref(game:GetService("UserInputService"));
    local ReplicatedStorage = Cloneref(game:GetService("ReplicatedStorage"));
    local Players = Cloneref(game:GetService("Players"));
    local Player = Players.LocalPlayer;
    
    local Running = true;
    local Saved = {
      LastTick = os.clock();
      LastBallPosition = nil;
      AttemptedParry = false,
    };
    
    local function GetBall()
      local RealBall, OtherBall = nil, nil;
      for Int, Object in pairs(workspace.Balls:GetChildren()) do
        if Object:GetAttribute("realBall") == true then
          RealBall = Object;
        else
          OtherBall = Object;
        end;
      end;
      return RealBall, OtherBall;
    end;
    local function AttemptParry(OtherBall)
      ReplicatedStorage.Remotes.ParryAttempt:FireServer(1.5, OtherBall.CFrame, (function()
        local Results = {};
        for Int, Character in pairs(workspace.Alive:GetChildren()) do
          Results[Character.Name] = Character.HumanoidRootPart.Position;
        end;
        return Results;
      end)(), {math.random(100, 999), math.random(100, 999)});
    end;
    
    UserInputService.InputBegan:Connect(function(Input, GameProcessed)
      if GameProcessed == false then
        if Input.KeyCode == ToggleKey then
          Running = not Running;
        end;
      end;
    end);
    
    while task.wait() do
      if Running == true then
        local RealBall, OtherBall = GetBall();
        if RealBall ~= nil and OtherBall ~= nil then
          if Saved.LastBallPosition ~= nil then
            if RealBall:GetAttribute("target") == Player.Name then
              local DeltaT = os.clock()-Saved.LastTick;
              local VelocityX = (OtherBall.Position.X-Saved.LastBallPosition.X)/DeltaT;
              local VelocityY = (OtherBall.Position.Y-Saved.LastBallPosition.Y)/DeltaT;
              local VelocityZ = (OtherBall.Position.Z-Saved.LastBallPosition.Z)/DeltaT;
              local VelocityMagnitude = math.sqrt(VelocityX^2+VelocityY^2+VelocityZ^2);
    
              local ServerPing = StatsService.Network.ServerStatsItem["Data Ping"]:GetValue();
              local DistanceToPlayer = (Player.Character.HumanoidRootPart.Position-OtherBall.Position).Magnitude;
              local EstimatedTimeToReachPlayer = (ServerPing/VelocityMagnitude)/(ServerPing/DistanceToPlayer);
              local TimeToParry = 0.2*(VelocityMagnitude/DistanceToPlayer);
    
              print(EstimatedTimeToReachPlayer, "<=", TimeToParry);
    
              if tostring(EstimatedTimeToReachPlayer) ~= "inf" and TimeToParry < 10 then
                if EstimatedTimeToReachPlayer <= TimeToParry then
                  if Saved.AttemptedParry == false then
                    warn("--firing");
                    AttemptParry(OtherBall);
                    Saved.AttemptedParry = true;
                  else
                    warn("--attempted");
                  end;
                else
                  Saved.AttemptedParry = false;
                end;
              end;
            else
              Saved.AttemptedParry = false;
            end;
          end;
          Saved.LastBallPosition = OtherBall.Position;
        end;
      end;
      Saved.LastTick = os.clock();
    end;
  end

})

AddButton(Main, {
  Name = "Anti Lag Beta",
  Callback = function()
    print("opa")

    _G.Settings = {
      Players = {
          ["Ignore Me"] = true, -- Ignore your Character
          ["Ignore Others"] = true-- Ignore other Characters
      },
      Meshes = {
          Destroy = false, -- Destroy Meshes
          LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
      },
      Images = {
          Invisible = true, -- Invisible Images
          LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
          Destroy = false, -- Destroy Images
      },
      ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
      ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
      ["No Explosions"] = true, -- Makes Explosion's invisible
      ["No Clothes"] = true, -- Removes Clothing from the game
      ["Low Water Graphics"] = true, -- Removes Water Quality
      ["No Shadows"] = true, -- Remove Shadows
      ["Low Rendering"] = true, -- Lower Rendering
      ["Low Quality Parts"] = true -- Lower quality parts
  }
  loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
  
  end 
  
  })

  local Paragraph = AddParagraph(Main, {"Paragraph teste", "Detects Spam"})

  AddButton(Main, {
    Name = "Detect Spam V1",
    Callback = function()
      print("Olá")

      local function get_plr()
        return game.Players.LocalPlayer
      end
      
      local function get_plrChar()
        local plrChar = get_plr().Character
        if plrChar then
          return plrChar
        end
      end
      
      local function get_plrRP()
        local plrRP = get_plrChar():FindFirstChild("HumanoidRootPart")
        if plrRP then
          return plrRP
        end
      end
      
      local function playerJump()
        pcall(function()
          game.Players.LocalPlayer.Character.Humanoid.Jump = true
        end)
      end
      
      local function get_PlayersNumber()
        local Alive = workspace:WaitForChild("Alive", 20):GetChildren()
        local PlayersNumber = 0
        for _,v in pairs(Alive) do
          if v and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 50 then
            PlayersNumber = PlayersNumber + 1
          end
        end
        return PlayersNumber
      end
      
      local function get_ProxyPlayer()
        local Players = workspace:WaitForChild("Alive"):GetChildren()
        local Distance = math.huge
        local plr = game.Players.LocalPlayer
        local plrRP = plr.Character:FindFirstChild("HumanoidRootPart")
        local Player = nil
        
        for _,plr1 in pairs(Players) do
          if plr1.Name ~= plr.Name and plrRP and plr1:FindFirstChild("HumanoidRootPart") and plr1:FindFirstChild("Humanoid") and plr1.Humanoid.Health > 50 then
            local magnitude = (plr1.HumanoidRootPart.Position - plrRP.Position).Magnitude
            if magnitude <= Distance then
              Distance = magnitude
              Player = plr1
            end
          end
        end
        return Player
      end
      
      local function Click_Button()
        task.spawn(function()
          local plr = game.Players.LocalPlayer
          local plrFind = workspace.Alive:FindFirstChild(plr.Name)
          if plrFind then
            local plrs = 0
            for _,v in pairs(workspace:WaitForChild("Alive", 10):GetChildren()) do
              plrs = plrs + 1
            end
            if plrs > 1 then
              local args = {[1] = 1.5,[2] = CFrame.new(-254, 112, -119) * CFrame.Angles(-2, 0, 2),[3] = {
              ["2617721424"] = Vector3.new(-273, -724, -20),
              },[4] = {[1] = 910,[2] = 154}}
              game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(args))task.wait()
            end
          end
        end)
      end
      
      task.spawn(function()
        while task.wait() do
          if getgenv().SpamClickA then
            Click_Button()
          end
        end
      end)
      
      local function DetectSpam()
        local Balls = workspace:WaitForChild("Balls", 20)
        
        local OldPos = Vector3.new()
        local OldTick1 = tick()
        
        local OldBall = Balls
        local TargetPlayer = ""
        local SpamNum = 0
        local BallSpeed = 0
        local BallDistance = 0
        
        task.spawn(function()
          local OldTick = tick()
          local OldPos = Vector3.new()
          while getgenv().DetectSpam do task.wait()
            local plrRP = get_plrRP()
            local Ball = Balls:FindFirstChildOfClass("Part")
            if plrRP and Ball then
              BallDistance = (plrRP.Position - Ball.Position).Magnitude
              BallSpeed = (OldPos - Ball.Position).Magnitude
              if tick() - OldTick >= 1/60 then
                OldTick = tick()
                OldPos = Ball.Position
              end
            end
          end
        end)
        
        while getgenv().DetectSpam do task.wait()
          local Ball = Balls:FindFirstChildOfClass("Part")
          local plrRP = get_plrRP()
          local ProxyPlayer = get_ProxyPlayer()
          
          if not Ball then
            getgenv().SpamClickA = false
          end
        
          if Ball and Ball:GetAttribute("realBall") and OldBall ~= Ball then
          
            Ball.Changed:Connect(function()task.wait()
              local Ball = Balls:FindFirstChildOfClass("Part")
              
              if Ball then
                TargetPlayer = Ball:GetAttribute("target")
                
                if ProxyPlayer and TargetPlayer == ProxyPlayer.Name or get_plr() and TargetPlayer == get_plr().Name then
                  SpamNum = SpamNum + 1
                else
                  SpamNum = 0
                end
                
                local args = ProxyPlayer and ProxyPlayer:FindFirstChild("HumanoidRootPart")
                local HL1 = ProxyPlayer and ProxyPlayer:FindFirstChild("Highlight")
                local HL2 = get_plrChar() and get_plrChar():FindFirstChild("Highlight")
                
                if plrRP and HL1 and args or plrRP and HL2 and args then
                  local DistancePlayer = (ProxyPlayer.HumanoidRootPart.Position - plrRP.Position).Magnitude
                  local DistanceBall = (Ball.Position - plrRP.Position).Magnitude
                  
                  if get_PlayersNumber() < 3 then
                    if DistancePlayer <= 30 and DistanceBall <= 35 and SpamNum >= 2 then
                      getgenv().SpamClickA = true
                    else
                      getgenv().SpamClickA = false
                    end
                  else
                    if DistancePlayer <= 30 and DistanceBall <= 35 and SpamNum >= 3 then
                      getgenv().SpamClickA = true
                    else
                      getgenv().SpamClickA = false
                    end
                  end
                else
                  getgenv().SpamClickA = false
                end
              end
            end)
            OldBall = Ball
          end
        end
      end
      
      getgenv().DetectSpam = true
      DetectSpam()
    end

  })

  AddButton(Main, {
    Name = "Detect Spam V2",
    Callback = function()
      print("Olá") 

      getgenv().AutoDetectSpam = true

      --///////////////////////////////////////////////////////////////////--
      
      local Alive = workspace:WaitForChild("Alive", 9e9)
      local Players = game:GetService("Players")
      local Player = Players.LocalPlayer
      
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local Remotes = ReplicatedStorage:WaitForChild("Remotes", 9e9)
      local ParryAttempt = Remotes:WaitForChild("ParryAttempt", 9e9)
      local Balls = workspace:WaitForChild("Balls", 9e9)
      
      --///////////////////////////////////////////////////////////////////--
      
      local function get_ProxyPlayer()
        local Distance = math.huge
        local plrRP = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        local PlayerReturn = nil
        
        for _,plr1 in pairs(Alive:GetChildren()) do
          if plr1:FindFirstChild("Humanoid") and plr1.Humanoid.Health > 50 then
            if plr1.Name ~= Player.Name and plrRP and plr1:FindFirstChild("HumanoidRootPart") then
              local magnitude = (plr1.HumanoidRootPart.Position - plrRP.Position).Magnitude
              if magnitude <= Distance then
                Distance = magnitude
                PlayerReturn = plr1
              end
            end
          end
        end
        return PlayerReturn
      end
      
      local function SuperClick()
        task.spawn(function()
          if IsAlive() and #Alive:GetChildren() > 1 then
            local args1 = 0.5
            local args2 = CFrame.new()
            local args3 = {["enzo"] = Vector3.new()}
            local args4 = {500, 500}
            
            if args1 and args2 and args3 and args4 then
              ParryAttempt:FireServer(args1, args2, args3, args4)
            end
          end
        end)
      end
      
      task.spawn(function()
        while task.wait() do
          if getgenv().SpamClickA and getgenv().AutoDetectSpam then
            SuperClick()
          end
        end
      end)
      
      local ParryCounter = 0
      local DetectSpamDistance = 0
      
      local function GetBall(ball)
        local Target = ""
        
        ball:GetPropertyChangedSignal("Position"):Connect(function()
          local PlayerPP = Player and Player.Character and Player.Character.PrimaryPart
          local NearestPlayer = get_ProxyPlayer()
          
          if ball and PlayerPP and NearestPlayer and NearestPlayer.PrimaryPart then
            local PlayerDistance = (PlayerPP.Position - NearestPlayer.PrimaryPart.Position).Magnitude
            local BallDistance = (PlayerPP.Position - ball.Position).Magnitude
            
            DetectSpamDistance = 25 + math.clamp(ParryCounter / 3, 0, 25)
            
            if ParryCounter > 2 and PlayerDistance < DetectSpamDistance and BallDistance < 55 then
              getgenv().SpamClickA = true
            else
              getgenv().SpamClickA = false
            end
          end
        end)
        ball:GetAttributeChangedSignal("target"):Connect(function()
          Target = ball:GetAttribute("target")
          local NearestPlayer = get_ProxyPlayer()
          
          if NearestPlayer then
            if Target == NearestPlayer.Name or Target == Player.Name then
              ParryCounter = ParryCounter + 1
            else
              ParryCounter = 0
            end
          end
        end)
      end
      
      for _,ball in pairs(Balls:GetChildren()) do
        if ball and not ball:GetAttribute("realBall") then
          return
        end
        
        GetBall(ball)
      end
      
      Balls.ChildAdded:Connect(function(ball)
        if not getgenv().AutoDetectSpam then
          return
        elseif ball and not ball:GetAttribute("realBall") then
          return
        end
        
        getgenv().SpamClickA = false
        ParryCounter = 0
        GetBall(ball)
      end)
    end
  
  })

  local Main = MakeTab({Name = "Misc Funções"})

  local section = AddSection(Main, {"Teste"})

  SetSection(section, "Misc Funções")

  AddButton(Main, {
    Name = "Abrir Caixa De Explosão",
    Callback = function()
      print("Olá") 

      anything = true

      while true do
      local args = {
          [1] = "PromptPurchaseCrate",
          [2] = workspace:WaitForChild("Spawn"):WaitForChild("Crates"):WaitForChild("NormalExplosionCrate")
      }
      
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
      end
        end
      })      

      AddButton(Main, {
        Name = "Abrir Caixa De Espada",
        Callback = function()
          print("")

          local args = {
            [1] = "OpeningCase",
            [2] = true
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
      end

    })
