resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'drugs by matif'

version '1.0.0'

dependency 'es_extended'

client_scripts {
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'config.lua',
	'server/main.lua'
}