if not um.property.houses.status then return end

if um.property.houses.script ~= 'qbx' and um.property.houses.script ~= 'qb' and um.property.houses.script ~= 'qs' then return end

Debug('qb | qbx | qs ready for house', 'debug')

lib.callback.register('getHouses', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local houses = MySQL.query.await('SELECT * FROM player_houses WHERE citizenid = ?', { citizenid })

    local found = houses[1] ~= nil
    Debug(found and 'Houses: Found Houses' or 'Houses: Not Found')

    return found and houses or false
end)
