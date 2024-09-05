Shared = Shared or {}

Shared.Debug = false
Shared.Resource = GetCurrentResourceName()

--- MLO Settings
Shared.FleecaBanks = 'default' -- 'default', 'gabz' or 'K4MB1' for fleeca bank MLO

--- Compatibility Settings
Shared.DoorLock = 'ox' -- 'nui' or 'qb' or 'ox'
Shared.Notify = 'qb' -- 'ox' for ox_lib or 'qb' for QBCore.Functions.Notify
Shared.Phone = 'lb-phone' -- 'QBCore' or 'GKS' or 'Qs' or 'lb-phone' or edit utils files for others
Shared.Inventory = 'ox_inventory' -- 'ox_inventory' or 'qb'

--- Laptop Settings
Shared.LaptopMoneyType = 'cash' -- Any QBCore moneytype: 'cash' / 'bank' / 'crypto'
Shared.LaptopUses = 3
Shared.Laptop = {
    green = {
        coords = vector4(2892.58, 4371.02, 50.31, 270.88),
        price = 21,
        pedModel = 'hc_hacker',
        usb = 'usb_green',
        reward = 'laptop_green'
    },
    blue = {
        coords = vector4(-90.95, -2577.8, 6.0, 102.77),
        price = 38,
        pedModel = 'g_f_y_vagos_01',
        usb = 'usb_blue',
        reward = 'laptop_blue'
    },
    red = {
        coords = vector4(2574.85, 1283.87, 44.54, 302.55),
        price = 54,
        pedModel = 'ig_talcc',
        usb = 'usb_red',
        reward = 'laptop_red'
    },
    gold = {
        coords = vector4(319.6, 2883.25, 46.38, 309.14),
        price = 54,
        pedModel = 's_f_y_clubbar_01',
        usb = 'usb_gold',
        reward = 'laptop_gold'
    },
    grey = {
        coords = vector4(-443.65, 288.33, 83.23, 43.01),
        price = 291,
        pedModel = 'g_f_importexport_01',
        usb = nil,
        reward = 'usb_grey'
    }
}

--- Minimum Cop Requirements
Shared.MinCops = {
    fleeca = 4,
    maze = 50,
    paleto = 6,
    pacific = 70,
    vault = 80
}

--- Banktype cooldown
Shared.Cooldown = { -- These cooldowns start the second the bank is successfully hacked, time in minutes
    fleeca = 30,
    maze = 45,
    paleto = 45,
    pacific = 60,
    vault = 60
}

--- Minigame Settings
Shared.MinigameSettings = {
    laptop = {
        ['fleeca'] = { time = 20, blocks = 4, amount = 3 },
        ['maze'] = { time = 11, blocks = 3, amount = 4 },
        ['paleto'] = { time = 12, blocks = 4, amount = 4 },
        ['pacific'] = { time = 12, blocks = 5, amount = 4 },
        ['vault'] = { time = 12, blocks = 6, amount = 4 }
    },
    thermite = {
        grideSize = 6,
        incorrectBlocks = 4,
        timetoShow = 10,
        timetoLose = 20
    },
    lightsOut = { grid = 1, maxClicks = 50 }, -- Used for every locker (drilling)
    numbers = { numbersLength = 4, timer = 15, showTime = 15 }, -- Used at Grey USB for Vault
}

--- Bank Settings
Shared.BankSettings = {
    VaultUnlockTime = 10, -- Time in seconds for when the vault door opens after laptop hack
    VaultMaxFlags = 3, -- Maximum amount of fails for entering the code
}

Shared.Banks = {
    ['PinkCage'] = {
        label = 'Pink Cage Motels',
        type = 'fleeca',
        coords = vector3(311.15, -284.49, 54.16),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(311.15, -284.49, 54.16), object = `v_ilev_gb_vauldr`, closed = 250.0, open = 160.0 },
        camId = 21,
        laptop = vector4(311.57, -284.0903, 53.974, 259.00),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(315.03, -288.31, 54.14, 249.50) },
            [2] = { busy = false, taken = false, coords = vector4(315.92, -285.14, 54.14, 249.50) },
            [3] = { busy = false, taken = false, coords = vector4(312.47, -289.45, 54.16, 159.50) },
            [4] = { busy = false, taken = false, coords = vector4(310.79, -286.92, 54.16, 249.50) },
            [5] = { busy = false, taken = false, coords = vector4(314.13, -283.07, 54.16, 159.50) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(313.47702, -289.2542, 54.1431, 320.27249) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(311.61235, -287.6962, 54.143051, 305.18524) }
        }
    },
    ['Legion'] = {
        label = 'Legion Square',
        type = 'fleeca',
        coords = vector3(146.92, -1046.11, 29.36),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(146.92, -1046.11, 29.36), object = `v_ilev_gb_vauldr`, closed = 250.0, open = 150.0 },
        camId = 22,
        laptop = vector4(148.10859, -1046.593, 30.00808, 246.72924),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(151.54, -1046.71, 29.35, 250.00) },
            [2] = { busy = false, taken = false, coords = vector4(150.81, -1050.10, 29.35, 250.00) },
            [3] = { busy = false, taken = false, coords = vector4(148.12, -1051.03, 29.35, 160.00) },
            [4] = { busy = false, taken = false, coords = vector4(146.58, -1048.51, 29.35, 250.00) },
            [5] = { busy = false, taken = false, coords = vector4(149.84, -1044.70, 29.35, 160.00) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(147.13935, -1049.607, 29.34633, 311.47201) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(149.51391, -1050.767, 29.346384, 291.46362) }
        }
    },
    ['Hawick'] = {
        label = 'Hawick Ave',
        type = 'fleeca',
        coords = vector3(-353.82, -55.37, 49.03),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(-353.82, -55.37, 49.03), object = `v_ilev_gb_vauldr`, closed = 250.0, open = 150.0 },
        camId = 23,
        laptop = vector4(-354.08, -55.27648, 49.8666, 257.45),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(-349.16, -55.93, 49.01, 250.00) },
            [2] = { busy = false, taken = false, coords = vector4(-349.98, -59.1, 49.01, 250.00) },
            [3] = { busy = false, taken = false, coords = vector4(-352.70, -60.14, 49.01, 160.00) },
            [4] = { busy = false, taken = false, coords = vector4(-354.07, -57.75, 49.01, 250.00) },
            [5] = { busy = false, taken = false, coords = vector4(-350.95, -53.85, 49.01, 160.00) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(-353.644, -59.04, 49.0148, 309.626) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(-351.6271, -59.91, 49.0148, 296.23211) }
        }
    },
    ['DelPerro'] = {
        label = 'Del Perro Blvd',
        type = 'fleeca',
        coords = vector3(-1210.77, -336.57, 37.78),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(-1210.77, -336.57, 37.78), object = `v_ilev_gb_vauldr`, closed = 296.863, open = 196.863 },
        camId = 24,
        laptop = vector4(-1209.822, -336.4793, 37.381, 299.439),
        lockers = { 
            [1] = { busy = false, taken = false, coords = vector4(-1207.14, -333.59, 37.76, 297.0) },
            [2] = { busy = false, taken = false, coords = vector4(-1205.28, -336.56, 37.76, 297.0) },
            [3] = { busy = false, taken = false, coords = vector4(-1209.7, -333.31, 37.76, 207.0) },
            [4] = { busy = false, taken = false, coords = vector4(-1206.52, -339.17, 37.76, 207.0) },
            [5] = { busy = false, taken = false, coords = vector4(-1209.34, -338.3, 37.76, 297.0) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(-1207.97, -338.9731, 37.759284, 353.9089) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(-1205.895, -338.0665, 37.759326, 340.50067) }
        }
    },
    ['GreatOcean'] = {
        label = 'Great Ocean Hwy',
        type = 'fleeca',
        coords = vector3(-2956.55, 481.74, 15.69),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(-2956.55, 481.74, 15.69), object = `hei_prop_heist_sec_door`, closed = 357.542, open = 257.542 },
        camId = 25,
        laptop = vector4(-2956.564, 481.957, 15.297, 347.02),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(-2958.77, 484.18, 15.68, 268.0) },
            [2] = { busy = false, taken = false, coords = vector4(-2957.33, 486.25, 15.68, 358.0) },
            [3] = { busy = false, taken = false, coords = vector4(-2954.02, 486.69, 15.68, 358.0) },
            [4] = { busy = false, taken = false, coords = vector4(-2952.23, 484.32, 15.68, 268.0) },
            [5] = { busy = false, taken = false, coords = vector4(-2954.27, 482.06, 15.68, 358.0) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(-2953.083, 482.7803, 15.675336, 49.137405) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(-2952.881, 485.22781, 15.675389, 37.428142) }
        }
    },
    ['Sandy'] = {
        label = 'Sandy Shores',
        type = 'fleeca',
        coords = vector3(1175.28, 2712.72, 38.08),
        size = 15,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(1175.28, 2712.72, 38.08), object = `v_ilev_gb_vauldr`, closed = 90.00, open = 0.00 },
        camId = 99,
        laptop = vector4(1175.34, 2713.09, 39.35, 84.60),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(1171.43, 2711.87, 38.07, 91.2) },
            [2] = { busy = false, taken = false, coords = vector4(1170.89, 2715.25, 38.07, 91.2) },
            [3] = { busy = false, taken = false, coords = vector4(1173.29, 2717.18, 38.09, 1.2) },
            [4] = { busy = false, taken = false, coords = vector4(1173.65, 2710.27, 38.07, 181.2) },
            [5] = { busy = false, taken = false, coords = vector4(1175.75, 2715.18, 38.07, 91.2) },
        },
        trolly = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(1174.6406, 2716.2036, 38.066295, 141.10868) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(1171.6578, 2716.2761, 38.066303, 231.91242) }
        }
    },
    ['Maze'] = {
        label = 'Maze Bank',
        type = 'maze',
        coords = vector3(-1306.05, -816.82, 17.3),
        size = 25,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(-1306.05, -816.82, 17.3), object = `v_ilev_bk_vaultdoor`, closed = 37.0, open = -133.0 },
        camId = 99,
        laptop = vector4(-1304.17, -816.56, 18.05, 311.46),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(-1307.53, -810.4, 17.15, 307.00) },
            [2] = { busy = false, taken = false, coords = vector4(-1311.2, -813.01, 17.15, 126.65) },
            [3] = { busy = false, taken = false, coords = vector4(-1310.35, -810.21, 17.15, 36.57) },
        },
        trolly = {
            [1] = { type = 'money', taken = false, coords = vector4(-1310.97, -811.23, 17.15, 221.28) },
            [2] = { type = 'gold', taken = false, coords = vector4(-1308.99, -809.94, 17.15, 187.48) },
        },
        thermite = {
            [1] = { coords = vector4(-1305.3, -819.80, 17.20, 38.56), ptfx = vector3(-1305.40, -818.70, 17.20), doorId = 'bankrobbery-mazethermite1', hit = false },
            [2] = { coords = vector4(-1308.46, -814.2, 17.20, 38.56), ptfx = vector3(-1308.57, -813.1, 17.20), doorId = 'bankrobbery-mazethermite2', hit = false }, 
        }
    },
    ['Paleto'] = {
        label = 'Blaine County Savings Bank',
        type = 'paleto',
        coords = vector3(-105.61, 6472.03, 31.62),
        size = 15,
        outsideHack = false,
        hacked = false,
        policeClose = false,
        vaultDoor = { coords = vector3(-105.61, 6472.03, 31.62), object = -1185205679, closed = 45.45, open = 145.45 },
        camId = 26,
        laptop = vector4(-109.6426, 6483.5849, 31.00846, 223.6921),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(-107.37, 6473.08, 31.63, 133.94) },
            [2] = { busy = false, taken = false, coords = vector4(-107.99, 6475.9, 31.63, 44.67) },
            [3] = { busy = false, taken = false, coords = vector4(-102.84, 6478.43, 31.63, 315.79) },
            [4] = { busy = false, taken = false, coords = vector4(-102.47, 6475.33, 31.63, 225.12) }
        },
        trolly = {
            [1] = { type = 'money', taken = false, coords = vector4(-106.2033, 6477.7485, 31.626792, 175.3149) },
            [2] = { type = 'money', taken = false, coords = vector4(-104.9971, 6478.7548, 31.649032, 257.95233) }
        },
        thermite = {
            [1] = { coords = vector4(-105.39, 6475.02, 31.83, 313.00), ptfx = vector3(-105.49, 6476.0, 31.92), doorId = 'bankrobbery-paletothermite', hit = false }
        }
    },
    ['Pacific'] = {
        label = 'Pacific Standard Bank',
        type = 'pacific',
        coords = {
            vec3(253.60, 229.76, 104.0),
            vec3(247.85, 218.05, 104.0),
            vec3(265.85, 211.15, 104.0),
            vec3(270.15, 224.05, 104.0),
        },
        size = 6,
        hacked = false,
        card = false,
        cardDoor = 'bankrobbery-pacificcard',
        policeClose = false,
        vaultDoor = { coords = vector3(253.76, 223.56, 101.68), object = 961976194, closed = 160.0, open = 35.0 },
        camId = 26,
        laptop = vector4(253.18, 228.24, 101.42, 72.19),
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(259.9, 218.46, 101.68, 340.0) },
            [2] = { busy = false, taken = false, coords = vector4(257.11, 214.04, 101.68, 160.0) },
            [3] = { busy = false, taken = false, coords = vector4(264.86, 216.63, 101.68, 340.0) },
            [4] = { busy = false, taken = false, coords = vector4(263.38, 211.85, 101.68, 160.0) },
            [5] = { busy = false, taken = false, coords = vector4(266.44, 213.44, 101.68, 250.0) },
        },
        trolly = {
            [1] = { type = 'gold', taken = false, coords = vector4(263.58, 216.02, 101.68, 108.98) },
            [2] = { type = 'gold', taken = false, coords = vector4(265.53, 213.55, 101.68, 154.02) },
            [3] = { type = 'money', taken = false, coords = vector4(262.24, 213.16, 101.68, 31.58) },
            [4] = { type = 'money', taken = false, coords = vector4(259.32, 214.94, 101.68, 114.46) }
        },
        thermite = {
            [1] = {
                coords = vector4(257.37, 220.22, 106.39, 342.15),
                ptfx = vector3(257.45, 221.22, 106.39),
                doorId = 'bankrobbery-pacificthermite1',
                hit = false
            },
            [2] = {
                coords = vector4(253.01703, 220.73141, 101.78381, 162.6746),
                ptfx = vector3(253.11703, 221.53141, 101.78381),
                doorId = 'bankrobbery-pacificthermite2',
                hit = false
            },
            [3] = {
                coords = vector4(261.66752, 215.73648, 101.78382, 261.99899),
                ptfx = vector3(261.69946, 216.82735, 101.78382),
                doorId = 'bankrobbery-pacificthermite3',
                hit = false
            }
        }
    },
    ['Vault'] = {
        label = 'Pacific Lower Vault',
        type = 'vault',
        coords = vector3(259.51, 247.61, 101.69),
        size = 19,
        lockdown = false,
        goldhacked = false,
        laptopDoor = 'bankrobbery-pacificextended',
        hacked = false,
        code = false,
        policeClose = false,
        vaultDoor = { coords = vector3(259.51, 247.61, 101.69), object = -1520917551, closed = 160.0, open = 295.0 },
        laptop = vector4(257.5, 227.83, 101.42, 345.84),
        stacks = {
            [1] = { type = 'money', busy = false, taken = false, coords = vector4(265.812, 241.233, 101.581, 250.0) },
            [2] = { type = 'money', busy = false, taken = false, coords = vector4(268.112, 247.533, 101.581, 250.0) },
            [3] = { type = 'money', busy = false, taken = false, coords = vector4(254.062, 258.454, 101.581, 70.0) },
            [4] = { type = 'gold', busy = false, taken = false, coords = vector4(250.019, 247.602, 101.581, 70.0) },
            [5] = { type = 'gold', busy = false, taken = false, coords = vector4(251.988, 252.979, 101.581, 70.0) }
        },
        lockers = {
            [1] = { busy = false, taken = false, coords = vector4(261.67, 234.51, 101.68, 250.0) },
            [2] = { busy = false, taken = false, coords = vector4(259.79, 232.97, 101.68, 340.0) },
            [3] = { busy = false, taken = false, coords = vector4(257.46, 234.39, 101.68, 160.0) }
        },
        trolly = {
            [1] = { type = 'gold', taken = false, coords = vector4(262.67, 262.21, 101.68, 200.53) },
            [2] = { type = 'gold', taken = false, coords = vector4(266.18, 260.96, 101.68, 114.51) },
            [3] = { type = 'money', taken = false, coords = vector4(266.05, 258.54, 101.68, 70.56) },
            [4] = { type = 'money', taken = false, coords = vector4(261.49, 260.25, 101.68, 287.52) }
        },
        explosion = {
            [1] = vector4(255.35, 245.21, 101.74, 70.0),
            [2] = vector4(260.50, 243.08, 101.74, 250.0),
            [3] = vector4(257.41, 251.00, 101.74, 70.0),
            [4] = vector4(262.43, 248.50, 101.74, 250.0),
            [5] = vector4(259.43, 256.39, 101.74, 70.0)
        }
    },
}

--- This updates the vaultdoor modelhashes and laptop animation coords depending on what MLO setting is selected

CreateThread(function()
    if Shared.FleecaBanks == 'K4MB1' then
        Shared.Banks['PinkCage'].vaultDoor.object = 839234948
        Shared.Banks['Legion'].vaultDoor.object = 839234948
        Shared.Banks['Hawick'].vaultDoor.object = 839234948
        Shared.Banks['DelPerro'].vaultDoor.object = 839234948
        Shared.Banks['Sandy'].vaultDoor.object = 839234948
    elseif Shared.FleecaBanks == 'gabz' then
        Shared.Banks['PinkCage'].laptop = vector4(311.14, -284.03, 53.974, 160.00)
        Shared.Banks['Legion'].laptop = vector4(147.60, -1046.86, 30.008, 160.00)
        Shared.Banks['Hawick'].laptop = vector4(-354.55, -55.26, 49.86, 160.00)
        Shared.Banks['DelPerro'].laptop = vector4(-1210.53, -336.78, 37.381, 206.00)
        Shared.Banks['GreatOcean'].laptop = vector4(-2956.07, 481.64, 15.297, 268.00)
        Shared.Banks['Sandy'].laptop = vector4(1175.81, 2713.26, 39.35, 359.96)
        Shared.Banks['GreatOcean'].vaultDoor.object = `v_ilev_gb_vauldr`
    end
end)
