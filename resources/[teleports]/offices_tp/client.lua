key_to_teleport = 38

positions = {
	-- Offices
    --[[{{-1362.407, -472.136, 30.596, 103.500}, {-1388.755, -480.907, 77.200, 8.452}, "Press E to Teleport | W. Maze Bank Mod Shop"},
    {{-1370.964, -503.463, 31.650, 150.131}, {-1399.251, -481.576, 70.550, 334.465}, "Press E to Teleport | W. Maze Bank Office"},
	{{-1397.591, -470.406, 76.600, 277.998}, {-1388.917, -481.155, 70.550, 15.264}, "Press E to Teleport | Mod Shop"},
	{{-1399.741, -479.254, 70.550, 213.181}, {-1368.914, -471.645, 82.900, 302.966}, "Press E to Teleport | Roof Access"},
	{{-115.887, -604.964, 34.800, 248.760}, {-142.039, -614.338, 167.300, 261.673}, "Press E to Teleport | Arcadius Business Centre Office"},
	{{-142.313, -624.713, 167.300, 276.926}, {-146.454, -603.822, 165.500, 40.219}, "Press E to Teleport | Mod Shop"},
	{{-137.868, -624.140, 167.300, 97.058}, {-198.013, -580.724, 134.500, 279.530}, "Press E to Teleport | Garage"},
	{{-140.082, -613.947, 167.300, 114.171}, {-144.634, -599.274, 205.400, 157.788}, "Press E to Teleport | Roof Access"},
	{{-143.925, -575.996, 31.400, 159.148}, {-141.679, -590.459, 166.000, 131.716}, "Press E to Teleport | Arcadius Business Centre Mod Shop"},
	{{-68.461, -800.435, 42.700, 343.794}, {-77.866, -833.427, 241.900, 33.931}, "Press E to Teleport | Maze Bank Office"},
	{{-73.067, -824.069, 241.900, 72.332}, {-70.086, -827.780, 283.500, 71.429}, "Press E to Teleport | Mod Shop"},
	{{-77.580, -822.682, 241.900, 252.109}, {-91.338, -821.349, 220.500, 251.889}, "Press E to Teleport | Garage"},
	{{-80.070, -832.899, 241.900, 269.804}, {-75.219, -824.831, 319.500, 157.830}, "Press E to Teleport | Roof Access"},
	{{-84.193, -821.564, 35.000, 350.110}, {-72.779, -814.612, 284.000, 158.892}, "Press E to Teleport | Maze Bank Mod Shop"},
	{{-1581.475, -558.026, 33.000, 37.768}, {-1583.611, -559.497, 107.000, 282.078}, "Press E to Teleport | Lombank Office"},
	{{-1574.608, -565.779, 107.000, 126.856}, {-1585.958, -561.924, 85.000, 218.178}, "Press E to Teleport | Garage"},
	{{-1581.788, -558.048, 107.000, 147.423}, {-1570.193, -576.450, 113.000, 35.738}, "Press E to Teleport | Roof Access"},
	{{-1537.437, -577.770, 24.700, 36.268}, {-1576.677, -585.784, 85.500, 303.768}, "Press E to Teleport | Lombank Garage"},]]--
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