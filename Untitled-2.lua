--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.16) ~  Much Love, Ferib 

]]--

local v0 = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))();
local v1 = v0:MakeWindow({Name="Vick Hub Beta",HidePremium=false,SaveConfig=true,ConfigFolder="OrionTest"});
local v2 = v1:MakeTab({Name="MAIN",Icon="rbxassetid://4483345998",PremiumOnly=false});
local v3 = v2:AddSection({Name="Test"});
v2:AddButton({Name="Auto Parry",Callback=function()
	print("button pressed");
	local v4 = game:GetService("Workspace");
	local v5 = game:GetService("Players");
	local v6 = game:GetService("RunService");
	local v7 = game:GetService("VirtualInputManager");
	local v8 = v4.Balls;
	local v9 = Instance.new("Part");
	v9.Size = Vector3.new(5, 5, 5);
	v9.Anchored = true;
	v9.CanCollide = false;
	v9.Transparency = 1;
	v9.BrickColor = BrickColor.new("Bright red");
	v9.Parent = v4;
	local v16 = nil;
	local v17 = false;
	local function v18(v87, v88)
		if (v88.Character and v88.Character:FindFirstChild("HumanoidRootPart")) then
			local v143 = v88.Character.HumanoidRootPart;
			local v144 = v87.Position - v143.Position;
			local v145 = v87.Velocity + v143.Velocity;
			local v146 = v87.Size.magnitude / 2;
			local v147 = v144.magnitude;
			local v148 = math.sqrt((v146 * v146) + (v147 * v147));
			local v149 = (v148 - v146) / v145.magnitude;
			return v149;
		end
		return math.huge;
	end
	local function v19(v89)
		v9.Position = v89.Position;
	end
	local function v20(v92, v93)
		local v94 = v18(v92, v93);
		local v95 = v92:GetAttribute("realBall");
		local v96 = v92:GetAttribute("target");
		local v97 = math.max(0.4, 0.6 - (v92.Velocity.magnitude * 0.01));
		if ((v94 <= v97) and (v95 == true) and (v96 == v93.Name) and not v17) then
			v7:SendKeyEvent(true, Enum.KeyCode.F, false, nil);
			wait(0.005);
			v7:SendKeyEvent(false, Enum.KeyCode.F, false, nil);
			v16 = v92;
			v17 = true;
		elseif ((v16 == v92) and ((v94 > v97) or (v95 ~= true) or (v96 ~= v93.Name))) then
			v17 = false;
		end
	end
	local function v21()
		local v98 = v5.LocalPlayer;
		if v98 then
			for v152, v153 in pairs(v8:GetChildren()) do
				v20(v153, v98);
				v19(v153);
			end
		end
	end
	v6.Heartbeat:Connect(v21);
	print("Script ran without errors");
end});
v2:AddButton({Name="Clash",Callback=function()
	print("button pressed");
	loadstring(game:HttpGet("https://pastebin.com/raw/KB4xQe4j"))();
end});
v2:AddButton({Name="Anti Lag",Callback=function()
	print("button pressed");
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))();
end});
v2:AddButton({Name="Anti Afk Kick",Callback=function()
	print("button pressed");
	wait(0.5);
	local v22 = Instance.new("ScreenGui");
	local v23 = Instance.new("TextLabel");
	local v24 = Instance.new("Frame");
	local v25 = Instance.new("TextLabel");
	local v26 = Instance.new("TextLabel");
	v22.Parent = game.CoreGui;
	v22.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	v23.Parent = v22;
	v23.Active = true;
	v23.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471);
	v23.Draggable = true;
	v23.Position = UDim2.new(0.698610067, 0, 0.098096624, 0);
	v23.Size = UDim2.new(0, 370, 0, 52);
	v23.Font = Enum.Font.SourceSansSemibold;
	v23.Text = "Anti Afk";
	v23.TextColor3 = Color3.new(0, 1, 1);
	v23.TextSize = 22;
	v24.Parent = v23;
	v24.BackgroundColor3 = Color3.new(0.196078, 0.196078, 0.196078);
	v24.Position = UDim2.new(0, 0, 1.0192306, 0);
	v24.Size = UDim2.new(0, 370, 0, 107);
	v25.Parent = v24;
	v25.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471);
	v25.Position = UDim2.new(0, 0, 0.800455689, 0);
	v25.Size = UDim2.new(0, 370, 0, 21);
	v25.Font = Enum.Font.Arial;
	v25.Text = "Made by Headshot#5868";
	v25.TextColor3 = Color3.new(0, 1, 1);
	v25.TextSize = 20;
	v26.Parent = v24;
	v26.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471);
	v26.Position = UDim2.new(0, 0, 0.158377, 0);
	v26.Size = UDim2.new(0, 370, 0, 44);
	v26.Font = Enum.Font.ArialBold;
	v26.Text = "Status: Active";
	v26.TextColor3 = Color3.new(0, 1, 1);
	v26.TextSize = 20;
	local v64 = game("VirtualUser");
	game("Players").LocalPlayer.Idled:connect(function()
		v64:CaptureController();
		v64:ClickButton2(Vector2.new());
		v26.Text = "Roblox kicked you but we didnt let them!";
		wait(2);
		v26.Text = "Status : Active";
	end);
end});
v2:AddButton({Name="Detect Spam V2",Callback=function()
	print("button pressed");
	getgenv().AutoDetectSpam = true;
	local v66 = workspace:WaitForChild("Alive", 8999999488);
	local v67 = game:GetService("Players");
	local v68 = v67.LocalPlayer;
	local v69 = game:GetService("ReplicatedStorage");
	local v70 = v69:WaitForChild("Remotes", 8999999488);
	local v71 = v70:WaitForChild("ParryAttempt", 8999999488);
	local v72 = workspace:WaitForChild("Balls", 8999999488);
	local function v73()
		local v100 = math.huge;
		local v101 = v68.Character and v68.Character:FindFirstChild("HumanoidRootPart");
		local v102 = nil;
		for v126, v127 in pairs(v66:GetChildren()) do
			if (v127:FindFirstChild("Humanoid") and (v127.Humanoid.Health > 50)) then
				if ((v127.Name ~= v68.Name) and v101 and v127:FindFirstChild("HumanoidRootPart")) then
					local v168 = (v127.HumanoidRootPart.Position - v101.Position).Magnitude;
					if (v168 <= v100) then
						v100 = v168;
						v102 = v127;
					end
				end
			end
		end
		return v102;
	end
	local function v74()
		task.spawn(function()
			if (IsAlive() and (#v66:GetChildren() > 1)) then
				local v154 = 0.5;
				local v155 = CFrame.new();
				local v156 = {enzo=Vector3.new()};
				local v157 = {500,500};
				if (v154 and v155 and v156 and v157) then
					v71:FireServer(v154, v155, v156, v157);
				end
			end
		end);
	end
	task.spawn(function()
		while task.wait() do
			if (getgenv().SpamClickA and getgenv().AutoDetectSpam) then
				v74();
			end
		end
	end);
	local v75 = 0;
	local v76 = 0;
	local function v77(v103)
		local v104 = "";
		v103:GetPropertyChangedSignal("Position"):Connect(function()
			local v128 = v68 and v68.Character and v68.Character.PrimaryPart;
			local v129 = v73();
			if (v103 and v128 and v129 and v129.PrimaryPart) then
				local v158 = (v128.Position - v129.PrimaryPart.Position).Magnitude;
				local v159 = (v128.Position - v103.Position).Magnitude;
				v76 = 25 + math.clamp(v75 / 3, 0, 25);
				if ((v75 > 2) and (v158 < v76) and (v159 < 55)) then
					getgenv().SpamClickA = true;
				else
					getgenv().SpamClickA = false;
				end
			end
		end);
		v103:GetAttributeChangedSignal("target"):Connect(function()
			v104 = v103:GetAttribute("target");
			local v130 = v73();
			if v130 then
				if ((v104 == v130.Name) or (v104 == v68.Name)) then
					v75 = v75 + 1;
				else
					v75 = 0;
				end
			end
		end);
	end
	for v105, v106 in pairs(v72:GetChildren()) do
		if (v106 and not v106:GetAttribute("realBall")) then
			return;
		end
		v77(v106);
	end
	v72.ChildAdded:Connect(function(v107)
		if not getgenv().AutoDetectSpam then
			return;
		elseif (v107 and not v107:GetAttribute("realBall")) then
			return;
		end
		getgenv().SpamClickA = false;
		v75 = 0;
		v77(v107);
	end);
end});
v2:AddButton({Name="Detect Spam V1",Callback=function()
	print("button pressed");
	local function v78()
		return game.Players.LocalPlayer;
	end
	local function v79()
		local v109 = v78().Character;
		if v109 then
			return v109;
		end
	end
	local function v80()
		local v110 = v79():FindFirstChild("HumanoidRootPart");
		if v110 then
			return v110;
		end
	end
	local function v81()
		pcall(function()
			game.Players.LocalPlayer.Character.Humanoid.Jump = true;
		end);
	end
	local function v82()
		local v111 = workspace:WaitForChild("Alive", 20):GetChildren();
		local v112 = 0;
		for v132, v133 in pairs(v111) do
			if (v133 and v133:FindFirstChild("Humanoid") and (v133.Humanoid.Health > 50)) then
				v112 = v112 + 1;
			end
		end
		return v112;
	end
	local function v83()
		local v113 = workspace:WaitForChild("Alive"):GetChildren();
		local v114 = math.huge;
		local v115 = game.Players.LocalPlayer;
		local v116 = v115.Character:FindFirstChild("HumanoidRootPart");
		local v117 = nil;
		for v134, v135 in pairs(v113) do
			if ((v135.Name ~= v115.Name) and v116 and v135:FindFirstChild("HumanoidRootPart") and v135:FindFirstChild("Humanoid") and (v135.Humanoid.Health > 50)) then
				local v160 = (v135.HumanoidRootPart.Position - v116.Position).Magnitude;
				if (v160 <= v114) then
					v114 = v160;
					v117 = v135;
				end
			end
		end
		return v117;
	end
	local function v84()
		task.spawn(function()
			local v136 = game.Players.LocalPlayer;
			local v137 = workspace.Alive:FindFirstChild(v136.Name);
			if v137 then
				local v161 = 0;
				for v163, v164 in pairs(workspace:WaitForChild("Alive", 10):GetChildren()) do
					v161 = v161 + 1;
				end
				if (v161 > 1) then
					local v171 = {[1]=1.5,[2]=(CFrame.new(-254, 112, -119) * CFrame.Angles(-2, 0, 2)),[3]={["2617721424"]=Vector3.new(-273, -724, -20)},[4]={[1]=910,[2]=154}};
					game:GetService("ReplicatedStorage").Remotes.ParryAttempt:FireServer(unpack(v171));
					task.wait();
				end
			end
		end);
	end
	task.spawn(function()
		while task.wait() do
			if getgenv().SpamClickA then
				v84();
			end
		end
	end);
	local function v85()
		local v118 = workspace:WaitForChild("Balls", 20);
		local v119 = Vector3.new();
		local v120 = tick();
		local v121 = v118;
		local v122 = "";
		local v123 = 0;
		local v124 = 0;
		local v125 = 0;
		task.spawn(function()
			local v138 = tick();
			local v139 = Vector3.new();
			while getgenv().DetectSpam do
				task.wait();
				local v150 = v80();
				local v151 = v118:FindFirstChildOfClass("Part");
				if (v150 and v151) then
					v125 = (v150.Position - v151.Position).Magnitude;
					v124 = (v139 - v151.Position).Magnitude;
					if ((tick() - v138) >= (1 / 60)) then
						v138 = tick();
						v139 = v151.Position;
					end
				end
			end
		end);
		while getgenv().DetectSpam do
			task.wait();
			local v140 = v118:FindFirstChildOfClass("Part");
			local v141 = v80();
			local v142 = v83();
			if not v140 then
				getgenv().SpamClickA = false;
			end
			if (v140 and v140:GetAttribute("realBall") and (v121 ~= v140)) then
				v140.Changed:Connect(function()
					task.wait();
					local v167 = v118:FindFirstChildOfClass("Part");
					if v167 then
						v122 = v167:GetAttribute("target");
						if ((v142 and (v122 == v142.Name)) or (v78() and (v122 == v78().Name))) then
							v123 = v123 + 1;
						else
							v123 = 0;
						end
						local v173 = v142 and v142:FindFirstChild("HumanoidRootPart");
						local v174 = v142 and v142:FindFirstChild("Highlight");
						local v175 = v79() and v79():FindFirstChild("Highlight");
						if ((v141 and v174 and v173) or (v141 and v175 and v173)) then
							local v176 = (v142.HumanoidRootPart.Position - v141.Position).Magnitude;
							local v177 = (v167.Position - v141.Position).Magnitude;
							if (v82() < 3) then
								if ((v176 <= 30) and (v177 <= 35) and (v123 >= 2)) then
									getgenv().SpamClickA = true;
								else
									getgenv().SpamClickA = false;
								end
							elseif ((v176 <= 30) and (v177 <= 35) and (v123 >= 3)) then
								getgenv().SpamClickA = true;
							else
								getgenv().SpamClickA = false;
							end
						else
							getgenv().SpamClickA = false;
						end
					end
				end);
				v121 = v140;
			end
		end
	end
	getgenv().DetectSpam = true;
	v85();
end});
v0:Init();
