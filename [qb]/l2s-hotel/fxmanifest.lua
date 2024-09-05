fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'New Hotel Script For QBCore'
author '@L2S Developers Team'
version '1.0'

shared_scripts {
    'shared/sh_config.lua',
    'shared/sh_doors.lua',
    'shared/sh_chairs.lua',
}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_source.lua',
    'client/cl_elevators.lua',
    'client/cl_hotel.lua',
    'client/cl_doors.lua',
    'client/cl_chairs.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_main.lua',
    'server/sv_hotel.lua',
    'server/sv_mails.lua',
    'server/sv_doors.lua',
}

ui_page "ui/index.html"
files {
	'ui/index.html',
	'ui/imgs/*.png',
	'ui/css/style.css',
	'ui/js/ui.js',
}

escrow_ignore {
    'shared/sh_config.lua',
    'shared/sh_chairs.lua',

    'server/sv_main.lua',
    'server/sv_mails.lua',
    'server/sv_doors.lua',

    'client/cl_source.lua',
    'client/cl_doors.lua',
    'client/cl_elevators.lua',
}
dependency '/assetpacks'