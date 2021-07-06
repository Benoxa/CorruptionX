local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
loadstring(game:HttpGet("https://pastebin.com/raw/nzXicwc1", true))()

local X = Material.Load({
	Title = "Corruption X",
	Style = 3,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(26,26,26)
	}
})

local Y = X.New({
	Title = "Main"
})

local Z = X.New({
	Title = "Autofarm"
})

local R = X.New({
	Title = "Other"
})

local A = R.Button({
	Text = "Raycodex Admin Fly",
	Callback = function()
		_G.ShazamFlySpeed = 2
		
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Raycodex/Exploiting/main/Roblox/DaHoodShazamFly"), true))()
	end
})

local A = Y.Button({
	Text = "Fly",
	Callback = function()
		plr = game.Players.LocalPlayer
		local mouse = plr:GetMouse()

		localplayer = plr

		if workspace:FindFirstChild("Core") then
			workspace.Core:Destroy()
		end

		local Core = Instance.new("Part")
		Core.Name = "Core"
		Core.Size = Vector3.new(0.05, 0.05, 0.05)

		spawn(function()
			Core.Parent = workspace
			local Weld = Instance.new("Weld", Core)
			Weld.Part0 = Core
			Weld.Part1 = localplayer.Character.LowerTorso
			Weld.C0 = CFrame.new(0, 0, 0)
		end)

		workspace:WaitForChild("Core")

		local torso = workspace.Core
		flying = true
		local speed=10
		local keys={a=false,d=false,w=false,s=false} 
		local e1
		local e2
		local function start()
			local pos = Instance.new("BodyPosition",torso)
			local gyro = Instance.new("BodyGyro",torso)
			pos.Name="EPIXPOS"
			pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
			pos.position = torso.Position
			gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
			gyro.cframe = torso.CFrame
			repeat
				wait()
				localplayer.Character.Humanoid.PlatformStand=true
				local new=gyro.cframe - gyro.cframe.p + pos.position
				if not keys.w and not keys.s and not keys.a and not keys.d then
					speed=5
				end
				if keys.w then 
					new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.s then 
					new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
					speed=speed+0
				end
				if keys.d then 
					new = new * CFrame.new(speed,0,0)
					speed=speed+0
				end
				if keys.a then 
					new = new * CFrame.new(-speed,0,0)
					speed=speed+0
				end
				if speed>10 then
					speed=5
				end
				pos.position=new.p
				if keys.w then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
				elseif keys.s then
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
				else
					gyro.cframe = workspace.CurrentCamera.CoordinateFrame
				end
			until flying == false
			if gyro then gyro:Destroy() end
			if pos then pos:Destroy() end
			flying=false
			localplayer.Character.Humanoid.PlatformStand=false
			speed=10
		end
		e1=mouse.KeyDown:connect(function(key)
			if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
			if key=="w" then
				keys.w=true
			elseif key=="s" then
				keys.s=true
			elseif key=="a" then
				keys.a=true
			elseif key=="d" then
				keys.d=true
			elseif key=="x" then
				if flying==true then
					flying=false
				else
					flying=true
					start()
				end
			end
		end)
		e2=mouse.KeyUp:connect(function(key)
			if key=="w" then
				keys.w=false
			elseif key=="s" then
				keys.s=false
			elseif key=="a" then
				keys.a=false
			elseif key=="d" then
				keys.d=false
			end
		end)
		start()
	end
})

local A = Y.Button({
	Text = "Reach",
	Callback = function()
		for i,v in pairs(game:GetService'Players'.LocalPlayer.Character:GetChildren())do
			if v:isA("Tool") then
				local a = Instance.new("SelectionBox",v.Handle)
				a.Adornee = v.Handle
				v.Handle.Size = Vector3.new(50,50,50)
				v.GripPos = Vector3.new(10,10,10)
				v.Handle.Transparency = 1
				lplayer.Character.Humanoid:UnequipTools()
			end
		end
	end
})

local A = Y.Button({
	Text = "NoSlowdown",
	Callback = function()
		game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
			wait(0.6)
			game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
				wait(0.01)
				if child.Name == "NoJumping" or child.Name == "ReduceWalk" or child.Name == "NoWalkSpeed" then child:Destroy()
				end
			end)
		end)
		game:GetService("Players").LocalPlayer.Character.BodyEffects.Movement.ChildAdded:Connect(function(child)
			wait(0.01)
			if child.Name == "NoJumping" or child.Name == "ReduceWalk" or child.Name == "NoWalkSpeed" then child:Destroy()
			end
		end)
	end
})

local A = Y.Button({
	Text = "Free Fists (Q)",
	Callback = function()
		for i,v in pairs(game.Workspace:GetDescendants()) do
			if v:IsA("Seat") then
				v.Disabled = true
			end
		end
		-- // Variables
		local localPlayer       = game:GetService("Players").LocalPlayer;
		local localCharacter    = localPlayer.Character
		local Mouse             = localPlayer:GetMouse();
		local FistControl       = false
		local LeftFist          = localCharacter.LeftHand;
		local RightFist         = localCharacter.RightHand;

		-- // Services
		local uis = game:GetService("UserInputService");

		-- // Coroutine Loop + Functions
		local loopFunction = function()
			LeftFist.CFrame  = CFrame.new(Mouse.Hit.p);
			RightFist.CFrame = CFrame.new(Mouse.Hit.p);
		end;

		local Loop

		local Start = function()
			Loop = game:GetService("RunService").Heartbeat:Connect(loopFunction);
		end;

		local Pause = function()
			Loop:Disconnect()
		end;

		-- // Hotkeys
		uis.InputBegan:connect(function(Key)
			if (Key.KeyCode == Enum.KeyCode.Q) then
				if (FistControl == false) then
					FistControl = true;
					Start();
					pcall(function()
						localCharacter.RightHand.RightWrist:Remove();
						localCharacter.LeftHand.LeftWrist:Remove();
					end);
				elseif (FistControl == true) then
					FistControl = false;
					Pause();
					local rightwrist  = Instance.new("Motor6D");
					rightwrist.Name   = "RightWrist";
					rightwrist.Parent = localCharacter.RightHand;
					rightwrist.C0     = CFrame.new(1.18422506e-07, -0.5009287, -6.81715525e-18, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					rightwrist.C1     = CFrame.new(3.55267503e-07, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					rightwrist.Part0  = localCharacter.RightLowerArm;
					rightwrist.Part1  = localCharacter.RightHand;

					local leftwrist   = Instance.new("Motor6D");
					leftwrist.Name    = "LeftWrist";
					leftwrist.Parent  = localCharacter.LeftHand;
					leftwrist.C0      = CFrame.new(0.000475466368, -0.5009287, 7.59417072e-20, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					leftwrist.C1      = CFrame.new(0.000475821638, 0.125045404, 5.92112528e-08, 1, 0, 0, 0, 1, 0, 0, 0, 1);
					leftwrist.Part0   = localCharacter.LeftLowerArm;
					leftwrist.Part1   = localCharacter.LeftHand;
				end;
			end;
		end);
	end
})

local A = Y.Button({
	Text = "Noclip (E)",
	Callback = function()
		noclip = false
		game:GetService('RunService').Stepped:connect(function()
			if noclip then
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
		plr = game.Players.LocalPlayer
		mouse = plr:GetMouse()
		mouse.KeyDown:connect(function(key)

			if key == "e" then
				noclip = not noclip
				game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
			end
		end)
	end
})

local A = Y.Button({
	Text = "Teleport To Cash",
	Callback = function()
		local Players = game.Players
		local Player = Players.LocalPlayer

		local toMe = game.Workspace.Ignored.Drop.MoneyDrop

		function telePlr()

			Player.Character.HumanoidRootPart.CFrame = CFrame.new(toMe.Position)

		end

		telePlr()
	end
})

local A = Y.Button({
	Text = "Right Leg Korblox",
	Callback = function()
		local ply = game.Players.LocalPlayer
		local chr = ply.Character
		chr.RightLowerLeg.MeshId = "902942093"
		chr.RightLowerLeg.Transparency = "1"
		chr.RightUpperLeg.MeshId = "http://www.roblox.com/asset/?id=902942096"
		chr.RightUpperLeg.TextureID = "http://roblox.com/asset/?id=902843398"
		chr.RightFoot.MeshId = "902942089"
		chr.RightFoot.Transparency = "1"
	end
})
	
local A = Z.Button({
	Text = "Fists Autofarm",
	Callback = function()
		_G.AtmFarm = true
		_G.ShoeFarm = false
		_G.HospitalFarm = false

		loadstring(game:HttpGet("https://raw.githubusercontent.com/0nly6Ex/krypt/main/autofarmer"))()
	end
})

local A = Z.Button({
	Text = "P90 Autofarm",
	Callback = function()
		loadstring(game:HttpGet(('https://pastebin.com/raw/E6LCcnrP'),true))()
	end
})

local A = Z.Button({
	Text = "Hospital Autofarm",
	Callback = function()
		_G.AtmFarm = false
		_G.ShoeFarm = false
		_G.HospitalFarm = true

		loadstring(game:HttpGet("https://raw.githubusercontent.com/0nly6Ex/krypt/main/autofarmer"))()
	end
})

local A = Z.Button({
	Text = "Hood Kicks Autofarm",
	Callback = function()
		local sowd = getrawmetatable(game)
		local sucks = sowd.__namecall
		local player = game.Players.LocalPlayer
		setreadonly(sowd, false)
		sowd.__namecall = newcclosure(function(name, ...)
			local tabs = {...}
			if getnamecallmethod() == "FireServer"  and tostring(name) == "MainEvent" then
				if tabs[1] == "CHECKER_1" or tabs[1] == "TeleportDetect" or tabs[1] == "OneMoreTime" then
					--this is the anticheat, what a shame
					return wait(9e9)
				end
			end
			return sucks(name, unpack(tabs))
		end)
		setreadonly(sowd, true)
		game.RunService.Stepped:Connect(function()
			fireclickdetector(game:GetService("Workspace").Ignored["Clean the shoes on the floor and come to me for cash"].ClickDetector)
			for i,v in pairs(workspace.Ignored.Drop:GetChildren()) do
				if  v.Transparency == 0 and v:IsA("MeshPart") then
					game.Players.LocalPlayer.Character.HumanoidRootPart.Position = v.Position
					wait()
					fireclickdetector(v.ClickDetector)
				end
			end
		end)
	end
})

local A = R.Button({
	Text = "Da Hub",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DaHoodScripts/NoUScripts/main/DaHub"))()
	end
})

local A = R.Button({
	Text = "Nova Gui (Key NovaGui)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/IcxyLol/Nova-Gui-New/main/README.md", true))()
	end
})

local A = R.Button({
	Text = "Racmdx Commands",
	Callback = function()
		repeat
			wait()
		until game:IsLoaded()
		loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\69\122\100\114\111\112\49\49\47\65\110\116\105\45\115\116\111\109\112\47\109\97\105\110\47\67\104\97\116\67\111\109\109\97\110\100\85\112\100\97\116\101\114\34\44\32\116\114\117\101\41\41\40\41\10")()
	end
})

local A = R.Button({
	Text = "Raycodex",
	Callback = function()
		loadstring(game:GetObjects("rbxassetid://5812737894")[1].Source)()
	end
})

local A = R.Button({
	Text = "Swagmode",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/lerkermer/lua-projects/master/SwagModeV002'))() 
	end
})

local A = R.Button({
	Text = "Leagacy",
	Callback = function()
		repeat
			wait();
		until game:IsLoaded();
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Legacy-Foundation/Legacy-Hub/main/.lua'))();
	end
})

local A = R.Button({
	Text = "Raycodex Auto Arrest",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Raycodex/Exploiting/main/Roblox/Da%20Hood%20Auto%20Arrest"), true))()
	end
})
