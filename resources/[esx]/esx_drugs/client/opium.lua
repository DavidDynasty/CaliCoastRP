local spawnedOpiums = 0
local opiumPlants = {}
local isPickingUp, isProcessing = false, false


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.CircleZones.OpiumField.coords, true) < 50 then
			SpawnOpiumPlants()
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.OpiumProcessing.coords, true) < 1 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('opium_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then

				if Config.LicenseEnable then
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasProcessingLicense)
						if hasProcessingLicense then
							ProcessOpium()
						else
							OpenBuyLicenseMenu('opium_processing')
						end
					end, GetPlayerServerId(PlayerId()), 'opium_processing')
				else
					ProcessOpium()
				end

			end
		else
			Citizen.Wait(500)
		end
	end
end)

function ProcessOpium()
	isProcessing = true
	local timeLeft = Config.Delays.OpiumProcessing
	local playerPed = PlayerPedId()

	TriggerEvent("mythic_progbar:client:progress", {
			name = "opiumpick",
			duration = Config.Delays.OpiumProcessing,
			label = "Bagging Opium",
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
	TriggerServerEvent('esx_drugs:processOpium')
	Citizen.Wait(timeLeft)

	if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.OpiumProcessing.coords, false) > 4 then
		ESX.ShowNotification(_U('opium_processingtoofar'))
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

		for i=1, #opiumPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(opiumPlants[i]), false) < 1 then
				nearbyObject, nearbyID = opiumPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification(_U('opium_pickupprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPickingUp then
				isPickingUp = true

				ESX.TriggerServerCallback('esx_drugs:canPickUp', function(canPickUp)

					if canPickUp then
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
						DisableControlAction(0, Keys['LEFTCTRL'], true)
						DisableControlAction(0, Keys['T'], true)
						TriggerEvent("mythic_progbar:client:progress", {
								name = "opiumpick",
								duration = 2000,
								label = "Picking Opium",
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
						ClearPedTasks(playerPed)
						ESX.Game.DeleteObject(nearbyObject)
						table.remove(opiumPlants, nearbyID)
						spawnedOpiums = spawnedOpiums - 1
		
						TriggerServerEvent('esx_drugs:pickedUpOpium')
						DisableControlAction(0, Keys['LEFTCTRL'], false)
						DisableControlAction(0, Keys['T'], false)
					else
						ESX.ShowNotification(_U('opium_inventoryfull'))
					end

					isPickingUp = false

				end, 'opium')
			end

		else
			Citizen.Wait(500)
		end

	end

end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(opiumPlants) do
			ESX.Game.DeleteObject(v)
		end
	end
end)

function SpawnOpiumPlants()
	while spawnedOpiums < 25 do
		Citizen.Wait(0)
		local opiumCoords = GenerateOpiumCoords()

		ESX.Game.SpawnLocalObject('prop_weed_02', opiumCoords, function(obj)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(opiumPlants, obj)
			spawnedOpiums = spawnedOpiums + 1
		end)
	end
end

function ValidateOpiumCoord(plantCoord)
	if spawnedOpiums > 0 then
		local validate = true

		for k, v in pairs(opiumPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.CircleZones.OpiumField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateOpiumCoords()
	while true do
		Citizen.Wait(1)

		local opiumCoordX, opiumCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-90, 90)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-90, 90)

		opiumCoordX = Config.CircleZones.OpiumField.coords.x + modX
		opiumCoordY = Config.CircleZones.OpiumField.coords.y + modY

		local coordZ = GetCoordZ(opiumCoordX, opiumCoordY)
		local coord = vector3(opiumCoordX, opiumCoordY, coordZ)

		if ValidateOpiumCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end

	return 43.0
end