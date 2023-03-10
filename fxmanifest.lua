fx_version 'cerulean'
games { 'gta5' }

author 'Snov'
description 'Better Police Department'
version '0.2'
lua54 'yes'

client_scripts {
    'client_core.lua',
    '**/client.lua',
}

shared_scripts {
	'@es_extended/imports.lua',
	'@ox_lib/init.lua',
    '**/config.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server_core.lua',
    '**/server.lua',
}

dependency 'ox_target'