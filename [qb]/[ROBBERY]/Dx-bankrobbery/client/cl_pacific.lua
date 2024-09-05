RegisterNetEvent('qb-bankrobbery:client:UseGoldCard', function()
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'security_card_02') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('security_card_02') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks['Pacific'].card then
        lib.callback('qb-bankrobbery:server:CanAttemptBankRobbery', 200, function(canAttempt)
            if canAttempt then
                local ped = cache.ped

                Utils.AlertCops('pacific')

                SetEntityCoords(ped, 261.89, 223.5, 105.30, 1, 0, 0, 1)
                SetEntityHeading(ped, 255.92)

                RequestModel('p_ld_id_card_01')
                while not HasModelLoaded('p_ld_id_card_01') do Wait(0) end
                Wait(100)

                -- Remove Card
                TriggerServerEvent('qb-bankrobbery:server:RemoveGoldCard')

                local pedco = GetEntityCoords(ped)
                local IdProp = CreateObject(`p_ld_id_card_01`, pedco, true, true, false)
                local boneIndex = GetPedBoneIndex(ped, 28422)
                local panel = GetClosestObjectOfType(pedco, 4.0, `hei_prop_hei_securitypanel`, false, false, false)
                AttachEntityToEntity(IdProp, ped, boneIndex, 0.12, 0.028, 0.001, 10.0, 175.0, 0.0, true, true, false, true, 1, true)
                TaskStartScenarioInPlace(ped, 'PROP_HUMAN_ATM', 0, true)
                Wait(1500)

                AttachEntityToEntity(IdProp, panel, boneIndex, -0.09, -0.02, -0.08, 270.0, 0.0, 270.0, true, true, false, true, 1, true)
                FreezeEntityPosition(IdProp)
                Wait(500)

                ClearPedTasksImmediately(ped)
                PlaySoundFrontend(-1, 'ATM_WINDOW', 'HUD_FRONTEND_DEFAULT_SOUNDSET')

                -- ENTERING CODE
                local dict = 'mp_heists@keypad@'
                local anim = 'idle_a'
                local flag = 0

                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do Wait(0) end

                SetEntityCoords(ped, vector3(261.83, 223.08, 105.28))
                SetEntityHeading(ped, 255.92)

                TaskPlayAnim(ped, dict, anim, 8.0, 8.0, -1, flag, 0, false, false, false)
                Wait(2500)

                TaskPlayAnim(ped, dict, 'exit', 2.0, 2.0, -1, flag, 0, false, false, false)
                Wait(1000)

                TriggerServerEvent('qb-bankrobbery:server:SetGoldCard')
            end
        end, 'Pacific')
    else
        Utils.Notify(Locales['laptop_hit'], 'success', 3000)
    end 
end)

RegisterNetEvent('qb-bankrobbery:client:SetGoldCard', function()
    Shared.Banks['Pacific'].card = true
end)

RegisterNetEvent('qb-bankrobbery:client:UseRedLaptop', function(data)
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'laptop_red') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('laptop_red') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks['Pacific'].hacked then
        if lib.progressBar({
            duration = math.random(5000, 10000),
            label = Locales['progressbar_laptop'],
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true, mouse = false },
            anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
        }) then 
            TriggerServerEvent('qb-bankrobbery:server:LaptopDamage', 'laptop_red')
            Utils.AlertCops(Shared.Banks[data.bank].type)
            LaptopAnimation(data.bank)
        else
            Utils.Notify(Locales['canceled'], 'error', 3000)
        end
    else
        Utils.Notify(Locales['laptop_hit'], 'normal', 2500)
    end
end)

--- Threads

CreateThread(function()
    exports['qb-target']:AddBoxZone('bankrobbery_panel_pacific', vector3(252.88, 228.55, 101.79), 0.3, 0.4, {
        name = 'bankrobbery_panel_pacific',
        heading = 68.00,
        debugPoly = Shared.Debug,
        minZ = 101.79,
        maxZ = 102.39
     }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseRedLaptop',
                icon = 'fas fa-user-secret',
                label = Locales['panel_target_hack'],
                canInteract = function()
                    return not (Shared.Banks['Pacific'].hacked or Shared.Banks['Vault'].goldhacked or not Shared.Banks['Pacific'].card)
                end,
                bank = 'Pacific',
            },
            {
                type = 'server',
                event = 'qb-bankrobbery:server:PDClose',
                icon = 'fas fa-door-closed',
                label = Locales['panel_target_pd'],
                canInteract = function()
                    return Shared.Banks['Pacific'].hacked
                end,
                bank = 'Pacific',
                job = 'police'
            }
        },
        distance = 1.5,
    })

    exports['qb-target']:AddBoxZone('bankrobbery_pacific_card', vector3(262.31, 223.01, 106.29), 0.2, 0.5, {
        name = 'bankrobbery_pacific_card',
        heading = 250,
        debugPoly = Shared.Debug,
        minZ = 106.29,
        maxZ = 106.99
     }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseGoldCard',
                icon = 'fas fa-user-secret',
                label = Locales['pacific_swipe_card'],
                canInteract = function()
                    return not Shared.Banks['Pacific'].card
                end,
            }
        },
        distance = 1.5,
    })

end)
