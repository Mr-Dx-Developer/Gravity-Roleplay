CreateThread(function()
    if isBridgeLoaded('Notify', Notifies.OKOK) then
        Framework.sendNotification = function(client, message, type)
            TriggerClientEvent('okokNotify:Alert', client, 
                _U('NOTIFY.TITLE'), 
                message, 
                5000, 
                type or 'info', 
                false
            )
        end
    end
end)