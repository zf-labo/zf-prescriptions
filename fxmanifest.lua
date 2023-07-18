fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'ZF LABO'
description 'Prescriptions for Ambulance Job'
version '1.0.0'

client_script 'client/*.lua'
server_script 'server/*.lua'
shared_scripts {
    '@zf-lib/init.lua',
    '@ox_lib/init.lua',
    'shared/*.lua',
    'locales/*.lua',
}