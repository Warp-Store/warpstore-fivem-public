RegisterNetEvent('warpShowMessage')
AddEventHandler('warpShowMessage', function (content) {
    SendNUIMessage({
        title: content.title,
        subTitle: content.subTitle,
        resourceName: GetCurrentResourceName()
    })
    SetNuiFocus(false, false)
})

RegisterNUICallback('removeFocus', function (data, cb) {
    SetNuiFocus(false, false)
    cb(true)
})
