EventLimiterService.RegisterNetEvent('rcore_prison:server:requestStashedItems', 0, 1, function(playerId, state, zoneId)
    if state then
        dbg.debug('Player named %s requested their stashed items', GetPlayerName(playerId))
    
        local charId = Framework.getIdentifier(playerId)

        if not charId then
            return
        end

        local stashItems = db.FetchStashItems(charId)

        if not stashItems then
            return
        end

        local items = stashItems and type(stashItems) == 'string' and json.decode(stashItems)
        local stashedVirtualMoney = Inventory.GetStashedVirtualMoney(charId)

        if stashedVirtualMoney and stashedVirtualMoney > 0 and not (items and next(items)) then
            Inventory.ReturnVirtualMoney(playerId, charId)
        elseif items and next(items) then
            local state = Inventory.addMultipleItems(playerId, items)

            if state then
                db.RemoveStashItems(charId)
                Framework.sendNotification(playerId, _U('STASH.ITEMS_RETURNED'), 'success') 
                Inventory.ReturnVirtualMoney(playerId, charId)
            end
        else
            dbg.debug('Player named %s does not have any stashed items', GetPlayerName(playerId))
            Framework.sendNotification(playerId, _U('STASH.YOU_DONT_HAVE_STASHED_ITEMS'), 'error')
        end
    end
end)







