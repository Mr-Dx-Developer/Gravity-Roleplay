ESX_ITEMS_DEPLOY = {
    {
        name = 'sprunk',
        label = 'Sprunk',
        weight = 100,
    },
    {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 250,
    },
    {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 100,
    },
    {
        name = 'ecola',
        label = 'Ecola',
        weight = 100,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 100,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 100,
    },
    {
        name = 'water',
        label = 'Water',
        weight = 100,
    },
    {
        name = 'fries',
        label = 'Fries',
        weight = 100,
    },
    {
        name = 'pizza_ham',
        label = 'Pizza Ham',
        weight = 100,
    },
    {
        name = 'chips',
        label = 'Chips',
        weight = 100,
    },
    {
        name = 'donut',
        label = 'Donut',
        weight = 100,
    },
    {
        name = 'wire_cutter',
        label = 'Wire cutter',
        weight = 100,
    },
    {
        name = 'cigarrete',
        label = 'Cigarrete',
        weight = 100,
    },
}

CreateThread(function()
    if (isBridgeLoaded('Framework', Framework.ESX)) then
        if resourceList['Inventory'] then
            return dbg.debug('ESX-INV: Found already loaded inventory named: %s', Bridge.Inventory)
        end



        Inventory.getInventoryItems = function(client)
            local player = Framework.getPlayer(client)

            if not player then
                return {}
            end

            local p = promise.new()
            local items = player.inventory
            local loadout = player.getLoadout(false)

            local playerInventory = {}

            if items and next(items) then
                local size = table.size(items)
                local iterateCount = 0

                for k, v in pairs(items) do
                    iterateCount = iterateCount + 1

                    if v.count > 0 then
                        playerInventory[#playerInventory + 1] = {
                            name = v.name,
                            count = v.count,
                            label = v.label,
                            weight = v.weight,
                            useable = v.useable,
                            rare = v.rare,
                        }
                    end

                    if size >= iterateCount then
                        p:resolve(true)
                    end
                end
            else
                p:resolve(false)
            end

            Citizen.Await(p)

            if loadout and next(loadout) then
                playerInventory = table.merge(playerInventory, loadout)
            end

            return playerInventory
        end

        Inventory.addMultipleItems = function(client, items)
            if not client then
                return
            end

            if not items then
                return
            end

            local p = promise.new()

            if next(items) then
                for i = 1, #items, 1 do
                    local item = items[i]

                    if item and next(item) then
                        Inventory.addItem(client, item.name, item.count, item.metadata)
                    end

                    if i >= #items then
                        p:resolve(true)
                    end
                end
            else
                p:resolve(false)
            end

            return Citizen.Await(p)
        end


        Inventory.hasItem = function(client, item, amount)
            local player = Framework.getPlayer(client)

            if player == nil then
                return false
            end

            local itemExistState = Inventory.DoesItemExist(item, client)

            if not itemExistState then
                return false
            end

            local state, error_message = pcall(function()
                if player.inventory then
                    local playerInventory = player.getInventoryItem(item)

                    if playerInventory.count > 0 then
                        return true
                    else
                        return false
                    end
                else
                    return false
                end
            end)

            return state
        end

        Inventory.addItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then
                return false
            end

            if item == 'cash' or item == 'money' then
                return player.addMoney(amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                return player.addWeapon(item:lower(), math.random(30, 120))
            end

            player.addInventoryItem(item, amount)
        end

        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then
                return false
            end

            if item == 'cash' or item == 'money' then
                return player.removeMoney(amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                return player.removeWeapon(item:lower(), math.random(30, 120))
            end

            player.removeInventoryItem(item, amount)
        end

        Inventory.registerUsableItem = function(item, cb)
            Framework.object.RegisterUsableItem(item, cb)
        end

        AssetDeployer:registerDeploy('items', Framework.ESX, function(data)
            for _, item in ipairs(data) do
                MySQL.Sync.execute(
                'INSERT IGNORE INTO items (name, label, weight, rare, can_remove) VALUES (?, ?, ?, 0, 1)', {
                    item.name,
                    item.label,
                    item.weight
                })
            end

            return true
        end, ESX_ITEMS_DEPLOY)
    end
end)
