ESX = nil
local playersProcessingCannabis = {}
local playersProcessingCoke = {}
local playersPreparingMeth = {}
local playersPackagingMeth = {}
local playersProcessingOpium = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_drugs:sellDrug')
AddEventHandler('esx_drugs:sellDrug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugDealerItems[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_drugs: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('dealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)

	if Config.GiveBlack then
		xPlayer.addAccountMoney('black_money', price)
	else
		xPlayer.addMoney(price)
	end

	xPlayer.removeInventoryItem(xItem.name, amount)

	TriggerClientEvent('esx:showNotification', source, _U('dealer_sold', amount, xItem.label, ESX.Math.GroupDigits(price)))
end)

ESX.RegisterServerCallback('esx_drugs:buyLicense', function(source, cb, licenseName)
	local xPlayer = ESX.GetPlayerFromId(source)
	local license = Config.LicensePrices[licenseName]

	if license == nil then
		print(('esx_drugs: %s attempted to buy an invalid license!'):format(xPlayer.identifier))
		cb(false)
	end

	if xPlayer.getMoney() >= license.price then
		xPlayer.removeMoney(license.price)

		TriggerEvent('esx_license:addLicense', source, licenseName, function()
			cb(true)
		end)
	else
		cb(false)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpCannabis')
AddEventHandler('esx_drugs:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('weed')
	local xAmt = math.random(4,6)
	if xItem.limit ~= -1 and (xItem.count + xAmt) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, xAmt)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpCoke')
AddEventHandler('esx_drugs:pickedUpCoke', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('coke')
	local xAmt = math.random(4,6)

	if xItem.limit ~= -1 and (xItem.count + xAmt) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('coke_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, xAmt)
	end
end)

RegisterServerEvent('esx_drugs:pickedUpOpium')
AddEventHandler('esx_drugs:pickedUpOpium', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('opium')
	local xAmt = math.random(4,6)
	if xItem.limit ~= -1 and (xItem.count + xAmt) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('opium_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, xAmt)
	end
end)


ESX.RegisterServerCallback('esx_drugs:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)

RegisterServerEvent('esx_drugs:processCannabis')
AddEventHandler('esx_drugs:processCannabis', function()
	if not playersProcessingCannabis[source] then
		local _source = source

		playersProcessingCannabis[_source] = ESX.SetTimeout(Config.Delays.WeedProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xWeed, xWeedBag, xBaggies = xPlayer.getInventoryItem('weed'), xPlayer.getInventoryItem('weed_pooch'), xPlayer.getInventoryItem('baggie')

			if xWeedBag.limit ~= -1 and (xWeedBag.count + 1) > xWeedBag.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('weed_processingfull'))
			elseif xWeed.count < 10 then
				TriggerClientEvent('esx:showNotification', _source, _U('weed_processingenough'))
			elseif xBaggies.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_baggies'))
			else
				xPlayer.removeInventoryItem('weed', 10)
				xPlayer.removeInventoryItem('baggie', 1)
				xPlayer.addInventoryItem('weed_pooch', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('weed_processed'))
			end

			playersProcessingCannabis[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit weed processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:processCoke')
AddEventHandler('esx_drugs:processCoke', function()
	if not playersProcessingCoke[source] then
		local _source = source

		playersProcessingCoke[_source] = ESX.SetTimeout(Config.Delays.CokeProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xCoke, xCokeBags, xBaggies = xPlayer.getInventoryItem('coke'), xPlayer.getInventoryItem('coke_pooch'), xPlayer.getInventoryItem('baggie')

			if xCokeBags.limit ~= -1 and (xCokeBags.count + 1) > xCokeBags.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingfull'))
			elseif xCoke.count < 10 then
				TriggerClientEvent('esx:showNotification', _source, _U('coke_processingenough'))
			elseif xBaggies.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_baggies'))
			else
				xPlayer.removeInventoryItem('coke', 10)
				xPlayer.removeInventoryItem('baggie', 1)
				xPlayer.addInventoryItem('coke_pooch', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('coke_processed'))
			end

			playersProcessingCoke[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:processOpium')
AddEventHandler('esx_drugs:processOpium', function()
	if not playersProcessingOpium[source] then
		local _source = source

		playersProcessingOpium[_source] = ESX.SetTimeout(Config.Delays.OpiumProcessing, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xOpium, xOpiumBags, xBaggies = xPlayer.getInventoryItem('opium'), xPlayer.getInventoryItem('opium_pooch'), xPlayer.getInventoryItem('baggie')

			if xOpiumBags.limit ~= -1 and (xOpiumBags.count + 1) > xOpiumBags.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('opium_processingfull'))
			elseif xOpium.count < 10 then
				TriggerClientEvent('esx:showNotification', _source, _U('opium_processingenough'))
			elseif xBaggies.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_baggies'))
			else
				xPlayer.removeInventoryItem('opium', 10)
				xPlayer.removeInventoryItem('baggie', 1)
				xPlayer.addInventoryItem('opium_pooch', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('opium_processed'))
			end

			playersProcessingOpium[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit coke processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:prepareMeth')
AddEventHandler('esx_drugs:prepareMeth', function()
	if not playersPreparingMeth[source] then
		local _source = source

		playersPreparingMeth[_source] = ESX.SetTimeout(Config.Delays.MethPrep, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xMeth, xBattery, xBrakeFluid, xColdMedicine, xDrano, xFertilizer, xHCL, xMatches, xNailPolish, xNAOH = xPlayer.getInventoryItem('meth'), xPlayer.getInventoryItem('battery'), xPlayer.getInventoryItem('brake_fluid'), xPlayer.getInventoryItem('cold_medicine'), xPlayer.getInventoryItem('drano'), xPlayer.getInventoryItem('fertilizer'), xPlayer.getInventoryItem('hydrochloric_acid'), xPlayer.getInventoryItem('matches'), xPlayer.getInventoryItem('nail_polish'), xPlayer.getInventoryItem('sodium_hydroxide')
			local xAmt = math.random(10, 15)
			if xMeth.limit ~= -1 and (xMeth.count + 1) > xMeth.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('meth_processingfull'))
			elseif xBattery.count < 1 or xBrakeFluid.count < 1 or xColdMedicine.count < 1 or xDrano.count < 1 or xFertilizer.count < 1 or xHCL.count < 1 or xMatches.count < 1 or xNailPolish.count < 1 or xNAOH.count < 1  then
				TriggerClientEvent('esx:showNotification', _source, _U('meth_processingenough'))
			else
				xPlayer.removeInventoryItem('battery', 1)
				xPlayer.removeInventoryItem('brake_fluid', 1)
				xPlayer.removeInventoryItem('cold_medicine', 1)
				xPlayer.removeInventoryItem('drano', 1)
				xPlayer.removeInventoryItem('fertilizer', 1)
				xPlayer.removeInventoryItem('hydrochloric_acid', 1)
				xPlayer.removeInventoryItem('matches', 1)
				xPlayer.removeInventoryItem('nail_polish', 1)
				xPlayer.removeInventoryItem('sodium_hydroxide', 1)
				xPlayer.addInventoryItem('meth', xAmt)

				TriggerClientEvent('esx:showNotification', _source, _U('meth_processed'))
			end

			playersPreparingMeth[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit meth processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

RegisterServerEvent('esx_drugs:packageMeth')
AddEventHandler('esx_drugs:packageMeth', function()
	if not playersPackagingMeth[source] then
		local _source = source

		playersPackagingMeth[_source] = ESX.SetTimeout(Config.Delays.MethPrep, function()
			local xPlayer = ESX.GetPlayerFromId(_source)
			local xMeth, xMethBags, xBaggies = xPlayer.getInventoryItem('meth'), xPlayer.getInventoryItem('meth_pooch'), xPlayer.getInventoryItem('baggie')

			if xMethBags.limit ~= -1 and (xMethBags.count + 1) >= xMethBags.limit then
				TriggerClientEvent('esx:showNotification', _source, _U('meth_packagingfull'))
			elseif xMeth.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('meth_packagingenough'))
			elseif xBaggies.count < 1 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_baggies'))
			else
				xPlayer.removeInventoryItem('meth', 10)
				xPlayer.removeInventoryItem('baggie', 1)
				xPlayer.addInventoryItem('meth_pooch', 1)

				TriggerClientEvent('esx:showNotification', _source, _U('meth_packaged'))
			end
			playersPackagingMeth[_source] = nil
		end)
	else
		print(('esx_drugs: %s attempted to exploit meth processing!'):format(GetPlayerIdentifiers(source)[1]))
	end
end)

function CancelProcessing(playerID)
	if playersProcessingCannabis[playerID] then
		ESX.ClearTimeout(playersProcessingCannabis[playerID])
		playersProcessingCannabis[playerID] = nil
	elseif playersProcessingCoke[playerID] then
		ESX.ClearTimeout(playersProcessingCoke[playerID])
		playersProcessingCoke[playerID] = nil
	elseif playersProcessingOpium[playerID] then
		ESX.ClearTimeout(playersProcessingOpium[playerID])
		playersProcessingOpium[playerID] = nil
	elseif playersPreparingMeth[playerID] then
		ESX.ClearTimeout(playersPreparingMeth[playerID])
		playersPreparingMeth[playerID] = nil
	elseif playersPackagingMeth[playerID] then
		ESX.ClearTimeout(playersPackagingMeth[playerID])
		playersPackagingMeth[playerID] = nil

	end
end

RegisterServerEvent('esx_drugs:cancelProcessing')
AddEventHandler('esx_drugs:cancelProcessing', function()
	CancelProcessing(source)
end)

AddEventHandler('esx:playerDropped', function(playerID, reason)
	CancelProcessing(playerID)
end)

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	CancelProcessing(source)
end)
