CreateThread(function()
    if isBridgeLoaded('Inventory', Inventories.NONE) or isBridgeLoaded('Inventory', Inventories.AUTO_DETECT) then
        dbg.debugInventory('Inventory part running in standalone: %s')

        --- Check if player has specific item in his inventory
        --- @param client number - The player's server identifier
        --- @param itemName string  - The name of the item
        --- @param amount number - The amount of them item which player should have in his inventory
        --- @return boolean boolean - If player has specific item or not
        Inventory.hasItem = function(client, itemName, amount)
            return true
        end

        --- Add item to player's inventory
        --- @param client number - The player's server identifier
        --- @param itemName string - The name of the item
        --- @param amount number - The amount of the item which player will receive
        --- @param metadata table - Metadata for this item
        --- @return boolean boolean - The state of the action
        Inventory.addItem = function(client, itemName, amount, metadata)
            return false
        end

        --- Remove item from player's inventory
        --- @param client number - The player's server identifier
        --- @param itemName string - The name of the item
        --- @param amount number - The amount of the item which player will receive
        --- @param metadata table - Metadata for this item
        --- @return boolean boolean - The state of the action
        Inventory.removeItem = function(client, itemName, amount, metadata)
            return false
        end

        --- Register specific item to be useable
        --- @param name string - The name of the item
        --- @param client number - The player's server identifier
        --- @param item string - The item itself
        --- @param cb any - The callback function
        Inventory.registerUsableItem = function(name, client, item, cb)
            cb(client, name, item)
        end


        --- Clear player items in his inventory
        --- @param client number - The player's server identifier
        --- @return boolean boolean - The state of the action
        Inventory.clearInventory = function(client)
            return false
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
    end
end)
