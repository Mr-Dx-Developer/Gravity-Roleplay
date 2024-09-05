CreateThread(function()
    if isBridgeLoaded('Framework', Framework.NDCore) then
        function Framework.getIdentifier(client)
            local player = Framework.getPlayer(client)
    
            if not player then
                return nil
            end
    
            local identifiers = player.identifiers
    
            if not identifiers then
                return nil
            end
    
            return identifiers['discord'] or identifiers['license'] or identifiers['license2'] 
        end
    
        function Framework.getJob(client)
            local player = Framework.getPlayer(client)
            local retval =  {
                name = 'unemployed',
                label = 'Unemployed'
            }

            if player then
                if Ace.Can(client, Permissions.CAN_USE_JOB_COMMANDS) then
                    retval =  {
                        name = 'police',
                        label = 'Police'
                    }
                end
            end
    
            return retval
        end
    
            
        function Framework.getPlayer(client)
            return NDCore.getPlayer(client) or {}
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
    
            local firstname = player.firstname
            local lastname = player.lastname
    
            local shortName = firstname or lastname
    
            return shortName
        end
    
    
        function Framework.getCharacterName(client)
            local player = Framework.getPlayer(client)
    
            if not player then
                return 'Unknown'
            end
    
            if player.firstname == nil or player.lastname == nil then
                return 'Unknown'
            end
    
            local name = ('%s %s'):format(player.firstname or 'Unknown', player.lastname or 'Unknown')
    
            return name or GetPlayerName(client)
        end
    
        function Framework.sendNotification(client, message, type)
            TriggerClientEvent('chat:addMessage', client, {
                multiline = true,
                args = { message }
            })
        end
    
        function Framework.isAdmin(client)
            local retval = false

            if Ace.Can(client, Permissions.HAS_SERVER_GROUP) then
                retval = true
            end
    
            return retval
        end
    
        function Framework.getMoney(client)
            local player = Framework.getPlayer(client)
    
            if not player then
                return 0
            end
    
            return player.cash or 0
        end
    
    
        function Framework.addMoney(client, amount)
            local player = Framework.getPlayer(client)
    
            if not player then
                return 0
            end
    
            return player.addMoney("cash", amount, 'prison - addMoney')
        end
    
        function Framework.removeMoney(client, amount)
            local player = Framework.getPlayer(client)
    
            if not player then
                return 0
            end
    
            return player.deductMoney("cash", amount, 'prison - deductMoney')
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
            dbg.debug('This feature is not defined for NDCore, will not work!')
        end

        RegisterNetEvent('rcore_prison:bridge:standalonePlayerActivated', function()
            local client = source
            TriggerEvent('rcore_prison:server:playerLoaded', client)
        end)
    
        AddEventHandler("ND:characterUnloaded", function(source, character)
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)

        AddEventHandler('playerDropped', function()
            local playerId = source
        
            if playerId then
                TriggerEvent('rcore_prison:server:playerUnloaded', playerId)
            end
        end)
    end
end)