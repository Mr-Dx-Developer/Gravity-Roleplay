RegisterNetEvent('qb-bankrobbery:client:UseBlueLaptop', function(data)
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'laptop_blue') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('laptop_blue') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks['Paleto'].outsideHack then
        lib.callback('qb-bankrobbery:server:CanAttemptBankRobbery', 200, function(canAttempt)
            if canAttempt then
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
                    TriggerServerEvent('qb-bankrobbery:server:LaptopDamage', 'laptop_blue')
                    Utils.AlertCops(Shared.Banks[data.bank].type)
                    LaptopAnimation(data.bank)
                else
                    Utils.Notify(Locales['canceled'], 'error', 3000)
                end
            end
        end, 'Paleto')
    else
        Utils.Notify(Locales['laptop_hit'], 'success', 3000)
    end
end)

RegisterNetEvent('qb-bankrobbery:client:SetOutsideHacked', function()
    Shared.Banks['Paleto'].outsideHack = true
end)

RegisterNetEvent('qb-bankrobbery:client:UseGreenCard', function()
    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'security_card_01') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('security_card_01') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if Shared.Banks['Paleto'].outsideHack then
        if lib.progressBar({
            duration = math.random(5000, 10000),
            label = Locales['progressbar_swipe_card'],
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, combat = true, mouse = false },
            anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
        }) then
            Utils.AlertCops(Shared.Banks['Paleto'].type)
            TriggerServerEvent('qb-bankrobbery:server:SetBankHacked', 'Paleto')
            TriggerServerEvent('qb-bankrobbery:server:RemoveGreenCard')
        else
            Utils.Notify(Locales['canceled'], 'error', 3000)
        end
    else
        Utils.Notify(Locales['paleto_lockdown'], 'error', 4500)
        Wait(5000)
        Utils.Notify(Locales['paleto_lockdown2'], 'error', 4500)
    end
end)

--- Threads

CreateThread(function()
    exports['qb-target']:AddBoxZone('bankrobbery_panel_paleto', vector3(-109.39, 6483.2, 31.20), 0.3, 0.5, {
        name = 'bankrobbery_panel_paleto',
        heading = 226,
        debugPoly = Shared.Debug,
        minZ = 31.20,
        maxZ = 32.20
    }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseBlueLaptop',
                icon = 'fas fa-user-secret',
                label = Locales['panel_target_hack'],
                canInteract = function()
                    return not Shared.Banks['Paleto'].hacked
                end,
                bank = 'Paleto',
            }
        },
        distance = 1.5,
    })

    exports['qb-target']:AddBoxZone('bankrobbery_card_paleto', vector3(-105.84, 6472.10, 31.79), 0.3, 0.4, {
        name = 'bankrobbery_card_paleto',
        heading = 73,
        debugPoly = Shared.Debug,
        minZ = 31.79,
        maxZ = 32.19
    }, {
        options = { 
            {
                type = 'client',
                event = 'qb-bankrobbery:client:UseGreenCard',
                icon = 'fas fa-user-secret',
                label = Locales['pacific_swipe_card'],
                canInteract = function()
                    return not Shared.Banks['Paleto'].hacked
                end
            },
            {
                type = 'server',
                event = 'qb-bankrobbery:server:PDClose',
                icon = 'fas fa-door-closed',
                label = Locales['panel_target_pd'],
                canInteract = function()
                    return Shared.Banks['Paleto'].hacked
                end,
                bank = 'Paleto',
                job = 'police'
            }
        },
        distance = 1.5,
    })

end)
