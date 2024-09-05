CreateThread(function()
    if isBridgeLoaded('Notify', Notifies.NATIVE) or isBridgeLoaded('Notify', Notifies.NONE) or isBridgeLoaded('Notify', Notifies.AUTO_DETECT) then
        Framework.sendNotification = function(client, message, type)
            StartClient(client, 'Notify', message)
        end
    end
end)