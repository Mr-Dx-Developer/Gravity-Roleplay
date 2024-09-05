if not um.property.apartments.status then return end

if um.property.apartments.script ~= 'bcs' then return end

Debug('bcs_housing for apartments', 'debug')

-- Still need to implement this

-- lib.callback.register('getApartments', function(source)
--     local citizenid = GetCitizenID(GetPlayer(source))
--     local apartments = exports.bcs_housing:GetOwnedHomeKeys(citizenid, 'Apartment')

--     local found = apartments[1] ~= nil
--     Debug(found and 'Apartments: Found Apartments' or 'Apartments: Not Found')

--     return found and apartments or false
-- end)
