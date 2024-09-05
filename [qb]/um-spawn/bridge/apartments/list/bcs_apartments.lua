if not um.property.apartments.status then return end

if um.property.apartments.script ~= 'bcs' then return end

Debug('bcs_housing for apartments list ready', 'debug')

-- Still need to implement this

-- function GetStarterApartment()
--     local apts
--     if IsDuplicityVersion() then
--         apts = exports.bcs_housing:GetStarterApartment()
--     else
--         apts = lib.callback.await('apartments:GetStarterApartment', false)
--     end
--     local list = {}
--     for homeId, v in pairs(apts) do
--         local home = exports.bcs_housing:GetHome(homeId)
--         list[homeId] = {
--             type = homeId,
--             coords = vec4(v.enter.x, v.enter.y, v.enter.z, v.enter.w),
--             text = v.label,
--             image = './properties/SouthRockfordDrive.png',
--             features = {
--                 beds = '2 bd',
--                 bath = '2 ba',
--                 sqft = '2,300 sqft'
--             },
--             desc =
--             'An upscale dwelling featuring modern amenities and a desirable location, ideal for professionals and city enthusiasts.',
--             star = 4,
--             tag = "rent"
--         }
--     end
--     return list
-- end

-- UM_apartments = GetStarterApartment()
