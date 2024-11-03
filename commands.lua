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

-- Todos os comandos são server-side
Commands = {}


Commands["Money"] = function(Passport, Args)
    vRP.GiveBank(Passport, Args[1])

    return true -- Se você retorna false ou nada ele vai considerar que não conseguiu adicionar!
end


Commands["AddGroup"] = function(Passport, Args)
    vRP.SetPermission(Passport, Args[1], Args[2])

    return true -- Se você retorna false ou nada ele vai considerar que não conseguiu adicionar!
end


Commands["RemGroup"] = function(Passport, Args)
    vRP.RemovePermission(Passport, Args[1])

    return true -- Se você retorna false ou nada ele vai considerar que não conseguiu adicionar!
end


Commands["AddCar"] = function(Passport, Args)
    vRP.Query("vehicles/addVehicles",{ Passport = Passport, vehicle = Args[1], plate = vRP.GeneratePlate(), work = tostring(false) })

    return true -- Se você retorna false ou nada ele vai considerar que não conseguiu adicionar!
end


Commands["RemCar"] = function(Passport, Args)
    vRP.Query("vehicles/removeVehicles",{ Passport = Passport, vehicle = Args[1]})

    return true -- Se você retorna false ou nada ele vai considerar que não conseguiu adicionar!
end


return Commands