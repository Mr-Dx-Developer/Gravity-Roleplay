-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(441.67, -975.05, 35.06),
    },
    ['ambulance'] = {
        vector3(329.55, -601.72, 43.15),
    },
    
    ['realestate'] = {
        vector3(-716.17, 261.29, 83.34),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-35.18, -1669.67, 29.48),
    },
    ['mechanic'] = {
        vector3(-339.53, -156.44, 44.59),
    },
    ['cookies'] = {
        vector3(-934.1, -1168.34, 5.11),
    },
    ['bestbuds'] = {
        vector3(374.27, -823.49, 29.3),
    },    
    ['catcafe'] = {
        vector3(-578.37, -1065.71, 26.61),
    },
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(441.67, -975.05, 35.06), length = 2.0, width = 2.0, heading = 0, minZ = 31.86, maxZ = 35.86 },
    },
    
    ['ambulance'] = {
        { coords = vector3(329.55, -601.72, 43.15), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    },
    
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-35.18, -1669.67, 29.48), length = 2.2, width = 2.0, heading = 140.0, minZ = 26.28, maxZ = 30.28 },
    },
    ['mechanic'] = {
        { coords = vector3(-339.53, -156.44, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    },
    ['catcafe'] = {
        { coords = vector3(-578.37, -1065.71, 26.61), length = 0.35, width = 0.45, heading = 0.0, minZ = 25.61, maxZ = 29.61 }, -- DONE
    },
}    

Config.GangMenus = {
     ['alcapone'] = {
        vector3(-1529.14, 149.61, 61.28),
     },
     ['yakuza'] = {
         vector3(-1877.59, 2059.48, 145.57),
     },
}

Config.GangMenuZones = {
     ['alcapone'] = {
         { coords = vector3(-1529.14, 149.61, 61.28), length = 1.0, width = 1.0, heading = 45.0, minZ = 58.0, maxZ = 63.0 },
     },
     ['yakuza'] = {
         { coords = vector3(-1877.59, 2059.48, 145.57), length = 1.0, width = 1.0, heading = 1.0, minZ = 142.97, maxZ = 146.97 },
     },
    -- ['families'] = {
    --     { coords = vector3(-138.12, -1608.25, 35.03), length = 2.0, width = 2.0, heading = 340.0, minZ = 32.23, maxZ = 36.23 },
    -- },
    -- ['lostmc'] = {
    --     { coords = vector3(917.79, 3577.56, 29.92), length = 5.0, width = 1.0, heading = 0.0, minZ = 26.32, maxZ = 30.32 },
    -- },
    -- ['marabunta'] = {
    --     { coords = vector3(1440.01, -1489.83, 66.62), length = 2.0, width = 2.0, heading = 160.0, minZ = 64.02, maxZ = 68.02 },
    -- },
    -- ['bloods'] = {
    --     { coords = vector3(-1566.25, -409.02, 51.49), length = 1.5, width = 1.5, heading = 320.0, minZ = 46.69, maxZ = 53.69 },
    -- },
}
