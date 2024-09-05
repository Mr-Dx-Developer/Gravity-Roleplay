--/* EDITED BY KNOX : Knox#3719 */--

Config = {}
--------------------------------
-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- [Staff Groups]

Config.StaffGroups = {
	'god',
	'admin'
}

--------------------------------
-- [Clear Player Chat]

Config.AllowPlayersToClearTheirChat = true

Config.ClearChatCommand = 'clear'

--------------------------------
-- [Staff]

Config.EnableStaffCommand = true

Config.StaffCommand = 'staff'

Config.AllowStaffsToClearEveryonesChat = true

Config.ClearEveryonesChatCommand = 'clearall'

-- [Staff Only Chat]

Config.EnableStaffOnlyCommand = true

Config.StaffOnlyCommand = 'staffo'

--------------------------------
-- [Advertisements]

Config.EnableAdvertisementCommand = true

Config.AdvertisementCommand = 'ad'

Config.AdvertisementPrice = 1000

Config.AdvertisementCooldown = 5 -- in minutes

--------------------------------
-- [Twitch]

Config.EnableTwitchCommand = false

Config.TwitchCommand = 'twitch'

-- Types of identifiers: license: | xbl: | live: | discord: | fivem: | ip:
Config.TwitchList = {
	'license:7fcf584ef3665d61212f92b6b4a2817z09fgd1a0' -- Example, change this
}

--------------------------------
-- [Youtube]

Config.EnableYoutubeCommand = true

Config.YoutubeCommand = 'youtube'

-- Types of identifiers: steam: | license: | xbl: | live: | discord: | fivem: | ip:
Config.YoutubeList = {
	'license:0424522fe35dbfba0c79e53d0c6d42b0ba031feb' -- knox
}

--------------------------------
-- [Twitter]

Config.EnableTwitterCommand = true

Config.TwitterCommand = 'twitter'

--------------------------------
-- [Police]

Config.EnablePoliceCommand = true

Config.PoliceCommand = 'lspd'

Config.PoliceJobName = 'police'

--------------------------------
-- [Ambulance]

Config.EnableAmbulanceCommand = true

Config.AmbulanceCommand = 'ems'

Config.AmbulanceJobName = 'ambulance'

--------------------------------
-- [Mechanic]

Config.EnableMechanicCommand = true

Config.MechanicCommand = 'meca'

Config.MechanicJobName = 'mechanic'

--------------------------------
-- [OOC]

Config.EnableOOCCommand = true

Config.OOCCommand = 'ooc'

Config.OOCDistance = 20.0

--------------------------------
-- [ME]
Config.EnableMECommand = false

Config.MECommand = 'me'

Config.MEDistance = 5.0

--------------------------------
-- [DO]
Config.EnableDOCommand = false

Config.DOCommand = 'do'

Config.DODistance = 5.0

--------------------------------

-- Edited by Knox : Knox#3719