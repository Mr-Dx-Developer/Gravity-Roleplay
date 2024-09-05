--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.NewESX = true
Config.Framework = "auto-detect" -- Framework | types: auto-detect, qbcore, ESX, standalone
Config.Target = "auto-detect" -- Target | types: auto-detect, qb-target, qtarget, ox_target
Config.BossMenu = "auto-detect" -- BossMenu | types: auto-detect, esx_society, qb-management
Config.NotificationType = "ox_lib" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib" -- ProgressBar | types: progressBars, ox_lib, qbcore
Config.Clothing = "auto-detect" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance, illenium-appearance
Config.Context = "ox_lib" -- Context | types: ox_lib, qbcore
Config.Input = "ox_lib" -- Input | types: ox_lib, qb-input
Config.TextUI = "ox_lib" -- TextUIs | types: esx, ox_lib, luke
--PLAYER SETTINGS
Config.JobName = "unicorn" -- Job name for Unicorn
Config.BossGrade = 4 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = true -- Required to clean hands to make drinks etc.

--dispatch
Config.PoliceJobs = { 'police', 'sheriff' } -- For Alert
Config.Dispatch = { enabled = true, script = "ps-disptach" } -- cd_dispatch, linden_outlawalert, ps-disptach

Config.Inventory = "quasar" -- ox, quasar, chezza, qb

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = true -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.NudityStrippers = false

Config.DisableDefaultMusic = true

Config.ThrowMoney = 500

Config.ThrowMoneyToSociety = true

Config.Hookers = {
    Cooldown = 600000, -- 10-minutes
    MoneyToSociety = true,
    BlowjobPrice  = 500,
    SexPrice = 500,
    girls = {
        {
            name = "Cathrine",
            model = `s_f_y_hooker_01`,
            price = 200,
        },
        {
            name = "Tatiana",
            model = `s_f_y_hooker_02`,
            price = 200,
        },
        {
            name = "Bootylicious",
            model = `s_f_y_hooker_03`,
            price = 200,
        },
        {
            name = "Vannesa",
            model = `s_f_y_hooker_02`,
            price = 200,
        }
    },
    pickuplocation = {
        vec4(-1409.76, -565.35, 29.33, 209.8),
        vec4(-1262.67, -628.37, 26.04, 30.42),
        vec4(-362.08, 5.81, 46.01, 158.13),
        vec4(179.15, 186.88, 104.58, 349.8),
        vec4(277.25, 327.78, 104.62, 0),
        vec4(-474.61, 236.48, 82.03, 0),
        vec4(835.6, -97.5, 79.59, 0),
        vec4(1090.75, -765.9, 56.8, 38.62),
        vec4(202.31, -1568.22, 28.27, 265.66),
        vec4(33.58, -1378.87, 28.33, 71.65),
        vec4(-664.14, -1239.42, 9.61, 167.42),
        vec4(-1050.98, -1262.53, 5.23, 245.93),
        vec4(-1621.65, -592.11, 32.32, 201.48),
        vec4(167.87, -425.56, 40.06, 123.11),
        vec4(175.52, -1797.21, 28.04, 20.06),
        vec4(848.29, -1703.04, 28.3, 158.68),
        vec4(-128.95, 68.84, 70.1, 27.38),
    },
    Header = "Pimp",
    --Location = vec4(120.761, -1328.953, 28.365, 36.762),
    Location = vec4(0.0, 0.0, 0.0, 0.0),
    Ped = {
       -- { model = "csb_vagspeak", coords = vec4(120.761, -1328.953, 28.365, 36.762), scenario = "WORLD_HUMAN_SMOKING" },
        { model = "csb_vagspeak", coords = vec4(0.0, 0.0, 0.0, 0.0), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

Config.CigShop = {
    enabled = false, -- change item to your cigarette item before enabling
    AddMoneyToSociety = false,
    Header = "Cigarette vending",
    Items = {
        { label = 'Box of cigarette', item = 'YOUR CIGARETE ITEM', description = "Buy Box of cigarette for: $", price = 50 },
    },
    CigMachines = {
        "prop_vend_fags_01",
    }
}

Config.LapDance = {
    Seller =  { model = "s_m_y_devinsec_01", coords = vec4(120.56, -1296.46, 20.39, 19.88), scenario = "WORLD_HUMAN_SMOKING" },
        Locations = {
            {
                Title = "Near pool dance",
                Spawn = vec4(104.24, -1299.77, 20.39, 299.25),
                price = 200,
                coords = {
                    { pos = vector3(104.24, -1299.77, 20.39), time = 1000 },
                    --{ pos = vector3(104.22, -1299.91, 20.39), time = 4500 }
                },
                Anims = {
                    { dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2", time = 20000 },
                -- { dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", time = 20000 },
                },
                Models = {
                    `csb_stripper_01`,
                    `s_f_y_stripper_01`,
                    `s_f_y_stripperlite`,
                },
            },
            {
                Title = "N2",
                Spawn = vec4(110.7, -1302.61, 20.39, 299.25),
                price = 200,
                coords = {
                    { pos = vector3(106.09, -1295.03, 20.41), time = 10000 },
                    --{ pos = vector3(104.22, -1299.91, 20.39), time = 4500 }
                },
                Anims = {
                    { dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2", time = 20000 },
                -- { dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", time = 20000 },
                },
                Models = {
                    `csb_stripper_01`,
                    `s_f_y_stripper_01`,
                    `s_f_y_stripperlite`,
                },
            },
        },

        --YOU CAN ADD MORE LOCATIONS
        -- LIKE THIS :
        --{
        --    Title = "Private Lapdance cabin #1",
        --    Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
        --    price = 200,
        --    coords = {
        --        { pos = vector3(119.6016, -1296.1283, 28.2693), time = 4000 }
        --    },
        --    Anims = {
        --        { dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2", time = 120000 },
              --  { dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", time = 20000 },
        --    },
        --    Models = {
        --        `csb_stripper_01`,
        --       `s_f_y_stripper_01`,
        --        `s_f_y_stripperlite`,
        --    },
        --},
    --}
}


Config.unicorn = {
    PoleEnabled = false,
    Poledance = {
        pole1 = { coords = vector3(121.7578,-1289.28431, 29.48414), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole2 = { coords = vector3(116.59029388427735,-1292.1796142578126, 29.57504653930664), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole3 = { coords = vector3(111.48719787597656, -1295.1752197265626, 29.48274040222168), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole4 = { coords = vector3(116.27, -1300.35, 22.58), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole5 = { coords = vector3(109.5, -1288.58, 22.42), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole6 = { coords = vector3(120.32, -1282.34, 22.65), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole7 = { coords = vector3(127.13, -1294.07, 22.45), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
    },

    PrivateDances = {
      --  { coords = vector3(123.4, -1294.8, 29.71), heading = 30.02, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},

    },
    Lean = {
        { coords = vector3(109.43, -1294.52, 27.43), teleport = vector3(109.43, -1294.52, 27.43), heading = 256.79, pole = "pole3"},
        { coords = vector3(110.32, -1293.4, 27.44), teleport = vector3(110.32, -1293.4, 27.44), heading = 208.61, pole = "pole3"},
        { coords = vector3(112.09, -1293.3, 27.44), teleport = vector3(112.09, -1293.3, 27.44), heading = 164.99, pole = "pole3"},
        { coords = vector3(113.73, -1296.19, 27.44), teleport = vector3(113.73, -1296.19, 27.44), heading = 77.82, pole = "pole3"},
        { coords = vector3(112.6, -1297.63, 27.44), teleport = vector3(112.6, -1297.63, 27.44), heading = 28.04, pole = "pole3"},
        { coords = vector3(110.79, -1297.72, 27.43), teleport = vector3(110.79, -1297.72, 27.43), heading = 343.39, pole = "pole3"},

        { coords = vector3(114.4, -1292.09, 27.44), teleport = vector3(114.4, -1292.09, 27.44), heading = 271.91, pole = "pole2"},
        { coords = vector3(115.41, -1290.5, 27.44), teleport = vector3(115.41, -1290.5, 27.44), heading = 218.94, pole = "pole2"},
        { coords = vector3(117.7, -1290.52, 27.44), teleport = vector3(117.7, -1290.52, 27.44), heading = 163.61, pole = "pole2"},
        { coords = vector3(118.95, -1293.04, 27.44), teleport = vector3(118.95, -1293.04, 27.44), heading = 82.71, pole = "pole2"},
        { coords = vector3(118.02, -1294.39, 27.44), teleport = vector3(118.02, -1294.39, 27.44), heading = 29.29, pole = "pole2"},
        { coords = vector3(115.98, -1294.84, 27.44), teleport = vector3(115.98, -1294.84, 27.44), heading = 339.51, pole = "pole2"},

        { coords = vector3(119.5, -1288.78, 27.44), teleport = vector3(119.5, -1288.78, 27.44), heading = 263.29, pole = "pole1"},
        { coords = vector3(120.53, -1287.67, 27.44), teleport = vector3(120.53, -1287.67, 27.44), heading = 212.7, pole = "pole1"},
        { coords = vector3(122.24, -1287.27, 27.44), teleport = vector3(122.24, -1287.27, 27.44), heading = 173.2, pole = "pole1"},
        { coords = vector3(123.6, -1288.26, 27.44), teleport = vector3(123.6, -1288.26, 27.44), heading = 131.34, pole = "pole1"},
        { coords = vector3(124.04, -1290.28, 27.44), teleport = vector3(124.04, -1290.28, 27.44), heading = 87.17, pole = "pole1"},
        { coords = vector3(122.87, -1291.59, 27.44), teleport = vector3(122.87, -1291.59, 27.44), heading = 30.16, pole = "pole1"},
        { coords = vector3(121.16, -1291.81, 27.44), teleport = vector3(121.16, -1291.81, 27.44), heading = 351.73, pole = "pole1"},
    },

    Peds = {
        pole1 = { model = "s_f_y_stripper_01", coords = vector3(111.43, -1295.49, 0.52), dict = 'mini@strip_club@pole_dance@pole_dance2', anim = "pd_dance_02", stripper = false},
        pole2 = { model = "s_f_y_stripperlite", coords = vector3(104.7740, -1294.2447, 0.3866), dict = 'mini@strip_club@pole_dance@pole_dance3', anim = "pd_dance_03", stripper = false},
        pole3 = { model = "csb_stripper_01", coords = vector3(102.2257, -1289.9059, 0.3604), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01", stripper = false},
    },

    PolyZone = {
        coords = vector3(127.91, -1286.27, 28.22), size = vec3(90.6, 40.6, 20), rotation = 211, debug = false, RemovePeds = true, radius = 50.0
    },

    AlertPolice = vec3(115.89, -1279.43, 29.47),
    AlarmButton = { enabled = true, coords = vec4(115.89, -1279.43, 29.47, 288.54) },

    Delivery = vec3(93.63, -1297.41, 29.81),
    Phone = { enabled = true, coords = vec4(93.63, -1297.41, 29.81, 210.14) },

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(134.6066, -1276.3187, 28.3262, 315.2296),
                Scenario = "WORLD_HUMAN_SMOKING"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 2 },
            { Model = "STRETCH", Label = "Limousine ", livery = 0 },
        },
        SpawnPoints = {
            { Coords = vector3(137.6740, -1264.6813, 29.1603), Heading = 208.7397, Radius = 3.0 },
            { Coords = vector3(138.6378, -1275.0543, 29.0927), Heading = 296.7762, Radius = 3.0 }
        },
    },

    Bars = {
        FrontBar = {
            coords = vector3(113.38, -1282.82, 29.64),
            radius = 0.5,
            debug = false,
            camera = {
                enabled = true,
                coords = vector3(114.4, -1283.54, 30.05),
                rotation = vector3(-4.29, 0.0, 8.4244),
            },
        },
    },

    Sinks = {
        FrontBar = {
            coords = vector3(107.46, -1283.24, 29.83),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(107.46, -1283.14, 29.83),
        --[[},
        BackBar = {
            coords = vector3(-1374.89, -627.13, 30.81),
            radius = 0.7,
            debug = false,

            WaterStream = vector3(-1374.72, -626.84, 31.0),]]
        },
    },

    DJ = { coords = vec3(119.0, -1299.57, 29.2), radius = 0.4, playingradius = 31, defaultvol = 0.2, Playing = false },

    Duty = {
        Front = { coords = vector3(100.84, -1297.73, 29.93), radius = 0.4, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(99.74, -1304.79, 29.64), radius = 0.6, debug = false },
        Second = { coords = vector3(137.0, -1291.49, 23.0), radius = 0.6, debug = false },
    },

    Stashes = {

        Main = {
            name = "Unicorn_Refregiator",
            label = "Unicorn Refregiator",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(111.4, -1283.65, 29.16),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiator2 = {
            name = "Unicorn_Refregiator2",
            label = "Unicorn Refregiator 2",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(110.42, -1284.45, 29.16),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Refregiato3 = {
            name = "Unicorn_Refregiator3",
            label = "Unicorn Refregiator 3",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(127.38, -1290.61, 21.42),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiato4 = {
            name = "Unicorn_Refregiator4",
            label = "Unicorn Refregiator 4",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(112.77, -1299.03, 21.46),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Refregiato5 = {
            name = "Unicorn_Refregiator5",
            label = "Unicorn Refregiator 5",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(108.89, -1292.55, 21.41),
            radius = 0.4,
            debug = false,
            job = "unicorn"
        },

        Refregiato6 = {
            name = "Unicorn_Refregiator6",
            label = "Unicorn Refregiator 6",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(123.62, -1283.62, 21.52),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Trey = {
            name = "Unicorn_Trey",
            label = "Unicorn Trey",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Trey",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(113.76, -1283.61, 29.77),
            radius = 0.45,
            debug = false
        },

        Table = {
            name = "Unicorn_Table",
            label = "Unicorn Table",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(118.19, -1285.83, 27.95),
            radius = 0.45,
            debug = false
        },

        Table2 = {
            name = "Unicorn_Table2",
            label = "Unicorn Table 2",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(114.07, -1288.31, 27.94),
            radius = 0.45,
            debug = false
        },

        Table3 = {
            name = "Unicorn_Table3",
            label = "Unicorn Table 3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(119.15, -1296.95, 27.95),
            radius = 0.45,
            debug = false
        },

        Table4 = {
            name = "Unicorn_Table4",
            label = "Unicorn Table 4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(123.37, -1294.72, 27.94),
            radius = 0.45,
            debug = false
        },

        Table5 = {
            name = "Unicorn_Table5",
            label = "Unicorn Table 5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(127.76, -1279.77, 22.05),
            radius = 0.45,
            debug = false
        },

        Table6 = {
            name = "Unicorn_Table6",
            label = "Unicorn Table 6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(133.38, -1289.27, 22.09),
            radius = 0.45,
            debug = false
        },

        Table7 = {
            name = "Unicorn_Table7",
            label = "Unicorn Table 7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(126.04, -1291.18, 20.87),
            radius = 0.45,
            debug = false
        },

        Table8 = {
            name = "Unicorn_Table8",
            label = "Unicorn Table 8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(114.48, -1297.26, 20.89),
            radius = 0.45,
            debug = false
        },

        Table9 = {
            name = "Unicorn_Table9",
            label = "Unicorn Table 9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(127.86, -1285.54, 28.69),
            radius = 0.45,
            debug = false
        },

        Table10 = {
            name = "Unicorn_Table10",
            label = "Unicorn Table 10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(129.85, -1280.74, 28.72),
            radius = 0.45,
            debug = false
        },

        Table11 = {
            name = "Unicorn_Table11",
            label = "Unicorn Table 11",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(132.46, -1276.74, 28.71),
            radius = 0.45,
            debug = false
        },

        Table12 = {
            name = "Unicorn_Table12",
            label = "Unicorn Table 12",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(127.32, -1277.95, 28.71),
            radius = 0.45,
            debug = false
        },

        Table13 = {
            name = "Unicorn_Table12",
            label = "Unicorn Table 12",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(121.16, -1279.09, 29.12),
            radius = 0.45,
            debug = false
        },
    },

    BossMenu = {
        Main = { coords = vector3(99.51, -1298.11, 35.41), radius = 0.3, debug = false },
    },

    IceMachine = {
        FrontBar = { coords = vector3(112.39, -1282.91, 29.43), radius = 0.45, debug = false },
    },

    Registers = {
        FrontBar = { coords = vector3(117.12, -1280.27, 29.71), radius = 0.2, debug = false, amount = 0 },
    },

    DancePlatforms = {
        DJ = { coords = vector3(122.74, -1297.39, 29.21), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@djs@dixon@", anim = "dixn_dance_cntr_open_dix" },
    },

    -- Here, we're not using any teleports, so we just put it underground.. if you want it, you can change coords
    Teleports = {
        FrontBar = {
            coords = vector3(0.8512, 0.6432, 0.6261),
            radius = 0.7,
            debug = false,
            BehindCoords = { coords = vector3(0), heading = 86.2596 },
            FrontCoords = { coords = vector3(0), heading = 102.0459 },
        },
    }
}

--Drinks
Config.Drinks = {
    PinaColada = {
        Title = "Piña Colada",
        description = "Requirements: Tall glass, Rhum, Ice, Coco Milk",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "coco_milk", count = 1, remove = true },
        },
        AddItems = {
            { item = "pina_colada", count = 1 },
        }
    },
    Mojito = {
        Title = "Mojito",
        description = "Requirements: Tall glass, Rhum, Lime, Sugar, Juice, Mint, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "mint", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
            { item = "sugar", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
        },
        AddItems = {
            { item = "mojito", count = 1 },
        }
    },
    MaiTai = {
        Title = "Mai Tai",
        description = "Requirements: Tall glass, Rhum, Lime, Juice, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
        },
        AddItems = {
            { item = "mai_tai", count = 1 },
        }
    },
    Caipirinha = {
        Title = "Caipirinha",
        description = "Requirements: Tall glass, Rhum, Lime, Sugar, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "rhum", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lime", count = 1, remove = true },
            { item = "sugar", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
        },
        AddItems = {
            { item = "caipirinha", count = 1 },
        }
    },
    SanFrancisco = {
        Title = "San Francisco",
        description = "Requirements: Tall glass, Juice, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "juice", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
        },
        AddItems = {
            { item = "san_francisco", count = 1 },
        }
    },
    BlueLagoon = {
        Title = "Blue Lagoon",
        description = "Requirements: Tall glass, Vodka, Lemon, Ice",
        RequiredItems = {
            { item = "glass_tall", count = 1, remove = true },
            { item = "vodka", count = 1, remove = true },
            { item = "ice", count = 1, remove = true },
            { item = "lemon", count = 1, remove = true },
        },
        AddItems = {
            { item = "blue_lagoon", count = 1 },
        }
    }
}

--Food
Config.Food = {
    BowlChips = {
        Title = "Bowl of nuts",
        description = "Requirements: Bowl, Nuts",
        RequiredItems = {
            { item = "bowl", count = 1, remove = true },
            { item = "nuts", count = 1, remove = true },
        },
        AddItems = {
            { item = "bar_nuts", count = 1 },
        }
    },
    BowlBeans = {
        Title = "Bowl of nuts",
        description = "Requirements: Bowl, Nuts",
        RequiredItems = {
            { item = "bowl", count = 1, remove = true },
            { item = "nuts", count = 1, remove = true },
        },
        AddItems = {
            { item = "bar_beans", count = 1 },
        }
    },
}


--Sink
Config.Sink = {
    CleanTallGlass = {
        Title = "Clean Tall Glass",
        description = "Requirements: Dirty Tall Glass",
        prop = `prop_sh_tall_glass`,
        RequiredItems = {
            { item = "glass_tall_dirty", count = 1, remove = true },
        },
        AddItems = {
            { item = "glass_tall", count = 1 },
        }
    },
    CleanBowl = {
        Title = "Clean Bowl",
        description = "Requirements: Dirty Bowl",
        prop = `prop_bar_beans`,
        RequiredItems = {
            { item = "bar_bowl_dirty", count = 1, remove = true },
        },
        AddItems = {
            { item = "bar_bowl", count = 1 },
        }
    },
}

--IceMachine
Config.IceMachine = {
    Ice = {
        Title = "Get Ice Cube",
        description = "Get ice cube to drinks!",
        RequiredItems = {
            --{ item = "glass_tall_dirty", count = 1, remove = false },
        },
        AddItems = {
            { item = "ice", count = 1 },
        }
    },
}

--BLIPS
Config.Blips = {
    Unicorn = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(127.7439, -1296.4795, 29.2693), -- Blip coords
        Sprite = 121, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 27, -- colour
        Name = "Vanilla Unicorn" -- Blip name
    },
}

--Job BLIPS
Config.JobBlips = {
    PawnShop = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(-1311.47, -1172.07, 3.9), -- Blip coords
        Sprite = 59, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 5, -- colour
        Name = "Vanilla Unicorn - Shop" -- Blip name
    },
}

--Shop
Config.Shop = {
    Header = "Vanilla Unicorn Shop",
    Items = {
        { label = 'Coco Milk', item = 'coco_milk', description = "Buy Coco Milk for: $", price = 7, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Dirty Tall Glass', item = 'glass_tall_dirty', description = "Buy Dirty Tall Glass for: $", price = 2,
            MinAmount = 1, MaxAmount = 20 },
        { label = 'Juice', item = 'juice', description = "Buy Juice for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Lemon', item = 'lemon', description = "Buy Lemon for: $", price = 6, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Lime', item = 'lime', description = "Buy Lime for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Mint', item = 'mint', description = "Buy Mint for: $", price = 5, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Rhum', item = 'rhum', description = "Buy Rhum for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Sugar', item = 'sugar', description = "Buy Sugar for: $", price = 4, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Vodka', item = 'vodka', description = "Buy Vodka for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Dirty bowl', item = 'bar_bowl_dirty', description = "Buy Dirty Bowl for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Nuts', item = 'nuts', description = "Buy Nuts for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
        { label = 'Beans', item = 'beans', description = "Buy Beans for: $", price = 8, MinAmount = 1,
            MaxAmount = 20 },
    },
    Ped = {
        { model = "mp_m_shopkeep_01", coords = vec4(-1312.43, -1171.91, 3.9, 284.6), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

--Outfits
Config.Outfits = {
    [`mp_m_freemode_01`] = { -- Skin model
        {
            label = "Security",
            description = "",
            outfitData = {
                tshirt_1 = 21,
                tshirt_2 = 0,
                arms     = 4,
                torso_1  = 4,
                torso_2  = 0,
                pants_1  = 24,
                pants_2  = 0,
                shoes_1 = 10,
                shoes_2 = 0,
                chain_1 = 19,
                chain_2 = 0,
                glasses_1 = 3,
                glasses_2 = 0,
                ears_1 = 2,
                ears_2 = 0,
            }
        },
        {
            label = "Barman",
            description = "",
            outfitData = {
                tshirt_1 = 22,
                tshirt_2 = 0,
                arms     = 4,
                torso_1  = 11,
                torso_2  = 1,
                pants_1  = 24,
                pants_2  = 0,
                shoes_1 = 10,
                shoes_2 = 0,
                chain_1 = 22,
                chain_2 = 0,
                glasses_1 = 3,
                glasses_2 = 0,
                ears_1 = 2,
                ears_2 = 0,
            }
        }
    },
    [`mp_f_freemode_01`] = { -- Skin model
        {
            label = "Dancer",
            description = "",
            outfitData = {
                tshirt_1 = 14,
                tshirt_2 = 0,
                arms     = 15,
                torso_1  = 22,
                torso_2  = 1,
                pants_1  = 20,
                pants_2  = 1,
                shoes_1 = 20,
                shoes_2 = 4,
                chain_1 = 0,
                chain_2 = 0,
                glasses_1 = 0,
                glasses_2 = 0,
                ears_1 = 0,
                ears_2 = 0,
            }
        },
        {
            label = "Barman",
            description = "",
            outfitData = {
                tshirt_1 = 14,
                tshirt_2 = 0,
                arms     = 15,
                torso_1  = 173,
                torso_2  = 0,
                pants_1  = 78,
                pants_2  = 2,
                shoes_1 = 77,
                shoes_2 = 0,
                chain_1 = 0,
                chain_2 = 0,
                glasses_1 = 0,
                glasses_2 = 0,
                ears_1 = 0,
                ears_2 = 0,
            }
        }
    },
}

-- Consumables / Drinking / Eating
Config.Consumables = {
    bar_nuts = { -- Item name
        Log = "He ate nuts",
        Remove = true, -- Remove item
        RemoveItem = "bar_nuts", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_bar_nuts',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    bar_beans = { -- Item name
        Log = "He ate beans",
        Remove = true, -- Remove item
        RemoveItem = "bar_beans", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_bar_beans',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    pina_colada = { -- Item name
        Log = "Drank Pina colada",
        Remove = true, -- Remove item
        RemoveItem = "pina_colada", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    mojito = { -- Item name
        Log = "Drank mojito",
        Remove = true, -- Remove item
        RemoveItem = "mojito", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    mai_tai = { -- Item name
        Log = "Drank mai_tai",
        Remove = true, -- Remove item
        RemoveItem = "mai_tai", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    caipirinha = { -- Item name
        Log = "Drank caipirinha",
        Remove = true, -- Remove item
        RemoveItem = "caipirinha", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },

            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    san_francisco = { -- Item name
        Log = "Drank san_francisco",
        Remove = true, -- Remove item
        RemoveItem = "san_francisco", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    blue_lagoon = { -- Item name
        Log = "Drank blue_lagoon",
        Remove = true, -- Remove item
        RemoveItem = "blue_lagoon", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "glass_tall_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "drunk", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'prop_cocktail',
                    bone = 57005,
                    pos = vec3(0.14, -0.07, -0.01),
                    rot = vec3(-80.0, 100.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
}

Config.ChairsDebug = false
Config.Chairs = {
    --TABLE 1
    {
        coords = vector3(120.05, -1279.52, 29.1), offsetZ = -0.10, heading = 228.78, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.45, -1279.89, 28.61, 229.76)
    },
    {
        coords = vector3(122.35, -1278.74, 29.12), offsetZ = -0.10, heading = 170.11, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.19, -1279.46, 28.62, 165.9)
    },
    {
        coords = vector3(125.82, -1278.04, 28.7), offsetZ = -0.10, heading = 217.63, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(126.08, -1278.45, 28.22, 212.89)
    },
    {
        coords = vector3(128.77, -1277.45, 28.71), offsetZ = -0.10, heading = 171.69, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.51, -1277.93, 28.22, 170.43)
    },
    {
        coords = vector3(130.9, -1276.79, 28.69), offsetZ = -0.10, heading = 217.31, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(131.31, -1277.35, 28.22, 220.98)
    },
    {
        coords = vector3(133.65, -1277.65, 28.7), offsetZ = -0.10, heading = 118.26, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(132.93, -1278.04, 28.19, 118.26)
    },
    {
        coords = vector3(130.68, -1279.7, 28.69), offsetZ = -0.10, heading = 114.8, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(130.25, -1279.75, 28.22, 100.52)
    },
    {
        coords = vector3(129.5, -1282.02, 28.72), offsetZ = -0.10, heading = 43.15, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(129.11, -1281.61, 28.21, 43.15)
    },
    {
        coords = vector3(127.74, -1283.96, 28.72), offsetZ = -0.10, heading = 156.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(127.41, -1284.49, 28.22, 162.88)
    },
    {
        coords = vector3(129.11, -1286.47, 28.72), offsetZ = -0.10, heading = 98.77, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.78, -1286.52, 28.68, 98.77)
    },
-- PINK SOFAS
    {
        coords = vector3(119.4, -1284.79, 27.91), offsetZ = -0.10, heading = 211.78, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.38, -1285.44, 27.44, 198.65)
    },
    {
        coords = vector3(120.22, -1284.31, 27.91), offsetZ = -0.10, heading = 212.49, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.5, -1284.78, 27.43, 213.4)
    },
    {
        coords = vector3(121.09, -1283.81, 27.92), offsetZ = -0.10, heading = 221.82, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.47, -1284.26, 27.44, 234.25)
    },
    {
        coords = vector3(115.33, -1287.12, 27.93), offsetZ = -0.10, heading = 209.02, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.07, -1287.92, 27.44, 200.48)
    },
    {
        coords = vector3(115.91, -1286.75, 27.92), offsetZ = -0.10, heading = 209.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.05, -1287.42, 27.44, 213.28)
    },
    {
        coords = vector3(116.72, -1286.32, 27.92), offsetZ = -0.10, heading = 207.95, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.14, -1286.87, 27.44, 212.46)
    },
    {
        coords = vector3(112.75, -1288.6, 27.93), offsetZ = -0.10, heading = 209.49, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.16, -1289.07, 27.44, 206.79)
    },
    {
        coords = vector3(112.1, -1288.95, 27.92), offsetZ = -0.10, heading = 206.23, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.24, -1289.64, 27.44, 212.24)
    },
    {
        coords = vector3(110.81, -1289.73, 27.92), offsetZ = -0.10, heading = 210.48, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.18, -1290.35, 27.44, 210.48)
    },
    {
        coords = vector3(126.36, -1293.24, 27.92), offsetZ = -0.10, heading = 33.65, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(126.06, -1292.66, 27.44, 32.69)
    },
    {
        coords = vector3(125.46, -1293.53, 27.92), offsetZ = -0.10, heading = 28.26, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.36, -1293.07, 27.44, 30)
    },
    {
        coords = vector3(124.56, -1294.12, 27.9), offsetZ = -0.10, heading = 22.16, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.29, -1293.67, 27.44, 26.8)
    },
    {
        coords = vector3(122.29, -1295.53, 27.89), offsetZ = -0.10, heading = 32.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.07, -1294.97, 27.44, 29.96)
    },
    {
        coords = vector3(121.3, -1296.05, 27.89), offsetZ = -0.10, heading = 31.23, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.02, -1295.57, 27.44, 30.35)
    },
    {
        coords = vector3(120.39, -1296.68, 27.89), offsetZ = -0.10, heading = 31.27, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.05, -1296.13, 27.44, 31.48)
    },
    {
        coords = vector3(118.1, -1297.94, 27.92), offsetZ = -0.10, heading = 31.28, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.88, -1297.36, 27.44, 30.46)
    },
    {
        coords = vector3(117.2, -1298.38, 27.9), offsetZ = -0.10, heading = 30.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.99, -1297.88, 27.44, 32.93)
    },
    {
        coords = vector3(116.2, -1298.91, 27.92), offsetZ = -0.10, heading = 33.4, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.89, -1298.49, 27.44, 30.83)
    },
    {
        coords = vector3(137.73, -1289.18, 28.72), offsetZ = -0.10, heading = 132.26, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(137.42, -1289.63, 28.25, 134.69)
    },
    {
        coords = vector3(101.71, -1290.09, 28.66), offsetZ = -0.10, heading = 207.79, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(102.04, -1290.86, 28.22, 203.83)
    },
    {
        coords = vector3(101.19, -1292.44, 28.65), offsetZ = -0.10, heading = 298.5, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(101.71, -1292.18, 28.22, 305.34)
    },
    {
        coords = vector3(104.84, -1304.27, 28.98), offsetZ = -0.10, heading = 29.22, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(104.66, -1303.75, 28.22, 21.6)
    },
    {
        coords = vector3(107.64, -1302.62, 28.98), offsetZ = -0.10, heading = 39.77, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.24, -1302.32, 28.22, 49.74)
    },
    {
        coords = vector3(109.69, -1301.32, 28.99), offsetZ = -0.10, heading = 9.65, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(109.6, -1300.82, 28.21, 13.61)
    },
    {
        coords = vector3(111.01, -1301.88, 28.69), offsetZ = -0.10, heading = 120.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.44, -1302.04, 28.22, 123.67)
    },
    {
        coords = vector3(111.64, -1302.81, 28.68), offsetZ = -0.10, heading = 118.41, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.12, -1303.1, 28.21, 118.41)
    },
    {
        coords = vector3(104.23, -1299.85, 35.06), offsetZ = -0.10, heading = 120.29, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(103.84, -1300.11, 34.59, 117.19)
    },
    {
        coords = vector3(103.62, -1298.69, 35.07), offsetZ = -0.10, heading = 118.87, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(103.14, -1298.95, 34.59, 120.95)
    },
    {
        coords = vector3(100.76, -1299.93, 35.08), offsetZ = -0.10, heading = 48.3, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(100.46, -1299.56, 34.58, 64.83)
    },
    {
        coords = vector3(99.02, -1301.07, 35.1), offsetZ = -0.10, heading = 338.41, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(99.13, -1300.54, 34.58, 343.39)
    },
    {
        coords = vector3(98.36, -1297.23, 35.09), offsetZ = -0.10, heading = 184.99, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(98.39, -1297.79, 34.58, 181.36)
    },
    {
        coords = vector3(99.55, -1304.28, 35.05), offsetZ = -0.10, heading = 28.16, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(99.31, -1303.84, 34.58, 28.26)
    },
    {
        coords = vector3(107.94, -1309.67, 35.04), offsetZ = -0.10, heading = 36.4, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.73, -1309.22, 34.59, 29.21)
    },
    {
        coords = vector3(106.86, -1310.44, 35.05), offsetZ = -0.10, heading = 32.42, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(106.57, -1309.94, 34.59, 28.18)
    },
    {
        coords = vector3(105.71, -1311.05, 35.07), offsetZ = -0.10, heading = 28.37, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(105.48, -1310.52, 34.59, 31.09)
    },
    {
        coords = vector3(103.84, -1308.02, 35.06), offsetZ = -0.10, heading = 210.14, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(104.11, -1308.39, 34.59, 212.36)
    },
    {
        coords = vector3(104.97, -1307.37, 35.05), offsetZ = -0.10, heading = 209.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(105.18, -1307.77, 34.59, 211.98)
    },
    {
        coords = vector3(106.09, -1306.69, 35.05), offsetZ = -0.10, heading = 212.38, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(106.33, -1307.11, 34.59, 209.63)
    },
    {
        coords = vector3(134.5, -1288.55, 22.14), offsetZ = -0.10, heading = 31.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(134.23, -1287.96, 21.65, 28.8)
    },
    {
        coords = vector3(131.92, -1288.98, 22.11), offsetZ = -0.10, heading = 300.46, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(132.4, -1288.69, 21.65, 300.46)
    },
    {
        coords = vector3(131.4, -1287.92, 22.11), offsetZ = -0.10, heading = 300.97, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(131.8, -1287.68, 21.65, 297.51)
    },
    {
        coords = vector3(129.0, -1279.03, 22.13), offsetZ = -0.10, heading = 210.67, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(129.23, -1279.49, 21.65, 209.17)
    },
    {
        coords = vector3(128.14, -1282.13, 22.11), offsetZ = -0.10, heading = 300.71, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.62, -1281.84, 21.65, 300.53)
    },
    {
        coords = vector3(127.71, -1281.45, 22.12), offsetZ = -0.10, heading = 300.38, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(128.09, -1281.23, 21.65, 300.37)
    },
    {
        coords = vector3(127.24, -1280.73, 22.13), offsetZ = -0.10, heading = 299.04, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(127.73, -1280.46, 21.65, 299.01)
    },
    {
        coords = vector3(124.45, -1288.37, 20.91), offsetZ = -0.10, heading = 209.52, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.64, -1288.8, 20.4, 210.92)
    },
    {
        coords = vector3(123.95, -1288.56, 20.88), offsetZ = -0.10, heading = 205.68, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.16, -1289.09, 20.4, 210.95)
    },
    {
        coords = vector3(123.4, -1288.94, 20.9), offsetZ = -0.10, heading = 211.12, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.67, -1289.4, 20.39, 211.12)
    },
    {
        coords = vector3(123.08, -1288.29, 20.89), offsetZ = -0.10, heading = 33.74, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.75, -1287.77, 20.39, 33.51)
    },
    {
        coords = vector3(123.58, -1287.91, 20.88), offsetZ = -0.10, heading = 29.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.33, -1287.43, 20.39, 27.3)
    },
    {
        coords = vector3(124.14, -1287.54, 20.91), offsetZ = -0.10, heading = 26.92, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.91, -1287.12, 20.39, 30.59)
    },
    {
        coords = vector3(119.62, -1290.6, 20.98), offsetZ = -0.10, heading = 292.24, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.95, -1290.41, 20.39, 298.46)
    },
    {
        coords = vector3(119.7, -1291.71, 20.92), offsetZ = -0.10, heading = 256.13, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.18, -1291.75, 20.4, 263.61)
    },
    {
        coords = vector3(119.32, -1292.66, 20.9), offsetZ = -0.10, heading = 207, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.53, -1292.92, 20.4, 224.88)
    },
    {
        coords = vector3(118.22, -1292.89, 20.91), offsetZ = -0.10, heading = 168.46, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.28, -1293.42, 20.4, 183.65)
    },
    {
        coords = vector3(117.34, -1292.54, 20.95), offsetZ = -0.10, heading = 139.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.03, -1292.97, 20.4, 148.35)
    },
    {
        coords = vector3(116.86, -1291.72, 20.94), offsetZ = -0.10, heading = 100.23, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.33, -1291.83, 20.4, 106.06)
    },
    {
        coords = vector3(116.9, -1290.66, 20.5), offsetZ = -0.10, heading = 48.02, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.51, -1290.51, 20.4, 64.95)
    },
    {
        coords = vector3(117.59, -1289.96, 20.92), offsetZ = -0.10, heading = 32.2, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.47, -1289.63, 20.4, 24.21)
    },
    {
        coords = vector3(118.76, -1289.98, 20.92), offsetZ = -0.10, heading = 329.6, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.78, -1289.53, 20.4, 347.95)
    },
    {
        coords = vector3(112.93, -1294.08, 20.91), offsetZ = -0.10, heading = 27.5, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.64, -1293.56, 20.4, 32.94)
    },
    {
        coords = vector3(112.32, -1294.36, 20.89), offsetZ = -0.10, heading = 29.26, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.08, -1293.94, 20.39, 31.63)
    },
    {
        coords = vector3(111.74, -1294.77, 20.5), offsetZ = -0.10, heading = 27.26, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.49, -1294.29, 20.39, 27.24)
    },
    {
        coords = vector3(112.23, -1295.45, 20.89), offsetZ = -0.10, heading = 208.46, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.43, -1295.9, 20.4, 213.92)
    },
    {
        coords = vector3(112.73, -1295.08, 20.88), offsetZ = -0.10, heading = 209.17, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.01, -1295.59, 20.39, 209.13)
    },
    {
        coords = vector3(113.33, -1294.77, 20.92), offsetZ = -0.10, heading = 211.17, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.63, -1295.26, 20.4, 206.9)
    },
    {
        coords = vector3(116.69, -1283.01, 29.39), offsetZ = -0.10, heading = 27.91, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.89, -1283.29, 28.62, 213.32)
    },
    {
        coords = vector3(113.98, -1284.52, 29.39), offsetZ = -0.10, heading = 28.31, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.21, -1284.87, 28.62, 210.8)
    },
    {
        coords = vector3(111.04, -1286.17, 28.38), offsetZ = -0.10, heading = 29.29, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.22, -1286.54, 28.62, 210.64)
    },
}


Config.Delivery = {
    {
        item = "bar_nuts",
        Label = "Bar Nuts",
        MinPrice = 5,
        MaxPrice = 5,
        MinCount = 1,
        MaxCount = 10,
    },
    {
        item = "bar_beans",
        Label = "Bar Beans",
        MinPrice = 6,
        MaxPrice = 6,
        MinCount = 1,
        MaxCount = 10,
    },
    {
        item = "pina_colada",
        Label = "Pina Colada",
        MinPrice = 10,
        MaxPrice = 10,
        MinCount = 1,
        MaxCount = 5,
    },
    {
        item = "mojito",
        Label = "Mojito",
        MinPrice = 10,
        MaxPrice = 10,
        MinCount = 1,
        MaxCount = 5,
    },
    {
        item = "mai_tai",
        Label = "Mai Tai",
        MinPrice = 12,
        MaxPrice = 12,
        MinCount = 1,
        MaxCount = 5,
    },
    {
        item = "caipirinha",
        Label = "Caipirinha",
        MinPrice = 11,
        MaxPrice = 11,
        MinCount = 1,
        MaxCount = 5,
    },
    {
        item = "san_francisco",
        Label = "San Francisco",
        MinPrice = 10,
        MaxPrice = 10,
        MinCount = 1,
        MaxCount = 5,
    },
    {
        item = "blue_lagoon",
        Label = "Blue Lagoon",
        MinPrice = 9,
        MaxPrice = 9,
        MinCount = 1,
        MaxCount = 5,
    },
}