local PlayerData = {}
local IsRobberyStarted = false
local isRobberyDone = false
local isInRobberyZone = false
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}

local copsConnected = 0
local blipRobbery = nil
local loopAlarm = false
local isPedArmed = false

ESX	= nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	SetTextOutline()

	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end

-- Enter / Exit robbery zone events
function RobberyZoneEvents(zone)
	Citizen.CreateThread(function()
		while isInRobberyZone do
			Citizen.Wait(100)

			local playerPed = PlayerPedId()
			local coords = GetEntityCoords(playerPed)
			local zoneTable = Config.Zones[zone]

			if GetDistanceBetweenCoords(coords, zoneTable.Pos.x, zoneTable.Pos.y, zoneTable.Pos.z, true) > zoneTable.AreaSize then
				isInRobberyZone	= false
				if not isRobberyDone then
					PlaySoundFrontend(-1, "HACKING_FAILURE", 0, 1)
					TriggerServerEvent('esx_advanced_holdup:robberyCanceled', zone, true)
					Citizen.Wait(20000)
					loopAlarm = false
				end
			end
		end
	end)
end

RegisterNetEvent('esx_advanced_holdup:robPoliceNotification')
AddEventHandler('esx_advanced_holdup:robPoliceNotification', function(zone)
	PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
	Citizen.Wait(100)
	ESX.ShowAdvancedNotification(_U('911_emergency'), _U('notif_zone_name', zone), _U('911_message_alarm'), 'CHAR_CALL911', 1)
end)

RegisterNetEvent('esx_advanced_holdup:robCompleteNotification')
AddEventHandler('esx_advanced_holdup:robCompleteNotification', function()
	isRobberyDone = true
	PlaySoundFrontend(-1, "HACKING_SUCCESS", 0, 1)
	ESX.ShowNotification(_U('robbery_complete'))
	Citizen.Wait(20000)
	loopAlarm = false
end)

RegisterNetEvent('esx_advanced_holdup:robCompleteAtNotification')
AddEventHandler('esx_advanced_holdup:robCompleteAtNotification', function(zone, complete)
	PlaySoundFrontend(-1, "Event_Start_Text", "GTAO_FM_Events_Soundset", 0)
	Citizen.Wait(100)
	if complete then
		ESX.ShowAdvancedNotification(_U('911_emergency'), _U('notif_zone_name', zone), _U('911_message_complete'), 'CHAR_CALL911', 1)
	else
		ESX.ShowAdvancedNotification(_U('911_emergency'), _U('notif_zone_name', zone), _U('911_message_cancel'), 'CHAR_CALL911', 1)
	end
end)

RegisterNetEvent('esx_advanced_holdup:copsConnected')
AddEventHandler('esx_advanced_holdup:copsConnected', function(copsNumber)
	copsConnected = copsNumber
end)

RegisterNetEvent('esx_advanced_holdup:setBlip')
AddEventHandler('esx_advanced_holdup:setBlip', function(pos)
	blipRobbery = AddBlipForCoord(pos.x, pos.y, pos.z)
	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, 1)
	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_advanced_holdup:killBlip')
AddEventHandler('esx_advanced_holdup:killBlip', function()
	Citizen.Wait(20000)
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx_advanced_holdup:startRobberingTimer')
AddEventHandler('esx_advanced_holdup:startRobberingTimer', function(zone)
	isInRobberyZone = true
	isRobberyDone = false
	loopAlarm = true

	RobberyZoneEvents(zone)
	TriggerEvent('esx_advanced_holdup:loopAlarmTriggered', zone)

	local timer = Config.Zones[zone].TimeToRob

	Citizen.CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while timer > 0 and isInRobberyZone do
			Citizen.Wait(6)
			drawTxt(0.85, 1.4, 1.0,1.0,0.4, _U('robbery_in_progress', zone, timer), 255, 255, 255, 255)
		end
	end)
end)

RegisterNetEvent('esx_advanced_holdup:loopAlarmTriggered')
AddEventHandler('esx_advanced_holdup:loopAlarmTriggered', function(zone)
	while loopAlarm do
		PlaySoundFromCoord(-1, "scanner_alarm_os", Config.Zones[zone].Pos.x, Config.Zones[zone].Pos.y, Config.Zones[zone].Pos.z, "dlc_xm_iaa_player_facility_sounds", 1, 100, 0)
		Citizen.Wait(1000)
	end
end)

AddEventHandler('esx_advanced_holdup:hasEnteredMarker', function(zone)
	CurrentAction     = 'start_robbery'
	CurrentActionMsg  = _U('press_to_rob')
	CurrentActionData = {zone = zone}
end)

AddEventHandler('esx_advanced_holdup:hasExitedMarker', function(zone)
	CurrentAction = nil
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if isPedArmed then
			for _, v in pairs(Config.Zones) do
				if v.PoliceRequired <= copsConnected and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < Config.DrawDistance then
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, false, false, false, false)
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

-- Enter / Exit marker events
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)

		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local isInMarker = false
		local isEnoughCops = false
		local currentZone = nil

		if IsPedArmed(playerPed, 4) then
			isPedArmed = true
			for k, v in pairs(Config.Zones) do
				if v.PoliceRequired <= copsConnected and GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true) < v.Size.x then
					isInMarker = true
					isEnoughCops = true
					currentZone = k
				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker and isEnoughCops) or (isInMarker and LastZone ~= currentZone and isEnoughCops) then
				HasAlreadyEnteredMarker = true
				LastZone = currentZone
				TriggerEvent('esx_advanced_holdup:hasEnteredMarker', currentZone)
			end
		else
			isPedArmed = false
		end

		if (not isInMarker or not isEnoughCops or not isPedArmed) and HasAlreadyEnteredMarker then
			HasAlreadyEnteredMarker = false
			TriggerEvent('esx_advanced_holdup:hasExitedMarker', LastZone)
			Citizen.Wait(500)
		end

		if not isPedArmed then
			Citizen.Wait(500)
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8)

		if CurrentAction == nil then
			Citizen.Wait(250)
		else
			ESX.ShowHelpNotification(CurrentActionMsg)

			if IsControlJustReleased(0, 38) and IsInputDisabled(0) then
				local playerPed = PlayerPedId()
				if not IsPedOnFoot(playerPed) then
					ESX.ShowNotification(_U('can_inside_vehicle'))
				else
					local zone = CurrentActionData.zone
					TriggerServerEvent('esx_advanced_holdup:robberyInProgress', zone)
				end

				CurrentAction = nil
			end
		end
	end
end)
