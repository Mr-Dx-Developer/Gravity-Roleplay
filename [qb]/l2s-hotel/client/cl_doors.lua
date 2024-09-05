local QBCore = exports[Shared.Exports.core]:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state['isLoggedIn']
local DoorsConfig = DoorsConfig
local playerPed = PlayerPedId()
local playerCoords = GetEntityCoords(playerPed)
local lastCoords = playerCoords
local nearbyDoors, closestDoor = {}, {}
local paused = false
local usingAdvanced = false

-- Functions

local function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(0)
	end
end

local function setobjCoords(data)
    local minDimension, maxDimension = GetModelDimensions(data.objHash)
    local dimensions = maxDimension - minDimension
    local dx, dy = tonumber(dimensions.x), tonumber(dimensions.y)
    if dy <= -1 or dy >= 1 then dx = dy end
    if data.fixText then
        return GetOffsetFromEntityInWorldCoords(data.object, dx / 2, 0, 0)
    else
        return GetOffsetFromEntityInWorldCoords(data.object, -dx / 2, 0, 0)
    end
end

local function playSound(door, src, enableSounds)
	SendNUIMessage({
		type = 'audio',
	})
end

local function doorAnim()
	CreateThread(function()
		loadAnimDict("anim@heists@keycard@")
        TaskPlayAnim(playerPed, "anim@heists@keycard@", "exit", 8.0, 1.0, -1, 48, 0, 0, 0, 0)
        Wait(550)
        ClearPedTasks(playerPed)
    end)
end

local function round(value, numDecimalPlaces)
	if not numDecimalPlaces then return math.floor(value + 0.5) end
    local power = 10 ^ numDecimalPlaces
    return math.floor((value * power) + 0.5) / (power)
end

local function updateDoors(specificDoor)
    playerCoords = GetEntityCoords(playerPed)
    for doorID, data in pairs(DoorsConfig.DoorList) do
        if not specificDoor or doorID == specificDoor then
            if not data.doors then
				if not data.doorType then data.doorType = 'door' end
                if #(playerCoords - data.objCoords) < 30 then
					data.object = GetClosestObjectOfType(data.objCoords, 1.0, data.objHash, false, false, false)
                    if data.object and data.object ~= 0 then
                        data.doorHash = 'door_'..doorID
                        if not IsDoorRegisteredWithSystem(data.doorHash) then
							local objCoords = GetEntityCoords(data.object)
							local objHeading = GetEntityHeading(data.object)
							local hasHeading = data.objYaw or data.objHeading or false
							if data.objCoords ~= objCoords then data.objCoords = objCoords end -- Backwards compatibility fix
							if not hasHeading then
								data.objYaw = objHeading
							else
								if hasHeading ~= objHeading then -- Backwards compatibility fix
									data.objYaw = data.objYaw and objHeading or nil
									data.objHeading = data.objHeading and objHeading or nil
								end
							end
							data.objCoords = GetEntityCoords(data.object)
                            AddDoorToSystem(data.doorHash, data.objName or data.objHash, data.objCoords.x, data.objCoords.y, data.objCoords.z, false, false, false)
                            nearbyDoors[doorID] = true
                            if data.locked then
                                DoorSystemSetDoorState(data.doorHash, 4, false, false)
								DoorSystemSetDoorState(data.doorHash, 1, false, false)
                            else
                                DoorSystemSetDoorState(data.doorHash, 0, false, false)
                            end
                        end
                    end
                elseif data.object and data.object ~= 0 then
					RemoveDoorFromSystem(data.doorHash)
					nearbyDoors[doorID] = false
				end
            end
        end
    end
    lastCoords = playerCoords
end

-- Events

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	QBCore.Functions.TriggerCallback('l2s-hoteldoors:server:setupDoors', function(result)
		DoorsConfig.DoorList = result
		isLoggedIn = true
	end)
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	isLoggedIn = false
end)


RegisterNetEvent('l2s-hoteldoors:client:setState', function(serverId, doorID, state, src, enableAnimation, enableSounds, togggllee)
	if not DoorsConfig.DoorList[doorID] then return end
	if enableAnimation == nil then enableAnimation = true end
	if enableSounds == nil then enableSounds = true end
	if serverId == PlayerData.source and enableAnimation then doorAnim() end
	DoorsConfig.DoorList[doorID].locked = state
	updateDoors(doorID)
	local current = DoorsConfig.DoorList[doorID]
	while true do
		if current.doors then
		else
			if not IsDoorRegisteredWithSystem(DoorsConfig.DoorList[doorID].doorHash) then -- If door is not registered end the loop
			return
		end
		DoorsConfig.DoorList[doorID].currentHeading = GetEntityHeading(DoorsConfig.DoorList[doorID].object)
		DoorsConfig.DoorList[doorID].doorState = DoorSystemGetDoorState(DoorsConfig.DoorList[doorID].doorHash)
		if DoorsConfig.DoorList[doorID].locked and (DoorsConfig.DoorList[doorID].doorState == 4) then
			DoorSystemSetDoorState(DoorsConfig.DoorList[doorID].doorHash, 1, false, false) -- Set to locked
			playSound(DoorsConfig.DoorList[doorID], src, enableSounds)
			return -- End the loop
		elseif not DoorsConfig.DoorList[doorID].locked then
			if DoorsConfig.DoorList[doorID].oldMethod then FreezeEntityPosition(DoorsConfig.DoorList[doorID].object, false) end
			DoorSystemSetDoorState(DoorsConfig.DoorList[doorID].doorHash, 0, false, false) -- Set to unlocked
			playSound(DoorsConfig.DoorList[doorID], src, enableSounds)
			return -- End the loop
		else
			if Round(DoorsConfig.DoorList [doorID].currentHeading, 0) == Round(DoorsConfig.DoorList[doorID].objHeading, 0) then
				DoorSystemSetDoorState(DoorsConfig.DoorList[doorID].doorHash, 4, false, false) -- Force to close
			end
		end
		end
		Wait(0)
	end
end)



-- Threads

CreateThread(function()
	if Shared.V4Files == true then return end
	updateDoors()
	while true do
		local sleep = 100
		if isLoggedIn  then
			playerPed = PlayerPedId()
			playerCoords = GetEntityCoords(playerPed)
			if not closestDoor.id then
				local distance = #(playerCoords - lastCoords)
				if distance > 15 then
					updateDoors()
					sleep = 1000
				else
					for k in pairs(nearbyDoors) do
						local door = DoorsConfig.DoorList[k]
						if door.setText and door.objCoords then
							distance = #(playerCoords - door.objCoords)
							if distance < (closestDoor.distance or 15) then
								if distance < (door.distance or door.maxDistance) then
									closestDoor = {distance = distance, id = k, data = door}
									sleep = 0
								end
							end
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)