fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'uyuyorum'
description 'UM Loading Screen V3'
version '1.5.0'

loadscreen 'nui/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

files {
	'config.js',
	'nui/index.html',
	'nui/assets/**',
}

client_script 'lua/spawn.lua'
server_script 'lua/steamkey.lua'

escrow_ignore {
	'lua/spawn.lua'
}
dependency '/assetpacks'