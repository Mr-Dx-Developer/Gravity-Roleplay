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
    Location = vec4(125.87, -1324.06, 28.6, 44.44),
    Ped = {
        { model = "csb_vagspeak", coords = vec4(125.87, -1324.06, 28.29, 44.24), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

Config.CigShop = {
    enabled = true, -- change item to your cigarette item before enabling
    AddMoneyToSociety = true,
    Header = "Cigarette vending",
    Items = {
        { label = 'Cigarette', item = 'cigarette', description = "Buy cigarette for: $", price = 50 },
    },
    CigMachines = {
        "prop_vend_fags_01",
    }
}

Config.LapDance = {
    Seller =  { model = "s_m_y_devinsec_01", coords = vec4(117.4648, -1295.9160, 28.2693, 316.8826), scenario = "WORLD_HUMAN_SMOKING" },
    Locations = {
        {
            Title = "Private Lapdance cabin #1",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(119.6016, -1296.1283, 28.2693), time = 4000 }
            },
            Anims = {
                { dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2", time = 120000 },
              --  { dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", time = 20000 },
            },
            Models = {
                `csb_stripper_01`,
                `s_f_y_stripper_01`,
                `s_f_y_stripperlite`,
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
    }
}


Config.unicorn = {
    PoleEnabled = true,
    Poledance = {
        pole1 = { coords = vector3(105.0791, -1291.1047, 29.0998), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole2 = { coords = vector3(104.7740, -1294.2447, 29.3866), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole3 = { coords = vector3(102.2257, -1289.9059, 29.3604), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole4 = { coords = vector3(133.3988, -1279.3443, 29.5197), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
    },

    PrivateDances = {
        { coords = vector3(114.8777, -1303.9745, 29.2720), heading = 253.2636, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(112.9996, -1304.9867, 29.2720), heading = 167.7012, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(111.8303, -1302.5922, 29.2720), heading = 73.1104, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(113.6621, -1301.0468, 29.2721), heading = 98.1804, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(119.4162, -1288.1040, 29.0526), heading = 331.8597, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(111.7946, -1285.2072, 29.0571), heading = 308.6962, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
    },
    Lean = {
        { coords = vector3(106.8017, -1290.6082, 28.2602), teleport = vector3(106.8017, -1290.6082, 28.2602), heading = 119.6515, pole = "pole1"},
        { coords = vector3(107.2739, -1291.4602, 28.2602), teleport = vector3(107.2739, -1291.4602, 28.2602), heading = 94.7051, pole = "pole1"},
        { coords = vector3(107.4794, -1294.3127, 28.2602), teleport = vector3(107.4794, -1294.3127, 28.2602), heading = 86.9258, pole = "pole1"},

        { coords = vector3(107.0802, -1294.5315, 28.2602), teleport = vector3(107.0802, -1294.5315, 28.2602), heading = 76.5486, pole = "pole2"},
        { coords = vector3(106.4523, -1296.3215, 28.2602), teleport = vector3(106.4523, -1296.3215, 28.2602), heading = 45.0772, pole = "pole2"},

        { coords = vector3(104.7866, -1288.8627, 28.2602), teleport = vector3(104.7866, -1288.8627, 28.2602), heading = 155.2343, pole = "pole3"},
        { coords = vector3(102.2107, -1287.7810, 28.2602), teleport = vector3(102.2107, -1287.7810, 28.2602), heading = 189.2290, pole = "pole3"},
    },

    Peds = {
        pole1 = { model = "s_f_y_stripper_01", coords = vector3(105.0791, -1291.1047, 29.0998), dict = 'mini@strip_club@pole_dance@pole_dance2', anim = "pd_dance_02", stripper = true},
        pole2 = { model = "s_f_y_stripperlite", coords = vector3(104.7740, -1294.2447, 29.3866), dict = 'mini@strip_club@pole_dance@pole_dance3', anim = "pd_dance_03", stripper = true},
        pole3 = { model = "csb_stripper_01", coords = vector3(102.2257, -1289.9059, 29.3604), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01", stripper = true},
    },

    PolyZone = {
        coords = vector3(119.98, -1289.29, 37.73), size = vec3(50.6, 40.6, 20), rotation = 211, debug = false, RemovePeds = true, radius = 50.0
    },

    AlertPolice = vec3(126.97, -1281.52, 28.99),
    AlarmButton = { enabled = true, coords = vec4(127.07, -1281.45, 28.91, 118.52) },

    Delivery = vec3(131.7057, -1288.7290, 29.7696),
    Phone = { enabled = true, coords = vec4(131.7057, -1288.7290, 28.9696, 31.1683) },

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
            coords = vector3(128.05, -1283.14, 29.27),
            radius = 0.5,
            debug = false,
            camera = {
                enabled = true,
                coords = vector3(128.8118, -1283.8989, 29.7507),
                rotation = vector3(-4.29, 0.0, 8.4244),
            },
        },
    },

    Sinks = {
        FrontBar = {
            coords = vector3(133.6448, -1286.7816, 29.4408),
            radius = 0.3,
            debug = false,
            WaterStream = vector3(133.6448, -1286.7816, 29.5408),
        --[[},
        BackBar = {
            coords = vector3(-1374.89, -627.13, 30.81),
            radius = 0.7,
            debug = false,

            WaterStream = vector3(-1374.72, -626.84, 31.0),]]
        },
    },

    DJ = { coords = vec3(106.57, -1284.63, 28.26), radius = 0.4, playingradius = 31, defaultvol = 0.2, Playing = false },

    Duty = {
        Front = { coords = vector3(102.2655, -1299.4333, 29.5729), radius = 0.4, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(104.84, -1303.55, 28.79), radius = 0.6, debug = false },
    },

    Stashes = {

        Main = {
            name = "Unicorn_Refregiator",
            label = "Unicorn Refregiator",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(119.17, -1302.85, 28.87),
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
            coords = vector3(132.45, -1285.69, 28.92),
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
            coords = vector3(129.8, -1280.72, 28.72),
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
            coords = vector3(129.01, -1283.98, 28.77),
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
            coords = vector3(129.93, -1285.46, 28.77),
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
            coords = vector3(92.92, -1290.93, 29.26),
            radius = 0.45,
            debug = false,
            job = "unicorn"
        },

        Table = {
            name = "Unicorn_Table",
            label = "Unicorn Table",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(94.77, -1289.96, 28.91),
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
            coords = vector3(114.67, -1305.65, 28.64),
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
            coords = vector3(113.76, -1299.81, 28.62),
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
            coords = vector3(111.26, -1304.28, 28.64),
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
            coords = vector3(114.68, -1299.18, 29.22),
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
            coords = vector3(123.36, -1294.77, 28.62),
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
            coords = vector3(119.95, -1296.72, 28.57),
            radius = 0.5,
            debug = false
        },

        Table8 = {
            name = "Unicorn_Table8",
            label = "Unicorn Table 8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(122.07, -1287.07, 27.71),
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
            coords = vector3(120.96, -1285.21, 27.56), 
            radius = 0.55,
            debug = false
        },

        Table10 = {
            name = "Unicorn_Table10",
            label = "Unicorn Table 10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(117.49, -1282.76, 27.66),
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
            coords = vector3(113.91, -1282.42, 27.71),
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
            coords = vector3(116.36, -1291.31, 27.66),
            radius = 0.45,
            debug = false
        },

        Table13 = {
            name = "Unicorn_Table13",
            label = "Unicorn Table 13",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(125.81, -1286.77, 29.27),
            radius = 0.45,
            debug = false
        },

        Table14 = {
            name = "Unicorn_Tabl14",
            label = "Unicorn Table 14",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(124.22, -1283.94, 29.37),
            radius = 0.45,
            debug = false
        },

        Table15 = {
            name = "Unicorn_Tabl15",
            label = "Unicorn Table 15",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(110.05, -1282.96, 27.81),
            radius = 0.45,
            debug = false
        },

        Table16 = {
            name = "Unicorn_Tabl16",
            label = "Unicorn Table 16",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(114.0350, -1291.4268, 28.0000),
            radius = 0.45,
            debug = false
        },

        Table17 = {
            name = "Unicorn_Tabl17",
            label = "Unicorn Table 17",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(131.57, -1291.62, 29.27),
            radius = 0.45,
            debug = false
        },

        Table18 = {
            name = "Unicorn_Tabl18",
            label = "Unicorn Table 18",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(138.4, -1285.14, 28.97),
            radius = 0.45,
            debug = false
        },

        Table19 = {
            name = "Unicorn_Tabl19",
            label = "Unicorn Table 19",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(141.1, -1293.76, 28.87),
            radius = 0.45,
            debug = false
        },

        Table20 = {
            name = "Unicorn_Tabl20",
            label = "Unicorn Table 20",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(137.99, -1297.76, 28.78),
            radius = 0.45,
            debug = false
        },

        Table21 = {
            name = "Unicorn_Tabl21",
            label = "Unicorn Table 21",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(133.91, -1299.96, 29.23),
            radius = 0.45,
            debug = false
        },

        Table22 = {
            name = "Unicorn_Tabl22",
            label = "Unicorn Table 22",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(126.62, -1300.29, 29.23),
            radius = 0.45,
            debug = false
        },

        Table23 = {
            name = "Unicorn_Tabl23",
            label = "Unicorn Table 23",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(126.72, -1304.43, 29.23),
            radius = 0.45,
            debug = false
        },

        Table24 = {
            name = "Unicorn_Tabl24",
            label = "Unicorn Table 24",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(123.78, -1306.03, 28.83),
            radius = 0.45,
            debug = false
        },

        Table25 = {
            name = "Unicorn_Tabl25",
            label = "Unicorn Table 25",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(118.65, -1306.82, 28.78),
            radius = 0.45,
            debug = false
        },



    },

    BossMenu = {
        Main = { coords = vector3(96.2516, -1293.2615, 29.0546), radius = 0.3, debug = false },
    },

    IceMachine = {
        FrontBar = { coords = vector3(128.01, -1281.78, 29.17), radius = 0.45, debug = false },
    },

    Registers = {
        FrontBar = { coords = vector3(129.5015, -1285.2175, 29.4592), radius = 0.2, debug = false, amount = 0 },
    },

    DancePlatforms = {
        DJ = { coords = vector3(106.2397, -1284.0128, 27.2602), radius = 0.7, debug = false,
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
        { label = 'rhum', item = 'Rhum', description = "Buy Rhum for: $", price = 8, MinAmount = 1,
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
        coords = vector3(109.8657, -1281.5925, 27.7602), offsetZ = -0.10, heading = 187.5198, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(109.8742, -1282.2256, 28.2602, 187.5198)
    },
    {
        coords = vector3(110.8365, -1281.4282, 27.7603), offsetZ = -0.10, heading = 188.7338, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.8584, -1282.0610, 28.2602, 188.7338)
    },
    {
        coords = vector3(111.7421, -1281.2279, 27.7602), offsetZ = -0.10, heading = 189.4382, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.7717, -1281.8604, 28.2602, 189.4382)
    },
    {
        coords = vector3(112.8018, -1281.1604, 27.7602), offsetZ = -0.10, heading = 187.4072, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.8091, -1281.7935, 28.2602, 187.4072)
    },
    {
        coords = vector3(113.7751, -1280.9406, 27.7602), offsetZ = -0.10, heading = 190.4273, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.8157, -1281.5724, 28.2602, 190.4273)
    },
    --PINK SOFA
    {
        coords = vector3(115.1857, -1285.8967, 27.7602), offsetZ = -0.10, heading = 338.5557, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.4848, -1285.3387, 28.2672, 338.5557)
    },
    {
        coords = vector3(116.3270, -1286.3557, 27.7602), offsetZ = -0.10, heading = 335.8420, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.6523, -1285.8125, 28.2602, 335.8420)
    },
    {
        coords = vector3(116.9480, -1287.0923, 27.7602), offsetZ = -0.10, heading = 245.5743, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.4897, -1287.4200, 28.2614, 245.5742)
    },
    {
        coords = vector3(115.8171, -1287.0662, 27.7602), offsetZ = -0.10, heading = 157.8511, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.5111, -1287.6205, 28.2659, 157.8511)
    },
    {
        coords = vector3(114.7618, -1286.6506, 27.7602), offsetZ = -0.10, heading = 161.7623, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.4943, -1287.2245, 28.2602, 161.7623)
    },
    {
        coords = vector3(114.5271, -1285.9729, 27.7602), offsetZ = -0.10, heading = 65.6462, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.9850, -1285.6458, 28.2602, 65.6462)
    },
    --TABLE 2
    {
        coords = vector3(115.4113, -1281.4491, 27.7602), offsetZ = -0.10, heading = 190.7147, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.4412, -1281.8812, 28.1022, 190.7147)
    },
    {
        coords = vector3(116.3726, -1281.2891, 27.7602), offsetZ = -0.10, heading = 189.5474, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.4035, -1281.9214, 28.2602, 189.5474)
    },
    {
        coords = vector3(117.2883, -1281.1525, 27.8831), offsetZ = -0.10, heading = 183.4660, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.3762, -1281.7017, 27.2602, 183.4660)
    },
    {
        coords = vector3(118.1986, -1281.3113, 27.8831), offsetZ = -0.10, heading = 160.0094, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.0707, -1281.8589, 27.2602, 160.0094)
    },
    {
        coords = vector3(118.9634, -1281.8427, 27.8831), offsetZ = -0.10, heading = 128.0857, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.5246, -1282.1819, 27.2589, 128.0857)
    },
    {
        coords = vector3(119.3103, -1282.6425, 27.8831), offsetZ = -0.10, heading = 99.1393, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.8130, -1282.7972, 27.2554, 99.1393)
    },
    --TABLE 6
    {
        coords = vector3(120.3339, -1284.1119, 27.8831), offsetZ = -0.10, heading = 209.9036, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.6591, -1284.5745, 27.2587, 209.9036)
    },
    {
        coords = vector3(121.4663, -1283.8474, 27.8831), offsetZ = -0.10, heading = 175.8504, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.2868, -1284.3159, 27.2602, 175.8504)
    },
    {
        coords = vector3(122.1494, -1284.5983, 27.8831), offsetZ = -0.10, heading = 125.3508, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.6713, -1284.8397, 27.2604, 125.3508)
    },
    {
        coords = vector3(122.4534, -1285.5507, 27.8831), offsetZ = -0.10, heading = 73.2978, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.9277, -1285.4055, 27.2557, 73.2978)
    },
    {
        coords = vector3(121.6319, -1286.3036, 27.8831), offsetZ = -0.10, heading = 37.6982, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.3505, -1285.8153, 27.2602, 37.6982)
    },
    --TABLE 7
    {
        coords = vector3(123.0713, -1286.7272, 27.8831), offsetZ = -0.10, heading = 187.9797, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.9451, -1287.2068, 27.2602, 187.9797)
    },
    {
        coords = vector3(123.8439, -1287.5515, 27.8831), offsetZ = -0.10, heading = 182.2098, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.2552, -1287.7681, 27.2602, 182.2098)
    },
    {
        coords = vector3(124.1546, -1288.4507, 27.8831), offsetZ = -0.10, heading = 76.7260, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.6182, -1288.3331, 27.2602, 76.7260)
    },
    {
        coords = vector3(123.4008, -1289.1797, 27.8831), offsetZ = -0.10, heading = 37.9876, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.0324, -1288.7502, 27.2602, 37.9876)
    },
    --TABLE 8
    {
        coords = vector3(124.3408, -1293.7279, 28.8183), offsetZ = -0.10, heading = 121.6098, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.8481, -1294.0190, 28.2693, 121.6098)
    },
    {
        coords = vector3(124.8770, -1294.6318, 28.8484), offsetZ = -0.10, heading = 115.1720, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.3108, -1294.7925, 28.2694, 115.1720)
    },
    {
        coords = vector3(124.4872, -1295.8425, 28.8484), offsetZ = -0.10, heading = 54.0744, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.1556, -1295.4296, 28.2694, 54.0744)
    },
    {
        coords = vector3(123.5813, -1296.3651, 28.8484), offsetZ = -0.10, heading = 26.8883, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.4196, -1295.8546, 28.2694, 26.8883)
    },
    {
        coords = vector3(122.4040, -1295.9778, 28.8484), offsetZ = -0.10, heading = 308.4721, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.8666, -1295.6416, 28.2694, 308.4721)
    },
    {
        coords = vector3(121.9062, -1295.1108, 28.8484), offsetZ = -0.10, heading = 311.0298, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.4075, -1294.8466, 28.2694, 311.0298)
    },
    --TABLE 9
    {
        coords = vector3(120.8525, -1295.6863, 28.8484), offsetZ = -0.10, heading = 124.4409, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.5119, -1296.0554, 28.2694, 124.4409)
    },
    {
        coords = vector3(121.4925, -1296.6168, 28.8484), offsetZ = -0.10, heading = 110.0061, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.9953, -1296.8926, 28.2694, 110.0061)
    },
    {
        coords = vector3(121.1351, -1297.8300, 28.8484), offsetZ = -0.10, heading = 22.9529, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.7976, -1297.3656, 28.2694, 22.9529)
    },
    {
        coords = vector3(120.2928, -1298.3162, 28.8484), offsetZ = -0.10, heading = 18.9943, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.9361, -1297.8619, 28.2694, 18.9943)
    },
    {
        coords = vector3(119.0261, -1297.9738, 28.8484), offsetZ = -0.10, heading = 306.0406, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.4664, -1297.5934, 28.2694, 306.0406)
    },
    {
        coords = vector3(118.5218, -1297.0306, 28.8484), offsetZ = -0.10, heading = 292.2786, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.0106, -1296.7721, 28.2694, 292.2786)
    },
    --TABLE 10
    {
        coords = vector3(112.7460, -1300.3533, 28.8484), offsetZ = -0.10, heading = 209.3583, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.0902, -1300.7990, 28.2927, 209.3583)
    },
    {
        coords = vector3(111.8175, -1300.9615, 28.8484), offsetZ = -0.10, heading = 207.3478, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.2105, -1301.3729, 28.2927, 207.3478)
    },
    {
        coords = vector3(111.0221, -1301.5034, 28.8484), offsetZ = -0.10, heading = 216.8274, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.3143, -1301.8555, 28.2927, 216.8274)
    },
    {
        coords = vector3(110.2212, -1302.0726, 28.8484), offsetZ = -0.10, heading = 260.2877, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.7265, -1302.2605, 28.3296, 260.2877)
    },
    {
        coords = vector3(110.5166, -1303.0498, 28.8484), offsetZ = -0.10, heading = 306.0406, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.0717, -1302.8835, 29.2924, 319.6523)
    },
    {
        coords = vector3(111.9851, -1305.6008, 28.8484), offsetZ = -0.10, heading = 307.5330, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.4165, -1305.3024, 28.3443, 307.5330)
    },
    {
        coords = vector3(112.7056, -1306.3507, 28.8484), offsetZ = -0.10, heading = 357.1729, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.8100, -1305.8630, 28.2927, 357.1729)
    },
    {
        coords = vector3(113.7458, -1305.9983, 28.8484), offsetZ = -0.10, heading = 26.2957, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.4625, -1305.6075, 28.2927, 26.2957)
    },
    {
        coords = vector3(115.5091, -1305.0121, 28.8484), offsetZ = -0.10, heading = 34.8896, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.1573, -1304.5172, 28.2927, 7.6775)
    },
    {
        coords = vector3(116.2858, -1304.3356, 28.8484), offsetZ = -0.10, heading = 73.7213, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.8083, -1304.1415, 28.2927, 73.7213)
    },
    {
        coords = vector3(115.9479, -1303.3240, 28.8484), offsetZ = -0.10, heading = 115.2382, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.4993, -1303.5592, 28.2927, 115.2382)
    },
    --TABLE 11
    {
        coords = vector3(117.2455, -1292.7332, 27.8831), offsetZ = -0.10, heading = 38.8528, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.9475, -1292.2291, 27.2602, 26.8228)
    },
    {
        coords = vector3(116.2019, -1293.0452, 27.8831), offsetZ = -0.10, heading = 348.4792, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.3668, -1292.5144, 27.2513, 342.3091)
    },
    {
        coords = vector3(115.5133, -1292.2919, 27.8831), offsetZ = -0.10, heading = 307.0855, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.9724, -1291.9591, 27.2555, 304.1265)
    },
    --SOFA1
    {
        coords = vector3(124.0078, -1279.5321, 28.8507), offsetZ = -0.10, heading = 208.5998, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.3146, -1279.9835, 28.2693, 208.5998)
    },
    {
        coords = vector3(125.0815, -1278.8871, 28.8507), offsetZ = -0.10, heading = 204.0523, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.3629, -1279.3873, 28.2693, 204.0523)
    },
    --SOFA2
    {
        coords = vector3(98.7329, -1290.4625, 28.8507), offsetZ = -0.10, heading = 119.2904, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(98.2758, -1290.8250, 28.2635, 125.6112)
    },
    {
        coords = vector3(98.0714, -1289.4818, 28.8507), offsetZ = -0.10, heading = 119.2904, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(97.5673, -1289.7594, 28.2635, 48.4941)
    },
    --OUTDOOR RIGHT
    {
        coords = vector3(140.3908, -1292.4805, 28.7917), offsetZ = -0.10, heading = 206.0273, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(140.5063, -1292.8107, 29.0649, 206.0273)
    },
    {
        coords = vector3(142.6317, -1293.0892, 28.8286), offsetZ = -0.10, heading = 117.7342, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(142.2495, -1293.2357, 29.1475, 117.7342)
    },
    {
        coords = vector3(141.9905, -1295.1641, 28.7914), offsetZ = -0.10, heading = 33.4626, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(141.8394, -1294.8636, 29.0588, 33.4626)
    },
    {
        coords = vector3(139.5479, -1296.8176, 28.7327), offsetZ = -0.10, heading = 118.6605, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(139.2957, -1296.9191, 28.9470, 118.6605)
    },
    {
        coords = vector3(137.2177, -1296.2754, 28.7327), offsetZ = -0.10, heading = 210.1840, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(137.3065, -1296.4803, 28.9087, 210.1840)
    },
    {
        coords = vector3(136.3725, -1298.7764, 28.7429), offsetZ = -0.10, heading = 303.8773, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(136.4875, -1298.7174, 28.8445, 303.8774)
    },
    --OUTDOOR LEFT
    {
        coords = vector3(125.3413, -1305.1324, 28.7327), offsetZ = -0.10, heading = 121.2180, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.0209, -1305.2782, 29.0104, 121.2180)
    },
    {
        coords = vector3(122.9679, -1304.5472, 28.7327), offsetZ = -0.10, heading = 205.7000, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.1069, -1304.9524, 29.0708, 205.7000)
    },
    {
        coords = vector3(122.2892, -1306.8877, 28.7327), offsetZ = -0.10, heading = 294.3576, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.6601, -1306.7700, 29.0398, 294.3576)
    },
    {
        coords = vector3(139.5479, -1296.8176, 28.7327), offsetZ = -0.10, heading = 118.6605, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(139.2957, -1296.9191, 28.9470, 118.6605)
    },
    {
        coords = vector3(119.5039, -1308.1726, 28.7327), offsetZ = -0.10, heading = 32.2515, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.2902, -1307.7245, 29.1247, 32.2515)
    },
    {
        coords = vector3(117.2118, -1307.5466, 28.7327), offsetZ = -0.10, heading = 298.4845, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.5793, -1307.4001, 29.0449, 298.4846)
    },
    {
        coords = vector3(117.8036, -1305.3748, 28.7327), offsetZ = -0.10, heading = 208.1004, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.9841, -1305.8367, 29.1242, 208.1004)
    },
    -- ARCADE SOFA 1
    {
        coords = vector3(139.9307, -1291.1533, 28.8292), offsetZ = -0.10, heading = 30.9677, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(139.6710, -1290.5759, 29.3182, 30.9677)
    },
    {
        coords = vector3(140.5392, -1290.9048, 28.8115), offsetZ = -0.10, heading = 31.3606, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(140.3552, -1290.5029, 29.1790, 31.3606)
    },
    {
        coords = vector3(141.4038, -1290.3267, 28.8630), offsetZ = -0.10, heading = 32.3270, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(141.2329, -1289.9698, 29.1783, 32.3270)
    },
        -- ARCADE SOFA 2
    {
        coords = vector3(140.0742, -1287.8339, 28.7696), offsetZ = -0.10, heading = 124.8017, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(139.7047, -1288.0308, 29.1001, 124.8017)
    },
    {
        coords = vector3(139.7385, -1287.2952, 28.7696), offsetZ = -0.10, heading = 122.5138, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(139.4444, -1287.4370, 29.0272, 122.5138)
    },
    {
        coords = vector3(139.2908, -1286.5044, 28.7696), offsetZ = -0.10, heading = 122.4548, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(138.9942, -1286.6471, 29.0293, 122.4548)
    },
        -- STRIP BEHIND BAR 1
    {
        coords = vector3(135.3287, -1279.7231, 28.7696), offsetZ = -0.10, heading = 123.4038, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(135.1366, -1279.8195, 28.9390, 123.4038)
    },
    {
        coords = vector3(134.9473, -1279.0620, 28.7696), offsetZ = -0.10, heading = 121.2741, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(134.6562, -1279.1948, 29.0220, 121.2741)
    },
    {
        coords = vector3(134.5110, -1278.3068, 28.7696), offsetZ = -0.10, heading = 122.1944, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(134.3970, -1278.3610, 28.8689, 122.1944)
    },
        -- STRIP BEHIND BAR 2
    {
        coords = vector3(133.0459, -1277.2662, 28.8523), offsetZ = -0.10, heading = 210.1980, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(133.2503, -1277.6626, 29.3915, 210.8987)
    },
    {
        coords = vector3(132.3843, -1277.6857, 28.7696), offsetZ = -0.10, heading = 212.7292, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(132.5279, -1277.9805, 29.0282, 212.7292)
    },
    {
        coords = vector3(131.5071, -1278.1870, 28.7694), offsetZ = -0.10, heading = 213.9936, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(131.7009, -1278.5634, 29.1037, 213.9936)
    },
            -- STRIP BEHIND BAR 3
    {
        coords = vector3(131.5682, -1280.0039, 28.7696), offsetZ = -0.10, heading = 302.0221, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(131.7831, -1279.9025, 28.9569, 302.0221)
    },
    {
        coords = vector3(132.0086, -1280.7616, 28.7696), offsetZ = -0.10, heading = 301.3287, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(132.2944, -1280.6310, 29.0175, 301.3287)
    },
    {
        coords = vector3(132.4203, -1281.4811, 28.7696), offsetZ = -0.10, heading = 303.5624, radius = 0.4, distance = 1.7,
        LeaveCoords = vector4(132.6324, -1281.3739, 28.9570, 303.5624)
    },
    --CHAIR1
    {
        coords = vector3(94.9903, -1293.7760, 28.7635), offsetZ = -0.10, heading = 317.4995, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(95.4699, -1293.3628, 29.2635, 317.4995)
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