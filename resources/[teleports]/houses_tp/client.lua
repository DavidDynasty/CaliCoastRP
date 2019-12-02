key_to_teleport = 38

positions = {
	-- Houses
	{{-174.901, 502.377, 135.500, 77.733}, {-174.339, 497.536, 136.060, 190.776}, "Press E to Teleport | House 1 - Wild Oats Dr."},
    {{-167.593, 478.521, 132.300, 344.395}, {-167.332, 476.792, 132.600, 189.395}, "Press E to Teleport | Deck"},
	{{346.605, 440.606, 146.000, 295.325}, {341.877, 437.765, 147.850, 113.547}, "Press E to Teleport | House 1 - North Conker Ave"},
	{{373.731, 427.791, 144.000, 54.982}, {373.590, 423.721, 144.320, 165.157}, "Press E to Teleport | House 2 - North Conker Ave"},
	{{119.508, 564.123, 182.500, 7.216}, {117.196, 559.920, 182.700, 178.512}, "Press E to Teleport | House 1 - Whispymound Dr."},
	{{-1294.289, 454.388, 95.900, 1.750}, {-1289.871, 449.691, 96.400, 178.826}, "Press E to Teleport | House 1 - Mad Wayne Thunder Dr."},
	{{-852.913, 695.416, 147.300, 1.805}, {-859.906, 691.430, 151.400, 178.617}, "Press E to Teleport | House 1 - Hillcrest Ave"},
	{{-753.173, 620.436, 140.850, 285.513}, {-758.364, 619.071, 142.600, 107.752}, "Press E to Teleport | House 2 - Hillcrest Ave"},
	{{-686.045, 596.303, 142.110, 39.001}, {-682.433, 592.444, 143.900, 220.426}, "Press E to Teleport | House 3 - Hillcrest Ave"},
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