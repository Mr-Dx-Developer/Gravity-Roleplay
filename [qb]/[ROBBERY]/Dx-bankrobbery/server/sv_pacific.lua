RegisterNetEvent('qb-bankrobbery:server:RemoveGoldCard', function()
    local src = source
    
    if Shared.Inventory == 'ox_inventory' then
        exports['ox_inventory']:RemoveItem(src, 'security_card_02', 1, false)
    elseif Shared.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

        Player.Functions.RemoveItem('security_card_02', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['security_card_02'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetGoldCard', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    
    Shared.Banks['Pacific'].card = true
    TriggerClientEvent('qb-bankrobbery:client:SetGoldCard', -1)

    Utils.DoorUpdate(src, Shared.Banks['Pacific'].cardDoor, 0)

    debugPrint(Player.PlayerData.name .. '(id: ' .. src .. ') Used Gold Card') 
    
    TriggerEvent('qb-log:server:CreateLog', 'bankrobbery', 'Use Gold Card', 'white', '**' .. Player.PlayerData.name .. '** (citizenid: *' .. Player.PlayerData.citizenid .. '* | id: *' .. src .. '*) Used Gold Card')
end)
