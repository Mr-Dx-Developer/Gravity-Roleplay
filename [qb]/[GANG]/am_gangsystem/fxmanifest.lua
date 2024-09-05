----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 
--<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 
--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>--
fx_version 'adamant'
game 'gta5'
author 'FelipeKLFH#5810'
description 'AM-GANGSYSTEM NEW, COMMING NEWS VERSIONS'
version '1.0.0'
lua54 'on'
shared_scripts {
	'config.lua',
}
client_script 'client.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server.lua'
}
server_exports {
    "getPlayerGroup",
    "getGroupById",
    "isPlayerFounderOfParty",
    "getGroupMemberCount"
}
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/app.js',
    
    'html/main.css',
    'html/*.ttf',
	'html/*.png',
	'html/*.jpg',
	'html/*.mp3',
}
escrow_ignore {
	'config.lua',
}