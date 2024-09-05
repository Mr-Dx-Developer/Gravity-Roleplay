fx_version 'cerulean'
game 'gta5'
version '1.0.0'
lua54 'yes' -- Add in case you want to use lua 5.4 (https://www.lua.org/manual/5.4/manual.html)
client_scripts {
    'config.lua',
    'garbageCollector.lua',
    'crosshair/crosshair.lua',
    'recoil/recoil.lua',
    'recoil/exports.lua',
    'recoil/components.lua',
    'disableHeadshot/disableHeadshot.lua',
    'weaponDamages/weaponDamages.lua',
    'rollPrevention/rollPrevention.lua',
    'removeWhipping/removeWhipping.lua',
}
server_scripts {
    'config.lua',
}
exports {
    'AlterSpecificGunRecoil',
    'AlterGeneralGunRecoil',
    'ResetAllGunRecoil',
    'ViewCamForcerJoined',
}
ui_page "/crosshair/html/index.html"
files {
    '/crosshair/html//index.html',
    '/crosshair/html//css/style.css',
    '/crosshair/html//js/script.js',
    '/crosshair/html//img/crosshair.png'
}
