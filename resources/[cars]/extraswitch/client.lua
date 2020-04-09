mainOn = false
secOn = false
takeOn = false
steadyOn = false
warnOn = false
alleyOn = false

local colors = {
	[true] = {0, 255, 0},
	[false] = {255, 0, 0}
}

function DrawAdvancedText(x,y ,w,h,sc, text, color,a,font,jus)
	local r, g, b = table.unpack(color)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		if IsControlJustPressed(0, 124) then -- Numpad 4 Main Light Bar 7
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 7)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 7, ison)
			mainOn = not ison
		elseif IsControlJustPressed(0, 126) then -- Numpad 5 Rear Flashers 8
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 8)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 8, ison)
			secOn = not ison
		elseif IsControlJustPressed(0, 125) then -- Front Takedown Flashers 9
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 9)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 9, ison)
			takeOn = not ison
		elseif IsControlJustPressed(0, 117) then -- Cruise Lights 10
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 10)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 10, ison)
			steadyOn = not ison
		elseif IsControlJustPressed(0, 127) then -- Yellow Rear Flashers 11
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 11)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 11, ison)
			warnOn = not ison
		elseif IsControlJustPressed(0, 118) then -- Alley Lights 12
			local veh = GetVehiclePedIsIn(ped, false)
			local ison = IsVehicleExtraTurnedOn(veh, 12)
			SetVehicleAutoRepairDisabled(veh, true)
			SetVehicleExtra(veh, 12, ison)
			alleyOn = not ison
		elseif IsControlJustPressed(0, 96) then -- Fix Vehicle
			local veh = GetVehiclePedIsIn(ped, false)
			SetVehicleFixed(veh)
		end
		if IsPedInAnyVehicle(ped, true) then
			DrawRect(0.085, 0.78, 0.140, 0.030, 0, 0, 0, 150)
			DrawAdvancedText(0.124, 0.785, 0.005, 0.0028, 0.3, "Primary", colors[mainOn], 255, 6, 0)
	    DrawAdvancedText(0.152, 0.785, 0.005, 0.0028, 0.3, "Secondary", colors[secOn], 255, 6, 0)
	   	DrawAdvancedText(0.180, 0.785, 0.005, 0.0028, 0.3, "Aux1", colors[takeOn], 255, 6, 0)
	   	DrawAdvancedText(0.204, 0.785, 0.005, 0.0028, 0.3, "Aux2", colors[steadyOn], 255, 6, 0)
	   	DrawAdvancedText(0.224, 0.785, 0.005, 0.0028, 0.3, "Aux3", colors[warnOn], 255, 6, 0)
	   	DrawAdvancedText(0.242, 0.785, 0.005, 0.0028, 0.3, "Alley", colors[alleyOn], 255, 6, 0)
		end
	end
end)


------------------------------------------------------------------
------------------------------------------------------------------
------------------------------------------------------------------
