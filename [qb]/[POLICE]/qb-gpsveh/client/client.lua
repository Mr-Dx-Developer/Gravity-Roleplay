local QBCore = exports[Config.CoreObject]:GetCoreObject()

local CarGPS = {}

local function CarGPSActive(plate)
    local gameVehicles = QBCore.Functions.GetVehicles()
    for i = 1, #gameVehicles do
        local vehicle = gameVehicles[i]
        if DoesEntityExist(vehicle) then
            if QBCore.Functions.GetPlate(vehicle) == plate then
                local vehCoords = GetEntityCoords(vehicle)
                return vehCoords
            end
        end
    end
end



local function GPSBlipUpdate(Label,  Coord)
	CreateThread(function()
		local blip = nil
		if not DoesBlipExist(blip) then
			blip = AddBlipForCoord(Coord.x, Coord.y, Coord.z)
			SetBlipSprite(blip, 161)
			SetBlipScale(blip, 0.8)
			SetBlipColour(blip, 75)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName('STRING')
			AddTextComponentString(Label)
			EndTextCommandSetBlipName(blip)
			Wait(2000)
			RemoveBlip(blip)
		end
	end)
end



local function GetClosestPlate()
	local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local veh = QBCore.Functions.GetClosestVehicle(pos)
    local plate = QBCore.Functions.GetPlate(veh)
	local vehpos = GetEntityCoords(veh)
	local VehSpeed = GetEntitySpeed(veh)
    if not IsPedInAnyVehicle(ped) then
		if veh and #(pos - vehpos) < 2.5 then
			if VehSpeed <= 0.5 then
				return ped, veh, plate
			else
				QBCore.Functions.Notify("The speed of the car is high!", "error")
			end
		else
			QBCore.Functions.Notify("There are no cars near you", "error")
		end
	else
		QBCore.Functions.Notify("Get out of the car", "error")
    end
	return false
end

CreateThread(function()
	while true do
		Wait(1000)
		if LocalPlayer.state.isLoggedIn then
			for k, v in pairs(CarGPS) do
				local CarCoord = CarGPSActive(v.Plate)
				if CarCoord then
					GPSBlipUpdate(v.IP, CarCoord)
					Wait(1000)
				end
			end
		end
	end
end)

RegisterNetEvent(Config.TriggerName..'vehiclegps:client:UseGpsInTheCar', function()
	local ped, veh, Plate = GetClosestPlate()
	if Plate then
		TaskTurnPedToFaceEntity(ped, veh, 1000)
		Wait(800)
		TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		local timer = math.random(5,10)
		local circles = math.random(3,4)
		local LockPick = exports[Config.TriggerName..'lock']:StartLockPickCircle(circles, timer)
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		if LockPick then
			QBCore.Functions.Progressbar("installing_gps", "Installing GPS", 10000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true
			}, {
				animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
				anim = "machinic_loop_mechandplayer",
				flags = 16
			}, {}, {}, function() -- Done
				StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
				QBCore.Functions.TriggerCallback(Config.Core..':HasItem', function(result)
					if result then
						local IP = math.random(1,9).."."..math.random(1,9).."."..math.random(1,9).."."..math.random(1,9)
						local Pass = math.random(1,9)..math.random(1,9)..math.random(1,9)..math.random(1,9)
						TriggerServerEvent(Config.TriggerName..'vehiclegps:server:AddGpsToCarData', Plate, IP, Pass)
						SetTimeout(math.random(1000, 2000), function()
							TriggerServerEvent('qb-phone:server:sendNewMail', {
								sender = "GPS",
								subject = "GPS Data",
								message = "<b>IP:</b> "..IP.."<br/><b>Pass:</b> "..Pass,
								button = {}
							})
						end)
						TriggerServerEvent(Config.Core..":Server:RemoveItem", "vehicle_gps", 1)
						TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vehicle_gps'], "remove")
						QBCore.Functions.Notify("success", "success")
					else
						QBCore.Functions.Notify("You do not have a Vehicle GPS item!", "error")
					end
				end, "vehicle_gps")
			end, function() -- Cancel
				StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
			end)
		else
			QBCore.Functions.Notify("Failed", "error")
		end
	end
end)

RegisterCommand('removegps', function()
	QBCore.Functions.TriggerCallback(Config.Core..':HasItem', function(result)
		if result then
			local Search = false
			local ped, veh, Plate = GetClosestPlate()
			if Plate then
				TaskTurnPedToFaceEntity(ped, veh, 1000)
				Wait(800)
				QBCore.Functions.TriggerCallback(Config.TriggerName..'vehiclegps:server:GetCarsGPSs', function(result)
					QBCore.Functions.Progressbar("searching_gps", "Searching GPS", 10000, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true
					}, {
						animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
						anim = "machinic_loop_mechandplayer",
						flags = 16
					}, {}, {}, function() -- Done
						StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
						for k, v in pairs(result) do 
							if not Search then
								if v.Plate == Plate then
									QBCore.Functions.Notify("Found !", "success")	
									Wait(1000)
									TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
									local timer = math.random(5,10)
									local circles = math.random(3, 4)
									local LockPick = exports[Config.TriggerName..'lock']:StartLockPickCircle(circles, timer)
									TriggerEvent('animations:client:EmoteCommandStart', {"c"})
									if LockPick then
										TriggerServerEvent(Config.Core..":Server:AddItem", "vehicle_gps", 1, false, {quality = 100})
										TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['vehicle_gps'], "add")
										TriggerServerEvent(Config.TriggerName..'vehiclegps:server:RemoveGPS', k)
										QBCore.Functions.Notify("success", "success")
									else
										QBCore.Functions.Notify("Failed", "error")
									end
									Search = true
									return
								end
							end
						end
						QBCore.Functions.Notify("Nothing found !", "error")	
					end, function() -- Cancel
						StopAnimTask(ped, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 1.0)
					end)
				end)
			end
		else
			QBCore.Functions.Notify("You do not have a ToolKit item!", "error")
		end
	end, "screwdriverset")
end)

RegisterNetEvent(Config.TriggerName..'vehiclegps:client:SuncGPSData', function(IP)
	CarGPS[IP] = nil
	SendNUIMessage({
		action = "RefreshIP",
		data = CarGPS,
	})
end)



RegisterNetEvent(Config.TriggerName..'vehiclegps:client:OpenGPSMenu', function()
	SendNUIMessage({
		action = "StartUP",
		data = CarGPS,
	})
	SetNuiFocus(true, true)
end)

RegisterNUICallback('CloseGpsMenu', function()
	SetNuiFocus(false, false)
end)

RegisterNUICallback('GetCheckIP', function(data, cb)
	QBCore.Functions.TriggerCallback(Config.TriggerName..'vehiclegps:server:GetGPSInIP', function(data)
		if data then
			CarGPS[data.IP] = {['IP'] = data.IP, ['Pass'] = data.Pass, ['Plate'] = data.Plate}
			cb(CarGPS)
		else
			QBCore.Functions.Notify("There is no such IP!", "error")
		end
	end, data)
end)

RegisterNUICallback('DeleteRefreshGPS', function(data)
	CarGPS[data.IP] = nil
	SendNUIMessage({
		action = "RefreshIP",
		data = CarGPS,
	})
end)

-- RL Shop - https://discord.gg/S7zvxXHDem
-- RL Shop - https://discord.gg/S7zvxXHDem
-- RL Shop - https://discord.gg/S7zvxXHDem
-- RL Shop - https://discord.gg/S7zvxXHDem