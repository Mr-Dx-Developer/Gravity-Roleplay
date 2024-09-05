CreateThread(function()
    if isBridgeLoaded('Framework', Framework.QBOX) then
        local QBox = nil
    
        local success = pcall(function()
            QBox = exports['qb-core']:GetCoreObject()
        end)

        Framework.object = QBox

        function Framework.getPlayer(client)
            if not client then
                return nil
            end

            return exports.qbx_core:GetPlayer(client)
        end

        function Framework.getPlayerCuffState(client)
            local player = Framework.getPlayer(client)

            if not player then
                return false
            end

            local retval = false
            
            if player.PlayerData.metadata['ishandcuffed'] then
                retval = player.PlayerData.metadata['ishandcuffed']
            end

            return retval
        end

        function Framework.getMoney(client)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            return player.Functions.GetMoney("cash")
        end


        function Framework.addMoney(client, amount)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            return player.Functions.AddMoney("cash", amount)
        end

        function Framework.removeMoney(client, amount)
            local player = Framework.getPlayer(client)

            if not player then
                return 0
            end

            player.Functions.RemoveMoney("cash", amount)
        end

        function Framework.canPerformJobCommand(client, commandName)
            local job = Framework.getJob(client)
            
            if job == nil then return false end
    
            local jobName = job.name
    
            if jobName == nil then return false end

            if Config.Jobs[jobName] then
                return true
            end
            
            return false
        end
    
        function Framework.getCharacterShortName(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            local firstname = player.PlayerData.charinfo.firstname
            local lastname = player.PlayerData.charinfo.lastname
    
            local shortName = firstname or lastname
    
            return shortName
        end
    
        function Framework.getIdentifier(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end


            return tostring(player.PlayerData.citizenid)
        end
    
        function Framework.getJob(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            return {
                name = player.PlayerData.job.name,
                gradeName = player.PlayerData.job.grade.name,
                grade = player.PlayerData.job.grade.level,
                onDuty = player.PlayerData.job.onduty,
                isBoss = player.PlayerData.job.isboss
            }
        end
    
        function Framework.getCharacterName(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            local firstname = player.PlayerData.charinfo.firstname
            local lastname = player.PlayerData.charinfo.lastname
    
            return string.format('%s %s', firstname, lastname)
        end
    
        function Framework.sendNotification(client, message, type)
            TriggerClientEvent('QBCore:Notify', tonumber(client), message, type, 5000)
        end
    
        function Framework.isAdmin(client)
            for _, adminGroup in ipairs(Config.FrameworkAdminGroups[Bridge.Framework]) do
                if QBox.Functions.HasPermission(client, adminGroup) then
                    return true
                end
            end
    
            return false
        end

        function Framework.removeJailMetaData(client)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end
                   
            player.Functions.SetMetaData('injail', nil)
            player.Functions.SetMetaData('criminalrecord', {})
        end

        function Framework.applyJailMetaData(client, jailTime)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            local currentDate = os.date('*t')

            if currentDate.day == 31 then
                currentDate.day = 30
            end
        
            player.Functions.SetMetaData('injail', jailTime)
            player.Functions.SetMetaData('criminalrecord', {
                ['hasRecord'] = true,
                ['date'] = currentDate
            })
        end

        function Framework.getOfficers()
            local players = GetPlayers()
            local officers = {}
 
            for playerId, v in pairs(players) do
                local job = Framework.getJob(playerId)

                if not job then
                    return
                end

                local jobName = job.name

                if Config.Jobs[jobName] then
                    officers[#officers + 1] = playerId
                end
            end

            return officers
        end

        function Framework.setJob(client, jobName)
            local player = Framework.getPlayer(client)

            if not player then
                return nil
            end

            if not jobName then
                jobName = 'unemployed'
            end

            player.Functions.SetJob(jobName)

            dbg.debug("Framework.setJob: Setting citizen %s (%s) to job named: %s", GetPlayerName(client), client, jobName)
        end

        --- @return boolean
        function Framework.clearInventory(client)
            local player = Framework.getPlayer(client)

            if player == nil then 
                return nil 
            end

            local p = promise.new()
            local clearMain, clearMainErr = pcall(function()
                return player.Functions.ClearInventory(Inventory.KeepSessionItems)
            end)
            
            local state = false

            if clearMain then
                state = true
                p:resolve(state)
            else
                local backClear, backClearErr = pcall(player.Functions.SetPlayerData, "items", {})

                if backClear then
                    state = true
                    p:resolve(state)
                else
                    p:resolve(state)
                end
            end

            dbg.debugInventory("Framework.clearInventory: For citizen %s (%s) with state: %s", GetPlayerName(client), client, state)

            Citizen.Await(p)

            return state
        end
            
        RegisterNetEvent('QBCore:Server:OnPlayerLoaded', function()
            local client = source
 
            if client then
                local playerJob = Framework.getJob(client)

                if playerJob then
                    SetTimeout(1000, function()
                        TriggerClientEvent('rcore_prison:client:playerLoaded', client, playerJob)
                    end)
                end
            end

            TriggerEvent('rcore_prison:server:playerLoaded', client)
        end)
    

        AddEventHandler('QBCore:Server:OnPlayerUnload', function(playerId)
            TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)

        Inventory.CheckItemExistList(PRISON_ITEMS)
    end    
end)