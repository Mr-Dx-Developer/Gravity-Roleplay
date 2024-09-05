local standardVolumeOutput = 0.3;
local hasPlayerLoaded = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    hasPlayerLoaded = true
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    hasPlayerLoaded = false
end)

RegisterNetEvent('InteractSound_CL:PlayOnOne', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile  = soundFile,
            transactionVolume = soundVolume
        })
    end
end)

RegisterNetEvent('InteractSound_CL:PlayOnAll', function(soundFile, soundVolume)
    if hasPlayerLoaded then
        SendNUIMessage({
            transactionType = 'playSound',
            transactionFile = soundFile,
            transactionVolume = soundVolume or standardVolumeOutput
        })
    end
end)

RegisterNetEvent('InteractSound_CL:PlayWithinDistance', function(otherPlayerCoords, maxDistance, soundFile, soundVolume)
	if hasPlayerLoaded then
		local myCoords = GetEntityCoords(PlayerPedId())
		local distance = #(myCoords - otherPlayerCoords)

		if distance < maxDistance then
			SendNUIMessage({
				transactionType = 'playSound',
				transactionFile  = soundFile,
				transactionVolume = soundVolume or standardVolumeOutput
			})
		end
	end
end)


RegisterNetEvent('InteractSound:PlayFromCoord_CL')
AddEventHandler('InteractSound:PlayFromCoord_CL',function(coord,maxDistance,soundFile,soundVolume)
    local CoordJoueur = GetEntityCoords(PlayerPedId())
    local distance = Vdist(coord.x,coord.y,coord.z,CoordJoueur.x,CoordJoueur.y,CoordJoueur.z)
    if distance < maxDistance then
        local Volume = (1-distance/maxDistance)*soundVolume
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = Volume
        })
    end
end)