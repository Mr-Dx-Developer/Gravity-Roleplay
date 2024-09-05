CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.RCORE)) then
        Dispatch.Breakout = function()
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x,SH.data.prisonYard.y, SH.data.prisonYard.z)
            local data = {
                code = '10-64',
                default_priority = 'high',
                coords = coords,
                job =  Config.Escape.NotifyJobs,
                text = text,
                type = 'alerts', 
                blip_time = 5,
                image = "https://rco.re/product/prison/rcore_dispatch_preview.png",
                blip = { -- Blip table (optional)
                    sprite = 488, 
                    colour = 1, 
                    scale = 1.5,
                    text = _U('DISPATCH.BREAKOUT_BLIP_TEXT'),
                    flashes = true, 
                    radius = 0,
                }
            }

            TriggerEvent('rcore_dispatch:server:sendAlert', data)

            dbg.info('Dispatch.Breakout: Prison break started!')
        end
    end
end)
