local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    -- Create a Zone at the location instead of spawning a prop
    exports['ox_target']:addBoxZone({
        coords = Config.Location,
        size = vec3(1.0, 1.0, 1.0),
        rotation = 0.0,
        debug = false,
        options = {
            {
                name = 'unity_cake:cut',
                event = 'unity_cake:client:cut',
                icon = 'fas fa-birthday-cake',
                label = Config.Text.TargetLabel,
                distance = 2.0
            }
        }
    })
end)

RegisterNetEvent('unity_cake:client:cut', function()
    local ped = PlayerPedId()
    
    QBCore.Functions.Progressbar("cut_cake", Config.Animation.label, Config.Animation.duration, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = Config.Animation.dict,
        anim = Config.Animation.anim,
        flags = 49,
    }, {}, {}, function() -- Done
        TriggerServerEvent('unity_cake:server:cut')
        ClearPedTasks(ped)
    end, function() -- Cancel
        QBCore.Functions.Notify("Cancelled", "error")
        ClearPedTasks(ped)
    end)
end)
