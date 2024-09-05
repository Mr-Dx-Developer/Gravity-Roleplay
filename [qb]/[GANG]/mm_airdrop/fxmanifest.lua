fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'mastermind8816'
version '1.07'
description 'Script that allows Airdrops to fall and players fight over it'

ui_page 'html/index.html'
-- ui_page 'http://localhost:3000/' --for dev

shared_scripts {
    '@ox_lib/init.lua',
    'shared/shared.lua',
    'shared/init.lua'
}
client_scripts {
    'client/interface.lua',
    'client/bridge/*.lua',
    'client/modules/*.lua',
    'client/event.lua',
    'client/function.lua',
    'client/config.lua',
    'client/minigame.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/interface.lua',
    'server/bridge/*.lua',
    'server/event.lua',
    'server/function.lua',
    'server/modules/*.lua',
    'server/config.lua'
}

files {
    'html/**',
    'locales/*.json'
}

escrow_ignore {
    'shared/*.lua',
    'client/config.lua',
    'client/bridge/*.lua',
    'client/minigame.lua',
    'server/bridge/*.lua',
    'server/config.lua'
}
dependency '/assetpacks'