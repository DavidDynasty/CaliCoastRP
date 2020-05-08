ESX = nil
pedspawned = false
synced = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
  while synced == false do
    ESX.TriggerServerCallback('matif_drugs:requestSync', function(result)
      if result ~= nil and result ~= 'NOT' then
          synced = result
      end
    end)
    Citizen.Wait(0)
  end
end)

RegisterCommand('testdrug', function(source, args, rawCommand)
  WrongRecipeMixer()
end)

function upper(text) -- Translate string first char uppercase
	return tostring(text:gsub("^%l", string.upper))
end

function test(text)
  print(tonumber(tostring(text)))
  print(tostring(text))
end

RegisterNetEvent('matif_drugs:forceSync')
AddEventHandler('matif_drugs:forceSync', function(table)
  print('synced?')
  synced = table
end)

freezed = false
enteredblip = false

function helpNotification(msg)
	if not IsHelpMessageOnScreen() then
		BeginTextCommandDisplayHelp('STRING')
		AddTextComponentSubstringWebsite(msg)
		EndTextCommandDisplayHelp(0, false, true, -1)
	end
end

crafting = false

Citizen.CreateThread(function()
	while true do
    Citizen.Wait(10)
    local coords = GetEntityCoords(PlayerPedId(), false)
    if synced ~= false then
      for k,v in pairs(Config.Locations) do
        local sl = Config.Locations[k][synced[k]]
        local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, sl.x, sl.y, sl.z, false)
        if dist < 2 then
            helpNotification('~INPUT_CONTEXT~ Buy ' .. upper(k))
            if IsControlJustPressed(0, 38) then
              openmenu(k)
              --TriggerEvent('csrp_drugs:start', sl.type)
            end
        end
      end
    end

    local dist = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z, true)

    if dist < 5 then
      if crafting == false then
        DrawText3Ds(Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z, 'Press [~g~E~s~] to start crafting', 0.4)
        if dist < 2 then
          if IsControlJustPressed(0, 38) then
            startCrafting()
          end
        end
      elseif crafting == true then
        DrawText3Ds(Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z, 'Press [~g~E~s~] to add new items', 0.4)
        DrawText3Ds(Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z - 0.3, 'Press [~r~G~s~] to stop crafting.', 0.4)
        DrawText3Ds(Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z + 0.5, 'Items put in: ' .. currentString, 0.4)
        if dist < 2 then
          if IsControlJustPressed(0, 38) then
            openAddItemMenu()
          elseif IsControlJustPressed(0, 58) then
            finishRecipe()
          end
        end
      end
    end

    if craftingFoil == true then
      DrawText3Ds(coords.x, coords.y, coords.z + 0.5, 'Press [~g~E~s~] to add new items', 0.4)
      DrawText3Ds(coords.x, coords.y, coords.z + 0.3, 'Press [~r~G~s~] to stop crafting.', 0.4)
      DrawText3Ds(coords.x, coords.y, coords.z + 0.8, 'Items put in: ' .. currentStringM, 0.4)
      if IsControlJustPressed(0, 38) then
        openAddItemMenuFoil()
      elseif IsControlJustPressed(0, 58) then
        finishRecipeFoil()
      end
    end
  end
end)

function DrawText3Ds(x,y,z, text)
  local onScreen,_x,_y=World3dToScreen2d(x,y,z)
  local px,py,pz=table.unpack(GetGameplayCamCoords())

  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(true)
  AddTextComponentString(text)
  DrawText(_x,_y)
  local factor = (string.len(text)) / 370
  DrawRect(_x,_y+0.0125, 0.015+ factor, 0, 0, 0, 0.0)
end

function openmenu(type)
  ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'drugQuantity', {
    title = 'How much ' .. upper(type) .. ' do you want to buy?'
  }, function(data, menu)
    local quantity = data.value
    if tonumber(tostring(quantity)) ~= nil then
      local quantity = tonumber(tostring(quantity))
      print('numbers')
      TriggerServerEvent('matif_drugs:buyDrug', type, quantity)
      menu.close()
    else
      print("error lol")
    end
  end, function(data, menu)
    menu.close()
  end)
end

function startCrafting()
  print('Started Crafting')
  crafting = true
  currentCraft = {}
end

currentString = 'No items in...'

function refreshstring()
  currentString = ''
  print(currentString)
  local qt = 0 
  for k,v in pairs(currentCraft) do
    if #currentCraft > 1 then
      qt = qt + 1
      if qt ~= #currentCraft then
        currentString = currentString .. currentCraft[k].quantity .. ' ' .. upper(currentCraft[k].item) .. ', '
      else
        currentString = currentString .. currentCraft[k].quantity .. ' ' .. upper(currentCraft[k].item)
      end
    else
      currentString = currentString .. currentCraft[k].quantity .. ' ' .. upper(currentCraft[k].item)
    end
  end
  print(currentString)
end

function openAddItemMenu()

  PlayerData = ESX.GetPlayerData()

  local playerPed = PlayerPedId()
  local inventory = PlayerData["inventory"]
  local elements = {}
  for i=1, #inventory, 1 do
		if inventory[i].count > 0 then
			table.insert(elements, {
				label     = inventory[i].label .. ' x' .. inventory[i].count,
				count     = inventory[i].count,
				type      = 'item_standard',
				value     = inventory[i].name,
			})
		end
  end
  
  ESX.UI.Menu.Open(

		'default', GetCurrentResourceName(), 'matif_drugs',
		{
		  title    = 'Select the item you want to add to the recipe.',
		  align    = 'top-left',
		  elements = elements
		},

    function(data, menu)
      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'selectQuantity', {
        title = 'How many?'
      }, function(data2, menu2)
        local quantity = data2.value
        if tonumber(tostring(quantity)) ~= nil then
          local quantity = tonumber(tostring(quantity))
          local adds = #currentCraft
          if adds == 0 then
            --print(Config.Mixer.craft[1].name)
            if data.current.value == Config.Mixer.craft[1].name then
              --print(Config.Mixer.craft[1].quantity)
              if quantity == Config.Mixer.craft[1].quantity then
                TriggerServerEvent('matif_drugs:addItemCraft', 1)
                
                ESX.UI.Menu.CloseAll()
              else
                TriggerServerEvent('matif_drugs:wrongAddItem', data.current.value, quantity)
                ESX.UI.Menu.CloseAll()
                print('quantity error')
              end
            else
              TriggerServerEvent('matif_drugs:wrongAddItem', data.current.value, quantity)
              ESX.UI.Menu.CloseAll()
              print('item error')
            end
          else
            local nextCraft = #currentCraft + 1
            if data.current.value == Config.Mixer.craft[nextCraft].name then
              --print(Config.Mixer.craft[1].quantity)
              if quantity == Config.Mixer.craft[nextCraft].quantity then
                if nextCraft == #Config.Mixer.craft then
                  local final = true
                  TriggerServerEvent('matif_drugs:addItemCraft', nextCraft, final)
                else
                  local final = false
                  TriggerServerEvent('matif_drugs:addItemCraft', nextCraft, final)
                end
                
                ESX.UI.Menu.CloseAll()
              else
                TriggerServerEvent('matif_drugs:wrongAddItem', data.current.value, quantity)
                ESX.UI.Menu.CloseAll()
                print('quantity error')
              end
            else
              TriggerServerEvent('matif_drugs:wrongAddItem', data.current.value, quantity)
              ESX.UI.Menu.CloseAll()
              print('item error')
            end
          end
        else
          print("not numbers inserted")
        end
      end, function(data2, menu2)
        menu2.close()
      end)
		end,

    function(data, menu)
      menu.close()
    end
	)
end

RegisterNetEvent('matif_drugs:addtocurrentCraft')
AddEventHandler('matif_drugs:addtocurrentCraft', function(itemName, quantity)
  table.insert(currentCraft,{
    item = itemName,
    quantity = quantity
  })
  refreshstring()
end)


RegisterNetEvent('matif_drugs:finishedRecipe')
AddEventHandler('matif_drugs:finishedRecipe', function()
  finishRecipe()
end)

RegisterNetEvent('matif_drugs:wrongRecipeMixer')
AddEventHandler('matif_drugs:wrongRecipeMixer', function()
  finishRecipe()
  wrongRecipe()
end)

RegisterNetEvent('matif_drugs:finishedRecipeF')
AddEventHandler('matif_drugs:finishedRecipeF', function()
  finishRecipeFoil()
end)

RegisterNetEvent('matif_drugs:wrongRecipeFoil')
AddEventHandler('matif_drugs:wrongRecipeFoil', function()
  print('wrong recipe dudeee')
  finishRecipeFoil()
  wrongRecipeM()
end)

RegisterNetEvent('matif_drugs:addtocurrentCraftF')
AddEventHandler('matif_drugs:addtocurrentCraftF', function(itemName, quantity)
  table.insert(currentCraftFoil,{
    item = itemName,
    quantity = quantity
  })
  refreshstringM()
end)

function finishRecipe()
  crafting = false
  currentCraft = {}
  currentString = 'No items in...'
end

function wrongRecipeM()
  SetEntityHealth(GetPlayerPed(-1), GetEntityHealth(GetPlayerPed(-1))-40)
  DoScreenFadeOut(1000)
  DoScreenFadeIn(1000)
  --AddExplosion(Config.Mixer.coords.x, Config.Mixer.coords.y, Config.Mixer.coords.z, 1, 0.0, true, false, false)
end

RegisterNetEvent('matif_drugs:startfoilMethod')
AddEventHandler('matif_drugs:startfoilMethod', function()
  startfoilMethod()
end)

function refreshstringM()
  currentStringM = ''
  print(currentStringM)
  local qt = 0 
  for k,v in pairs(currentCraftFoil) do
    if #currentCraftFoil > 1 then
      qt = qt + 1
      if qt ~= #currentCraftFoil then
        currentStringM = currentStringM .. currentCraftFoil[k].quantity .. ' ' .. upper(currentCraftFoil[k].item) .. ', '
      else
        currentStringM = currentStringM .. currentCraftFoil[k].quantity .. ' ' .. upper(currentCraftFoil[k].item)
      end
    else
      currentStringM = currentStringM .. currentCraftFoil[k].quantity .. ' ' .. upper(currentCraftFoil[k].item)
    end
  end
  print(currentStringM)
end


craftingFoil = false
currentCraftFoil = {}
currentStringM = 'No items in...'
function startfoilMethod()
  craftingFoil = true
end

function openAddItemMenuFoil()

  PlayerData = ESX.GetPlayerData()

  local playerPed = PlayerPedId()
  local inventory = PlayerData["inventory"]
  local elements = {}
  for i=1, #inventory, 1 do
		if inventory[i].count > 0 then
			table.insert(elements, {
				label     = inventory[i].label .. ' x' .. inventory[i].count,
				count     = inventory[i].count,
				type      = 'item_standard',
				value     = inventory[i].name,
			})
		end
  end
  
  ESX.UI.Menu.Open(

		'default', GetCurrentResourceName(), 'matif_drugs',
		{
		  title    = 'Select the item you want to add to the recipe.',
		  align    = 'top-left',
		  elements = elements
		},

    function(data, menu)
      ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'selectQuantity', {
        title = 'How many?'
      }, function(data2, menu2)
        local quantity = data2.value
        if tonumber(tostring(quantity)) ~= nil then
          local quantity = tonumber(tostring(quantity))
          local adds = #currentCraftFoil
          if adds == 0 then
            --print(Config.Mixer.craft[1].name)
            if data.current.value == Config.AluminumFoil.craft[1].name then
              --print(Config.AluminumFoil.craft[1].quantity)
              if quantity == Config.AluminumFoil.craft[1].quantity then
                TriggerServerEvent('matif_drugs:addItemCraftF', 1)
                
                ESX.UI.Menu.CloseAll()
              else
                TriggerServerEvent('matif_drugs:wrongAddItemF', data.current.value, quantity)
                ESX.UI.Menu.CloseAll()
                print('quantity error')
              end
            else
              TriggerServerEvent('matif_drugs:wrongAddItemF', data.current.value, quantity)
              ESX.UI.Menu.CloseAll()
              print('item error')
            end
          else
            local nextCraft = #currentCraftFoil + 1
            if data.current.value == Config.AluminumFoil.craft[nextCraft].name then
              --print(Config.AluminumFoil.craft[1].quantity)
              if quantity == Config.AluminumFoil.craft[nextCraft].quantity then
                  TriggerServerEvent('matif_drugs:addItemCraftF', nextCraft)
                
                ESX.UI.Menu.CloseAll()
              else
                TriggerServerEvent('matif_drugs:wrongAddItemF', data.current.value, quantity)
                ESX.UI.Menu.CloseAll()
                print('quantity error')
              end
            else
              TriggerServerEvent('matif_drugs:wrongAddItemF', data.current.value, quantity)
              ESX.UI.Menu.CloseAll()
              print('item error')
            end
          end
        else
          print("not numbers inserted")
        end
      end, function(data2, menu2)
        menu2.close()
      end)
		end,

    function(data, menu)
      menu.close()
    end
	)
end

function finishRecipeFoil()
  craftingFoil = false
  currentCraftFoil = {}
  currentStringM = 'No items in...'
end
