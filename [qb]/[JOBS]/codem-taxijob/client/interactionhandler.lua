function InitMenu()
    if Config.InteractionHandler == 'ox_target'  then
        exports.ox_target:addBoxZone({
            name = 'taxijob-menu',
            coords = vector3(Config.NpcLocation.coords.x, Config.NpcLocation.coords.y, Config.NpcLocation.coords.z),
            size = vec3(3.6, 3.6, 3.6),
            drawSprite = true,
            options =  {
                {
                    name = 'taxijob-menu-open',
                    onSelect = function()
                        TriggerEvent('codem-taxijob:OpenMenu')
                    end,
                    icon = 'fas fa-gears',
                    label = locales.open_menu,
                }
            }
        })
    end
    if Config.InteractionHandler == 'qb_target'  then

        exports['qb-target']:AddBoxZone('taxijob-menu-open', vector3(Config.NpcLocation.coords.x, Config.NpcLocation.coords.y, Config.NpcLocation.coords.z), 1.5, 1.6,
            {
                name = 'taxijob-menu-open',
                heading = 12.0,
                debugPoly = false,
                minZ =  Config.NpcLocation.coords.z - 1,
                maxZ =  Config.NpcLocation.coords.z + 2,
            }, 
            {
            options = {
                {
                    num = 1,
                    type = "client",
                    icon = 'fas fa-gears',
                    label = locales.open_menu,
                    targeticon = 'fas fa-gears',
                    action = function()
                        TriggerEvent('codem-taxijob:OpenMenu')
                    end
                }
            },
            distance = 2.5,
        })
    end
    if Config.InteractionHandler == 'qb_textui' or Config.InteractionHandler == 'esx_textui' or Config.InteractionHandler == 'drawtext' or Config.InteractionHandler == 'codem_textui' then
        CreateThread(function()
            local show = false
            while true do
                local cd = 1500
                local plyCoords = GetEntityCoords(PlayerPedId())
                local vec = vector3(Config.NpcLocation.coords.x, Config.NpcLocation.coords.y, Config.NpcLocation.coords.z + 1.0)
                local dist = #(vec - plyCoords)
                if dist < 1.25  then
                    cd = 0
                    if not show then
                        if Config.InteractionHandler == 'esx_textui' then
                            Core.TextUI(locales.e_open_menu)
                            show = true
                        end
                        if Config.InteractionHandler == 'qb_textui' then
                            TriggerEvent("qb-core:client:DrawText", locales.e_open_menu)
                            show = true
                        end
                        if Config.InteractionHandler == 'codem_textui' then
                            TriggerEvent('codem-textui:ShowTextUI', locales.e_open_menu, 'E', 'thema-1')
                            show = true

                        end
                    end
                    if Config.InteractionHandler == 'drawtext' then
                        DrawMarker(2, vec, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.2, 0.15, 255, 255, 255, 255, false, false, false,
                            true, false, false, false)
                        DrawText3D(vec.x, vec.y, vec.z, locales.e_open_menu)
                    end
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent('codem-taxijob:OpenMenu')
                    end                       
                end
                 if show and cd > 0 then
                    show = false
                    if  Config.InteractionHandler == 'esx_textui' then
                        Core.HideUI()
                    end
                    if Config.InteractionHandler == 'qb_textui' then
                        TriggerEvent("qb-core:client:HideText")
                    end
                    if Config.InteractionHandler == 'codem_textui' then
                        TriggerEvent("codem-textui:CloseTextUI")
                    end
                end
                Wait(cd)
            end
        end)

    end
end