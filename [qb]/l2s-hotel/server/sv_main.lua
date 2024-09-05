local DoorsConfig = DoorsConfig
QBCore = exports[Shared.Exports.core]:GetCoreObject()
CreateDataBase = function()
    for i=1, #Shared.Hotelrooms do
        local isAlready = MySQL.scalar.await('SELECT roomlabel FROM hotel_rooms WHERE roomlabel = ?', {Shared.Hotelrooms[i].label})
        if isAlready == nil then
            local query = 'INSERT INTO hotel_rooms (id, roomlabel) VALUES (:id, :roomlabel)'
            local data = {
                ['id'] = i,
                ['roomlabel'] = Shared.Hotelrooms[i].label,
            }
            MySQL.Async.insert(query, data)
            print("^5Created Database Room:^3 "..Shared.Hotelrooms[i].label)
        end
    end
end

CreateThread(function()
    CreateDataBase()
end)

RegisterServerEvent("qb-clothing:server:openOutfitMenu", function(shopType)
    local src = source
    TriggerClientEvent("qb-clothing:client:openOutfitMenu", src)
end)

QBCore.Functions.CreateUseableItem("hotel_card", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
		if Player.Functions.GetItemBySlot(item.slot) ~= nil then
            if (os.time() - item.info.myhidentime) < 1 then
                TriggerClientEvent('l2s-hotel:client:usekeyroom', src, item.info.roomnumber, item.info.cardnumber)
            else
                TriggerClientEvent('QBCore:Notify', Shared.Language[33], 'error')
            end
		end
    end
end)