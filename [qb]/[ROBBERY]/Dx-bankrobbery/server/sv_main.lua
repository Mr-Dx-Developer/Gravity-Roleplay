QBCore = exports['qb-core']:GetCoreObject()

trollies = {}

robberyBusy = {
    fleeca = false,
    maze = false,
    paleto = false,
    pacific = false,
    vault = false
}

--- Functions

--- Method to print debug messages to console when Shared.Debug is enabled
---@param message string - message to print
---@return nil
debugPrint = function(message)
    if Shared.Debug and type(message) == 'string' then
        print('^3[qb-bankrobbery] ^5' .. message .. '^7')
    end
end

CreateTrollys = function(bank)
    trollies[bank] = {}

    for k, v in ipairs(Shared.Banks[bank].trolly) do
        local model = `hei_prop_hei_cash_trolly_01`
        if v.type == 'gold' then model = `ch_prop_gold_trolly_01a` end
        local trolly = CreateObject(model, v.coords.x, v.coords.y, v.coords.z - 1.0, 1, 0, 0)
        SetEntityHeading(trolly, v.coords.w)
        FreezeEntityPosition(trolly, true)
        trollies[bank][#trollies[bank] + 1] = trolly
    end
end

ClearTrollys = function(bank)
    if not trollies[bank] then return end

    for i = 1, #trollies[bank], 1 do
        if DoesEntityExist(trollies[bank][i]) then
            DeleteEntity(trollies[bank][i])
        end
    end

    trollies[bank] = nil
end

--- Resets all bool variables for a given bank so that it can be hit again
---@param bank string - Name of the bank
local ResetBank = function(bank)
    robberyBusy[Shared.Banks[bank].type] = false

    -- Scoreboard trigger
    TriggerEvent('qb-scoreboard:server:SetActivityBusy', Shared.Banks[bank].type, false)

    -- Door
    Shared.Banks[bank].hacked = false
    Shared.Banks[bank].policeClose = false

    -- lockers
    for i = 1, #Shared.Banks[bank].lockers, 1 do
        Shared.Banks[bank].lockers[i].busy = false
        Shared.Banks[bank].lockers[i].taken = false
    end

    -- Trollys
    ClearTrollys(bank)

    for j = 1, #Shared.Banks[bank].trolly, 1 do
        Shared.Banks[bank].trolly[j].taken = false
    end

    -- Thermite spots
    if Shared.Banks[bank].thermite then
        for k = 1, #Shared.Banks[bank].thermite, 1 do
            Shared.Banks[bank].thermite[k].hit = false
        end
    end

    -- Stackpiles of cash or gold
    if Shared.Banks[bank].stacks then
        for h = 1, #Shared.Banks[bank].stacks, 1 do
            Shared.Banks[bank].stacks[h].busy = false
            Shared.Banks[bank].stacks[h].taken = false
        end
    end

    -- Big Banks
    if bank == 'Paleto' then
        Shared.Banks['Paleto'].outsideHack = false
    elseif bank == 'Pacific' then
        Shared.Banks['Pacific'].card = false
    elseif bank == 'Vault' then
        Shared.Banks['Vault'].lockdown = false
        Shared.Banks['Vault'].goldhacked = false
        Shared.Banks['Vault'].code = false
        ClearStacks('Vault')
    end

    TriggerClientEvent('qb-bankrobbery:client:ResetBank', -1, bank)

    debugPrint('Bank Fully Reset: ' .. bank)
end

SwapTrolly = function(bank, index, entity)
    local newTrollyModel = `hei_prop_hei_cash_trolly_03`
    
    if Shared.Banks[bank].trolly[index].type == 'gold' then
        newTrollyModel = `ch_prop_gold_trolly_empty`
    end

    local newTrolly = CreateObject(newTrollyModel, Shared.Banks[bank].trolly[index].coords.x, Shared.Banks[bank].trolly[index].coords.y, Shared.Banks[bank].trolly[index].coords.z - 1.0, 1, 0, 0)
    SetEntityHeading(newTrolly, Shared.Banks[bank].trolly[index].coords.w)
    DeleteEntity(entity)
    trollies[bank][index] = newTrolly
    FreezeEntityPosition(newTrolly, true)
end

--- Events

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() ~= resource then return end

    for k, v in pairs(trollies) do
        for i = 1, #v, 1 do
            if DoesEntityExist(v[i]) then
                DeleteEntity(v[i])
            end
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetBankHacked', function(bank)
    if not Shared.Banks[bank] then return end
    if Shared.Banks[bank].hacked then return end

    Shared.Banks[bank].hacked = true
    robberyBusy[Shared.Banks[bank].type] = true
    TriggerEvent('qb-scoreboard:server:SetActivityBusy', Shared.Banks[bank].type, true)

    CreateTrollys(bank)

    SetTimeout(Shared.BankSettings.VaultUnlockTime * 1000, function()
        TriggerClientEvent('qb-bankrobbery:client:SetBankHacked', -1, bank)
    end)

    SetTimeout(Shared.Cooldown[Shared.Banks[bank].type] * 60 * 1000, function() -- Cooldown timer
        ResetBank(bank)
    end)
end)

RegisterNetEvent('qb-bankrobbery:server:PDClose', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local bank = data.bank
    if not Shared.Banks[bank] then return end
    
    if not Utils.PlayerIsLeo(Player.PlayerData.job) then return end

    Shared.Banks[bank].policeClose = not Shared.Banks[bank].policeClose
    TriggerClientEvent('qb-bankrobbery:client:PDClose', -1, bank)
end)

RegisterNetEvent('qb-bankrobbery:server:SetTrollyBusy', function(bank, index)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    if not Shared.Banks[bank] or not Shared.Banks[bank].trolly[index] then return end
    if #(coords - Shared.Banks[bank].trolly[index].coords.xyz) > 2.0 then return end

    Shared.Banks[bank].trolly[index].busy = true
    TriggerClientEvent('qb-bankrobbery:client:SetTrollyBusy', -1, bank, index)
end)

RegisterNetEvent('qb-bankrobbery:server:TrollyReward', function(netId, bank, index)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or type(netId) ~= 'number' or not Shared.Banks[bank] or not Shared.Banks[bank].trolly[index] then return end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if entity ~= trollies[bank][index] then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.Banks[bank].trolly[index].coords.xyz) > 10 then return end
    if Shared.Banks[bank].trolly[index].taken then return end

    TriggerClientEvent('qb-bankrobbery:client:SetTrollyTaken', -1, bank, index)
    Shared.Banks[bank].trolly[index].taken = true

    SwapTrolly(bank, index, entity)

    local bankType = Shared.Banks[bank].type
    local rewardType = Shared.Banks[bank].trolly[index].type

    if rewardType == 'money' then
        local receiveAmount = math.random(Rewards.Trollys[rewardType][bankType].minAmount, Rewards.Trollys[rewardType][bankType].maxAmount)
        
        local metaData = {
            worth = math.random(Rewards.Trollys[rewardType][bankType].minWorth, Rewards.Trollys[rewardType][bankType].maxWorth)
        }

        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, 'markedbills', receiveAmount) then
                exports['ox_inventory']:AddItem(src, 'markedbills', receiveAmount, metaData)
            else
                exports['ox_inventory']:CustomDrop('Bank Trolly', {
                    { 'markedbills', receiveAmount, metaData }
                }, GetEntityCoords(GetPlayerPed(src)))

                Utils.Notify(src, Locales['notify_invent_desc'], 'error', 5000)
            end
        elseif Shared.Inventory == 'qb' then
            Player.Functions.AddItem('markedbills', receiveAmount, false, metaData)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], 'add', receiveAmount)
        end
    elseif rewardType == 'gold' then
        local receiveAmount = math.random(Rewards.Trollys[rewardType][bankType].minAmount, Rewards.Trollys[rewardType][bankType].maxAmount)
        
        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, 'goldbar1', receiveAmount) then
                exports['ox_inventory']:AddItem(src, 'goldbar1', receiveAmount)
            else
                exports['ox_inventory']:CustomDrop('Bank Trolly', {
                    { 'goldbar1', receiveAmount }
                }, GetEntityCoords(GetPlayerPed(src)))

                Utils.Notify(src, Locales['notify_invent_desc'], 'error', 5000)
            end
        elseif Shared.Inventory == 'qb' then
            Player.Functions.AddItem('goldbar1', receiveAmount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['goldbar1'], 'add', receiveAmount)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetLockerBusy', function(bank, index)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))

    if not Shared.Banks[bank] or not Shared.Banks[bank].lockers[index] then return end
    if #(coords - Shared.Banks[bank].lockers[index].coords.xyz) > 5.0 then return end

    Shared.Banks[bank].lockers[index].busy = true
    TriggerClientEvent('qb-bankrobbery:client:SetLockerBusy', -1, bank, index)
end)

RegisterNetEvent('qb-bankrobbery:server:LockerReward', function(bank, index)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or not Shared.Banks[bank] or not Shared.Banks[bank].lockers[index] then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.Banks[bank].lockers[index].coords.xyz) > 10 then return end
    if Shared.Banks[bank].lockers[index].taken then return end

    TriggerClientEvent('qb-bankrobbery:client:SetLockerTaken', -1, bank, index)
    Shared.Banks[bank].lockers[index].taken = true

    local bankType = Shared.Banks[bank].type

    if math.random(100) < Rewards.Lockers[bankType].rareChance then -- Rare item loot
        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, Rewards.Lockers[bankType].rareItem, 1) then
                exports['ox_inventory']:AddItem(src, Rewards.Lockers[bankType].rareItem, 1)
            else
                exports['ox_inventory']:CustomDrop('Bank Locker', {
                    { Rewards.Lockers[bankType].rareItem, 1 }
                }, GetEntityCoords(GetPlayerPed(src)))
                Utils.Notify(src, Locales['notify_invent_desc'], 'error', 5000)
            end
        elseif Shared.Inventory == 'qb' then
            Player.Functions.AddItem(Rewards.Lockers[bankType].rareItem, 1, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Rewards.Lockers[bankType].rareItem], 'add', 1)
        end 
    else
        local randomItem = Rewards.Lockers[bankType].items[math.random(#Rewards.Lockers[bankType].items)]
        local receiveAmount = math.random(Rewards.Lockers[bankType].amount.minAmount, Rewards.Lockers[bankType].amount.maxAmount)

        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, randomItem, receiveAmount) then
                exports['ox_inventory']:AddItem(src, randomItem, receiveAmount)
            else
                exports['ox_inventory']:CustomDrop('Bank Locker', {
                    { randomItem, receiveAmount }
                }, GetEntityCoords(GetPlayerPed(src)))
                Utils.Notify(src, Locales['notify_invent_desc'], 'error', 5000)
            end
        elseif Shared.Inventory == 'qb' then
            Player.Functions.AddItem(randomItem, receiveAmount, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[randomItem], 'add', receiveAmount)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveThermite', function()
    local src = source
    if Shared.Inventory == 'ox_inventory' then
        exports['ox_inventory']:RemoveItem(src, 'thermite', 1, false)
    elseif Shared.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

        Player.Functions.RemoveItem('thermite', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['thermite'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetThermiteHit', function(bank, index)
    Shared.Banks[bank].thermite[index].hit = true
    TriggerClientEvent('qb-bankrobbery:client:SetThermiteHit', -1, bank, index)
end)

RegisterNetEvent('qb-bankrobbery:server:ThermitePtfx', function(bank, index)
    local src = source
    local coords = Shared.Banks[bank].thermite[index].ptfx
    TriggerClientEvent('qb-bankrobbery:client:ThermitePtfx', -1, coords)

    Wait(27000)
    Utils.DoorUpdate(src, Shared.Banks[bank].thermite[index].doorId, 0)
end)

--- Callbacks

lib.callback.register('qb-bankrobbery:server:GetShared', function(source)
    return Shared
end)

lib.callback.register('qb-bankrobbery:server:CanAttemptBankRobbery', function(source, bank)
    local bankType = Shared.Banks[bank].type

    if robberyBusy[bankType] then
        Utils.Notify(source, Locales['bank_cooldown'], 'error', 4000)
        return false
    elseif Utils.GetCopCount() < Shared.MinCops[bankType] then
        Utils.Notify(source, Locales['not_enough_cops']:format(Shared.MinCops[bankType]), 'error', 4000)
        return false
    else
        return true
    end
end)

--- Items

QBCore.Functions.CreateUseableItem('thermite', function(source, item)
    TriggerClientEvent('thermite:UseThermite', source)
end)
