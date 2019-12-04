key_to_teleport = 38

positions = {
	-- Apartments
	--{{-906.828, -451.865, 38.000, 119.777}, {-890.659, -436.842, 120.000, 28.548}, "Press E to Use Elevator | Weazel Plaza Apt. 2"},
	--{{-909.734, -446.484, 38.000, 118.663}, {-890.872, -452.837, 93.900, 294.682}, "Press E to Use Elevator | Weazel Plaza Apt. 1"},
	--{{-1447.163, -538.165, 33.000, 218.311}, {-1452.716, -539.928, 72.200, 33.605}, "Press E to Use Elevator | Del Perro Heights Apt. 1"},
	--{{-44.875, -587.175, 36.500, 70.069}, {-18.491, -591.327, 88.500, 341.167}, "Press E to Use Elevator | Integrity Way Apt. 1"},
	--{{-44.070, -584.571, 36.500, 72.721}, {-25.468, -607.311, 98.700, 250.338}, "Press E to Use Elevator | Integrity Way Apt. 2"},
	--{{-621.032, 46.069, 42.000, 184.905}, {-596.452, 56.013, 106.500, 359.388}, "Press E to Use Elevator | Tinsel Towers Apt. 2"},
	--{{-614.624, 46.129, 42.000, 180.680}, {-604.937, 51.327, 92.100, 180.266}, "Press E to Use Elevator | Tinsel Towers Apt. 1"},
	--{{-770.443, 319.714, 84.000, 186.027}, {-774.047, 341.989, 195.000, 90.660}, "Press E to Use Elevator | Eclipse Towers Penthouse 2"},
	--{{-777.135, 319.673, 84.000, 177.928}, {-786.721, 315.783, 216.000, 268.414}, "Press E to Use Elevator | Eclipse Towers Penthouse 1"},
	--{{-264.255, -959.918, 29.700, 116.338}, {-269.879, -941.118, 91.000, 73.025}, "Press E to Use Elevator | Alta Street Apt. 2"},
	--{{-268.617, -962.357, 29.700, 300.776}, {-273.280, -967.213, 75.700, 248.961}, "Press E to Use Elevator | Alta Street Apt. 1"},
}

-----------------------------------------------------------------------------
-------------------------DO NOT EDIT BELOW THIS LINE-------------------------
-----------------------------------------------------------------------------

local player = GetPlayerPed(-1)

Citizen.CreateThread(function ()
    while true do
        Citizen.Wait(5)
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for i,location in ipairs(positions) do
            teleport_text = location[3]
            loc1 = {
                x=location[1][1],
                y=location[1][2],
                z=location[1][3],
                heading=location[1][4]
            }
            loc2 = {
                x=location[2][1],
                y=location[2][2],
                z=location[2][3],
                heading=location[2][4]
            }

            DrawMarker(1, loc1.x, loc1.y, loc1.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)
            DrawMarker(1, loc2.x, loc2.y, loc2.z, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, 0, 0, 255, 200, 0, 0, 0, 0)

            if CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc1.x, loc1.y, loc1.z, 2) then 
                alert(teleport_text)
                
                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc2.heading)
                    else
                        SetEntityCoords(player, loc2.x, loc2.y, loc2.z)
                        SetEntityHeading(player, loc2.heading)
                    end
                end

            elseif CheckPos(playerLoc.x, playerLoc.y, playerLoc.z, loc2.x, loc2.y, loc2.z, 2) then
                alert(teleport_text)

                if IsControlJustReleased(1, key_to_teleport) then
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), loc1.heading)
                    else
                        SetEntityCoords(player, loc1.x, loc1.y, loc1.z)
                        SetEntityHeading(player, loc1.heading)
                    end
                end
            end            
        end
    end
end)

function CheckPos(x, y, z, cx, cy, cz, radius)
    local t1 = x - cx
    local t12 = t1^2

    local t2 = y-cy
    local t21 = t2^2

    local t3 = z - cz
    local t31 = t3^2

    return (t12 + t21 + t31) <= radius^2
end

function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end