if Shared.Inventory == 'ox' then
    function Airdrop:ConvertOXStash(stash)
        local newstash = {}
        for k, v in pairs(stash) do
            newstash[#newstash+1] = {v.item, v.count, v.info}
        end
        return newstash
    end

    function Airdrop:GetOXItemInfo(reward)
        local items = exports[Shared.Resource.inventory]:Items()
        local slot = 0
        local weight = 0
        for _, v in pairs(reward) do
            if v.item:sub(0, 7) == 'weapon_' then
                v.item = v.item:upper()
            end
            weight = weight + (items[v.item].weight * v.count)
            slot = slot + 1
        end

        return slot, weight
    end

    function Airdrop:CreateOxStash(id, reward)
        local slot, weight = self:GetOXItemInfo(reward)
        local mystash = exports[Shared.Resource.inventory]:CreateTemporaryStash({
            label = id,
            slots = slot,
            maxWeight = weight,
            items = self:ConvertOXStash(reward)
        })
        return mystash
    end
end