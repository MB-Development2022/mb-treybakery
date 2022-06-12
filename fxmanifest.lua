fx_version 'cerulean'
game 'gta5'

author 'MB Development'
description 'mb-treybakery for QBCore '
version '1.0.0'

shared_scripts {
    'config.lua',
}

client_scripts {
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/main.lua',
}

server_script 'server/main.lua'