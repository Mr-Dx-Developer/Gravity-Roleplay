local vaultCode = math.random(1000, 9999)
local flags = 0

local stacks = {}

--- Functions

CreateStacks = function(bank)
    stacks[bank] = {}

    for k, v in ipairs(Shared.Banks['Vault'].stacks) do
        local model = `h4_prop_h4_cash_stack_01a`
        if v.type == 'gold' then model = `h4_prop_h4_gold_stack_01a` end

        local object = CreateObject(model, v.coords.x, v.coords.y, v.coords.z, 1, 0, 0)
        SetEntityHeading(object, v.coords.w)
        FreezeEntityPosition(object, true)
        
        stacks[bank][#stacks[bank] + 1] = object
    end
end

ClearStacks = function(bank)
    if not stacks[bank] then return end

    for i = 1, #stacks[bank], 1 do
        if DoesEntityExist(stacks[bank][i]) then
            DeleteEntity(stacks[bank][i])
        end
    end

    stacks[bank] = nil
end

--- Events

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() ~= resource then return end

    ClearStacks('Vault')
end)

RegisterNetEvent('qb-bankrobbery:server:HitByLaser', function()
    local src = source

    if Shared.Banks['Vault'].lockdown then return end

    Shared.Banks['Vault'].lockdown = true
    TriggerClientEvent('qb-bankrobbery:client:VaultLockDown', -1)

    Utils.Notify(src, Locales['pacific_hitbylaser'], 'inform', 3000)
end)

RegisterNetEvent('qb-bankrobbery:server:SetGoldHacked', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if Shared.Banks['Vault'].goldhacked then return end

    Shared.Banks['Vault'].goldhacked = true

    Utils.DoorUpdate(src, Shared.Banks['Vault'].laptopDoor, 0)
    TriggerClientEvent('qb-bankrobbery:client:SetGoldHacked', -1)

    debugPrint(Player.PlayerData.name .. ' (id: ' .. src .. ') Hacked Gold Laptop Vault') 
end)

RegisterNetEvent('qb-bankrobbery:server:PrintCodes', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not Shared.Banks['Vault'].goldhacked then return end

    CreateStacks('Vault')
    
    TriggerClientEvent('var-ui:on', src, tostring(vaultCode))

    debugPrint(Player.PlayerData.name .. ' (id: ' .. src .. ') Received Vault Code') 
end)

RegisterNetEvent('qb-bankrobbery:server:RemoveExplosive', function()
    local src = source
    
    if Shared.Inventory == 'ox_inventory' then
        exports['ox_inventory']:RemoveItem(src, 'explosive', 1, false)
    elseif Shared.Inventory == 'qb' then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then return end

        Player.Functions.RemoveItem('explosive', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['explosive'], 'remove', 1)
    end
end)

RegisterNetEvent('qb-bankrobbery:server:SetStackBusy', function(bank, index)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))

    if not Shared.Banks[bank] or not Shared.Banks[bank].stacks[index] then return end
    if #(coords - Shared.Banks[bank].stacks[index].coords.xyz) > 5.0 then return end

    Shared.Banks[bank].stacks[index].busy = true
    TriggerClientEvent('qb-bankrobbery:client:SetStackBusy', -1, bank, index)
end)

RegisterNetEvent('qb-bankrobbery:server:StackReward', function(netId, bank, index)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player or type(netId) ~= 'number' or not Shared.Banks[bank] or not Shared.Banks[bank].stacks[index] then return end

    local entity = NetworkGetEntityFromNetworkId(netId)

    if entity ~= stacks[bank][index] then return end

    if #(GetEntityCoords(GetPlayerPed(src)) - Shared.Banks[bank].stacks[index].coords.xyz) > 10 then return end
    if Shared.Banks[bank].stacks[index].taken then return end

    TriggerClientEvent('qb-bankrobbery:client:SetStackTaken', -1, bank, index)
    Shared.Banks[bank].stacks[index].taken = true

    -- Delete stack
    if DoesEntityExist(stacks[bank][index]) then
        DeleteEntity(stacks[bank][index])
    end

    local bankType = Shared.Banks[bank].type
    local rewardType = Shared.Banks[bank].stacks[index].type

    if rewardType == 'money' then
        local receiveAmount = math.random(Rewards.Stacks[rewardType][bankType].minAmount, Rewards.Stacks[rewardType][bankType].maxAmount)
        
        local metaData = {
            worth = math.random(Rewards.Stacks[rewardType][bankType].minWorth, Rewards.Stacks[rewardType][bankType].maxWorth)
        }

        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, 'markedbills', receiveAmount) then
                exports['ox_inventory']:AddItem(src, 'markedbills', receiveAmount, metaData)
            else
                exports['ox_inventory']:CustomDrop('Stack', {
                    { 'markedbills', receiveAmount, metaData }
                }, GetEntityCoords(GetPlayerPed(src)))

                Utils.Notify(src, Locales['notify_invent_desc'], 'error', 5000)
            end
        elseif Shared.Inventory == 'qb' then
            Player.Functions.AddItem('markedbills', receiveAmount, false, metaData)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], 'add', receiveAmount)
        end
    elseif rewardType == 'gold' then
        local receiveAmount = math.random(Rewards.Stacks[rewardType][bankType].minAmount, Rewards.Stacks[rewardType][bankType].maxAmount)
        
        if Shared.Inventory == 'ox_inventory' then
            if exports['ox_inventory']:CanCarryItem(src, 'goldbar1', receiveAmount) then
                exports['ox_inventory']:AddItem(src, 'goldbar1', receiveAmount)
            else
                exports['ox_inventory']:CustomDrop('Stack', {
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

RegisterNetEvent('qb-bankrobbery:server:AttemptCode', function(input)
    local src = source

    if input == vaultCode then
        Shared.Banks['Vault'].code = true
        TriggerClientEvent('qb-bankrobbery:client:CorrectCode', -1)
    else
        flags += 1

        if flags >= Shared.BankSettings.VaultMaxFlags then
            Shared.Banks['Vault'].lockdown = true
            TriggerClientEvent('qb-bankrobbery:client:VaultLockDown', -1)
        end

        Utils.Notify(src, Locales['vault_flags']:format(flags, Shared.BankSettings.VaultMaxFlags), 'error', 2500)
    end
end)

--- Items

QBCore.Functions.CreateUseableItem('explosive', function(source, item)
    TriggerClientEvent('explosive:UseExplosive', source)
end)

--- Threads

CreateThread(function()
    debugPrint('Lower Vault Access Code: ' .. vaultCode)
end)
