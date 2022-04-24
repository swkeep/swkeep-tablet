fx_version 'cerulean'
games { 'gta5' }

author "Swkeep#7049"

client_scripts {
  'client/client.lua',
  'config.lua'
}

server_scripts {
  'server/server.lua',
}

files { 'html/*', 'html/assets/*', 'html/icons/*' }

ui_page('html/index.html')
