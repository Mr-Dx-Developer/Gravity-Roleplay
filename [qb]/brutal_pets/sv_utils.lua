-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(source, title, text, time, type)
    if Config.BrutalNotify then
        TriggerClientEvent('brutal_notify:SendAlert', source, title, text, time, type)
    else
        TriggerClientEvent('brutal_pets:client:DefaultNotify', text)
    end
end

function PlayerNameFunction(source)
    return GetPlayerName(source)
end

function SendDiscord(PlayerID, Item, Count)
    -- Here you can put discord webhook to log when someone try to add/remove items with this script
end