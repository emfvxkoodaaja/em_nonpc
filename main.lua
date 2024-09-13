Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Prevent crashing.

        -- Stop random spawns for cops and vehicles
        SetCreateRandomCops(false)
        SetCreateRandomCopsNotOnScenarios(false)
        SetCreateRandomCopsOnScenarios(false)
        SetGarbageTrucks(false)
        SetRandomBoats(false)
        
        -- Increase pedestrian density and reduce vehicle density
        SetVehicleDensityMultiplierThisFrame(0.01) -- Reduce vehicle density
        SetPedDensityMultiplierThisFrame(0.8) -- Increase pedestrian density
        SetRandomVehicleDensityMultiplierThisFrame(0.05) -- Reduce random vehicle density
        SetScenarioPedDensityMultiplierThisFrame(0.8, 0.8) -- Increase scenario pedestrian density
        SetParkedVehicleDensityMultiplierThisFrame(0.05) -- Reduce parked vehicle density

        -- Clear vehicles from a large area to reduce congestion
        local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
        ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
        RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
    end
end)
