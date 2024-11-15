QBCore = exports["qb-core"]:GetCoreObject()

local keys = {
	[34]="A", [29]="B", [26]="C", [30]="D", [46]="E", [49]="F", [47]="G", [74]="H",
	[311]="K", [7]="L", [244]="M", [249]="N", [199]="P", [44]="Q", [45]="R", [33]="S",
	[245]="T", [303]="U", [0]="V", [32]="W", [77]="X", [246]="Y", [20]="Z", [39]="[",
	[27]="UpArr", [173]="DownArr", [174]="LeftArr", [175]="RightArr", [19]="LAlt",
	[168]="F7", [288]="F1", [289]="F2", [170]="F3", [166]="F5", [167]="F6", [56]="F9",
	[57]="F10", [344]="F11", [157]="1", [158]="2", [160]="3", [164]="4", [165]="5",
	[159]="6", [161]="7", [162]="8", [163]="9", [21]="LShift"
}

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
	PlayerJob = job
end)

Citizen.CreateThread(function()
	if type(Config.OpenMenuKey) == 'number' then
		Config.OpenMenuKey = keys[Config.OpenMenuKey]
	end
	RegisterKeyMapping(Config.OpenMenuCommand, "Open billing menu", "KEYBOARD", Config.OpenMenuKey)
end)

RegisterCommand(Config.OpenMenuCommand, function(source, args, rawCommand)
	TriggerEvent(Config.EventPrefix..":OpenSelectionMenu")
end)

RegisterNetEvent(Config.EventPrefix..":notification")
AddEventHandler(Config.EventPrefix..":notification", function(title, text, time, type)
	if Config.UseOKOKNotify then
		exports['okokNotify']:Alert(title, text, time, type)
	else
		TriggerEvent('QBCore:Notify', text, type, time)
	end
end)

function onMenuClose()
	-- Code to execute when the menu is closed
end

function playerjob()
	return QBCore.Functions.GetPlayerData().job
end

function playerjoblabel()
	return QBCore.Functions.GetPlayerData().job.label
end

function playerCitizenid()
	return QBCore.Functions.GetPlayerData().citizenid
end

function getNearPlayers()
	QBCore.Functions.TriggerCallback(Config.EventPrefix..":Get10NearestPlayers", function(nearestPlayers)
		if nearestPlayers ~= nil then
			if nearestPlayers[1] ~= nil then
				SendNUIMessage({
					action = 'updateNearPlayers',
					nearPlayers = nearestPlayers,
				})  
			else
				TriggerEvent(Config.EventPrefix..':notification', _L('near_error').title, _L('near_error').text, _L('near_error').time, _L('near_error').type)
			end
		else
			TriggerEvent(Config.EventPrefix..':notification', _L('near_error').title, _L('near_error').text, _L('near_error').time, _L('near_error').type)
		end
	end)
end

RegisterNetEvent(Config.EventPrefix..":OpenSelectionMenu")
AddEventHandler(Config.EventPrefix..":OpenSelectionMenu", function()
	local ped = PlayerPedId()
	if IsEntityDead(ped) then return end
	local playerIsCop = false
	local playerHasCityInvoices = false
	if(PlayerJob == nil) then
		PlayerJob = playerjob()
	end

	local PlayerJobName = ''

	local canAccessSociety = false

	if PlayerJob ~= nil then
		PlayerJobName = PlayerJob.name
	end

	canAccessSociety = false

	for k,v in pairs(Config.AllowedSocieties) do
		for k2, v2 in pairs(Config.SocietyAccessRanks) do
			if PlayerJobName == v and PlayerJob.grade.name == v2 or Config.SocietyAccessRanks[1] == '' then 
				canAccessSociety = true
				break
			end
		end

		for k2, v2 in pairs(Config.InspectCitizenSocieties) do
			if PlayerJobName == v2 then 
				playerIsCop = true
				break
			end
		end

		for k,v in pairs(Config.JobsWithCityInvoices) do
			if PlayerJobName == v then 
				for k2, v2 in pairs(Config.CityInvoicesAccessRanks) do
					if PlayerJob.grade.name == v2 or Config.CityInvoicesAccessRanks[1] == '' then 
						playerHasCityInvoices = true
						break
					end
				end
			end
		end
	end

	QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerGroup", function(playerGroup)
		QBCore.Functions.TriggerCallback(Config.EventPrefix..":getPlayerInvoices", function(pInvoices)
			isInvoicesOpen = true
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'selection_menu',
				vatPercentage = Config.VATPercentage,
				societyAccess = canAccessSociety,
				billsList = json.encode(Config.BillsList),
				playerJob = PlayerJobName,
				playerSociety = 'society_'..PlayerJobName,
				isCop = playerIsCop,
				hasCityInvoices = playerGroup and true or playerHasCityInvoices,
				playerInvoices = json.encode(pInvoices),
				playerIdentifier = playerCitizenid(),
				SocietyReceivesLessWithVAT = Config.SocietyReceivesLessWithVAT,
				VATPercentage = Config.VATPercentage,
				AllowPlayersInvoice = Config.AllowPlayersInvoice,
			})   
		end)
	end) 
end)