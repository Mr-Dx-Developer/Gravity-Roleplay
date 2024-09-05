fx_version 'cerulean'
game 'gta5'
version '1.8'
author 'aiakoscodem'
shared_scripts {
	'config/*.lua',
}
client_scripts {
	'client/*.lua',
	'editable/client_editable.lua',
}
server_scripts {
	-- '@mysql-async/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'mysql-async'.:warning:
	'@oxmysql/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'oxmysql'.:warning:
	'editable/server_editable.lua',
	'editable/discordlog.lua',
	'server/server.lua',
	'server/utility.lua',
	'server/crypto.lua',
	'server/loan.lua',
	'server/saving.lua',
	'server/dashboard.lua',
	'server/societydashboard.lua',
}
ui_page "html/index.html"
files {
	'html/index.html',
	'html/css/*.css',
	'html/fonts/*.TTF',
	'html/fonts/*.*',
	'html/sound/*.*',
	'html/images/**/*.png',
	'html/images/**/**/*.png',
	'html/js/*.js',
	'html/js/**/*.js',
	'html/images/**/*.png',
	'html/pages/**/*.js',
	'html/pages/**/*.html',
}
escrow_ignore {
	'editable/*.lua',
	'config/*.lua',
	'server/utility.lua',
	'client/utility.lua',
}
lua54 'yes'
dependency '/assetpacks'