fx_version 'cerulean'
games { 'gta5' }

author "Swkeep#7049"

client_scripts {
  'client/client.lua',
  'config.lua',
  'client/functions.lua'
}

shared_scripts {
  'shared/shared.lua'
}

server_script {
  'server/server.lua',
  'server/functions.lua',
}

files { 'html/*', 'html/assets/*', 'html/icons/*' }

ui_page('html/index.html')
