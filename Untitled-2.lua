local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Vick Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab1 = Window:MakeTab({
    Name = "BUTTONS",
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

              getgenv().visualizer = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()

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

OrionLib:Init()
