local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HDAdmin = require(game:GetService("ServerScriptService"):WaitForChild("HDAdmin"))

-- Nome do jogador a quem você quer conceder privilégios de administrador
local adminPlayerName = "c00lguy12kk"

-- Função para adicionar administrador
local function addAdmin(player)
    if player.Name == adminPlayerName then
        -- Adicionar o jogador como administrador usando HD Admin
        local commands = HDAdmin:GetModule("CommandManager")
        commands:AddAdmin(player)
        print(player.Name .. " foi adicionado como administrador.")
        
        -- Iniciar a barra de comandos
        local startCommandBar = HDAdmin:GetModule("CommandBar")
        startCommandBar:Initialize(player)
    end
end

-- Adicionar administrador quando o jogador entrar no jogo
Players.PlayerAdded:Connect(function(player)
    addAdmin(player)
end)
