local QBCore = exports['qb-core']:GetCoreObject()
local inPhone = false
local mision_cocaina = false
local misionesactivas = false
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}


local function LoadAnimDic(dict)
    if not HasAnimDictLoaded(dict) then
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Wait(0)
        end
    end
end
CreateThread(function()
    while true do
        if inPhone == true then

    DisableControlAction(0, 1, true) -- disable mouse look
    DisableControlAction(0, 2, true) -- disable mouse look
    DisableControlAction(0, 3, true) -- disable mouse look
    DisableControlAction(0, 4, true) -- disable mouse look
    DisableControlAction(0, 5, true) -- disable mouse look
    DisableControlAction(0, 6, true) -- disable mouse look
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 177, true) -- disable escape
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 202, true) -- disable escape
    DisableControlAction(0, 322, true) -- disable escape
    DisableControlAction(0, 245, true) -- disable chat

        end
        Wait(3)
    end
end)
------------
-- EVENTS --
------------

RegisterNetEvent('am_groupsystemystem:DisplayHud', function()
     QBCore.Functions.TriggerCallback('am_groupsystemystem:getBankingInformation', function(banking)
        if banking ~= nil then
        SetNuiFocus(true, true)
        SetNuiFocusKeepInput(true)
    SendNUIMessage({
        action = "OpenCopsUI",
		information = banking
    })
	    LoadAnimDic("cellphone@")
		TaskPlayAnim(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
		celProp = CreateObject(`prop_phone_ing_02`, 1.0, 1.0, 1.0, 1, 1, 0)
		AttachEntityToEntity(celProp, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.13, 0.02, -0.02, 100.0, 220.0, 80.0, 1, 1, 0, 0, 2, 1)
 inPhone = true
        end
    end)
end)

local function closeuicops()
    SetNuiFocus(false, false)
		DeleteObject(celProp)
		StopAnimTask(PlayerPedId(), "cellphone@", "cellphone_text_read_base", 1.0)
		ClearPedTasks(PlayerPedId())
		inPhone = false
end

RegisterNUICallback('close', function(_, cb)
    closeuicops()
	SetNuiFocus(false, false)
	DeleteObject(celProp)
    cb('ok')
end)



AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ClearPedTasks(PlayerPedId())
        FreezeEntityPosition(PlayerPedId(), false)
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local inRange = false
		local ped = PlayerPedId()
		
        local pos = GetEntityCoords(ped)
		local dist = GetDistanceBetweenCoords(pos, 1961.08, 3740.85, 32.34)

        if dist < 1.5 then
            inRange = true
            if dist < 1.5 then

                QBCore.Functions.HelpNotify('Press ~INPUT_CONTEXT~ simulate robbery Shop')
	
                if IsControlJustPressed(1, Keys["E"])  then
	        QBCore.Functions.Progressbar("misioncocainagangsystem", "simulate robbery Shop", math.random(3000,4000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@amb@business@coc@coc_unpack_cut@",
                anim = "fullcut_cycle_cokecutter",
                flags = 1,
            }, {}, {}, function() 
                    TriggerServerEvent("am_gangsystem:RespectAddLV1")
                    TriggerServerEvent("am_gangsystem:conteotienda")
					ClearPedTasks(PlayerPedId())

end)
				end
			end
		end
	end
end)

-- RegisterNetEvent('crearprop')
-- AddEventHandler('crearprop', function()
		-- local player = GetPlayerPed(-1)
-- local modelHash = "prop_weed_tub_01"

			-- if not HasModelLoaded(modelHash) then

				-- RequestModel(modelHash)

				-- while not HasModelLoaded(modelHash) do
					-- Citizen.Wait(1)
				-- end
			-- end


			-- local obj = CreateObject(modelHash, GetEntityCoords(GetPlayerPed(-1)), true)

-- end)

local puntoHabilitado = false -- Variable para rastrear si el punto está habilitado

-- Función para comprobar si es de noche
function esDeNoche()
    local horaActual = GetClockHours()
    return horaActual >= 21 or horaActual < 6 -- Puedes ajustar los valores según tu definición de "noche"
end

-- Activar o desactivar el punto según sea de noche o no
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- Espera un segundo antes de verificar nuevamente
        
        local nuevaHabilitacion = esDeNoche()
        
        if nuevaHabilitacion ~= puntoHabilitado then
            if nuevaHabilitacion then
                mision_cocaina = true
				CreateAutoRobadomisioncocaina()
            else
                mision_cocaina = false
				
            end
            puntoHabilitado = nuevaHabilitacion
        end
    end
end)

-----------------------------------------------------------------
-----------------------------------------------------------------
    ----- FUNCIONES DE MISIONES DROGAS  -----
-----------------------------------------------------------------
-----------------------------------------------------------------


RegisterNUICallback('activar-misioncocaina', function()
    QBCore.Functions.TriggerCallback("am_gangsystem:CooldownMisionCocaine", function(cooldown)
        if not cooldown then
            TriggerEvent("misioncocainarevisaritem")

        else
	        QBCore.Functions.Notify("The day's delivery has already taken place, you must wait for the next one...")
        end

    end)
end)


RegisterNetEvent('misioncocainarevisaritem')
AddEventHandler('misioncocainarevisaritem', function()

	QBCore.Functions.TriggerCallback('am_gangsystem:server:revisaritemscocaina', function(HasItem)
        if HasItem then
		    
	        QBCore.Functions.Progressbar("misioncocainagangsystem", "Organizing a Meeting", math.random(3000,4000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "anim@amb@business@coc@coc_unpack_cut@",
                anim = "fullcut_cycle_cokecutter",
                flags = 1,
            }, {}, {}, function() 
	            QBCore.Functions.Notify("Delivery accepted, Search for buyer within the area marked for Cocaine.", "error")
				TriggerServerEvent('am_gangsystem:Server:CooldownMisionCocaine')
				misionesactivas = true
				blipareascocainamision()
                
                -- TriggerServerEvent("am_gangsystem:RespectAddLV1")
		        -- TriggerServerEvent("am_gangsystem:conteotienda")
		        ClearPedTasks(PlayerPedId())
	        end)
		else
			QBCore.Functions.Notify("You don't have at least 15 bricks of cocaine.")
		end
	end)

end)

function blipareascocainamision()
    blipareascocainamision = AddBlipForRadius(-3234.44, 1104.28, 7.6, 250.0) 
    SetBlipHighDetail(blipareascocainamision, true)
  	SetBlipSprite(blipareascocainamision,9)
    SetBlipColour(blipareascocainamision,45)
    SetBlipAlpha(blipareascocainamision,80)
end
   




Citizen.CreateThread(function()
    local hash = GetHashKey("cs_nervousron")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
end
    scenariococainamisionamgang = CreatePed("PED_TYPE_CIVFEMALE", "cs_nervousron", -3164.53, 1115.65, 21.01, 100.05, false, false)
	TaskStartScenarioInPlace(scenariococainamisionamgang, 'CODE_HUMAN_MEDIC_KNEEL', -1, true)
    SetBlockingOfNonTemporaryEvents(scenariococainamisionamgang, true)
	        FreezeEntityPosition(scenariococainamisionamgang, true)
            SetEntityInvincible(scenariococainamisionamgang, true)
            SetPedDiesWhenInjured(scenariococainamisionamgang, false)
            SetPedCanPlayAmbientAnims(scenariococainamisionamgang, true)
            SetPedCanRagdollFromPlayerImpact(scenariococainamisionamgang, false)
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(1)
        local inRange = false
		local ped = PlayerPedId()
		
        local pos = GetEntityCoords(ped)
		local dist = GetDistanceBetweenCoords(pos, -3164.53, 1115.65, 21.01)

        if dist < 1.5 then
            inRange = true
            if dist < 1.5 then

                QBCore.Functions.HelpNotify('Press ~INPUT_CONTEXT~ Deliver Drugs')
	
                if IsControlJustPressed(1, Keys["E"])  then
				    if mision_cocaina == true then
					   if misionesactivas == true then
                    TriggerServerEvent("am_gangsystem:RespectAddLV1")
					-- TriggerServerEvent("am_gangsystem:conteotienda")
					ClearPedTasks(PlayerPedId())
                    PlayCutscene('mph_nar_tra_ext', Config['gangsystem']['cocaine-mision']['buyerPos1'])
											else
		QBCore.Functions.Notify("You haven't done business with him yet.")
		end
						else
		QBCore.Functions.Notify("It is Daylight.")
		end
				end
			end
		end
	end
end)






function CreateAutoRobadomisioncocaina()
    local coords = vector4(-3172.52, 1104.98, 20.52, 163.92)
    local ped = PlayerPedId()
        QBCore.Functions.SpawnVehicle("trash2", function(vehiculotrashmisioncoca)
        SetVehicleNumberPlateText(vehiculotrashmisioncoca, "Hayes"..tostring(math.random(1000, 9999)))
        SetEntityHeading(vehiculotrashmisioncoca, coords.w)
        exports['LegacyFuel']:SetFuel(vehiculotrashmisioncoca, 20.0)
        SetEntityAsMissionEntity(vehiculotrashmisioncoca, true, true)
        SetVehicleDoorsLocked(vehiculotrashmisioncoca, 2)

		print("VEHICULO CREADO")
        -- TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehiculorobao))
        -- SetVehicleEngineOn(vehiculorobao, true, true)
	end, coords, true)
end


-----------------------------------------------------------------
-----------------------------------------------------------------

function loadModel(model)
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
end

--Thanks to d0p3t
function PlayCutscene(cut, coords)
    while not HasThisCutsceneLoaded(cut) do 
	    DeleteEntity(scenariococainamisionamgang)
        RequestCutscene(cut, 8)
        Wait(0) 
    end
	
    CreateCutscene(false, coords)
    RemoveCutscene()
    DoScreenFadeIn(500)
end

function CreateCutscene(change, coords)
    local ped = PlayerPedId()
        



    
   TriggerEvent('save_all_clothes') -- saves the clothes
    SetCutsceneEntityStreamingFlags('MP_1', 0, 1)
    RegisterEntityForCutscene(ped, 'MP_1', 0, 0, 64)

    SetCutsceneEntityStreamingFlags('MP_2', 0, 1)
    RegisterEntityForCutscene(ped, 'MP_2', 0, 0, 64)

    SetCutsceneEntityStreamingFlags('MP_3', 0, 1)
    RegisterEntityForCutscene(ped, 'MP_3', 0, 0, 64)

    SetCutsceneEntityStreamingFlags('MP_4', 0, 1)
    RegisterEntityForCutscene(ped, 'MP_4', 0, 0, 64)


    
    Wait(10)

        StartCutsceneAtCoords(coords, 0)
   
    while not (DoesCutsceneEntityExist('MP_1', 0)) do
        Wait(0)
    end
   -- Set the clothes that you had on ped ' <-- for some reason that is needed to comment.
   SetCutscenePedComponentVariationFromPed(PlayerPedId(), GetPlayerPed(-1), 1885233650)
   SetPedComponentVariation(GetPlayerPed(-1), 11, jacket_old, jacket_tex, jacket_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 8, shirt_old, shirt_tex, shirt_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 3, arms_old, arms_tex, arms_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 4, pants_old,pants_tex,pants_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 6, feet_old,feet_tex,feet_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 1, mask_old,mask_tex,mask_pal)
   SetPedComponentVariation(GetPlayerPed(-1), 9, vest_old,vest_tex,vest_pal)
   SetPedPropIndex(GetPlayerPed(-1), 0, hat_prop, hat_tex, 0)
   SetPedPropIndex(GetPlayerPed(-1), 1, glass_prop, glass_tex, 0)


    Wait(50)

    DoScreenFadeIn(250)
	TriggerServerEvent("am_gangsystem:server:eliminarladrillosdecoca")
	TriggerServerEvent("am_gangsystem:server:darrecompensacocaina")
	RemoveBlip(blipareascocainamision)
    misionesactivas = false
end

RegisterNetEvent('save_all_clothes') -- The actual saving.
AddEventHandler('save_all_clothes',function()
    local ped = GetPlayerPed(-1)
    mask_old,mask_tex,mask_pal = GetPedDrawableVariation(ped,1),GetPedTextureVariation(ped,1),GetPedPaletteVariation(ped,1)
    vest_old,vest_tex,vest_pal = GetPedDrawableVariation(ped,9),GetPedTextureVariation(ped,9),GetPedPaletteVariation(ped,9)
    glass_prop,glass_tex = GetPedPropIndex(ped,1),GetPedPropTextureIndex(ped,1)
    hat_prop,hat_tex = GetPedPropIndex(ped,0),GetPedPropTextureIndex(ped,0)
    jacket_old,jacket_tex,jacket_pal = GetPedDrawableVariation(ped, 11),GetPedTextureVariation(ped,11),GetPedPaletteVariation(ped,11)
    shirt_old,shirt_tex,shirt_pal = GetPedDrawableVariation(ped,8),GetPedTextureVariation(ped,8),GetPedPaletteVariation(ped,8)
    arms_old,arms_tex,arms_pal = GetPedDrawableVariation(ped,3),GetPedTextureVariation(ped,3),GetPedPaletteVariation(ped,3)
    pants_old,pants_tex,pants_pal = GetPedDrawableVariation(ped,4),GetPedTextureVariation(ped,4),GetPedPaletteVariation(ped,4)
    feet_old,feet_tex,feet_pal = GetPedDrawableVariation(ped,6),GetPedTextureVariation(ped,6),GetPedPaletteVariation(ped,6)
end)

-----------------------------------------------------------------
-----------------------------------------------------------------

