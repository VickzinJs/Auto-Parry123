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
    print("Olá")

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
  loadstring(game:HttpGet("https://raw.githubusercontent.com/VickzinJs/Auto-Parry123/main/--Abaixo%20estar%C3%A1%20a%20lib%20da%20nossa%20UI.lua"))()
  
  end 
  
  })
