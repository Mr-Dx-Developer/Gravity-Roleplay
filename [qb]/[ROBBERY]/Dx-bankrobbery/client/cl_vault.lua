--- Lasers

local lasersActive = false
local lasers = {}

local enableLasers = function()
    for _, laser in ipairs(lasers) do 
        laser.setActive(true)
        laser.setMoving(true)
    end

    while Shared.Banks['Vault'].lockdown and lasersActive do
        for _, laser in ipairs(lasers) do laser.setVisible(true) end
        Wait(500)

        for _, laser in ipairs(lasers) do laser.setVisible(false) end
        Wait(500)
    end
end

local disableLasers = function()
    for _, laser in ipairs(lasers) do 
        laser.setActive(false)
        laser.setMoving(false)
    end
end

--- Zones

local enterVault = function()
    if not exports['qb-powerplant']:getPowerPlantState('city') then
        lasersActive = true
        enableLasers()
    end
end

local exitVault = function()
    if lasersActive then
        lasersActive = false
        disableLasers()
    end
end

local vaultZone = lib.zones.poly({
    points = {
        vector3(227.14, 213.12, 103.68), 
        vector3(266.51, 199.21, 103.68), 
        vector3(287.85, 261.23, 103.68), 
        vector3(250.88, 275.25, 103.68)
    },
    thickness = 4,
    debug = false,
    onEnter = enterVault,
    onExit = exitVault
})

--- Functions

--- Performs the animation of planing an explosive and making an explosion to break open the doors
---@param index number - Index number of explosion location in the lower vault
---@return nil
local VaultExplosion = function(index)
    LocalPlayer.state:set('inv_busy', true, true)
    local ped = cache.ped
    local pos = GetEntityCoords(ped)

    -- Remove explosive
    TriggerServerEvent('qb-bankrobbery:server:RemoveExplosive')

    -- Animation
    RequestAnimDict('anim@heists@ornate_bank@thermal_charge')
    RequestModel('hei_p_m_bag_var22_arm_s')
    while not HasAnimDictLoaded('anim@heists@ornate_bank@thermal_charge') or not HasModelLoaded('hei_p_m_bag_var22_arm_s') do Wait(0) end

    SetEntityHeading(ped, Shared.Banks['Vault'].explosion[index].w)
    local pos = Shared.Banks['Vault'].explosion[index].xyz
    Wait(100)

    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(cache.ped)))
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)
    local x, y, z = table.unpack(GetEntityCoords(ped))
    local charge = CreateObject(`prop_bomb_01`, x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(charge, false, true)
    AttachEntityToEntity(charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    NetworkAddPedToSynchronisedScene(ped, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'thermal_charge', 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, 'anim@heists@ornate_bank@thermal_charge', 'bag_thermal_charge', 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(5000)

    DetachEntity(charge, 1, 1)
    FreezeEntityPosition(charge, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
    LocalPlayer.state:set('inv_busy', false, true)

    for i = 8, 1, -1 do
        Wait(1000)
        Utils.Notify(Locales['pacific_explosive']:format(i), 'error', 800)
    end

    Wait(1000)
    DeleteEntity(charge)
    AddExplosion(Shared.Banks['Vault'].explosion[index].xyz, 2, 4.0, true, false, 10.0)
end

--- Event Handlers

AddEventHandler('qb-powerplant:client:PowerPlantHit', function(plant)
    if lasersActive and plant == 'city' then
        disableLasers()
    end
end)

--- Events

RegisterNetEvent('qb-bankrobbery:client:VaultLockDown', function()
    Shared.Banks['Vault'].lockdown = true

    while Shared.Banks['Vault'].lockdown and lasersActive do
        for _, laser in ipairs(lasers) do laser.setVisible(true) end
        Wait(500)

        for _, laser in ipairs(lasers) do laser.setVisible(false) end
        Wait(500)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:UseGoldLaptop', function(data)
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'laptop_gold') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('laptop_gold') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks['Pacific'].hacked and not Shared.Banks['Vault'].goldhacked then
        local ped = cache.ped
        TaskTurnPedToFaceEntity(ped, data.entity, 1.0)

        if lib.progressBar({
            duration = math.random(5000, 10000),
            label = Locales['progressbar_laptop'],
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true, mouse = false },
            anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
        }) then 
            TriggerServerEvent('qb-bankrobbery:server:LaptopDamage', 'laptop_gold')
            Utils.AlertCops(Shared.Banks[data.bank].type)
            LaptopAnimation(data.bank)
        else
            Utils.Notify(Locales['canceled'], 'error', 3000)
        end
    else
        Utils.Notify(Locales['pacific_lockdown_active'], 'error', 2500)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:SetGoldHacked', function()
    Shared.Banks['Vault'].goldhacked = true
end)

RegisterNetEvent('qb-bankrobbery:client:UseGreyUsb', function()
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'usb_grey') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('usb_grey') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks['Vault'].hacked then
        -- HACK ATTEMPT
        local result = exports['numbers']:StartNumbersGame(Shared.MinigameSettings.numbers.numbersLength, Shared.MinigameSettings.numbers.timer, Shared.MinigameSettings.numbers.showTime)
        if result then
            TriggerServerEvent('qb-bankrobbery:server:SetBankHacked', 'Vault')
            TriggerServerEvent('qb-bankrobbery:server:PrintCodes')
        else
            Utils.Notify(Locales['hack_failed'], 'error', 2500)
        end

        -- REMOVE USE
        TriggerServerEvent('qb-bankrobbery:server:LaptopDamage', 'usb_grey')
    else
        Utils.Notify(Locales['laptop_hit'], 'error', 2500)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:EnterVaultCode', function()
    if not Shared.Banks['Vault'].code then
        local input = lib.inputDialog(Locales['pacific_input_header'], {
            {
                type = 'number', 
                label = '',
                placeholder = '****',
                icon = 'user-shield',
                required = true
            },
        })

        if not input then return end
        local code = input[1]

        if code <= 0 or code >= 10000 then
            Utils.Notify(Locales['pacific_code_invalid'], 'error', 2500)
            return
        end

        TriggerServerEvent('qb-bankrobbery:server:AttemptCode', code)
    else
        Utils.Notify(Locales['laptop_hit'], 'error', 2500)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:CorrectCode', function()
    Shared.Banks['Vault'].code = true
end)

RegisterNetEvent('explosive:UseExplosive', function()
    local ped = cache.ped
    local coords = GetEntityCoords(ped)

    for i = 1, #Shared.Banks['Vault'].explosion, 1 do
        if #(coords - Shared.Banks['Vault'].explosion[i].xyz) < 1.50 then
            VaultExplosion(i)
            return
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:client:LootStack', function(data)
    if not currentBank then return end

    local pos = GetEntityCoords(cache.ped)

    for k, v in pairs(Shared.Banks[currentBank].stacks) do
        if #(pos - v.coords.xyz) < 1.0 then
            -- If taken or busy return
            if v.busy or v.taken then
                Utils.Notify(Locales['trolly_hit'], 'error', 3000)
                return 
            end

            local modelHash = `h4_prop_h4_cash_stack_01a`
            if v.type == 'gold' then modelHash = `h4_prop_h4_gold_stack_01a` end

            -- Evidence
            if not QBCore.Functions.IsWearingGloves() then
                TriggerServerEvent('evidence:server:CreateFingerDrop', pos)
            end

            -- Set Busy
            TriggerServerEvent('qb-bankrobbery:server:SetStackBusy', currentBank, k)
            LocalPlayer.state:set('inv_busy', true, true)

            -- Loot Stack
            local ped = cache.ped
            local coords, rotation = GetEntityCoords(ped), GetEntityRotation(ped)
            local animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@'

            RequestAnimDict(animDict)
            RequestModel('hei_p_m_bag_var22_arm_s')

            while not HasAnimDictLoaded(animDict) do Wait(0) end
            while not HasModelLoaded('hei_p_m_bag_var22_arm_s') do Wait(0) end

            local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, coords, 1, 1, 0)
            local sceneObject = GetClosestObjectOfType(coords, 2.0, modelHash, 0, 0, 0)
            local netId = NetworkGetNetworkIdFromEntity(sceneObject)
            local scenePos = GetEntityCoords(sceneObject)
            local sceneRot = GetEntityRotation(sceneObject)

            local netScene = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'enter_bag', 1.0, -1.0, 1148846080)
        
            local netScene2 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
            NetworkAddEntityToSynchronisedScene(sceneObject, netScene2, animDict, 'grab_cash', 1.0, -1.0, 1148846080)
        
            local netScene3 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'grab_idle', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'grab_idle_bag', 1.0, -1.0, 1148846080)
        
            local netScene4 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1.3)
            NetworkAddPedToSynchronisedScene(ped, netScene4, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)
            NetworkAddEntityToSynchronisedScene(bag, netScene4, animDict, 'exit_bag', 1.0, -1.0, 1148846080)
        
            NetworkStartSynchronisedScene(netScene)
            Wait(GetAnimDuration(animDict, 'enter') * 1000)
            NetworkStartSynchronisedScene(netScene2)
            Wait(GetAnimDuration(animDict, 'grab') * 1000 - 3000)

            TriggerServerEvent('qb-bankrobbery:server:StackReward', netId, currentBank, k)

            NetworkStartSynchronisedScene(netScene4)
            Wait(GetAnimDuration(animDict, 'exit') * 1000)
            DeleteObject(bag)
            ClearPedTasks(ped)

            LocalPlayer.state:set('inv_busy', false, true)
        end
    end
end)

RegisterNetEvent('qb-bankrobbery:client:SetStackBusy', function(bank, index)
    Shared.Banks[bank].stacks[index].busy = true
end)

RegisterNetEvent('qb-bankrobbery:client:SetStackTaken', function(bank, index)
    Shared.Banks[bank].stacks[index].taken = true
end)

--- Threads

CreateThread(function()
    -- Create Lasers
    lasers[#lasers + 1] = Laser.new(vector3(259.906, 229.711, 103.772), {vector3(255.549, 234.133, 100.683), vector3(257.374, 231.657, 100.683), vector3(253.942, 230.824, 100.683)}, {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = 'lowervault1'})
    lasers[#lasers + 1] = Laser.new(vector3(247.704, 233.616, 104.165), {vector3(256.850, 230.513, 100.683), vector3(256.461, 234.034, 101.463), vector3(251.250, 240.455, 100.683), vector3(252.001, 236.034, 100.683)}, {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = 'lowervault2'})
    lasers[#lasers + 1] = Laser.new(vector3(251.619, 241.131, 104.699), {vector3(249.331, 231.798, 101.505), vector3(254.754, 233.652, 100.683), vector3(258.954, 236.069, 100.683), vector3(251.435, 235.654, 100.683)}, {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = 'lowervault3'})
    lasers[#lasers + 1] = Laser.new(vector3(262.562, 237.010, 104.528), {vector3(247.755, 233.758, 101.268), vector3(249.672, 239.023, 101.412), vector3(253.880, 237.109, 100.683)}, {travelTimeBetweenTargets = {1.0, 1.0}, waitTimeAtTargets = {0.0, 0.0}, randomTargetSelection = true, name = 'lowervault4'})

    for _, laser in ipairs(lasers) do 
        laser.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                if not Shared.Banks['Vault'].lockdown then
                    TriggerServerEvent('qb-bankrobbery:server:HitByLaser')
                end

                laser.clearOnPlayerHit()
            end
        end)
    end

    -- Target
    exports['qb-target']:AddBoxZone('bankrobbery_vault_laptop', vector3(257.60, 228.20, 102.05), 0.2, 0.25, {
        name = 'bankrobbery_vault_laptop',
        heading = 340.00,
        debugPoly = Shared.Debug,
        minZ = 102.05,
        maxZ = 102.25
     }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseGoldLaptop',
                icon = 'fas fa-user-secret',
                label = Locales['panel_target_hack'],
                canInteract = function()
                    return Shared.Banks['Pacific'].card and not (Shared.Banks['Pacific'].hacked or Shared.Banks['Vault'].goldhacked)
                end,
                bank = 'Vault',
            }
        },
        distance = 1.5,
    })

    exports['qb-target']:AddBoxZone('bankrobbery_vault_usb', vector3(252.14, 235.93, 101.40), 0.3, 0.6, {
        name = 'bankrobbery_vault_usb',
        heading = 253.00,
        debugPoly = Shared.Debug,
        minZ = 101.40,
        maxZ = 101.60
     }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseGreyUsb',
                icon = 'fas fa-user-secret',
                label = 'Print Access Code',
                canInteract = function()
                    return not (Shared.Banks['Vault'].lockdown or Shared.Banks['Vault'].hacked or not Shared.Banks['Vault'].goldhacked)
                end,
            },
            {
                type = 'server',
                event = 'qb-bankrobbery:server:PDClose',
                icon = 'fas fa-door-closed',
                label = Locales['panel_target_pd'],
                canInteract = function()
                    return Shared.Banks['Vault'].hacked
                end,
                bank = 'Vault',
                job = 'police'
            }
        },
        distance = 1.5,
    })

    exports['qb-target']:AddBoxZone('bankrobbery_vault_code', vector3(261.61, 258.43, 102.0), 0.3, 0.3, {
        name = 'bankrobbery_vault_code',
        heading = 340.00,
        debugPoly = Shared.Debug,
        minZ = 102.00,
        maxZ = 102.25
     }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:EnterVaultCode',
                icon = 'fas fa-hand-holding',
                label = 'Enter Code',
                canInteract = function()
                    return Shared.Banks['Vault'].hacked and not Shared.Banks['Vault'].lockdown
                end,
            }
        },
        distance = 1.5,
    })

    -- Target for stacks
    for k, v in pairs(Shared.Banks['Vault'].stacks) do
        exports['qb-target']:AddBoxZone('bankrobbery_vault_stack' .. k, vector3(v.coords.x, v.coords.y, v.coords.z - 0.1), 0.5, 0.7, {
            name = 'bankrobbery_vault_stack' .. k,
            heading = v.coords.w,
            debugPoly = Shared.Debug,
            minZ = v.coords.z - 0.1,
            maxZ = v.coords.z + 0.4
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:LootStack',
                    icon = 'fas fa-hand-holding',
                    label = 'Grab!',
                    canInteract = function()
                        return Shared.Banks['Vault'].hacked and not Shared.Banks['Vault'].stacks[k].busy and not Shared.Banks['Vault'].stacks[k].taken
                    end,
                }
            },
            distance = 1.0,
        })
    end
end)
