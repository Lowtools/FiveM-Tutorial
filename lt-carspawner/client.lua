RegisterCommand('car', function(source, args)
    local carName = args[1]

    if not IsModelInCdimage(carName) then
        print('Dit voertuig bestaat niet.')
        return
    end

    RequestModel(carName)

    while not HasModelLoaded(carName) do
        Wait(750)
    end

    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)

    local vehicle = CreateVehicle(carName, playerPos.x, playerPos.y, playerPos.z, GetEntityHeading(playerPed), true, false)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    print('Je hebt succesvol een ' ..carName.. ' gespawnd!')
end)
