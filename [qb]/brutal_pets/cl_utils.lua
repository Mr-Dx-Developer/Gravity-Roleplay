-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    if Config.BrutalNotify then
        exports['brutal_notify']:SendAlert(title, text, time, type)
    else
        -- Put here your own notify and set the Config.BrutalNotify to false
        TriggerEvent('brutal_pets:client:DefaultNotify', text)
    end
end

RegisterNetEvent('brutal_pets:client:DefaultNotify')
AddEventHandler('brutal_pets:client:DefaultNotify', function(text)
    -- Put here your own notify and set the Config.BrutalNotify to false
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(0,1)

    -- Default ESX Notify:
    --TriggerEvent('esx:showNotification', text)

    -- Default QB Notify:
    --TriggerEvent('QBCore:Notify', text, 'info', 5000)

    -- OKOK Notify:
    -- exports['okokNotify']:Alert('POLICE JOB',title, text, time, type, false)
end)

RegisterNetEvent('brutal_pets:client:OpenPetMenu')
AddEventHandler('brutal_pets:client:OpenPetMenu', function()
    TriggerEvent('brutal_pets:client:openmypetmenu')
end)

function PlayerDied(ped)
    local died = false
    if (GetEntityHealth(ped) <= PlayerDiedHealth) then
        died = true
    end
    return died
end

function PetDied(ped)
    local died = false
    if IsEntityDead(ped) then
        died = true
    end
    return died
end

function GetPedHP(ped)
	if GetEntityHealth(ped) < MyPets[CB].HP and DoesEntityExist(ped) then
        if GetEntityHealth(ped) == 0 then
            MyPets[CB].HP = 100
        else
		    MyPets[CB].HP = GetEntityHealth(ped)
        end
		return MyPets[CB].HP
	else
        if MyPets[CB].HP == 0 then
            MyPets[CB].HP = 100
        end
		return MyPets[CB].HP
	end
end

function GPS_Enable()
    DisplayRadar(true)
end

function GPS_Disable()
    DisplayRadar(false)
end

function WhistleAnimation()
    local playerPed = PlayerPedId()
    loadAnimDict('rcmnigel1c')
	TaskPlayAnim(playerPed, 'rcmnigel1c', 'hailing_whistle_waive_a', 8.0, -8, -1, 1, 0, 0, 0, 0)
    Citizen.Wait(2300)
    ClearPedTasks(playerPed)
end

function NoteAnimation()
    loadAnimDict('anim@amb@nightclub@peds@')
	TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 0, false)
end

function GetBallBack_Utils()
    TriggerServerEvent('brutal_pets:server:AddItem', "WEAPON_BALL", 1)
    -- This is played when the pet returns the ball to the player
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function HelpText(text, sound, _end)
    text = tostring(text)
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), 2500)
end

-- Put this trigger where you want that the pet unfollow the player
-- TriggerEvent('brutal_pets:client:UnFollowPet')

RegisterNetEvent('brutal_pets:client:UnFollowPet')
AddEventHandler('brutal_pets:client:UnFollowPet', function()
    if MyPets[CB].Follow == true and MyPets[CB].InTask == true and MyPets[CB].IsOut then
        FollowPlayer()
    end
end)

function DeleteBallFunction(object)
    DeleteObject(object)
end