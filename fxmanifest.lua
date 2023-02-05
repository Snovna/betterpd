fx_version 'cerulean'
games { 'gta5' }

author 'Snov'
description 'Better Police Department'
version '0.1'

client_scripts {
    'client_core.lua',
    '**/client.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server_core.lua',
    '**/server.lua',
}