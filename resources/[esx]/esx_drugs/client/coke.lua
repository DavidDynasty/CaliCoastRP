local spawnedCokes = 0
local cokePlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeField.coords, true) < 50 then
			SpawnCokePlants()
			Citizen.Wait(500)
		else
			Citizen.Wait(500)
		end
	end
end)   

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.CokeProcessing.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('coke_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				ProcessCoke()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessCoke()
	isProcessing = true
	local timeLeft = Config.Delays.CokeProcessing
	local playerPed = PlayerPedId()

	TriggerEvent("mythic_progbar:client:progress", {
		name = "cokeprocess",
		duration = Config.Delays.OpiumProcessing,
		label = "Bagging Coke",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
	}, function(status)
		if not status then
			-- Do Something If Event Wasn't Cancelled
		end
	end)

	TriggerServerEvent('esx_drugs:processCoke')
	Citizen.Wait(timeLeft)
	if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.CokeProcessing.coords, false) > 4 then
		ESX.ShowNotification(_U('coke_processingtoofar'))
		TriggerServerEvent('esx_drugs:cancelProcessing')
	end

	isProcessing = false
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #cokePlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(cokePlants[i]), false) < 1 then
				nearbyObject, nearbyID = cokePlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('coke_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true
				DisableControlAction(0, Keys['LEFTCTRL'], true)
				DisableControlAction(0, Keys['T'], true)

				ESX.TriggerServerCallback('esx_drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
						DisableControlAction(0, Keys['LEFTCTRL'], true)
						DisableControlAction(0, Keys['T'], true)
						TriggerEvent("mythic_progbar:client:progress", {
								name = "cokepick",
								duration = 2000,
								label = "Picking Coca",
								useWhileDead = false,
								canCancel = false,
								controlDisables = {
									disableMovement = true,
									disableCarMovement = true,
									disableMouse = false,
									disableCombat = true,
								},
						}, function(status)
							if not status then
								-- Do Something If Event Wasn't Cancelled
							end
						end)
						ESX.Game.DeleteObject(nearbyObject)
						ClearPedTasks(playerPed)		
						table.remove(cokePlants, nearbyID)
						spawnedCokes = spawnedCokes - 1
		
						TriggerServerEvent('esx_drugs:pickedUpCoke')
					else
						ESX.ShowNotification(_U('coke_inventoryfull'))

					end

					isPickingUp = false
					DisableControlAction(0, Keys['LEFTCTRL'], false)
					DisableControlAction(0, Keys['T'], false)
				end, 'coke')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(cokePlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnCokePlants()
	while spawnedCokes < 25 do
		Citizen.Wait(0)
		local cokeCoords = GenerateCokeCoords()

		ESX.Game.SpawnLocalObject('prop_weed_01', cokeCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(cokePlants, obj)
			spawnedCokes = spawnedCokes + 1
		end)
	end
end

function ValidateCokeCoord(plantCoord)
	if spawnedCokes > 0 then
		local validate = true

		for k, v in pairs(cokePlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.CokeField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateCokeCoords()
	while true do
		Citizen.Wait(1)

		local cokeCoordX, cokeCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-30, 30)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-30, 30)

		cokeCoordX = Config.CircleZones.CokeField.coords.x + modX
		cokeCoordY = Config.CircleZones.CokeField.coords.y + modY

		local coordZ = Config.CircleZones.CokeField.coords.z--GetCoordZ(cokeCoordX, cokeCoordY)
		local coord = vector3(cokeCoordX, cokeCoordY, coordZ)

		if ValidateCokeCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 57.0, 58.0, 59.0, 60.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, Config.CircleZones.CokeField.coords.z)

		if foundGround then
			return z
		end
	end

	return 43.0
end