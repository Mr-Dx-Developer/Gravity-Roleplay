CreateThread(function()
    if isBridgeLoaded('Framework', Framework.Standalone) then
        function Framework.getIdentifier(client)
            local license = GetPlayerIdentifierByType(client, 'license')
    
            return license
        end
    
        function Framework.getJob(client)
            local retval =  {
                name = 'unemployed',
                label = 'Unemployed'
            }

            if Ace.Can(client, Permissions.CAN_USE_JOB_COMMANDS) then
                retval =  {
                    name = 'police',
                    label = 'Police'
                }
            end
    
            return retval
        end
    
                    
        function Framework.getPlayer(client)
            return nil
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
    
        function Framework.getCharacterName(client)
            return GetPlayerName(client)
        end

        function Framework.isAdmin(client)
            local retval = false

            if Ace.Can(client, Permissions.HAS_SERVER_GROUP) then
                retval = true
            end
    
            return retval
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
            dbg.debug('This feature is not defined for Standalone, will not work!')
        end
    
        RegisterNetEvent('rcore_prison:bridge:standalonePlayerActivated', function()
            local client = source
            TriggerEvent('rcore_prison:server:playerLoaded', client)
        end)
    
        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)
    end    
end)