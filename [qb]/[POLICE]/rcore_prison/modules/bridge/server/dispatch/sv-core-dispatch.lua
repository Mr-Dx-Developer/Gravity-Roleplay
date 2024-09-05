CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.CORE)) then
        Dispatch.Breakout = function()
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x,SH.data.prisonYard.y, SH.data.prisonYard.z)
            local data = {
                message = text,     
                coords = { coords },
                job = Config.Escape.NotifyJobs[0],
                cooldown = 5000,
                sprite = 488, 
                color = 1,
                priority = true
            }

            TriggerClientEvent('rcore_prison:client:setDispatch', -1, data)

            dbg.info('Dispatch.Breakout: Prison break started!')
        end
    end
end)



