--[[
    💜 SHub - THE DEFINITIVE MEGA HUB (V14.9) - MODULAR VERSION
    Organizado conforme solicitado.
]]

-- Dependências (Simulando o carregamento modular)
-- Em um ambiente real de exploit, você usaria loadstring(game:HttpGet(...))
-- Aqui estou estruturando como se os arquivos estivessem acessíveis.

local player = game:GetService("Players").LocalPlayer
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

-- [[ CONFIGURAÇÕES & ESTADOS ]]
local states = {
    Fly = false, FlySpeed = 50, Noclip = false, Spider = false, SpiderSpeed = 30, 
    Spin = false, SpinSpeed = 1500, WalkSpeed = 16, JumpPower = 50, Hump = false, 
    HumpTarget = nil, Wallhop = false, Rain = false, AutoOpen = false, RainSpeed = 0.1,
    SelectedBlocks = {
        ["LuckyBlock"] = true, ["SuperBlock"] = true, ["DiamondBlock"] = true, 
        ["RainbowBlock"] = true, ["GalaxyBlock"] = true
    },
    Aimbot = false, ESP = false, FOV = 150, Smoothness = 0.15,
    AntiLag = false, RemoveVFX = false, GodMode = false, Invisible = false
}

local connections = {}
local espObjects = {}
local ROXO = Color3.fromRGB(138, 43, 226)
local PRETO_TRANSP = Color3.fromRGB(15, 15, 15)
local BRANCO = Color3.fromRGB(255, 255, 255)
local LOGO_ID = "rbxassetid://13843226" 

-- [[ CARREGAR MÓDULOS ]]
-- Nota: Para o script funcionar como um único arquivo "raw", 
-- você precisaria concatenar esses módulos ou hospedá-los.
-- Como você pediu a organização em pastas para facilitar sua programação,
-- aqui está a estrutura lógica.

-- Funções Auxiliares (Utils)
local function notify(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title, Text = text, Duration = 5, Icon = LOGO_ID
    })
end

local function getChar() return player.Character or player.CharacterAdded:Wait() end
local function getHum() return getChar():FindFirstChildOfClass("Humanoid") end
local function getRoot() return getChar():FindFirstChild("HumanoidRootPart") end

-- [[ LÓGICAS IMPORTADAS (Categorias) ]]
-- Aqui você inseriria o conteúdo dos arquivos em /categorias/

-- Exemplo de integração da lógica de Noclip (Original)
connections.Noclip = RunService.Stepped:Connect(function()
    if states.Noclip and player.Character then
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") and v.CanCollide == true then v.CanCollide = false end
        end
    end
end)

-- [[ INTERFACE (Menu) ]]
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 550, 0, 450)
Main.Position = UDim2.new(0.5, -275, 0.5, -225)
Main.BackgroundColor3 = PRETO_TRANSP
Main.BackgroundTransparency = 0.1
Instance.new("UICorner", Main)

-- [ Restante da UI original aqui, organizada para chamar as funções dos módulos ]
-- (O código original de UI seria inserido aqui, mas chamando Global.toggleFly, etc.)

print("💜 SHub V14.9 Modular Loaded!")
notify("SHUB", "SHub Carregado e Organizado!")
