fx_version 'cerulean'
games {'gta5'}

author 'Nemesus.de'
description 'Funmodus for ESX'
contact 'info@nemesus.de'
version '1.0.0'

dependencies {
	"es_extended"
}

shared_script '@es_extended/imports.lua'

client_script 'client.lua'

server_script 'server.lua'
