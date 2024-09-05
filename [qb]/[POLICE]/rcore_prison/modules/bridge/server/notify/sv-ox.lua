CreateThread(function()
    if isBridgeLoaded('Notify', Notifies.OX) then
        Framework.sendNotification = function(client, message, type)
            if lib then
                TriggerClientEvent('ox_lib:notify', client, {
                    title = _U('NOTIFY.TITLE'),
                    description = message,
                    type = type,
                    duration = 5000
                })
            end
        end
    end
end)