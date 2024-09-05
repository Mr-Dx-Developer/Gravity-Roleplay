-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local seconds, minutes = 1000, 60000
Config = {}

-------------------------------------------------------------------
-- TO MODIFY NOTIFICATIONS TO YOUR OWN CUSTOM NOTIFICATIONS:-------
-------------- Navigate to wasabi_bridge/customize/ ---------------
-------------------------------------------------------------------
Config.CheckForUpdates = true -- Check for updates? Who would not want to know updates!?

-- Language Options are
-- 'en' (English)
-- 'fr' (French)
-- 'cn' (Chinese Simplified)
-- 'tw' (Chinese Traditional)
-- 'de' (German)
-- 'it' (Italian)
-- 'jp' (Japanese)
-- 'ko' (Korean)
-- 'pl' (Polish)
-- 'pt' (Portuguese)
-- 'es' (Spanish)
-- 'hi' (Hindi)
-- 'nl' (Dutch)
-- 'da' (Danish)
-- 'cs' (Czech)
-- If you would like us to add a language, join our discord and create a ticket!
-- All locale strings can be found in /game/configuration/locales/
Config.Language = 'en'
Config.UIColor = '#0390fc'   -- Can be 'red', 'blue', or a hex '#FF0000'

Config.jobMenu = 'F6'        -- Default job menu key
Config.useTarget = true      -- Enable target for police functions (Supports ox_target / qb-target)
Config.MobileMenu = {        -- THIS WILL USE A REGULAR MENU RATHER THAN A CONTEXT STYLE MENU!
    enabled = false,         -- Use a mobile menu rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'           -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.UseRadialMenu = false -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB - Editable in client/radial.lua)

Config.customCarlock = false -- If you use wasabi_carlock OR qb-carlock set to true(Add your own carlock system in wasabi_bridge/customize/client/carlock.lua)
Config.billingSystem =
'okok'                    -- Current options: false (Disabled) / 'default' (For built-in System)/'esx' (For esx_billing) / 'qb' (QBCore) / 'okok' (For okokBilling) (Easy to add more/fully customize in client/cl_customize.lua)

--ONLY IF USING 'default' BILLING SYSTEM
Config.billingData = {
    chargeAccount = 'bank', --Cash or bank (The default method to charge player)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job sent the fine)
    -- (If false, fines will be deducted from the player but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,

    fines = { --Fine presets
        { label = 'Attempt Robbery of Shop', amount = 1200 },
        { label = 'Attempt Robbery of Bank', amount = 2400 },
        { label = 'On-Duty Crime',           amount = 10000 },
        { label = 'Driving On Off-Road',     amount = 2200 },
        { label = 'Anti Gravity',            amount = 4200 },
    }
}

Config.OldQBManagement = true -- If you use older qb-management(Unrelated to ESX)

Config.AdvancedParking = false -- Delete vehicles with their exports(Script named advanced parking)

Config.Jail = {
    enabled = true, -- Enable jail feature?
    input = true,    -- Enable input? Some needs it
    jail = 'rcore',       -- Current options: 'qb' (For qb-prison) / 'rcore' (For rcore-prison) / 'tk_jail' (For tk_jail) / 'hd_jail' (For hd_jail) / 'myPrison' (For myPrison) / 'qalle-jail' (For qalle-jail) / 'plouffe ' (For Plouffe Jail) / 'mx' (For mxJail) / 'custom' (For custom)
}
-- NOTE: If using qb-prison, you must make one small change to qb-prison.
-- SEE https://docs.wasabiscripts.com/scripts/wasabi_police/customizations#qb-prison-integration

Config.searchPlayers = true     -- Allow police jobs to search players for items (Must have inventory in bridge or one already supported in cl_customize.lua - or add your own!)
Config.weaponsAsItems = true     -- (If you're unsure leave as true!)This is typically for older ESX and inventories that still use weapons as weapons and not items

Config.spikeStripsEnabled = true -- Enable functionality of spike strips (Disable if you use difference script for spike strips)

--[[ These resources can trigger:
    wasabi_police:handcuffPlayer
    wasabi_police:escortPlayer
    wasabi_police:inVehiclePlayer
    wasabi_police:outVehiclePlayer
]]
Config.AllowedResources = {
    'qb-core',
    'qb-radialmenu', -- For civilians to be able to use radial menu features(Already had compatibility without edit)
}

Config.AllowedJobs = { -- THIS HAS NOTHING TO DO with Config.policeJobs, only with triggering events above
    --'bloods'
}

Config.GrantWeaponLicenses = {
    enabled = true,          -- If you want police to have option to grant/revoke weapons licenses
    license_name = 'weapon', -- Name of license
    minGrade = 0,            -- Min grade to use this function
    menuPosition =
    'bottom-right'           -- Choose where menu of player select is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}

Config.RadarPosts = {           -- Radar posts for speed detection

    enabled = true,             -- Enable radar posts (Shows option in job menu for approved jobs)?
    saveToDatabase = true,      -- Save radar data to database? (If false, data will be stored in server memory/reset on server restarts)

    disableCameraFlash = false, -- Disable camera flash effect when player is caught speeding?

    measurement = 'mph',        -- Measurement of speed (Options: 'mph' / 'kmh')

    jobs = {                    -- Jobs & minimum ranks that can add/modify/delete radar posts
        -- Must be in Config.policeJobs as well
        police = 0,             -- Job 'police' with minimum rank 0
        sheriff = 2,            -- Job 'sheriff' with minimum rank 2
    },

    whitelistJobs = { -- Jobs that do not get fined for speeding
        -- Do not worry about jobs from Config.policeJobs, they are automatically whitelisted
        'ambulance',

    },

    chargeAccount = 'bank',       -- Cash or bank (The default method to charge player
    allowNegativeBalance = false, -- Allow players to go into negative balance? (If false, player must have enough money to pay fine)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job placed the radar post that detected speeding)
    -- (If false, fines will be deducted from the speeder but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,

    thresholds = {   -- Speed thresholds for fines
        [5] = 50,    -- 5 over = $50 fine
        [10] = 100,  -- 10 over = $100 fine
        [20] = 500,  -- 20 over = $500 fine
        [30] = 1000, -- 30 over = $1000 fine
        [40] = 2000, -- 40 over = $2000 fine
        [50] = 5000, -- 50 over = $5000 fine
    },

    blip = {
        enabled = false,      -- Enable blips for radar posts?
        label = 'Radar Post', -- Blip label
        sprite = 184,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
        short = false,        -- Short range blip?
    },

    options = {
        {
            label = 'Radar Post #1',     -- Label of radar post
            prop = 'prop_cctv_pole_01a', -- Prop name
        },
        {
            label = 'Radar Post #2',
            prop = 'prop_cctv_pole_02',
        },
        {
            label = 'Radar Post #3',
            prop = 'prop_cctv_pole_03',
        },
        {
            label = 'Radar Post #4',
            prop = 'prop_cctv_pole_04',
        },
    }
}

Config.GSR = {                 -- Gunshot residue settings
    enabled = true,           -- Enabled?
    cleanInWater = true,       -- Can clean GSR while in water?
    timeToClean = 5 * seconds, -- How long to clean GSR in water if enabled
    autoClean = 600,           -- (IN SECONDS)How long before residue clears itself? Set to false if undesired to auto clean GSR
    command = 'gsr'            -- Command for testing for GSR? Set to false if undesired
}

Config.tackle = {
    enabled = false,    -- Enable tackle?
    policeOnly = false, -- Police jobs only use tackle?
    hotkey = 'G'       -- What key to press while sprinting to start tackle of target
}

Config.seizeCash = {  -- ONLY FOR QBCORE WITHOUT CASH AS ITEM
    enabled = true,  -- Enabled?
    item = 'moneybag' -- Item to add after seizedCash
}

Config.handcuff = {                             -- Config in regards to cuffing
    defaultCuff = 'hard',                       -- Default cuff type (Options: 'soft' / 'hard') Changing this will be the default hotkey cuff type
    persistentCuff = true,                      -- Verify player's cuffed status during login (Install '_EXTRA_ESX_INSTALL/ESX_PERSISTENT_CUFF.sql' if using ESX)
    timer = 20 * minutes,                       -- Time before player is automatically unrestrained(Set to false if not desired)
    hotkey = 'J',                               -- What key to press to handcuff people(Set to false for no hotkey)
    skilledEscape = {
        enabled = true,                         -- Allow criminal to simulate resisting by giving them a chance to break free from cuffs via skill check
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    },
    cuffItem = {                                -- Have handcuffs as usable item? (ITEM NAME MUST BE IN ITEMS / YOU MUST ADD YOURSELF)
        enabled = true,                        -- Enable a handcuff usable item?? Must be in items table/database with name defined below
        required = true,                        -- Requires handcuff item to be in inventory when any handcuff function is used
        item = 'handcuffs'                      -- Item name (DONT FORGET to make sure its in your items)
    },
    lockpicking = {                             -- Lockpicking someone else out of handcuffs
        enabled = true,                        -- Enable handcuffs to be able to be lockpicked off(MUST HAVE LOCKPICK ITEM IN ITEMS)
        item = 'bobby_pin',
        breakChance = 50,                       -- Chance of lockpick breaking if failed (Set to 100 for 100% or 0 for never breaking)
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    }
}

Config.policeJobs = { -- Police jobs
    'police'
    --    'sheriff'
   -- 'reporter'
}

Config.GPSBlips = {
    enabled = true,     -- Enabled?
    item = false,        -- Item required? Note: You have to use it then
    sprites = {
        none = 1,        -- Blip for when not in a vehicle
        car = 56,        -- Blip for when in vehicles
        bike = 226,      -- Blip for when on bikes
        boat = 427,      -- Blip for when in boats
        helicopter = 43, -- Blip for when in helicopters
        plane = 307,     -- Blip for when in planes
    },
    settings = {
        color = 1,
        scale = 0.75,
        short = false,
        category = 7
    }
}

Config.Props = { -- What props are avaliable in the "Place Objects" section of the job menu

    {
        title = 'Barrier',             -- Label
        description = '',              -- Description (optional)
        model = `prop_barrier_work05`, -- Prop name within `
        freeze = true,                 -- Make prop unmovable
        groups = {                     -- ['job_name'] = min_rank
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Barricade',
        description = '',
        model = `prop_mp_barrier_01`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Traffic Cones',
        description = '',
        model = `prop_roadcone02a`,
        freeze = false, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Spike Strip',
        description = '',
        model = `p_ld_stinger_s`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            --            ['sheriff'] = 0,
        }
    },

}

Config.Locations = {
    LSPD = {
        blip = {
            enabled = true,
            coords = vec3(464.57, -992.0, 30.69),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Mission Row PD'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(442.703, -981.688, 30.689), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(464.87, -977.37, 30.69),
                heading = 91.06,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(460.646, -985.606, 30.728), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = true,                                                                 -- Set to false if you don't want to use
            coords = vec3(482.363, -995.165, 30.69 - 0.9),                                    -- Coords of armoury
            heading = 177.56,                                                                -- Heading of armoury NPC
            ped = 's_f_y_cop_01',
            label = '[E] - Access Armoury',                                                 -- String of text ui
            jobLock = 'police',                                                             -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {              ---  Trainee                                                           
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                --[[     ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 }, ]]
                   

                },
                [1] = {    ---  Trooper
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                --    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                --    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                --    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                --    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                --    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                --    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },
                    
                },
                [2] = { ----  Trooper First Class
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    
                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                --    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                --    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                --    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                --    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },


                },
                [3] = {    ----  Sergeant
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                --    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                --    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },


                },
                [4] = {       ------   Master Sergeant                                                
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                --    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                --    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                --    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                --    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                --    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                --    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },

                   

                },
                [5] = {           ----   Lieutenant                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                --    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },


                   

                },
                [6] = {           ---- Captain                                                                   
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                --    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },


                   

                },
                [7] = {     ---  Commander                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },


                --    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },

                   

                },
                
                [8] = {         --- Colonel                                                                
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                --    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },

                   

                },
                [9] = {          --- Assistant Chief                                                               
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },

                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                --    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },

                   

                },
                [10] = {       ---- Chief                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },



                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },
                 
                   

                },
                [11] = {       ---- Chief                                                                 
                    ['heavyarmor'] = { label = 'Bulletproof Vest', multiple = false, price = 25 },
                    ['handcuffs'] = { label = 'Handcuffs', multiple = false, price = 80 },
                    ['radio'] = { label = 'Radio', multiple = false, price = 100 },


                    ['ifaks'] = { label = 'iFaks', multiple = true, price = 5 },
                    ['advancedrepairkit'] = { label = 'Advanced Repairkit', multiple = true, price = 25 },
                    ['empty_evidence_bag'] = { label = 'Empty Evidence Bag', multiple = true, price = 1 },
                    ['police_stormram'] = { label = 'Stormram', multiple = true, price = 10 },
                    ['weapon_flashlight'] = { label = 'Flashlight', multiple = false, price = 10 },
                    ['weapon_nightstick'] = { label = 'Night Stick', multiple = false, price = 50 },
                    ['weapon_stungun'] = { label = 'Taser', multiple = false, price = 50 },



                    ['weapon_pd509'] = { label = 'PD 509', multiple = false, price = 350 },
                    ['weapon_glock40s'] = { label = 'PD GLOCK 40 SWITCH', multiple = false, price = 350 },
                    ['weapon_glock19x'] = { label = 'PD G19X XL', multiple = false, price = 350 },
                    ['weapon_pitviper'] = { label = 'PD JW4 PIT VIPER', multiple = false, price = 350 },
                    ['weapon_combatshotgun'] = { label = 'PD Combat Shotgun', multiple = false, price = 350 },
                    ['weapon_pumpshotgun_mk2'] = { label = 'PD Pump Shotgun MK2', multiple = false, price = 350 },
                    ['weapon_m32s'] = { label = 'PD M32 SMOKE GL', multiple = false, price = 350 },
                    ['weapon_lok'] = { label = 'PD M-LOK AR 15', multiple = false, price = 350 },
                    ['weapon_smg'] = { label = 'PD SMG', multiple = false, price = 350 },
                    ['weapon_glock18c'] = { label = 'PD GLOCK 18C', multiple = false, price = 350 },
                    ['weapon_carbinerifle_mk2'] = { label = 'PD Carbine Rifle Mk II', multiple = false, price = 350 },


                    ['ammo-9'] = { label = '9mm ammo', multiple = true, price = 5 },
                    ['ammo-rifle'] = { label = 'Rifle ammo', multiple = true, price = 5 },
                    ['ammo-45-pd'] = { label = '45 pd ammo', multiple = true, price = 5 },
                    ['ammo-shotgun'] = { label = 'Shotgun ammo', multiple = true, price = 5 },
                    --- --- ['mg_ammo'] = { label = 'MG ammo', multiple = true, price = 5 },
                    ['ammo-smokegrenade'] = { label = 'smokegrenade ammo', multiple = true, price = 5 },
                 
                   

                },

            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(461.37, -998.06, 31.2), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {    
                [0] = {                            -- Order it will display
                    label = 'INTERN',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 647, drawable = 0,  texture = 0 }, -- Torso
                            { component = 148,  drawable = 0, texture = 0 }, -- Shirt
                            { component = 289,  drawable = 0,  texture = 0 }, -- Pants
                            { component = 200,  drawable = 0, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 0,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },                       -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'CONSRABLE',              -- Name of outfit that will display in menu
                    minGrade = 1,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 647, drawable = 0,  texture = 0 }, -- Torso
                            { component = 148,  drawable = 0, texture = 0 }, -- Shirt
                            { component = 289,  drawable = 0,  texture = 0 }, -- Pants
                            { component = 200,  drawable = 0, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 0,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'ASI', -- Name of outfit that will display in menu
                    minGrade = 2,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'SUB INSPECTOR', -- Name of outfit that will display in menu
                    minGrade = 3,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [4] = {              -- Order it will display
                    label = 'INSPECTOR', -- Name of outfit that will display in menu
                    minGrade = 4,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [5] = {              -- Order it will display
                    label = 'ASP', -- Name of outfit that will display in menu
                    minGrade = 5,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [6] = {              -- Order it will display
                    label = 'SP', -- Name of outfit that will display in menu
                    minGrade = 6,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [7] = {              -- Order it will display
                    label = 'ADIG', -- Name of outfit that will display in menu
                    minGrade = 7,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [8] = {              -- Order it will display
                    label = 'DIG', -- Name of outfit that will display in menu
                    minGrade = 8,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [9] = {              -- Order it will display
                    label = 'AIGP', -- Name of outfit that will display in menu
                    minGrade = 9,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [10] = {              -- Order it will display
                    label = 'IGP', -- Name of outfit that will display in menu
                    minGrade = 10,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [11] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [12] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = true,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(486.021, -995.195, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = true,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(474.0, -1005.1, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(435.89, -976.31, 25.7), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(435.89, -976.31, 25.7), -- Coords of where land vehicle spawn/return
                    heading = 89.26
                },
                air = {
                    coords = vec3(449.108, -981.048, 43.691), -- Coords of where air vehicles spawn/return
                    heading = 200.379
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['rexon_dmp3'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP3',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    --[[ ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    }, ]]
                },
                [1] = {                    -- Job grade as table name
                    ['17cheyenne2'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Truck',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    --[[ ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    }, ]]
                },
                [2] = {                    -- Job grade as table name
                    ['rexon_dmp2'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'pd DMP2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    --[[ ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    }, ]]
                },
                [3] = {                    -- Job grade as table name
                    ['pd_c8'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD C8',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    --[[ ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    }, ]]
                },
                [4] = {                    -- Job grade as table name
                    ['rexon_dmp4'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP4',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
                [5] = {                    -- Job grade as table name
                    ['rexon_dmp6'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP6',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['r1200rtp'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Bike',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
                [6] = {                    -- Job grade as table name
                    ['rexon_dmp7'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP7',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['r1200rtp'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Bike',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
                [7] = {                    -- Job grade as table name
                    ['modelsleo'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Tesla',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['yzfr6'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD R6',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
                [8] = {                    -- Job grade as table name
                    ['nm_avent'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Lembo',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [9] = {   
                    ['nm_avent'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Lembo',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [10] = {                    -- Job grade as table name
                    ['polamggtr'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD GTR',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [11] = {                    -- Job grade as table name
                    ['rmodgt63police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD GT63',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
                [12] = {                    -- Job grade as table name
                    ['17cheyenne2'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Truck',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['modelsleo'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Tesla',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['nm_avent'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Lembo',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['pd_c8'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD C8',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polamggtr'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD GTR',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['r1200rtp'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD Bike',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp1'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP1',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp2'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp3'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP3',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp4'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP4',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp5'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP5',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp6'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP6',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp7'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP7',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp8'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP8',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rexon_dmp9'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD DMP9',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['rmodgt63police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD GT63',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['yzfr6'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'PD R6',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    
                    
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
}
