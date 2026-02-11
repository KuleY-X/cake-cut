local QBCore = exports['qb-core']:GetCoreObject()
local Cooldowns = {}

RegisterNetEvent('unity_cake:server:cut', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local citizenId = Player.PlayerData.citizenid

    -- Check if it's the birthday person
    if citizenId ~= Config.AllowedCitizenId then
        TriggerClientEvent('QBCore:Notify', src, Config.Text.NotBirthday, 'error')
        return
    end
    
    local currentTime = os.time()
    
    if Config.Cooldown > 0 then
        if Cooldowns[citizenId] and (currentTime - Cooldowns[citizenId]) < Config.Cooldown then
            local remaining = Config.Cooldown - (currentTime - Cooldowns[citizenId])
            TriggerClientEvent('QBCore:Notify', src, Config.Text.Cooldown .. " (" .. remaining .. "s)", 'error')
            return
        end
    end
    
    -- Give Item
    if Player.Functions.AddItem(Config.ItemName, Config.ItemAmount) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ItemName], "add")
        TriggerClientEvent('QBCore:Notify', src, Config.Text.Success, 'success')
        Cooldowns[citizenId] = currentTime
    else
        TriggerClientEvent('QBCore:Notify', src, "Inventory full!", 'error')
    end
end)
