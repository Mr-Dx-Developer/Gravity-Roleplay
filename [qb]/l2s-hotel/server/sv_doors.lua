local DoorsConfig = DoorsConfig

QBCore.Functions.CreateCallback('l2s-hoteldoors:server:setupDoors', function(_, cb)
	cb(DoorsConfig.DoorList)
end)

RegisterNetEvent('l2s-hoteldoors:server:ToggleHotel', function(doorID)
	local playerId = sentSource or source
	local Player = QBCore.Functions.GetPlayer(playerId)

	if DoorsConfig.DoorList[doorID].locked then
		DoorsConfig.DoorList[doorID].locked = false
		TriggerClientEvent('l2s-hoteldoors:client:setState', -1, playerId, doorID, false, src or false, true, true)
	else
		DoorsConfig.DoorList[doorID].locked = true
		TriggerClientEvent('l2s-hoteldoors:client:setState', -1, playerId, doorID, true, src or false, true, true)
		TriggerClientEvent('l2s-hotel:client:doorsound', source)
	end
	SetTimeout(30000, function()
		if DoorsConfig.DoorList[doorID].locked then return end
		DoorsConfig.DoorList[doorID].locked = true
		TriggerClientEvent('l2s-hoteldoors:client:setState', -1, playerId, doorID, true, src or false, false, false)
	end)
end)

RegisterServerEvent('l2s-hotel:Server:LockSynce')
AddEventHandler('l2s-hotel:Server:LockSynce', function(Place, bool)
	SharedChairs.ChairLocations[Place].IsBusy = bool
	TriggerClientEvent('l2s-hotel:Client:LockSynce', -1, Place, bool)
end)

RegisterServerEvent('l2s-hotel:Server:Enter')
AddEventHandler('l2s-hotel:Server:Enter', function(Current)
  local oSource = source
  TriggerClientEvent('l2s-hotel:Client:Animation', oSource, Current)
end)
