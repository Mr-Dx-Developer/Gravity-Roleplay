if not um.property.apartments.status then return end

if um.property.apartments.script ~= 'qbx_properties' then return end

Debug('qbx_properties for apartments', 'debug')

lib.callback.register('getApartments', function(source)
    local citizenid = GetCitizenID(GetPlayer(source))
    local apartments = MySQL.single.await('SELECT id, property_name, coords FROM properties WHERE owner = ?',
        { citizenid })
    local found = apartments ~= nil
    Debug(found and 'Apartments: Found Apartments' or 'Apartments: Not Found')

    return found and apartments or false
end)
