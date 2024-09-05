CreateThread(function()
    if isBridgeLoaded('Framework', Framework.ESX) then
        local ESX = nil
    
        local success, result = pcall(function()
            ESX = exports[Framework.ESX]:getSharedObject()
        end)
    
        if not success then
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    
        Framework.object = ESX

        function Framework.getIdentifier(client)
            local player = Framework.getPlayer(client)
            if player == nil then return nil end
    
            return tostring(player.identifier)
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
    
        function Framework.getJob(client)
            local player = Framework.getPlayer(client)
    
            
            if player == nil then return nil end
    
            return {
                name = player.job.name,
                grade = player.job.grade_name,
            }
        end
    
        function Framework.getCharacterShortName(client)
            local player = Framework.getPlayer(client)
    
            if player == nil then return nil end
    
            local firstname = player.get('firstName')
            local lastname = player.get('lastName')
    
            local shortName = firstname or lastname
    
            if shortName == nil then
                shortName = player.firstname or player.lastname
            end
    
            return shortName
        end
    
        function Framework.getCharacterName(client)
            local player = Framework.getPlayer(client)
    
            if player == nil then return nil end
    
            local firstname = player.get('firstName')
            local lastname = player.get('lastName')
    
            if firstname == nil or lastname == nil then
                firstname = player.firstname
                lastname = player.lastname
            end
    
            return string.format('%s %s', firstname, lastname)
        end

            
        function Framework.getPlayer(client)
            local player = ESX.GetPlayerFromId(client)
            if player == nil then return end
    
            return player
        end
    
        function Framework.sendNotification(client, message, type)
            local player = Framework.getPlayer(client)
            if player == nil then return end
    
            player.showNotification(message, type)
        end
    
        function Framework.isAdmin(client)
            local player = Framework.getPlayer(client)
            if player == nil then return false end
    
            local group = player.getGroup()
            for _, adminGroup in ipairs(Config.FrameworkAdminGroups[Bridge.Framework]) do
                if group == adminGroup then
                    return true
                end
            end
    
            return false
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

            player.SetJob(jobName)

            dbg.debug("Framework.setJob: Setting citizen %s (%s) to job named: %s", GetPlayerName(client), client, jobName)
        end

    
        --- @return boolean
        function Framework.clearInventory(client)
            local player = Framework.getPlayer(client)

            if not player then
                return false
            end

            local inventory = player.getInventory()
            local p = promise.new()
            local state = false

            if inventory and next(inventory) then
                local size = table.size(inventory)

                for k, v in pairs(inventory) do
                    if v.count > 0 then
                        if Config.Stash.KeepItemsState and not Inventory.KeepSessionItems[v.name] then
                            local match = string.match(v.name, "^WEAPON_(.*)")

                            if match then
                                player.removeWeapon(v.name)
                            else
                                player.setInventoryItem(v.name, 0)
                            end
                        elseif not Config.Stash.KeepItemsState then
                            local match = string.match(v.name, "^WEAPON_(.*)")

                            if match then
                                player.removeWeapon(v.name)
                            else
                                player.setInventoryItem(v.name, 0)
                            end
                        end
                    end

                    if k >= size then
                        TriggerEvent("esx:playerInventoryCleared", client)
                        TriggerEvent("esx:playerLoadoutCleared", client)
                        p:resolve(true)
                        state = true
                    end
                end
            else
                p:resolve(false)
            end

            Citizen.Await(p)

            return state
        end
    
        AddEventHandler('esx:playerLoaded', function(playerId, player)
            TriggerEvent('rcore_prison:server:playerLoaded', playerId)
        end)
    
        AddEventHandler('esx:playerDropped', function(playerId)
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