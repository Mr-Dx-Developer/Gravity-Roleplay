jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}
RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    SetPlayerJob()
    TriggerServerEvent('codem-bank:server:loadPlayerName')
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    SetPlayerJob()
    TriggerServerEvent('codem-bank:server:loadPlayerName')
end)

CreateThread(function()
    Core, Config.Framework = GetCore()
    SetPlayerJob()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Player:SetPlayerData")
AddEventHandler("QBCore:Player:SetPlayerData", function(data)
    Wait(1000)
    SetPlayerJob()
end)
AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    if (resource == GetCurrentResourceName()) then
        TriggerServerEvent('codem-bank:server:loadPlayerName')
    end
end)


function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do
            Wait(0)
        end
        while Core.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Wait(0)
        end
    else
        while Core == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Wait(0)
        end
    end
end

function SetPlayerJob()
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        jobData.jobname = PlayerData.job.name
        jobData.job_grade_name = PlayerData.job.label
        jobData.job_grade = tonumber(PlayerData.job.grade)
    else
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 90)
end

function exitATM(atm, coords)
    if atm then
        local atmAccount = TriggerCallback('codem-bank:server:getATMAccount')
        if atmAccount then
            NuiMessage('ATM_ACCOUNT', atmAccount)
            if Config.InteractionHandler ~= 'ox-target' then
                CreateCamVehicle(coords)
                SetNuiFocus(true, true)
                changeCamera('mainCam')
            else
                SetNuiFocus(true, true)
            end
            RequestAnimDict("amb@prop_human_atm@male@enter")
            while (not HasAnimDictLoaded("amb@prop_human_atm@male@enter")) do
                Citizen.Wait(1)
            end
            TaskPlayAnim(PlayerPedId(), "amb@prop_human_atm@male@enter", "enter", 1.0, 1.0, 3000, 0, 1, true, true, true)

            RequestAnimDict("amb@prop_human_atm@male@idle_a")
            while (not HasAnimDictLoaded("amb@prop_human_atm@male@idle_a")) do
                Citizen.Wait(1)
            end
            TaskPlayAnim(PlayerPedId(), "amb@prop_human_atm@male@idle_a", "idle_c", 1.0, -1.0, -1, 0, 1, true, true, true)
            ClearPedTasks(PlayerPedId())
        end
    end
end

exports('addtransaction', function(src, value, payment)
    TriggerServerEvent('codem-bank:server:addTransaction', src, value, payment)
end)
