local isPackaging = false
local isProcessing = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethProcessing.coords, true) < 2 then
			if not isProcessing then
				ESX.ShowHelpNotification(_U('meth_processprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isProcessing then
				PrepareMeth()
			end
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

		if GetDistanceBetweenCoords(coords, Config.CircleZones.MethPackaging.coords, true) < 2 then
			if not isPackaging then
				ESX.ShowHelpNotification(_U('meth_packageprompt'))
			end

			if IsControlJustReleased(0, Keys['E']) and not isPackaging then
				PackageMeth()
			end
		else
			Citizen.Wait(500)
		end
	end
end)

function PrepareMeth()
	isProcessing = true
	local timeLeft = Config.Delays.MethPrep
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_DRUG_DEALER', 0, false)
	TriggerEvent("mythic_progbar:client:progress", {
		name = "meth_prep",
		duration = Config.Delays.MethPrep,
		label = "Preparing Meth",
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

	TriggerServerEvent('esx_drugs:prepareMeth')
	Citizen.Wait(timeLeft)

	if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.MethProcessing.coords, false) > 4 then
		ESX.ShowNotification(_U('meth_processingtoofar'))
		TriggerServerEvent('esx_drugs:cancelProcessing')
	end
	isProcessing = false
end

function PackageMeth()
	isPackaging = true
	local timeLeft = Config.Delays.MethPrep
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_DRUG_DEALER', 0, false)
	TriggerEvent("mythic_progbar:client:progress", {
		name = "meth_prep",
		duration = Config.Delays.MethPrep,
		label = "Packaging Meth",
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

	TriggerServerEvent('esx_drugs:packageMeth')
	Citizen.Wait(Config.Delays.MethPrep)

	if GetDistanceBetweenCoords(GetEntityCoords(playerPed), Config.CircleZones.MethPackaging.coords, false) > 4 then
		ESX.ShowNotification(_U('meth_processingtoofar'))
		TriggerServerEvent('esx_drugs:cancelProcessing')
	end
	isPackaging = false
end

