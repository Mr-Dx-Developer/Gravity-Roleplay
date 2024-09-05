Config = {}
Config.Framework = 'autodetect' -- esx, oldesx, qb, oldqb, autodetect
Config.SQL = "oxmysql" -- oxmysql, ghmattimysql, mysql-async
Config.InteractionHandler = 'drawtext' -- drawtext, ox_target, qb_target, qb_textui, esx_textui, codem_textui (only for the menu)
Config.NpcLocation = {
    coords = vector4(896.37, -177.27, 73.7, 246.3),
    model = `a_m_m_malibu_01`,
    blip = {
      name = 'Taxi Job',
      show = true, -- if you want to disable the blip, set this to false
      sprite = 198, 
      color  = 5,
      scale = 0.8,
    }
}

Config.JobCheck = { -- if enabled only players with the job you have written can access the menu
  enable = false,
  name = 'taxi',
}

Config.CabFee = 10 
Config.Tax = 10


Config.DailyMissions = {
    ["deliver_player"] = {
      header = "Deliver Citizens !",
      label = "Deliver at least 5 citizen in day at any location.",
      max = 5,
      xp = 2500,
    },
    ["deliver_npc"] = {
      header = "Deliver Locals !",
      label = "Deliver at least 30 local citizen in day at any location.",
      max = 30,
      xp = 2500,
    },
    ["deliver_vip"] = {
      header = "Deliver VIP’s !",
      label = "Deliver at least 1 VIP citizen in day at any location.",
      max = 1,
      xp = 2500,
    },
  }
  

Config.TaximeterFare = function (vehicle, currentFare)
    local rpm = GetVehicleCurrentRpm(vehicle)
    currentFare = currentFare + (rpm * 2)
    return currentFare
end

Config.XP = {
}
CreateThread(function()
    for i = 1, 100 do
        table.insert(Config.XP, i * 1000)
    end
end)

Config.PlayerMissionXP = {
    min = 100,
    max = 150,
}

Config.VehicleSpawnLocation = vector4(904.59, -181.15, 74.06, 320.78)

Config.VipMissions = {
    {
        id = 1,
        name = "Mrs. Palmer's VIP Request",
        payment = 450,
        level = 5,
        passangersLabel = '1 Civilian 1 Pet',
        image = 'card_1.png', 
        spawnLocation = vector4(-922.31, 178.64, 67.06, 115.49),
        finishLocation = vector3(-1459.41, -969.68, 7.19),
        ped = `ig_kerrymcintosh_02`,
        ped_2 = `a_c_husky`,
        minxp = 100,
        maxxp = 150,
      },
      {
        id = 2,
        name = "Mr. Washington’s VIP Request",
        payment = 650,
        level = 10,
        passangersLabel = '1 Civilian',
        image = 'card_2.png', 
        spawnLocation = vector4(1529.1, 2231.61, 75.73, 93.09),
        finishLocation = vector3(-319.52, 6071.05, 31.34),
        ped = `cs_nigel`,
        minxp = 200,
        maxxp = 250,
      },
      {
        id = 3,
        name = "Mr. O’Connor’s VIP Request",
        payment = 1000,
        level = 20,
        passangersLabel = '3 Civilian',
        image = 'card_3.png', 
        spawnLocation = vector4(-654.98, 905.38, 227.97, 336.71),
        finishLocation = vector3(-1070.93, -2571.52, 20.08),
        ped = `cs_milton`,
        ped_2 = `csb_reporter`,
        ped_3 = `csb_tomcasino`,
        minxp = 250,
        maxxp = 300,
      },
      {
        id = 4,
        name = "Mrs. Alabama’s VIP Request",
        payment = 2000,
        level = 30,
        passangersLabel = '2 Civilian',
        image = 'card_4.png', 
        spawnLocation = vector4(-108.34, -607.39, 36.27, 252.74),
        finishLocation = vector3(922.79, 48.75, 81.11),
        ped = `u_f_o_moviestar`,
        ped_2 = `u_f_y_spyactress`,
        minxp = 300,
        maxxp = 350,
      },
      {
        id = 5,
        name = "Mr. Pearl’s VIP Request",
        payment = 4000,
        level = 50,
        passangersLabel = '1 Civilian',
        image = 'card_5.png', 
        spawnLocation = vector4(-1102.03, 365.39, 68.75, 309.74),
        finishLocation = vector3(3513.11, 3762.61, 29.93),
        ped = `u_m_m_bankman`,
        minxp = 350,
        maxxp = 400,
      },
      {
        id = 6,
        name = "Mrs. Tomris VIP Request",
        payment = 6000,
        level = 60,
        passangersLabel = '1 Civilian',
        image = 'card_6.png', 
        spawnLocation = vector4(-1284.26, 296.85, 64.94, 153.16),
        finishLocation = vector3(-1199.61, -1534.45, 4.41),
        ped = `a_f_m_beach_01`,
        minxp = 400,
        maxxp = 450,
      },
}

Config.Missions = {
    {
        bg = 'mission-1.png',
        header = 'Dowtown Cab Area',
        minPayment = 10,
        maxPayment = 150,
        minXP = 100,
        maxXP = 150,
        level = 1,
        npcSpawnLocations = {
            vector4(587.832, 72.2097, 93.7427,165.71),
            vector4(413.858, -307.93, 50.7339,320.39),
            vector4(159.444, -599.42, 43.7307,346.76),
            vector4(25.8853, -743.88, 44.1795,253.45),
            vector4(-243.31, -888.26, 30.3968,341.31),
            vector4(-569.39, -670.47, 33.1482,347.98),
            vector4(-594.03, -331.16, 34.9108,31.33),
            vector4(-516.21, -73.059, 39.9870,155.4),
            vector4(-436.00, 136.259, 64.8133,180.64),
        },
        finishLocations = {
            vector3(-117.02, 100.258, 72.0329),
            vector3(110.060, 215.840, 107.607),
            vector3(158.702, -26.377, 67.8214),
            vector3(314.622, -869.34, 29.2916),
            vector3(-211.43, -1409.3, 31.2847),
            vector3(-606.01, -1242.6, 12.6118),
            vector3(-1455.3, -72.951, 51.6612),
            vector3(-958.21, 273.472, 69.5823),
            vector3(561.326, 81.0092, 95.6172),
        },
      },
      {
        bg = 'mission-2.png',
        header = 'Sandy Shores Cab Area',
        minPayment = 150,
        maxPayment = 1500,
        minXP = 450,
        maxXP = 2500,
        level = 20,
        npcSpawnLocations = {
            vector4(-1631.5, -278.71, 52.3948,255.07),
            vector4(-1668.1, -586.96, 33.6712,328.62),
            vector4(-1155.4, -698.79, 21.6686,306.59),
            vector4(-852.88, -689.33, 27.7631,79.49),
            vector4(-941.57, -443.85, 37.7032,1347.89),
            vector4(1955.30, 3792.05, 32.3326,187.82),
            vector4(2024.81, 3753.47, 32.1753,33.23),
            vector4(1879.06, 3687.48, 33.4129,212.43),
            vector4(1695.80, 3578.24, 35.5056,201.28),
            vector4(1375.89, 3584.27, 34.8926,215.47),  

        },
        finishLocations = {
            vector3(1662.48, 3557.50, 35.4562),
            vector3(1709.09, 3748.47, 33.8176),
            vector3(1736.89, 3842.03, 34.7609),
            vector3(1873.86, 3894.77, 33.0433),
            vector3(1932.81, 3749.01, 32.2705),
            vector3(1375.81, -1761.8, 64.8168),
            vector3(1022.53, -1751.3, 35.4894),
            vector3(765.927, -1985.9, 29.2849),
            vector3(230.773, -1801.6, 27.8289),
            vector3(119.907, -1457.4, 29.2944),
        },
      },
      {
        bg = 'mission-3.png',
        header = 'Paleto Bay Cab Area',
        minPayment = 350,
        maxPayment = 3500,
        minXP = 750,
        maxXP = 3500,
        level = 40,
        npcSpawnLocations = {
            vector4(904.148, 62.5465, 79.0399,49.09),
            vector4(-1297.4, -482.46, 33.1162,185.47),
            vector4(82.9346, -1670.9, 29.0593,73.82),
            vector4(-639.31, -307.98, 35.0286,124.27),
            vector4(-140.34, 265.428, 95.0592,151.02),
            vector4(-309.59, 6348.84, 30.3592,44.76),
            vector4(-33.428, 6628.50, 30.3910,217.11),
            vector4(216.929, 6574.90, 32.0208,190.88),
            vector4(-7.0644, 6349.39, 31.3848,46.04),
            vector4(-73.089, 6319.80, 31.3384,254.37),          
        },
        finishLocations = {
            vector3(-126.28, 6549.11, 29.4287),
            vector3(-230.01, 6166.27, 31.3130),
            vector3(-416.82, 6258.83, 30.3966),
            vector3(-405.56, 6042.10, 31.3261),
            vector3(-355.14, 6323.73, 29.8197),
            vector3(-3.5902, 471.574, 145.710),
            vector3(-202.54, 414.127, 109.691),
            vector3(-482.39, 261.969, 83.0186),
            vector3(-495.44, 137.726, 63.6187),
            vector3(-760.72, -35.328, 37.8318),
        },
      },
}

Config.Vehicles = {
    {
        label = 'DT Cab Normal',
        image = 'vehicle-1.png',
        level = 1,
        spawnCode = 'taxi',
      },
      {
        label = 'DT Cab Luxury',
        image = 'vehicle-2.png',
        level = 10,
        spawnCode = 'taxi',

      },
      {
        label = 'DT Cab Limo',
        image = 'vehicle-3.png',
        level = 30,
        spawnCode = 'stretch',

    },
}

Config.NpcModels = {
    ---https://wiki.rage.mp/index.php?title=Peds
    --Random NPC
    0xF0EC56E2,
    0x6D1E15F7,
    0x0703F106,
    0x26C3D079,
    0x68709618,
    0xABEF0004,
    0xE5A11106,
    0x303638A7,
    0xD1FEB884,
    0xA039335F,
    0xFA389D4F,
    0x8B7D3766,
    0xAD9EF1BB,
}

Config.FuelSystem = "LegacyFuel"                      -- LegacyFuel / x-fuel

Config.SetVehicleFuel = function(vehicle, fuel_level) -- you can change LegacyFuel export if you use another fuel system
    if Config.FuelSystem == 'LegacyFuel' then
        return exports["LegacyFuel"]:SetFuel(vehicle, fuel_level)
    elseif Config.FuelSystem == 'x-fuel' then
        return exports["x-fuel"]:SetFuel(vehicle, fuel_level)
    else
        return SetVehicleFuelLevel(vehicle, fuel_level + 0.0)
    end
end


Config.Vehiclekey          = true
Config.VehicleSystem       = "qb-vehiclekeys"       -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys
Config.Removekeys          = true
Config.RemoveVehicleSystem = "qb-vehiclekeys"       -- cd_garage / qs-vehiclekeys / wasabi-carlock / qb-vehiclekeys

Config.GiveVehicleKey      = function(plate, model) -- you can change vehiclekeys export if you use another vehicle key system
    if Config.Vehiclekey then
        if Config.VehicleSystem == 'cd_garage' then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleSystem == 'qs-vehiclekeys' then
            exports['qs-vehiclekeys']:GiveKeys(plate, model)
        elseif Config.VehicleSystem == 'wasabi-carlock' then
            exports.wasabi_carlock:GiveKey(plate)
        elseif Config.VehicleSystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        end
    end
end
Config.RemoveVehiclekey = function(plate, model)
    if Config.Removekeys then
        if Config.RemoveVehicleSystem == 'cd_garage' then
            TriggerServerEvent('cd_garage:RemovePersistentVehicles', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.RemoveVehicleSystem == 'qs-vehiclekeys' then
            exports['qs-vehiclekeys']:RemoveKeys(plate, model)
        elseif Config.RemoveVehicleSystem == 'wasabi-carlock' then
            exports.wasabi_carlock:RemoveKey(plate)
        elseif Config.RemoveVehicleSystem == 'qb-vehiclekeys' then
            TriggerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        end
    end
end

Config.Notify = function(text)
    TriggerEvent("codem-taxijob:Notify", text)
end

Config.ServerNotify = function(src, text)
    TriggerClientEvent('codem-taxijob:Notify', src, text)
end