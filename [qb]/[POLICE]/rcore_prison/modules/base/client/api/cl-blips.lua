NetworkService.EventListener('heartbeat', function(eventType, data)
    if eventType == 'PRISONER_LOADED' then
        if PrisonService.IsPrisoner() then
            dbg.debug('Since player is a prisoner, setting prison blips.')
            SetPrisonBlips()    
        end
    elseif eventType == 'PRISONER_RELEASED' then
        dbg.debug('Since player is released, removing prison blips.')
        Blips.RemoveByType('NPC')
    end
end)

function SetPrisonBlips()
    for id, place in pairs(SH.data.interaction) do
        local zoneCoords = place.coords

        if place.blip and PrisonService.IsPrisoner() then
            Blips.Create({
                name = place.blip.name or _U('JOB.TASK_BLIP_AREA_NAME'),
                sprite = place.blip.sprite or 1,
                color = place.blip.color or 0,
                scale = place.blip.scale or 0.5,
                coords = zoneCoords,
                type = 'NPC'
            })
        end
    end
end