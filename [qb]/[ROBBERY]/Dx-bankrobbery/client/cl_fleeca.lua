RegisterNetEvent('qb-bankrobbery:client:UseGreenLaptop', function(data)
    if not currentBank or currentBank ~= data.bank then return end

    if Shared.Inventory == 'ox_inventory' and exports['ox_inventory']:Search('count', 'laptop_green') == 0 then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    elseif Shared.Inventory == 'qb' and not QBCore.Functions.HasItem('laptop_green') then
        Utils.Notify(Locales['missing_items'], 'error', 3000)
        return
    end

    if not Shared.Banks[data.bank].hacked then
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
                    TriggerServerEvent('qb-bankrobbery:server:LaptopDamage', 'laptop_green')
                    Utils.AlertCops(Shared.Banks[data.bank].type)
                    LaptopAnimation(data.bank)
                else
                    Utils.Notify(Locales['canceled'], 'error', 3000)
                end
            end
        end, data.bank)
    else
        Utils.Notify(Locales['laptop_hit'], 'success', 3000)
    end
end)

--- Threads

CreateThread(function()
    if Shared.FleecaBanks == 'K4MB1' or Shared.FleecaBanks == 'default' then 
        exports['qb-target']:AddBoxZone('bankrobbery_panel_pinkcage', vector3(311.6, -284.60, 54.02), 0.2, 0.46, {
            name = 'bankrobbery_panel_pinkcage',
            heading = 249,
            debugPoly = Shared.Debug,
            minZ = 54.02,
            maxZ = 54.76
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['PinkCage'].hacked
                    end,
                    bank = 'PinkCage'
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['PinkCage'].hacked
                    end,
                    bank = 'PinkCage',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_legion', vector3(147.19, -1046.2, 29.26), 0.3, 0.44, {
            name = 'bankrobbery_panel_legion',
            heading = 249,
            debugPoly = Shared.Debug,
            minZ = 29.26,
            maxZ = 29.96
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Legion'].hacked
                    end,
                    bank = 'Legion'
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Legion'].hacked
                    end,
                    bank = 'Legion',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_hawick', vector3(-353.47, -55.48, 48.92), 0.2, 0.46, {
            name = 'bankrobbery_panel_hawick',
            heading = 249,
            debugPoly = Shared.Debug,
            minZ = 48.92,
            maxZ = 49.56
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Hawick'].hacked
                    end,
                    bank = 'Hawick',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Hawick'].hacked
                    end,
                    bank = 'Hawick',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_delperro', vector3(-1210.38, -336.40, 37.68), 0.24, 0.46, {
            name = 'bankrobbery_panel_delperro',
            heading = 297,
            debugPoly = Shared.Debug,
            minZ = 37.67,
            maxZ = 38.33
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['DelPerro'].hacked
                    end,
                    bank = 'DelPerro',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['DelPerro'].hacked
                    end,
                    bank = 'DelPerro',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_greatocean', vector3(-2956.48, 482.1, 15.50), 0.24, 0.46, {
            name = 'bankrobbery_panel_greatocean',
            heading = 358,
            debugPoly = Shared.Debug,
            minZ = 15.50,
            maxZ = 16.20
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['GreatOcean'].hacked
                    end,
                    bank = 'GreatOcean',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['GreatOcean'].hacked
                    end,
                    bank = 'GreatOcean',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_sandy', vector3(1175.66, 2712.90, 38.0), 0.24, 0.46, {
            name = 'bankrobbery_panel_sandy',
            heading = 89,
            debugPoly = Shared.Debug,
            minZ = 38.00,
            maxZ = 38.60
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Sandy'].hacked
                    end,
                    bank = 'Sandy',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Sandy'].hacked
                    end,
                    bank = 'Sandy',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

    elseif Shared.FleecaBanks == 'gabz' then
        exports['qb-target']:AddBoxZone('bankrobbery_panel_pinkcage', vector3(311.06, -284.67, 53.96), 0.4, 0.6, {
            name = 'bankrobbery_panel_pinkcage',
            heading = 340,
            debugPoly = Shared.Debug,
            minZ = 53.96,
            maxZ = 54.76
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['PinkCage'].hacked
                    end,
                    bank = 'PinkCage'
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['PinkCage'].hacked
                    end,
                    bank = 'PinkCage',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_legion', vector3(146.69, -1046.44, 29.27), 0.4, 0.6, {
            name = 'bankrobbery_panel_legion',
            heading = 340,
            debugPoly = Shared.Debug,
            minZ = 29.27,
            maxZ = 29.97
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Legion'].hacked
                    end,
                    bank = 'Legion'
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Legion'].hacked
                    end,
                    bank = 'Legion',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_hawick', vector3(-354.02, -55.61, 48.84), 0.4, 0.6, {
            name = 'bankrobbery_panel_hawick',
            heading = 338,
            debugPoly = Shared.Debug,
            minZ = 48.84,
            maxZ = 49.64
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Hawick'].hacked
                    end,
                    bank = 'Hawick',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Hawick'].hacked
                    end,
                    bank = 'Hawick',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_delperro', vector3(-1210.75, -336.77, 37.58), 0.4, 0.6, {
            name = 'bankrobbery_panel_delperro',
            heading = 26,
            debugPoly = Shared.Debug,
            minZ = 37.58,
            maxZ = 38.38
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['DelPerro'].hacked
                    end,
                    bank = 'DelPerro',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['DelPerro'].hacked
                    end,
                    bank = 'DelPerro',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_greatocean', vector3(-2956.33, 481.61, 15.50), 0.6, 0.4, {
            name = 'bankrobbery_panel_greatocean',
            heading = 358,
            debugPoly = Shared.Debug,
            minZ = 15.50,
            maxZ = 16.30
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['GreatOcean'].hacked
                    end,
                    bank = 'GreatOcean',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['GreatOcean'].hacked
                    end,
                    bank = 'GreatOcean',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

        exports['qb-target']:AddBoxZone('bankrobbery_panel_sandy', vector3(1176.04, 2713.15, 37.89), 0.4, 0.6, {
            name = 'bankrobbery_panel_sandy',
            heading = 359,
            debugPoly = Shared.Debug,
            minZ = 37.89,
            maxZ = 38.69
         }, {
            options = { 
                {
                    type = 'client',
                    event = 'qb-bankrobbery:client:UseGreenLaptop',
                    icon = 'fas fa-user-secret',
                    label = Locales['panel_target_hack'],
                    canInteract = function()
                        return not Shared.Banks['Sandy'].hacked
                    end,
                    bank = 'Sandy',
                },
                {
                    type = 'server',
                    event = 'qb-bankrobbery:server:PDClose',
                    icon = 'fas fa-door-closed',
                    label = Locales['panel_target_pd'],
                    canInteract = function()
                        return Shared.Banks['Sandy'].hacked
                    end,
                    bank = 'Sandy',
                    job = 'police'
                }
            },
            distance = 1.5,
        })

    end
    
end)
