local QBCore = exports['qb-core']:GetCoreObject()


local consolemessage =
    [[

    ⚠️🚨 | Extras  | 🚨⚠️
          
    ]]

RegisterCommand('extra', function(source, args, rawCommand)
    local playerData = QBCore.Functions.GetPlayerData()
    local playerJob = playerData.job.name

    if playerJob == "police" then
        -- Get the player's current vehicle
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(PlayerId()))

        -- Check if the player is in a vehicle
        if vehicle ~= 0 then
            -- Loop through all the extra components on the vehicle and enable them
            local numExtras = tonumber(args[1])
            local i = 0
            while i < numExtras do
                if IsVehicleExtraTurnedOn(vehicle, i) == false then
                    SetVehicleExtra(vehicle, i, 0)
                end
                i = i + 1
            end

            -- Notify the player that all extras have been added to the vehicle
            QBCore.Functions.Notify('All extras added to vehicle!', 'success')
            -- TriggerEvent('chatMessage', prefix .. '^1Vehicle Extras ^0All extras added to vehicle!')
        else
            -- Notify the player that they are not in a vehicle
            QBCore.Functions.Notify('You are not in a vehicle!', 'error')
            -- TriggerEvent('chatMessage', prefix .. '^1Vehicle Extras ^0You are not in a vehicle!')
        end
    else
        -- Notify the player that they must have the Police job to use this command
        -- TriggerEvent('chatMessage', prefix .. '^1Vehicle Extras ^0You must have the Police job to use this command!')
        QBCore.Functions.Notify('You must have the Police job to use this command!', 'error')
    end
end)
TriggerEvent('chat:addSuggestion', "/extra [0-12]", "Set Extras", {})
