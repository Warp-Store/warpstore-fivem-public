RegisterNetEvent('warpShowMessage')
AddEventHandler('warpShowMessage', function(title, subTitle)
    SendNUIMessage({title = title, subTitle = subTitle, resourceName =  GetCurrentResourceName()});
    --SetNuiFocus(true, false)
end)

RegisterNUICallback('removeFocus', function(data, cb)
    --SetNuiFocus(false, false)
    cb(true)
end)
