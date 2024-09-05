Config = {}


--SERVERSIDE STUFF--
Config.CheckVersion =  false -- Enable/Disable version checker. Prints on serverside console.
--SERVERSIDE STUFF

--CROSSHAIR--
Config.UseCustomCrosshair = true -- Turn on/off custom crosshair.
Config.RemoveCrosshairOnFirstPerson = true -- Turn on/off custom crosshair while On First Person. IGNORE if the above is set to FALSE.
--CROSSHAIR--

--DISABLE HEADSHOT--
Config.RemoveHeadshots = true -- Disable/Enable headshots only on players.
--DISABLE HEADSHOT--

--JUMP SPAM PREVENTION
Config.JumpSpamPrevention = false -- Disable/Enable the jump spam prevention system. Pretty much if you spam the jump button it will make you fall down.
Config.JumpSpamPreventionTimer = 2000 -- Timer for the jump spam prevention system. This is in milliseconds. So 2000 is 2 seconds.
--JUMP SPAM PREVENTION


--REMOVE PISTOL WHIPPING
Config.RemovePistolWhipping = true
--REMOVE PISTOL WHIPPING

--ROLL PREVENTION
Config.RollPrevention = false -- Disable/Enable the roll prevention. Just doesn't allow players to roll while aiming. Yes, it is annoying in gta.
--ROLL PREVENTION

--VIEW CAM FORCER
Config.UseViewCamForcer = false -- Turn on/off view cam forcer inside vehicles.
Config.ViewCamForcerStartTime = 200
Config.ViewCamForcerFinishTime = 0
Config.UseVehicleViewCamForcer = true -- Turn on/off view cam forcer inside vehicles.
Config.UseDisable3rdPersonShooting = false
Config.UseFirstJoinViewCamForcer = false -- Disable the first person on first join. To stop the loop you need to trigger our export on your first joined event. exports['BetterFight']:ViewCamForcerJoined()
Config.DefaultViewCamModeOnFirstJoin = 1 -- Sets their prespective. Choose either 1/2/3.
--VIEW CAM FORCER

--WEAPON DAMAGES
Config.UseCustomWeaponDamages = true -- Disable/Enable custom weapon damages.
--WEAPON DAMAGES


--RECOIL
Config.UseRecoil = false -- Turn on/off recoil.
Config.RightLeftRecoil = true -- Turn on/off right left movement recoil.
Config.RightLeftRecoilRandomiser = true --If this is set to true then the recoil inside a vehicle will not trigger all the time. The value below will set the chance if true.
Config.RightLeftRecoilRandomiserChance = 50 --This is a percentage out of 100. The higher it is, the higher the chance of recoil kicking inside a vehicle.
Config.UseVehicleRecoil = true --Enable/Disable recoil inside vehicles.
Config.UseScreenExplosions = true --Adds a small screen explosion, it is affected by how big recoil is.
Config.GripMultiplier =  true
Config.SuppressorMultiplier = true
Config.LoweredFirstPersonRecoil = false -- Turn on/off lowered recoil while being in first person mode..
Config.LoweredFirstPersonRecoilValue = 0.7 -- Value for lowered recoil. It is actually the recoil * the value. So the lower the value is here the lowered it will be in first person.
--RECOIL--
--WEAPON SETTINGS--
Config.Weapons= {

    --You can change the values down here, feel free to also comment any weapons you don't want and add any weapons you do want. Only throwables are missing from this list.
    --Here's a link for you to find all weapons in GTA V: https://wiki.rage.mp/index.php?title=Weapons

    --Pistol--
    [1] = { hash = `WEAPON_PISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.80, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.65},
    [2] = { hash = `WEAPON_PISTOL_MK2`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.80, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.60},
    [3] = { hash = `WEAPON_COMBATPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.80, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.6},
    [4] = { hash = `WEAPON_APPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 5.50, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.46},
    [5] = { hash = `WEAPON_STUNGUN`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.50, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [6] = { hash = `WEAPON_PISTOL50`, recoil = 0.10, rightLeftRecoil = 2.90, vehicleRecoil = 2.90, vehicleRightLeftRecoil = 2.50, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.3},
    [7] = { hash = `WEAPON_SNSPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.52},
    [8] = { hash = `WEAPON_SNSPISTOL_MK2`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.43},
    [9] = { hash = `WEAPON_HEAVYPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.50},
    [10] = { hash = `WEAPON_VINTAGEPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.80, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.55},
    [11] = { hash = `WEAPON_FLAREGUN`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    [12] = { hash = `WEAPON_MARKSMANPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.0},
    [13] = { hash = `WEAPON_REVOLVER`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.5},
    [14] = { hash = `WEAPON_REVOLVER_MK2`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    [15] = { hash = `WEAPON_DOUBLEACTION`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    [16] = { hash = `WEAPON_RAYPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.0},
    [17] = { hash = `WEAPON_CERAMICPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.61},
    [18] = { hash = `WEAPON_NAVYREVOLVER`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    [19] = { hash = `WEAPON_GADGETPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 3.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    --Pistol--


    --Submachine Guns--
    [20] = { hash = `WEAPON_MICROSMG`, recoil = 1.40, rightLeftRecoil = 1.00, vehicleRecoil = 1.7, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.65},
    [21] = { hash = `WEAPON_SMG`, recoil = 0.35, rightLeftRecoil = 0.40, vehicleRecoil = 1.50, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.02},
    [22] = { hash = `WEAPON_SMG_MK2`, recoil = 1.30, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.2},
    [23] = { hash = `WEAPON_ASSAULTSMG`, recoil = 2.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.8},
    [24] = { hash = `WEAPON_COMBATPDW`, recoil = 1.75, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.0},
    [25] = { hash = `WEAPON_MACHINEPISTOL`, recoil = 0.10, rightLeftRecoil = 1.00, vehicleRecoil = 2.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.00},
    [26] = { hash = `WEAPON_MINISMG`, recoil = 1.0, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [27] = { hash = `WEAPON_RAYCARBINE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.25},
    --Submachine Guns--


    --Shotguns--
    [28] = { hash = `WEAPON_PUMPSHOTGUN`, recoil = 2.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.60, suppressorMultiplier = 0.00, damageMultiplier = 0.48},
    [29] = { hash = `WEAPON_PUMPSHOTGUN_MK2`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.30},
    [30] = { hash = `WEAPON_SAWNOFFSHOTGUN`, recoil = 3.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.222},
    [31] = { hash = `WEAPON_ASSAULTSHOTGUN`, recoil = 6.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.30},
    [32] = { hash = `WEAPON_BULLPUPSHOTGUN`, recoil = 8.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 2.58},
    [33] = { hash = `WEAPON_MUSKET`, recoil = 6.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.27},
    [34] = { hash = `WEAPON_HEAVYSHOTGUN`, recoil = 6.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.20},
    [35] = { hash = `WEAPON_DBSHOTGUN`, recoil = 5.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.40},
    [36] = { hash = `WEAPON_AUTOSHOTGUN`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.30},
    [37] = { hash = `WEAPON_COMBATSHOTGUN`, recoil = 4.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    --Shotguns--

    --Assault Rifles--
    [38] = { hash = `WEAPON_ASSAULTRIFLE`, recoil = 10.65, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.40, suppressorMultiplier = 0.00, damageMultiplier = 0.9},
    [39] = { hash = `WEAPON_ASSAULTRIFLE_MK2`, recoil = 0.86, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.66},
    [40] = { hash = `WEAPON_CARBINERIFLE`, recoil = 10.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.40, suppressorMultiplier = 0.00, damageMultiplier = 0.90},
    [41] = { hash = `WEAPON_CARBINERIFLE_MK2`, recoil = 1.43, rightLeftRecoil = 0.60, vehicleRecoil = 0.60, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.95},
    [42] = { hash = `WEAPON_ADVANCEDRIFLE`, recoil = 1.30, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.55},
    [43] = { hash = `WEAPON_SPECIALCARBINE`, recoil = 1.20, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.30},
    [44] = { hash = `WEAPON_SPECIALCARBINE_MK2`, recoil = 1.38, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.08},
    [45] = { hash = `WEAPON_BULLPUPRIFLE`, recoil = 1.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.7},
    [46] = { hash = `WEAPON_BULLPUPRIFLE_MK2`, recoil = 1.55, rightLeftRecoil = 0.70, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.75},
    [47] = { hash = `WEAPON_COMPACTRIFLE`, recoil = 1.30, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.2},
    [48] = { hash = `WEAPON_MILITARYRIFLE`, recoil = 0.10, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 1.50, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.50},
    --Assault Rifles--

    --Light Machine Guns--
    [49] = { hash = `WEAPON_MG`, recoil = 1.80, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.25},
    [50] = { hash = `WEAPON_COMBATMG`, recoil = 1.70, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.50},
    [51] = { hash = `WEAPON_COMBATMG_MK2`, recoil = 1.40, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [52] = { hash = `WEAPON_GUSENBERG`, recoil = 1.3, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.492},
    --Light Machine Guns--

    --Sniper Rifles--
    [53] = { hash = `WEAPON_SNIPERRIFLE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [54] = { hash = `WEAPON_HEAVYSNIPER`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.10},
    [55] = { hash = `WEAPON_HEAVYSNIPER_MK2`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.10},
    [56] = { hash = `WEAPON_MARKSMANRIFLE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [57] = { hash = `WEAPON_MARKSMANRIFLE_MK2`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    --Sniper Rifles--

    --Heavy Weapons--
    [58] = { hash = `WEAPON_RPG`, recoil = 5.00, rightLeftRecoil = 10.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 5.0},
    [59] = { hash = `WEAPON_GRENADELAUNCHER`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0},
    [60] = { hash = `WEAPON_GRENADELAUNCHER_SMOKE`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0},
    [61] = { hash = `WEAPON_MINIGUN`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.35},
    [62] = { hash = `WEAPON_FIREWORK`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.0},
    [63] = { hash = `WEAPON_RAILGUN`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0},
    [64] = { hash = `WEAPON_HOMINGLAUNCHER`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 10.0},
    [65] = { hash = `WEAPON_COMPACTLAUNCHER`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0},
    [66] = { hash = `WEAPON_RAYMINIGUN`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0},
    --Heavy Weapons--

    --Melee--
    [70] = { hash = `WEAPON_UNARMED`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [71] = { hash = `WEAPON_DAGGER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [72] = { hash = `WEAPON_BAT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [73] = { hash = `WEAPON_BOTTLE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [74] = { hash = `WEAPON_CROWBAR`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [75] = { hash = `WEAPON_FLASHLIGHT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.00},
    [76] = { hash = `WEAPON_GOLFCLUB`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [77] = { hash = `WEAPON_HAMMER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [78] = { hash = `WEAPON_HATCHET`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.15},
    [79] = { hash = `WEAPON_KNUCKLE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [80] = { hash = `WEAPON_KNIFE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.05},
    [81] = { hash = `WEAPON_MACHETE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [82] = { hash = `WEAPON_SWITCHBLADE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [83] = { hash = `WEAPON_NIGHTSTICK`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.0},
    [84] = { hash = `WEAPON_WRENCH`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [85] = { hash = `WEAPON_BATTLEAXE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [86] = { hash = `WEAPON_POOLCUE`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.05},
    [87] = { hash = `WEAPON_STONE_HATCHET`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [88] = { hash = `WEAPON_THERMALKATANA`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.0},
    [89] = { hash = `WEAPON_DAGGER2`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [90] = { hash = `WEAPON_KARAMBIT`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [91] = { hash = `WEAPON_KIBA`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [92] = { hash = `WEAPON_SOGFASTHAWK`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    [93] = { hash = `WEAPON_BERSERKER`, recoil = 0.00, vehicleRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.10},
    --Melee--

--Vlife V4 Custom Guns--

    -- Pistol

    [94] ={ hash = `WEAPON_G17C`, recoil = 0.30, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.28},
    [95] ={ hash = `WEAPON_GLOCK18C`, recoil = 2.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil =2.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.27},
    [96] ={ hash = `WEAPON_G19X`, recoil = 2.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.27},
    [97] ={ hash = `WEAPON_FN502`, recoil =0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier =0.20},
    [98] ={ hash = `WEAPON_USP45`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.23},
    [99] ={ hash = `WEAPON_ACHILLIS`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = .30},
    [100] ={ hash = `WEAPON_BR`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.28},

    -- SMG

    [101] ={ hash = `WEAPON_MP5`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.39},
    [102] ={ hash = `WEAPON_MP9`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.39},
    [103] ={ hash = `WEAPON_VECTOR`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.33},
    [104] ={ hash = `WEAPON_UZI`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.38},
    [105] ={ hash = `WEAPON_UMP45`, recoil = 1.00, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.25},

    -- AR

    [106] ={ hash = `WEAPON_AK47`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.40},
    [107] ={ hash = `WEAPON_ANIMEM4`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [108] ={ hash = `WEAPON_AR15`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.40},
    [109] ={ hash = `WEAPON_G36C`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [110] ={ hash = `WEAPON_M4A1`,    recoil = 0.50, rightLeftRecoil = 0.50, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.43},
    [111] ={ hash = `WEAPON_HK416`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.40, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.33},
    [112] ={ hash = `WEAPON_MK18`, recoil = 0.50, rightLeftRecoil = 0.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.30},
    [113] ={ hash = `WEAPON_SCARH`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.42},
    [114] ={ hash = `WEAPON_CQR`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.41},
    [115] ={ hash = `WEAPON_AUGA1V2`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.31},
    --[116] ={ hash = `WEAPON_ARAXYS`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    [117] ={ hash = `WEAPON_SIGMCX`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.42},
    [118] ={ hash = `WEAPON_M762`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.45},

    -- Sniper

    --[119] ={ hash = `WEAPON_KR98K`, recoil = 5.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 1.00},
    --[120] ={ hash = `WEAPON_MK14`, recoil = 5.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.00},


    -- Katana

    [121] ={ hash = `WEAPON_KATANA_R`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [122] ={ hash = `WEAPON_KATANA_Y`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [123] ={ hash = `WEAPON_KATANA_B`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [124] ={ hash = `WEAPON_KATANA_G`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [125] ={ hash = `WEAPON_BERSERKER`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [126] ={ hash = `WEAPON_BIGAXE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [127] ={ hash = `WEAPON_PICKAXE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [128] ={ hash = `WEAPON_USAMACHETTE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [129] ={ hash = `WEAPON_TAC_MACHETTE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [130] ={ hash = `WEAPON_PIPE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [131] ={ hash = `WEAPON_STEAKKNIFE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [132] ={ hash = `WEAPON_PICKAXE_SMALL`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [133] ={ hash = `WEAPON_BLUE_KATANA`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [134] ={ hash = `WEAPON_SLEDGEHAMMER`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [135] ={ hash = `WEAPON_CHINESE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [136] ={ hash = `WEAPON_DOUBLE_AXE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [137] ={ hash = `WEAPON_HANDSICKLE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [138] ={ hash = `WEAPON_KITETSU`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [139] ={ hash = `WEAPON_PATREON`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [140] ={ hash = `WEAPON_SOWRD`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [141] ={ hash = `WEAPON_PRIMAL_MACHETE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [142] ={ hash = `WEAPON_SHEVA`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [143] ={ hash = `WEAPON_KATANA`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [144] ={ hash = `WEAPON_TACTICAL_AXE`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},
    [145] ={ hash = `WEAPON_THERMAL_KATANA`, recoil = 0.00, rightLeftRecoil = 0.00, vehicleRecoil = 0.00, vehicleRightLeftRecoil = 0.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.13},

    -- Paintball Weapon

    [146] ={ hash = `WEAPON_PAINTBALL`, recoil = 0.50, rightLeftRecoil = 1.00, vehicleRecoil = 1.10, vehicleRightLeftRecoil = 1.00, gripMultiplier = 0.00, suppressorMultiplier = 0.00, damageMultiplier = 0.40},





}