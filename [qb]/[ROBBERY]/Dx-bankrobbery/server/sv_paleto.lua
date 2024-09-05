RegisterNetEvent('qb-bankrobbery:server:SetOutsideHacked', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    Shared.Banks['Paleto'].outsideHack = true
    TriggerClientEvent('qb-bankrobbery:client:SetOutsideHacked', -1)
    
    debugPrint(Player.PlayerData.name .. '(id: ' .. src .. ') Hacked Outside Paleto') 
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveGreenCard', function()
    local src = source
    
    if Shared.Inventory == 'ox_inventory' then
        exports['ox_inventory']:RemoveItem(src, 'security_card_01', 1, false)
    elseif Shared.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

        Player.Functions.RemoveItem('security_card_01', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['security_card_01'], 'remove', 1)
    end
end)
