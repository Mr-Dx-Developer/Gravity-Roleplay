Config = {
    Debug = false,               -- This is enabling debug of rcore_prison 
    DebugInventory = false,       -- This enable debug related to the inventory module
    DebugClothing = false,        -- This enable debug related to the clothing module
    DebugAPI = false,             -- This enable debug related to the API system

    DebugEnviroment = false,     -- This enable debug related to the enviroment

    DebugLevel = {
        'NETWORK',
        'INFO',
        'CRITICAL',
        'SUCCESS',
        'ERROR',
        'API',
        'DEBUG',
        'MENU',
    },

    Locale = 'en',                                -- Choose your language ['en']

    -- ⚠️ Deployer system ⚠️
    -- ⚠️ Third party resources can be installed by using our Deployer system without any additional configuration. ⚠️

    -- Supported resources by deployer: https://documentation.rcore.cz/paid-resources/rcore_prison#supported-resources
    -- Documentation: https://documentation.rcore.cz/paid-resources/rcore_prison/guides/deployer

    -- ⚠️⚠️ READ THIS CAREFULLY ⚠️⚠️
    -- ⚠️⚠️ If you are using ESX or QBCore or QBOX you can leave the Framework settings and Other script settings as they are, they will be detected automatically ⚠️⚠️

    -- Framework settings

    Framework = Framework.AUTO_DETECT,            -- [ND Framework - ND_Core | ESX - es_extended, QBCore - qb-core, QBOX - qbx_core, Standalone - standalone]
    Inventory = Inventories.AUTO_DETECT,          -- [OX - ox_inventory, QB - qb-inventory, QS - qs-sinventory, MF - mf-inventory, PS - ps-inventory, LJ - lj-inventory, CORE = core_inventory]
    Target = Target.OX,                         -- [NONE - none [pressing E], OX - ox_target, QB - qb-target, Q - qtarget]
    Database = Database.AUTO_DETECT,              -- [OX - ox_mysql, MYSQL_ASYNC - mysql-async, GHMATTI - ghmattimysql]

    -- Other script settings

    Clothing = Clothing.AUTO_DETECT,              -- [NONE - None, ESX - skin_changer, QB - qb-clothing, FAPPEARANCE - fivem-appearance, IAPPEARANCE - illennium-appearance, TGIANN - tgiann-clothing]
    Phone = Phones.AUTO_DETECT,                   -- [NONE - None, QB_PHONE - qb_phone, LB_PHONE - lb_phone]
    Notify = Notifies.AUTO_DETECT,                -- [NONE - Native, NATIVE - GTA:V Notify, OX - ox_lib, QBCORE - qb-core, OKOK - okok_notify, ESX - esx_notify, MYTHIC - mythic_notify, PNOTIFY - pNotify, BRUTAL - brutal_notify]
    TextUI = TextUI.AUTO_DETECT,                  -- [NONE - RCore, ESX - esx_textui, OX - ox_lib, QBCORE - qb-core]
    Menus = MenuList.RCORE,                       -- [RCORE - RCore, ESX_CONTEXT - esx_context, ESX_MENU - es_extended, OX - ox_menu, QB - qb-core]
    Dispatch = DispatchList.PS,                 -- [NONE - Standalone, RCORE - rcore_dispatch, PS - ps_dispatch, QS - qs_dispatch, CORE - core_dispatch, CD - cd_dispatch] 
    

    ---------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------
    ---------------------------------------------------------------------------------------------------------------

    -- Framework admin groups

    FrameworkAdminGroups = {
        [Framework.ESX] = { 'superadmin', 'admin' },
        [Framework.QBCore] = { 'god', 'admin' },
        [Framework.QBOX] = { 'god', 'admin' },
    },

    Prisoners = {
        Companion = true, -- This is used for enabling companion system, player with the specific job are not going to be attacked by Prison Guards
        CompanionRefreshCycleTime = 1.5, -- This is the time for refreshing prisoners (default in sec)
        CompanionJobList = {
            ['police'] = true,
            ['sheriff'] = true,
            ['ambulance'] = true,
        },

        RemovePlayerJobWhenJailed = false, -- This is used for removing player job when citizen is jailed (supports: ESX, QBCore)
        RemovePlayerSetDefaultJob = 'unemployed', -- This is the default job set when RemovePlayerJobWhenJailed is enabled
        RemoveJobList = {
            ['police'] = true, -- 
            ['ambulance'] = true,
            ['sheriff'] = true,
        }
    },

    -- If you are using renamed events, change only the right-side!

    FrameworkEvents = {
        ['QBCore:Client:OnJobUpdate'] = 'QBCore:Client:OnJobUpdate',
        ['esx:playerLoaded'] = 'esx:playerLoaded',
        ['esx:setJob'] = 'esx:setJob',
        ['esx_skin:getPlayerSkin'] = 'esx_skin:getPlayerSkin',
        ['skinchanger:loadSkin'] = 'skinchanger:loadSkin',
        ['skinchanger:getSkin'] = 'skinchanger:getSkin',
        ['skinchanger:loadClothes'] = 'skinchanger:loadClothes',
        ['qb-clothing:client:loadOutfit'] = 'qb-clothing:client:loadOutfit',
        ['qb-clothing:client:loadPlayerClothing'] = 'qb-clothing:client:loadPlayerClothing'
    },

    CanPrisonerBeReleasedWhenOnSolitary = true, -- This is used for enabling prisoner to be released when they are on solitary
    ReduceSentenceType = SentenceTypes.ONLINE, -- [OFFLINE - Prisoners are not required to be on server for sentence reduce, ONLINE - Prisoners are required to be on server for sentence reducing!]
    RenderJailTime = true, -- This is used for rendering jail time on the screen
    RenderNPCBlips = true, -- This is used for rendering blips on map

    JailByNPCSettings = {
        JailDistance = 10.0, -- This is the distance for jailing player by NPC
        JailTime = 60, -- This is the jail time for NPC jail (default in min)
        ResetPedPool = 5, -- This is the time for resetting ped pool - so same ped can jail other users. (default in min)
    },

    -- Prison break settings

    Escape = {
        WallLodSyncDistance = 300, -- This is the distance for syncing walls
        AutoCatch = true, -- This is used for auto catching the prisone are escaping
        SolitaryTime = 5, -- This is the time for solitary (default in min) - when prisoner is escaping and get caughh when AutoCatch enabled.
        DisableBugEscape = true, -- This is used for disabling bug escape system || Player are only allowed to escape through included Prison break system!
        BugEscapeCycleTime = 1, -- This is the time for checking if prisoner is in area (default in minutes)
        ViewNPCDistance = 30, -- This is the distance for viewing NPC
        RepairWallTime = 10, -- This is the time for repairing the wall (default in seconds)
        RepairWallKey = 'E',
        ResetTime = 30, -- This is the time for resetting the escape (default in min)
        EnableAutomaticReset = true, -- This is used for enabling automatic reset of the escape
        NeedItem = true, -- This is used for needing item to escape from the prison
        ItemName = 'wire_cutter', -- This is the item name for escaping from the prison
        NotifyJobs = {'police'}, -- This is the list of the jobs which are going to be notified when prisoner is escaping using supported dispatch system
    },

    Guards = {
        EnableJailAllCitizensWhenAttackedGuard = true, -- This is used for jailing all citizens when guard is attacked
        JailTime = 20, -- This is the jail time for attacking guard (default in min)
    },
    

    Solitary = {
        DistanceCheck = 10.0, -- This is the distance for checking if player is in his solitary cell.
        GuardDistanceCheck = 10.0, -- This is the distance for checking if player is in the guard area.
        Time = 3, -- This is the time for solitary (default in min) - when guard is attacked by prisoner
    },

    Release = {
        AtCheckpoint = false, -- This is used for releasing prisoner at the checkpoint, if disabled prisoner will be released at the prison.
    },

    Circuit = {
        Lifes = 3, -- How much lifes person has for Electrician
        Difficulty = 1, -- 1, 2, 3, 4, 5, 6 --> This is ignored when EachJobLevelIncreaseDifficulty is enabled

        Keybinds = {
            ['ARROW_UP'] = 172,
            ['ARROW_DOWN'] = 173,
            ['LEFT_ARROW'] = 174,
            ['RIGHT_ARROW'] = 175,
            ['BACKSPACE'] = 177,
        }
    },

    Commands = {
        Jail = 'jail', -- This is the command for jailing player
        Unjail = 'unjail', -- This is the command for unjailing player
        Startcs = 'startcs', -- This is the command for starting the community service
        Removecs = 'removecs', -- This is the command for removing the community service
        JailCP = 'jailcp', -- This is command for opening jail dashboard
        StopAlarm = 'stopalarm', -- This is the command for stopping the alarm
        Solitary = 'solitary', -- This is the command for sending player to solitary cell(s)
        RemoveSolitary = 'rsolitary', -- This is the command for removing player from solitary cell(s)
        ResetPrisonBreak = 'resetescape', -- This is the command for resetting the prison break
    },

    Menu = {
        Position = 'top-right', -- This is the position of the menu ['top-left', 'top-right', 'bottom-left', 'bottom-right']
    },

    Helpkeys = {
        Position = 'top-left', -- This is the position of the help keys ['top-left', 'top-right', 'bottom-left', 'bottom-right']
    },

    Text = {
        Position = 'left-center', -- This is the position of the text ['top-left', 'top-right', 'bottom-left', 'bottom-right']
    },

    Zone = {
        CheckDist = 1.5, -- This is the distance for checking if player is in the zone
        InteractKey = 'E', -- This is the key for interacting with the zone
        HelpkeysInteractKeyName = 'E', -- This is the key name for the help keys
        Size = vec3(1.0, 1.0, 1.0), -- This is the size of the zones    
    },

    -- Jobs which are allowed to jail/unjail players!

    Jobs = {
        ['police'] = true, -- This is the job which is allowed to jail/unjail players
        ['sheriff'] = true, -- This is the job which is allowed to jail/unjail players
    },


    PrisonJobs = {
        PlayerJobCoolDown = 2, -- This is the cooldown for player to get new job (default: 2 min)
        ResetJobPoolCooldown = 1, -- This is the cooldown for resetting job pool (default: 1 min)
        RequiredDelivery = 5, -- This is the required delivery for prisoner to be released
        
        SetCustomRequiredDeliveries = true, -- This is used for setting custom required deliveries for each job
    
        Electrician = {
            EachJobLevelIncreaseDifficulty = true -- This is used for increasing difficulty for each job level
        },

        LeaveJobKey = 'G', -- This is the key for leaving the job
        DoJobKey = 'E', -- This is the key for doing the job

        Stepper = {
            DoTask = 'SPACE', -- This is the key for doing exercises
            StopTask = 'H', -- This is the key for stopping exercise
            RequireInputMinigame = false,
        },

        -- This is the list of the rewards which are going to be given to player when they finish the job(s)

        Rewards = {
            {
                type = 'ITEM',
                list = {}
            },
            {
                type = 'CREDITS',
                min = 100,
                max = 500,
            },
            {
                type = 'REDUCE_SENTENCE',
                value = 5 -- This is the value for reducing sentence time as reward (5 min)
            }
        },

        RenderInteractZoneDistance = 100.0, -- This is the distance for rendering interact zone
        InRadius = 1.5, -- This is the distance for checking if player is in radius

        RequiredDeliveries = { -- This is the required deliveries for each job
            [JOBS.ELECTRICIAN] = 1,
            [JOBS.GARDENER] = 5,
            [JOBS.CLEAN_GROUND] = 3,
            [JOBS.BUSH_TRIMMING] = 3,
            [JOBS.COOK] = 1,
            [JOBS.LAUNDRY] = 3,
        }
    },

    DisplayPrisonMap = true, -- This is used for displaying prison map on the game map! (The map consumes 0.02ms to render!)
    PrisonYardAnnoucement = false, -- This is used for announcing prisoners about the yard time!
    BroadcastNewPrisoner = false, -- This is used for broadcasting new prisoner to all players on server.
    AutoUncuffNewPrisoner = true, -- This is used for auto uncuffing new prisoner when they are jailed.

    Time = TIMES.MIN, -- This is the time unit for jail time ['SEC', 'MIN', 'HOURS', 'DAYS', 'WEEK', 'MONTHS']

    PhoneBooth = {
        Enabled = true,        
        Lenght = 7, -- This is the lenght of the phone number [7 - lb-phone, qs-smartphone - 10]
        Format = '{3}-{4}', -- This is the format of the phone number [{3}-{4}: lb-phone, {3}-{4}-{2}-{1} - qs-smarpthone]
    },

    Chairs = {
        Enable = false, -- This is used for enabling chairs system
        RaycastDistCheck = 5.0, -- This is the distance for checking if player is near the chair
        SeatDistCheck = 1.5, -- This is the distance for checking if player is near the chair
        DebugSeatPos = false, -- This is used for debugging the chair positions
        
        HealLayingPlayers = true, -- This is used for healing players when they are laying on the bed
        HealModifier = 0.5, -- This is the heal modifier for laying players
        HealLayingPlayersTimeCycle = 1, -- Default (1 minute) - This is the time in minutes for healing laying players
    },

    GYM = {
        -- Supported stats resources: [RTX_GYM]
        -- Can be added in rcore_prison/modules/base/client/client/api/cl-gym.lua

        DoExerciseKey = 'SPACE', -- This is the key for doing exercises
        StopExerciseKey = 'H', -- This is the key for stopping exercise
        
        SkillMap = {
            [EXERCISE_MAP.CRANKS] = {
                action = {
                    percentIncrease = 2,
                    time = 4,
                },
                skills = {
                    strength = 0.3,
                    stamina = 0.1,  
                }
            },

            [EXERCISE_MAP.SITUPS] = {
                action = {
                    percentIncrease = 8,
                    time = 1,
                },
                skills = {
                    strength = 0.3,
                    stamina = 0.1,  
                }
            },
    
            [EXERCISE_MAP.MUSLECHIN] = {
                action = {
                    percentIncrease = 2,
                    time = 4,
                },
                skills = {
                    strength = 0.3,
                    stamina = 0.1,  
                }
            },
        },s
    },

    Mugshot = {
        Enable = false, -- This is used for enabling mugshot system
    },

    Outfits = {
        RestorePlayerOutfitOnRelease = true, -- This is used for setting outfit on release
    },

    EconomyItem = 'cigarrete', -- This is the economy item for prison

    Accounts = {
        Enable = true, -- This is used for enabling prisoner accounts system
        DeleteAccountWhenReleased = false, -- This is used for deleting account when prisoner is released
    },

    Prolog = {
        Enable = true, -- This is used for enabling prolog system
        ResetCache = false -- This is used for resetting cache when prolog is started
    },

    COMS = {
        Enable = true, -- This is used for enabling coms system
        RenderPerollTime = true, -- This is used for rendering peroll time on the screen

        Blip = {
            enable = true, -- Do you want to show blip on map?
            sprite = 643,
            scale = 1.0,
        },

        StartLocations = {
            name = 'Alta - Coms',
            coords = vector3(236.44, -409.33, 47.92),
            type = INTERACT_TYPES.COMS,
            zone = {
                size = vec3(1, 1, 1),
                icon = "fa-solid fa-paper-plane",
                label = 'Community service'
            },
            npc = {
                coords = vec3(236.44, -409.33, 47.92),
                heading = 342.26,
                model = 's_m_m_prisguard_01'
            },
            access = INTERACT_ACCESS_TYPES.ALL
        },

        RenderAreaOnlyForCOMSCitizens = false, -- This is used for rendering area only for coms citizens.
        DisableGameControls = true, -- This is used for disabling game controls when player is cleaning.

        InteractKey = 'E',
        CleaningAnimTime = 10 * 1000,

        RenderDistance = 150.0, -- This is the distance for rendering coms
        InRadius = 100.0, -- This is the distance for checking if player is in radius

        Models = {
            'prop_rub_cardpile_05',
            'prop_rub_binbag_03',
            'prop_skid_box_06',
            'prop_rub_flotsam_01',
            'prop_rub_litter_03c',
            'prop_rub_binbag_06',
            'prop_rub_cardpile_06',
        },

        Outline = {
            color = {
                x = 250,    -- Red
                y = 149,    -- Green
                z = 68      -- Blue
            },
            opacity = 80 -- Opacity of the outline
        }
    },

    -- This is the list of the inventory images paths to the items, that are used in our script frontend

    ImagePath = {
        [Inventories.OX] = 'nui://ox_inventory/web/images',
       -- [Inventories.QB] = 'nui://qb-inventory/html/images',
       -- [Inventories.LJ] = 'nui://lj-inventory/html/images',
       -- [Inventories.QS] = 'nui://qs-inventory/html/images',
       -- [Inventories.TGIANN] = 'nui://inventory_images/images',
        --[Inventories.ESX] = '', -- When running es_extended the images are being loaded from rcore_prison/modules/nui/web/build/images/items
    }, 

    Canteen = {
        Enable = true, -- This is used for enabling canteen system
        CreditItems = {
            { name = 'water', price = 30 },
            { name = 'fries', price = 7 },
            { name = 'sprunk', price = 7 },
            { name = 'cigarrete', price = 80 },
        },
        
        FreeFoodPackage = true, -- This is used for enabling free food package system
        FreeFoodPackageCooldown = 5, -- This is the cooldown for free food package system (5 min)
        FreeFoodPackageItems = {
            { name = 'water', count = 1 },
            { name = 'sprunk', count = 1 },
        }
    },

    Stash = {
        KeepItemsState = true, -- This is used for keeping items when citizen is jailed into prison.
        KeepItems = {
            ['bread'] = true,
            ['water'] = true,
            ['sludgie'] = true,
        }
    },

    Jail = {
        FetchClosestPlayer = 10.0, -- This is the distance for fetching closest player around player ./jailcp - Add Sentence
    },

    CigarProduction = {
        RewardCooldown = 5, -- This is the reward cooldown for minigame (min)
        RewardMin = 1, -- This is the reward amount for minigame
        RewardMax = 10, -- This is the reward amount for minigame
        RewardItem = 'cigarrete', -- This is the reward item for minigame
    },

    Minigame = {
        AnimDict = 'anim@amb@business@coc@coc_unpack_cut_left@', -- Animation dictionary for minigame
        AnimName = 'coke_cut_v5_coccutter', -- Animation name for minigame

        Steps = 5, -- How many blocks script is going to generate?
        MoveStep = 0.09, -- Speed of arrowKeys generation block (> 0.02!!)
        Tolerance = 0.025, -- What tolenrace should script ignore?
        TimeAcc = 0.3, -- Calc behind keyPress minigame
    
        Keys = {'W', 'S', 'A', 'D'}, -- Option to define own keys for minigame, no need for change! :)

        -- KEY_LABEL => KEY_VALUE
        -- https://docs.fivem.net/docs/game-references/controls/

        -- TRAVERSE MAP
        
        -- If you want to use different Keys layout, you need to define key in TraverseMap
        
        -- LEFT SIDE -> KEY VALUE
        -- RIGHT SIDE -> STRING KEY

        TraverseMap = {
            [20] = "Z",
            [32] = 'W',
            [33] = 'S',
            [34] = 'A',
            [35] = 'D',
            [44] = "Q",
        },

        Keybinds = {
            ['W'] = 32,
            ['S'] = 33,
            ['A'] = 34,
            ['D'] = 35,
            ['ARROW_UP'] = 172,
            ['ARROW_DOWN'] = 173,
            ['LEFT_ARROW'] = 174,
            ['RIGHT_ARROW'] = 175,
        }
    },

    -- We dont recommend to change this settings, if you decide to change it and want to spawn NPC inside the prison by game-engine you have been warned!

    EnableSpawnNPCInsidePrison = false, -- This is used for enabling spawn NPC inside the prison

    Teleport = {
        WhenReleasedTeleportPrisonerInFrontOfPrison = true, -- This is used for teleporting prisoner in front of the prison when released
    }
}

Config.ChatSuggestions = {
    [Config.Commands.Jail] = {
        { name=_U('CHAT_SUGGESTIONS.JAIL_PLAYER_PARAM'), help=_U('CHAT_SUGGESTIONS.JAIL_PLAYER_HELP_PARAM') },
        { name=_U(('CHAT_SUGGESTIONS.TIME_%s'):format(Config.Time)), help=_U(('CHAT_SUGGESTIONS.TIME_%s'):format(Config.Time)) },
    },
    [Config.Commands.Startcs] = {
        { name=_U('CHAT_SUGGESTIONS.JAIL_PLAYER_PARAM'), help=_U('CHAT_SUGGESTIONS.JAIL_PLAYER_HELP_PARAM') },
    },
    [Config.Commands.Unjail] = {
        { name=_U('CHAT_SUGGESTIONS.UNJAIL_PLAYER_PARAM'), help=_U('CHAT_SUGGESTIONS.UNJAIL_PLAYER_HELP_PARAM') },
    },
    [Config.Commands.Solitary] = {
        { name=_U('CHAT_SUGGESTIONS.SOLITARY_PLAYER_PARAM'), help=_U('CHAT_SUGGESTIONS.SOLITARY_PLAYER_HELP_PARAM') },
        { name=_U(('CHAT_SUGGESTIONS.TIME_%s'):format(Config.Time)), help=_U(('CHAT_SUGGESTIONS.TIME_%s'):format(Config.Time)) },
    },
    [Config.Commands.RemoveSolitary] = {
        { name=_U('CHAT_SUGGESTIONS.REMOVE_SOLITARY_PLAYER_PARAM'), help=_U('CHAT_SUGGESTIONS.REMOVE_SOLITARY_PLAYER_HELP_PARAM') },
    }
}
