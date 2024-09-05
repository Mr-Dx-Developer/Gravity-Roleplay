CreateThread(function()
    if (isBridgeLoaded('Dispatch', DispatchList.NONE or isBridgeLoaded('Dispatch', DispatchList.NATIVE))) then
        Dispatch.Breakout = function()
            local retval = Framework.getOfficers()
    
            if retval and next(retval) then
                for _, playerId in pairs(retval) do
                    if playerId then
                        Framework.sendNotification(playerId, _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'), 'info') 
                    end
                end
            end

            dbg.info('Dispatch.Breakout: This will be shown to all players, adjust it to your needs.')
        end
    end
end)



