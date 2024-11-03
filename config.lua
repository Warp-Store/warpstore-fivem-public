--[[
╔══════════════════════════════════════════════════[ www.warpstore.app ]═════════════════════════════════════════════════════════════╗

                               ██╗    ██╗ █████╗ ██████╗ ██████╗     ███████╗████████╗ ██████╗ ██████╗ ███████╗
                               ██║    ██║██╔══██╗██╔══██╗██╔══██╗     ██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗██╔════╝
                               ██║ █╗ ██║███████║██████╔╝██████╔╝    ███████╗   ██║   ██║   ██║██████╔╝█████╗  
                               ██║███╗██║██╔══██║██╔══██╗██╔═══╝       ╚════██║   ██║   ██║   ██║██╔══██╗██╔══╝  
                               ╚███╔███╔╝██║  ██║██║  ██║██║         ███████║   ██║   ╚██████╔╝██║  ██║███████╗
                                ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝           ╚══════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚══════╝
                                                                                                                                         
╚══════════════════════════════════════════════════[ www.warpstore.app ]═════════════════════════════════════════════════════════════╝                                                                                                         
--]]
local Proxy = module("vrp", "lib/Proxy")
local vRP = Proxy.getInterface("vRP")


Config = {}

Config.Warp = {
    Token = "", -- Pegue seu token em https://warpstore.app/dashboard/integration
    Interval = 5, -- Tempo em minutos que irá verificar se existe uma nova compra
    -- Todas as notificações a baixo só aparecem caso ser entrega, não reembolso e nem remoção do produto.
    Interface = {
        Enable = true,
        Ballons = true,
        Message = "💎 Olá <b>(name)</b>, a cidade agradece sua compra de (products)!"
    },
    Chat = {
        Enable = true,
        Message = "🚗💎 (name) agora faz parte da elite! Acabou de comprar (products)!"
    },
    Notify = {
        Enable = true,
        Message = "✨ <b>(name)</b>, você agora faz parte do time VIP! Sua compra de <b>(products)</b> está à sua disposição!"
    }
}

-- Todas as funções a baixo são server-side
Config.Framework = {
    GetUserName = function(Passport)
        local Identities = vRP.Identity(Passport)

        return Identities.name.." "..Identities.name2
    end,
    GetSource = function(Passport)
        local Source = vRP.Source(Passport)

        return Source
    end,
    Notify = function(Source, Message)
        TriggerClientEvent("Notify", Source, "Aviso!", Message, "verde", 10000)
    end,
    Chat = function(Message)
        TriggerEvent("chatMessage", Message)
    end
}
