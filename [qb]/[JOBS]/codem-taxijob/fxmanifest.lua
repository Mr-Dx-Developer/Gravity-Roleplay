fx_version 'cerulean'
game 'gta5'
version '1.0.1'
author 'discord.gg/codem'

shared_scripts {
	'shared/*.lua',
	
}

client_scripts {
	'client/main.lua',
	'client/interactionhandler.lua',

}

server_scripts {
	-- '@mysql-async/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'mysql-async'.:warning:
	'@oxmysql/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'oxmysql'.:warning:
	'server/*.lua',
}


ui_page "html/index.html"

files {
	'html/index.html',
	'html/index.js',
	'html/index.css',
	'html/responsive.css',
	'html/components/**/index.html',
	'html/components/**/index.js',
  	'html/vue/*.js',
  	'html/utils/*.js',
  	'html/assets/images/*.png',
  	'html/assets/fonts/*.ttf',
  	'html/assets/fonts/*.TTF',
  	'html/assets/fonts/*.OTF',

}

escrow_ignore {
	'client/interactionhandler.lua',
	'shared/*.lua',
	'server/botToken.lua',

}
lua54 'yes'
dependency '/assetpacks'