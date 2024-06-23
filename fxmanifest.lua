fx_version 'adamant'
game 'gta5'

ui_page 'https://plugins.warpstore.app/fivem/web/index.html'

version '2.0.2'

client_scripts { 'src/warpstore.client.js' }
server_scripts { '@vrp/lib/utils.lua', 'config.js', 'external.js', 'src/warpstore.server.js' }
