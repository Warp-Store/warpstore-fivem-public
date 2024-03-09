fx_version 'bodacious'
game 'gta5'

name 'FiveM Typescript Boilerplate'
description 'A boilerplate for using Typescript in FiveM'
author 'Remco Troost (d0p3t)'
url 'https://github.com/d0p3t/fivem-ts-boilerplate'

client_scripts {'src/warpstore.client.lua'}
server_scripts {'@vrp/lib/utils.lua', 'src/warpstore.server.js' }

ui_page "src/index.html"

files {"src/index.html"}