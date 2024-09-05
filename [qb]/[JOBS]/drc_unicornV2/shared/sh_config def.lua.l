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
Config.Dispatch = { enabled = true, script = "linden_outlawalert" } -- cd_dispatch, linden_outlawalert, ps-disptach

Config.Inventory = "ox" -- ox, quasar, chezza, qb

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = true -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.NudityStrippers = false

Config.DisableDefaultMusic = false

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
    Seller =  { model = "s_m_y_devinsec_01", coords = vec4(118.7, -1295.48, 28.27, 304.5), scenario = "WORLD_HUMAN_SMOKING" },
    Locations = {
        {
            Title = "Private Lapdance cabin #1",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(118.44, -1301.37, 28.27), time = 4500 }
            },
            Anims = {
                { dict = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2", time = 120000 },
               -- { dict = "mini@strip_club@idles@stripper", anim = "stripper_idle_02", time = 20000 },
            },
            Models = {
                `csb_stripper_01`,
                `s_f_y_stripper_01`,
                `s_f_y_stripperlite`,
            },
        },
        {
            Title = "Private Lapdance cabin #2",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(115.71, -1301.48, 28.02), time = 8000 },
                { pos = vector3(116.18, -1302.42, 28.27), time = 2000 }
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
        {
            Title = "Private Lapdance cabin #3",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(115.42, -1301.79, 28.02), time = 8000 },
                { pos = vector3(115.04, -1300.99, 28.27), time = 2000 }
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
        {
            Title = "Private Lapdance cabin #4",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(113.42, -1302.91, 28.02), time = 8000 },
                { pos = vector3(114.14, -1303.66, 28.27), time = 2000 }
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
        {
            Title = "Private Lapdance cabin #5",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(113.42, -1302.91, 28.02), time = 8000 },
                { pos = vector3(113.16, -1302.1, 28.27), time = 2000 }
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
        {
            Title = "Private Lapdance cabin #6",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(111.61, -1303.97, 28.02), time = 8000 },
                { pos = vector3(112.17, -1304.76, 28.27), time = 2000 }
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
        {
            Title = "Private Lapdance cabin #7",
            Spawn = vec4(114.58, -1295.01, 28.27, 214.25),
            price = 200,
            coords = {
                { pos = vector3(115.8, -1297.0, 28.27), time = 4000 },
                { pos = vector3(117.63, -1300.44, 28.02), time = 7000 },
                { pos = vector3(111.61, -1303.97, 28.02), time = 8000 },
                { pos = vector3(111.28, -1303.17, 28.27), time = 2000 }
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
    }
}


Config.unicorn = {
    PoleEnabled = true,
    Poledance = {
        pole1 = { coords = vector3(104.2, -1294.0, 29.25), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole2 = { coords = vector3(102.24, -1290.63, 29.25), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
        pole3 = { coords = vector3(112.61, -1286.76, 28.46), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01"},
    },

    PrivateDances = {
        { coords = vector3(118.48, -1301.7, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(116.36, -1302.87, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(114.2, -1304.06, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(112.45, -1305.3, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(111.04, -1302.68, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(112.96, -1301.75, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
        { coords = vector3(114.86, -1300.71, 29.27), heading = 30.0, dict = 'mini@strip_club@private_dance@part1', anim = "priv_dance_p1"},
    },
    Lean = {
        { coords = vector3(114.31, -1290.02, 27.26), teleport = vector3(114.31, -1290.02, 27.26), heading = 32.93, pole = "pole1"},
        { coords = vector3(114.76, -1285.9, 27.26), teleport = vector3(114.76, -1285.9, 27.26), heading = 118.36, pole = "pole1"},
        { coords = vector3(110.94, -1284.3, 27.26), teleport = vector3(110.94, -1284.3, 27.26), heading = 205.33, pole = "pole1"},

        { coords = vector3(103.35, -1287.91, 27.26), teleport = vector3(103.35, -1287.91, 27.26), heading = 157.31, pole = "pole2"},
        { coords = vector3(100.82, -1287.93, 27.26), teleport = vector3(100.82, -1287.93, 27.26), heading = 211.07, pole = "pole2"},

        { coords = vector3(106.34, -1296.76, 27.26), teleport = vector3(106.34, -1296.76, 27.26), heading = 32.69, pole = "pole3"},
        { coords = vector3(107.43, -1294.58, 27.26), teleport = vector3(107.43, -1294.58, 27.26), heading = 77.48, pole = "pole3"},
    },

    Peds = {
        pole1 = { model = "s_f_y_stripper_01", coords = vector3(104.2, -1294.0, 29.25), dict = 'mini@strip_club@pole_dance@pole_dance2', anim = "pd_dance_02", stripper = true},
        pole2 = { model = "s_f_y_stripperlite", coords = vector3(102.24, -1290.63, 29.25), dict = 'mini@strip_club@pole_dance@pole_dance3', anim = "pd_dance_03", stripper = true},
        pole3 = { model = "csb_stripper_01", coords = vector3(112.61, -1286.76, 28.46), dict = 'mini@strip_club@pole_dance@pole_dance1', anim = "pd_dance_01", stripper = true},
    },

    PolyZone = {
        coords = vector3(119.98, -1289.29, 37.73), size = vec3(50.6, 40.6, 20), rotation = 211, debug = false, RemovePeds = true, radius = 50.0
    },

    AlertPolice = vec3(126.97, -1281.52, 28.99),
    AlarmButton = { enabled = true, coords = vec4(127.07, -1281.45, 28.91, 118.52) },

    Delivery = vec3(132.75, -1295.01, 29.6),
    Phone = { enabled = false, coords = vec4(131.5, -1288.68, 29.79, 210.46) },

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
            coords = vector3(130.3844, -1286.3746, 28.9845),
            radius = 0.3,
            debug = false,
            WaterStream = vector3(129.9891, -1286.1013, 29.2077),
        --[[},
        BackBar = {
            coords = vector3(-1374.89, -627.13, 30.81),
            radius = 0.7,
            debug = false,

            WaterStream = vector3(-1374.72, -626.84, 31.0),]]
        },
    },

    DJ = { coords = vec3(120.08, -1281.7, 29.45), radius = 1.5, playingradius = 31, defaultvol = 0.2, Playing = false },

    Duty = {
        Main = { coords = vector3(102.3134, -1299.5570, 29.6036), radius = 0.7, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(104.33, -1303.82, 28.49), radius = 0.9, debug = true },
    },

    Stashes = {

        Main = {
            name = "Unicorn_Refregiator1",
            label = "Unicorn Refregiator 1",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(132.8, -1286.14, 28.78),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiato2 = {
            name = "Unicorn_Refregiator2",
            label = "Unicorn Refregiator 2",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(131.98, -1284.96, 28.77),
            radius = 0.5,
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
            coords = vector3(131.31, -1283.89, 28.82),
            radius = 0.35,
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
            coords = vector3(130.03, -1281.37, 28.77),
            radius = 0.5,
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
            coords = vector3(129.22, -1279.98, 28.72),
            radius = 0.5,
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
            coords = vector3(129.04, -1284.03, 28.77),
            radius = 0.5,
            debug = false,
            job = "unicorn"
        },

        Refregiato7 = {
            name = "Unicorn_Refregiator7",
            label = "Unicorn Refregiator 7",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(128.3, -1282.65, 28.82),
            radius = 0.38,
            debug = false,
            job = "unicorn"
        },

        Refregiato8 = {
            name = "Unicorn_Refregiator8",
            label = "Unicorn Refregiator 8",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(129.77, -1285.51, 28.62),
            radius = 0.38,
            debug = false,
            job = "unicorn"
        },

        Refregiato9 = {
            name = "Unicorn_Refregiator9",
            label = "Unicorn Refregiator 9",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(93.04, -1291.12, 29.27),
            radius = 0.5,
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
            coords = vector3(124.23, -1283.19, 28.93),
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
            coords = vector3(124.41, -1285.47, 28.98),
            radius = 0.5,
            debug = false
        },

        Table3 = {
            name = "Unicorn_Table3",
            label = "Unicorn Table 3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(125.65, -1287.72, 28.99),
            radius = 0.5,
            debug = false
        },

        Table4 = {
            name = "Unicorn_Table4",
            label = "Unicorn Table 4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(122.72, -1288.26, 27.91),
            radius = 0.5,
            debug = false
        },

        Table5 = {
            name = "Unicorn_Table5",
            label = "Unicorn Table 5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(121.78, -1286.56, 27.77),
            radius = 0.5,
            debug = false
        },

        Table6 = {
            name = "Unicorn_Table6",
            label = "Unicorn Table 6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(120.79, -1284.88, 27.97),
            radius = 0.5,
            debug = false
        },

        Table7 = {
            name = "Unicorn_Table7",
            label = "Unicorn Table 7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(118.77, -1282.6, 27.97),
            radius = 0.55,
            debug = false
        },

        Table8 = {
            name = "Unicorn_Table8",
            label = "Unicorn Table 8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(105.89, -1283.51, 27.86),
            radius = 0.5,
            debug = false
        },

        Table9 = {
            name = "Unicorn_Table9",
            label = "Unicorn Table 9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(102.32, -1285.6, 27.86),
            radius = 0.5,
            debug = false
        },

        Table10 = {
            name = "Unicorn_Table10",
            label = "Unicorn Table 10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(111.75, -1294.07, 28.01), 
            radius = 0.5,
            debug = false
        },

        Table11 = {
            name = "Unicorn_Table11",
            label = "Unicorn Table 11",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(107.9, -1296.23, 27.81),
            radius = 0.5,
            debug = false
        },

    },

    BossMenu = {
        Main = { coords = vector3(95.77, -1293.17, 29.26), radius = 0.55, debug = false },
    },

    IceMachine = {
        FrontBar = { coords = vector3(128.01, -1281.78, 29.27), radius = 0.45, debug = false },
    },

    Registers = {
        FrontBar = { coords = vector3(129.05, -1285.03, 29.27), radius = 0.45, debug = false, amount = 0 },
    },

    DancePlatforms = {
        DJ = { coords = vector3(120.5862, -1281.3948, 29.4805), radius = 0.7, debug = false,
            dict = "anim@amb@nightclub@djs@dixon@", anim = "dixn_dance_cntr_open_dix" },
    },

    -- Here, we're not using any teleports, so we just put it underground.. if you want it, you can change coords
    Teleports = {
        FrontBar = {
            coords = vector3(130.22, -1287.56, 29.12),
            radius = 0.8,
            debug = false,
            BehindCoords = { coords = vector3(131.4595, -1286.6543, 28.2750), heading = 128.9888 },
            FrontCoords = { coords = vector3(129.7043, -1287.7062, 28.2797), heading = 304.0650 },
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
            { item = "bar_bowl", count = 1, remove = true },
            { item = "nuts", count = 1, remove = true },
        },
        AddItems = {
            { item = "bar_nuts", count = 1 },
        }
    },
    BowlBeans = {
        Title = "Bowl of beans",
        description = "Requirements: Bowl, Beans",
        RequiredItems = {
            { item = "bar_bowl", count = 1, remove = true },
            { item = "beans", count = 1, remove = true },
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
        BlipCoords = vec3(124.22, -1487.95, 28.14), -- Blip coords
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
        { model = "mp_m_shopkeep_01", coords = vec4(124.22, -1487.95, 28.14, 53.63), scenario = "WORLD_HUMAN_SMOKING" },
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
        coords = vector3(124.8843, -1282.7286, 28.8527), offsetZ = -0.10, heading = 124.7589, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.4445, -1283.4063, 29.2824, 34.0343)
    },
    {
        coords = vector3(123.4632, -1283.5830, 28.8527), offsetZ = -0.10, heading = 299.1101, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(109.5518, -1291.8939, 28.2602, 23.7923)
    },
    {
        coords = vector3(124.7727, -1284.6920, 28.8527), offsetZ = -0.10, heading = 138.0630, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.2462, -1284.2748, 29.2868, 159.1692)
    },
    {
        coords = vector3(125.0180, -1285.7603, 28.8527), offsetZ = -0.10, heading = 72.0487, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.8759, -1286.4352, 29.2880, 36.1799)
    },

    {
        coords = vector3(126.2204, -1287.1541, 28.8527), offsetZ = -0.10, heading = 134.3776, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(125.9120, -1286.5114, 29.2861, 157.8897)
    },
    {
        coords = vector3(126.0598, -1288.4303, 28.8527), offsetZ = -0.10, heading = 33.0098, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(126.7428, -1288.2937, 29.2865, 110.3629)
    },
    --TABLE 2
    {
        coords = vector3(124.5265, -1294.3115, 28.8527), offsetZ = -0.10, heading = 126.8070, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.1598, -1294.6217, 29.2691, 119.1764)
    },
    {
        coords = vector3(124.3568, -1295.5372, 28.8527), offsetZ = -0.10, heading = 32.8256, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(124.0858, -1295.1290, 29.3068, 24.8815)
    },
    {
        coords = vector3(123.6490, -1295.8667, 28.8527), offsetZ = -0.10, heading = 38.3890, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(123.3461, -1295.5397, 29.2861, 30.4656)
    },
    {
        coords = vector3(122.5528, -1295.7767, 28.8527), offsetZ = -0.10, heading = 315.3800, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.9623, -1295.4003, 29.2684, 309.6602)
    },
    --TABLE 3
    {
        coords = vector3(121.3747, -1296.3170, 28.8527), offsetZ = -0.10, heading = 134.1628, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.0100, -1296.4789, 29.3612, 109.7189)
    },
    {
        coords = vector3(121.0868, -1297.3658, 28.8527), offsetZ = -0.10, heading = 38.443, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.8557, -1296.9607, 29.2684, 37.9998)
    },
    {
        coords = vector3(120.4173, -1297.7954, 28.8527), offsetZ = -0.10, heading = 22.1649, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.1015, -1297.4119, 29.2832, 61.7872)
    },
    {
        coords = vector3(119.3683, -1297.6309, 28.8527), offsetZ = -0.10, heading = 308.5934, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.7016, -1297.2512, 29.2934, 299.6207)
    },
    --TABLE 4
    {
        coords = vector3(118.3126, -1281.0762, 27.8222), offsetZ = -0.10, heading = 149.4354, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(117.9620, -1281.6014, 28.2752, 146.4492)
    },
    {
        coords = vector3(119.8834, -1283.6519, 27.8222), offsetZ = -0.10, heading = 89.2487, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(119.1191, -1283.6265, 28.2789, 78.3978)
    },
    {
        coords = vector3(121.3120, -1283.7991, 27.8222), offsetZ = -0.10, heading = 138.0062, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(120.1013, -1284.6578, 28.2782, 214.6958)
    },
    {
        coords = vector3(122.0892, -1285.1782, 27.8222), offsetZ = -0.10, heading = 140.5415, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(121.2387, -1285.5591, 28.2627, 122.9263)
    },
    {
        coords = vector3(122.9505, -1286.6978, 27.8222), offsetZ = -0.10, heading = 112.3235, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(122.4687, -1287.0029, 28.2609, 130.7378)
    },
    {
        coords = vector3(123.6950, -1288.7998, 27.8222), offsetZ = -0.10, heading = 24.5922, radius = 1.0, distance = 1.7,
        LeaveCoords = vector4(121.8004, -1287.9277, 28.2609, 97.5895)
    },
    --TABLE 5
    {
        coords = vector3(112.9996, -1293.2510, 27.8222), offsetZ = -0.10, heading = 106.2189, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.2465, -1293.2581, 28.2610, 89.3768)
    },
    {
        coords = vector3(110.4511, -1294.8969, 27.8222), offsetZ = -0.10, heading = 299.3090, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.7181, -1294.1075, 28.2610, 14.5313)
    },
    {
        coords = vector3(109.3155, -1295.3870, 27.8222), offsetZ = -0.10, heading = 102.7758, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(108.3880, -1295.4631, 28.2610, 99.3453)
    },
    {
        coords = vector3(106.5998, -1296.9868, 27.8222), offsetZ = -0.10, heading = 319.4055, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.0371, -1296.3243, 28.2610, 64.1895)
    },
    --TABLE 6
    {
        coords = vector3(109.1235, -1292.2389, 27.8222), offsetZ = -0.10, heading = 52.2837, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(109.4238, -1292.8506, 28.2609, 347.7061)
    },
    {
        coords = vector3(110.1325, -1291.6455, 27.8222), offsetZ = -0.10, heading = 25.4782, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.5631, -1292.1392, 28.2609, 42.6171)
    },
    {
        coords = vector3(111.4196, -1290.8890, 27.8222), offsetZ = -0.10, heading = 33.1275, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(111.7172, -1291.5071, 28.2609, 15.5804)
    },
    --TABLE 7
    {
        coords = vector3(116.8310, -1288.5288, 27.8222), offsetZ = -0.10, heading = 91.0768, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.1303, -1288.5201, 28.2610, 85.9810)
    },
    {
        coords = vector3(116.1389, -1286.5001, 27.8222), offsetZ = -0.10, heading = 120.7214, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(115.3225, -1286.7704, 28.2614, 70.8598)
    },
    {
        coords = vector3(114.9849, -1284.6700, 27.8222), offsetZ = -0.10, heading = 124.6503, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.1866, -1284.9348, 28.2641, 111.7996)
    },
    {
        coords = vector3(113.8080, -1282.9146, 27.8222), offsetZ = -0.10, heading = 138.7681, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(113.3735, -1283.5835, 28.2661, 167.3538)
    },
    --TABLE 8
    {
        coords = vector3(108.4791, -1285.8140, 27.8222), offsetZ = -0.10, heading = 245.3286, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.8747, -1285.4504, 28.2610, 226.9757)
    },
    {
        coords = vector3(106.7119, -1286.8359, 27.8222), offsetZ = -0.10, heading = 222.0797, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(106.3155, -1286.2839, 28.2610, 203.6313)
    },
    {
        coords = vector3(104.8078, -1288.0243, 27.8222), offsetZ = -0.10, heading = 180.1841, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(104.7855, -1287.2441, 28.2610, 197.5137)
    },
    --TABLE 9
    {
        coords = vector3(107.1545, -1282.9089, 27.8222), offsetZ = -0.10, heading = 154.0490, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(107.0886, -1283.6404, 28.2609, 122.1405)
    },
    {
        coords = vector3(104.7625, -1284.2616, 27.8222), offsetZ = -0.10, heading = 293.5667, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(105.6677, -1284.2567, 28.2609, 241.1432)
    },
    {
        coords = vector3(103.3476, -1284.9879, 27.8222), offsetZ = -0.10, heading = 204.4641, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(103.8210, -1285.5314, 28.2609, 164.6384)
    },
    {
        coords = vector3(101.0981, -1286.2946, 27.8222), offsetZ = -0.10, heading = 310.8039, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(101.9531, -1286.3417, 28.2609, 287.4625)
    },
    --TABLE 10
    {
        coords = vector3(110.6441, -1301.7236, 28.8186), offsetZ = -0.10, heading = 212.5608, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(110.9296, -1302.3605, 29.2695, 205.3210)
    },
    {
        coords = vector3(113.0880, -1306.2363, 28.8186), offsetZ = -0.10, heading = 25.2723, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.6864, -1305.6569, 29.2695, 26.8892)
    },
    {
        coords = vector3(114.8358, -1305.1893, 28.8186), offsetZ = -0.10, heading = 345.2220, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.6591, -1304.6100, 29.2695, 30.4387)
    },
    {
        coords = vector3(112.3452, -1300.7582, 28.8186), offsetZ = -0.10, heading = 245.9223, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(112.5911, -1301.3589, 29.2692, 269.6539)
    },
    {
        coords = vector3(114.2228, -1299.6460, 28.8186), offsetZ = -0.10, heading = 218.3685, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(114.5637, -1300.1528, 29.2689, 209.7597)
    },
    {
        coords = vector3(117.0021, -1303.9529, 28.8186), offsetZ = -0.10, heading = 32.6807, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(116.6289, -1303.3928, 29.2695, 57.8464)
    },
    {
        coords = vector3(119.1272, -1302.7494, 28.8186), offsetZ = -0.10, heading = 24.2936, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(118.8595, -1302.1360, 29.2694, 32.3086)
    },
    --SOFA1
    {
        coords = vector3(95.0648, -1289.6490, 28.8333), offsetZ = -0.10, heading = 203.2062, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(95.4691, -1290.1320, 29.2687, 205.9125)
    },
    {
        coords = vector3(94.0869, -1290.2772, 28.8333), offsetZ = -0.10, heading = 238.5555, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(94.4902, -1290.7908, 29.2687, 265.3612)
    },
    --CHAIR1
    {
        coords = vector3(95.2360, -1293.4696, 28.8567), offsetZ = -0.10, heading = 330.2567, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(94.6510, -1292.7789, 29.2635, 52.0339)
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