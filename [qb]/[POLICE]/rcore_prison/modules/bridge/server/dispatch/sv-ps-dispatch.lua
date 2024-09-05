CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.PS)) then
        Dispatch.Breakout = function()
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)
            local data = {
                message = text,
                codeName = 'NONE',
                code = '10-64',
                icon = 'fas fa-question',
                priority = 1,
                coords = coords,
                jobList = Config.Escape.NotifyJobs,
                jobs = Config.Escape.NotifyJobs,
            }

            if isResourceLoaded(THIRD_PARTY_RESOURCE.QF_MDT) then
                TriggerEvent('ps-dispatch:server:notify', data)
            else
                TriggerClientEvent('rcore_prison:client:setDispatch', -1, data)
            end

            dbg.info('Dispatch.Breakout: Prison break started!')
        end
    end
end)


