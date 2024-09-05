CreateThread(function()
    if isBridgeLoaded('Notify', Notifies.BRUTAL) then
        Framework.sendNotification = function(client, message, type)
            TriggerClientEvent('brutal_notify:SendAlert', client, _U('NOTIFY.TITLE'), message, 5500, type)
        end
    end
end)
