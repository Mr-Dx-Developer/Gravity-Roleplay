---------------------------
----rainmad scripts--------
---------------------------

local function ArtGalleryRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "artgalleryrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('artgalleryrobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('ArtGalleryRobbery', ArtGalleryRobbery)

local function HumaneRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "humanelabsrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('humanerobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('HumaneRobbery', HumaneRobbery)

local function TrainRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "trainrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('trainrobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('TrainRobbery', TrainRobbery)

local function VanRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "vanrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('vanrobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('VanRobbery', VanRobbery)

local function UndergroundRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "undergroundrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('underground'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('UndergroundRobbery', UndergroundRobbery)

local function DrugBoatRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "drugboatrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('drugboatrobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('DrugBoatRobbery', DrugBoatRobbery)

local function UnionRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "unionrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('unionrobbery'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('UnionRobbery', UnionRobbery)

local function CarBoosting(vehicle)
    local vehdata = vehicleData(vehicle)
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "carboosting", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-50",
        firstStreet = locationInfo,
        gender = gender,
        model = vehdata.name,
        plate = vehdata.plate,
        priority = 2,
        firstColor = vehdata.colour,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = _U('carboosting'), -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('CarBoosting', CarBoosting)

---------------------------
---- ps-signrobbery -------
---------------------------

local function SignRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "signrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-35",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = 'Sign Robbery Committed', -- message
        job = {"LEO", "police"} -- type or jobs that will get the alerts
    })
end exports('SignRobbery', SignRobbery)


local function Oxy()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "oxyruns", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-31",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = ('Drug Activity'), -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('Oxy', Oxy)

local function MethRuns()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "methruns", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-31",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = ('Suspicious Drug Activity'), -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('MethRuns', MethRuns)

local function BankTruckRobbery()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local gender = GetPedGender()
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "banktruckrobbery", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "10-90",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        dispatchMessage = ('Fleeca Truck Robbery'), -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('BankTruckRobbery', BankTruckRobbery)

local function IllegalHunting()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 2, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'Hello someone just killed a protected animal.. hurry',
        dispatchMessage = "Incoming Call", -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('IllegalHunting', IllegalHunting)

local function BigFoot()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall2", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'Hello someone just killed a person in a bigfoot outfit.. hurry',
        dispatchMessage = "Incoming Call", -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('BigFoot', BigFoot)

local function BodyLooting()
    local currentPos = GetEntityCoords(PlayerPedId())
    local locationInfo = getStreetandZone(currentPos)
    local sex = {
        'male',
        'female'
    }
    local gender = sex[math.random(#sex)]
    TriggerServerEvent("dispatch:server:notify",{
        dispatchcodename = "anoncall3", -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
        dispatchCode = "911",
        firstStreet = locationInfo,
        gender = gender,
        model = nil,
        plate = nil,
        priority = 1, -- priority
        firstColor = nil,
        automaticGunfire = false,
        origin = {
            x = currentPos.x,
            y = currentPos.y,
            z = currentPos.z
        },
        information = 'There is someone disecting a body..',
        dispatchMessage = "Incoming Call", -- message
        job = {"LEO", "police"} -- jobs that will get the alerts
    })
end exports('BodyLooting', BodyLooting)

