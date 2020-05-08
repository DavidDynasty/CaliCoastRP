ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

synced = {
    ['amphetamine'] = 1,
    ['methamphetamine'] = 1,
    ['rat_poison'] = 1,
    ['pill_bottle'] = 1,
    ['bromosafrole'] = 1,
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.RollTime)
        for k,v in pairs(synced) do
            if synced[k] ~= #Config.Locations[k] then   
                synced[k] = synced[k] + 1 
            else
                synced[k] = 1
            end
        end
        TriggerClientEvent('matif_drugs:forceSync', -1, synced)
        print('synced ' .. synced['amphetamine'])
    end
end)

ESX.RegisterServerCallback('matif_drugs:requestSync', function(source, cb, plate)
    local _source = source

    cb(synced)
end)
--
RegisterServerEvent('matif_drugs:buyDrug')
AddEventHandler('matif_drugs:buyDrug', function(itemName, quantity)
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    print(itemName)
    print(Config.Prices[itemName])
    local price = Config.Prices[itemName] * quantity

    if xPlayer.getMoney() >= price then
        -- can the player carry the said amount of x item?
        print(itemName)
        local item = xPlayer.getInventoryItem(itemName)
        print(item.count)
        local newcount = item.count + quantity
		if newcount <= item.limit then
			xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(itemName, tonumber(quantity))
            TriggerClientEvent('esx:showNotification', id, 'Bought ' .. quantity .. ' for ' .. price)
        else
            TriggerClientEvent('esx:showNotification', id, 'Inventory full')
		end
	else
        local missingMoney = price - xPlayer.getMoney()
        TriggerClientEvent('esx:showNotification', id, 'You dont have enough money, you need more ' .. missingMoney .. '$')
	end
end)

RegisterServerEvent('matif_drugs:addItemCraft')
AddEventHandler('matif_drugs:addItemCraft', function(number, final)
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    local item = xPlayer.getInventoryItem(Config.Mixer.craft[number].name)

    if item.count >= Config.Mixer.craft[number].quantity then
        xPlayer.removeInventoryItem(Config.Mixer.craft[number].name, Config.Mixer.craft[number].quantity)
        TriggerClientEvent('matif_drugs:addtocurrentCraft', id, item.label, Config.Mixer.craft[number].quantity)
        if final == true then   
            finishRecipe(id)
        end 
    end
end)

RegisterServerEvent('matif_drugs:wrongAddItem')
AddEventHandler('matif_drugs:wrongAddItem', function(itemName, quantity)
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)

    xPlayer.removeInventoryItem(itemName, quantity)

    Citizen.Wait(2500)

    TriggerClientEvent('matif_drugs:wrongRecipeMixer', id)
end)

function finishRecipe(id)
    local xPlayer = ESX.GetPlayerFromId(id)
    Citizen.Wait(Config.Mixer.crafttime)
    xPlayer.addInventoryItem(Config.Mixer.craftResult.item, Config.Mixer.craftResult.quantity)
    TriggerClientEvent('matif_drugs:finishedRecipe', id)
end

RegisterServerEvent('matif_drugs:addItemCraftF')
AddEventHandler('matif_drugs:addItemCraftF', function(number)
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)
    local item = xPlayer.getInventoryItem(Config.AluminumFoil.craft[number].name)

    if item.count >= Config.AluminumFoil.craft[number].quantity then
        xPlayer.removeInventoryItem(Config.AluminumFoil.craft[number].name, Config.AluminumFoil.craft[number].quantity)
        TriggerClientEvent('matif_drugs:addtocurrentCraftF', id, item.label, Config.AluminumFoil.craft[number].quantity)
        if number == #Config.AluminumFoil.craft then
            finishRecipeF(id)
        end 
    end
end)

RegisterServerEvent('matif_drugs:wrongAddItemF')
AddEventHandler('matif_drugs:wrongAddItemF', function(itemName, quantity)
    print('a')
    local id = source
    local xPlayer = ESX.GetPlayerFromId(id)

    xPlayer.removeInventoryItem(itemName, quantity)

    Citizen.Wait(2500)

    TriggerClientEvent('matif_drugs:wrongRecipeFoil', id)
end)

function finishRecipeF(id)
    local xPlayer = ESX.GetPlayerFromId(id)
    Citizen.Wait(Config.AluminumFoil.crafttime)
    xPlayer.addInventoryItem(Config.AluminumFoil.craftResult.item, Config.AluminumFoil.craftResult.quantity)
    TriggerClientEvent('matif_drugs:finishedRecipeF', id)
end

ESX.RegisterUsableItem('aluminium_foil', function(source)
    local id = source
	local xPlayer = ESX.GetPlayerFromId(id)
	xPlayer.removeInventoryItem('aluminium_foil', 1)
	TriggerClientEvent('matif_drugs:startfoilMethod', id)
end)
