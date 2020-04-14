local MFS = Stress
local RSC = ESX.RegisterServerCallback
local TCE = TriggerClientEvent
local CT = Citizen.CreateThread

function MFS.Smoke(source,getHigh)
  TriggerClientEvent('Stress:Smoke',source,getHigh)
end

function MFS.Drink(source,alchohol)
  TriggerClientEvent('Stress:Drink',source,alchohol)
end

ESX.RegisterUsableItem('joint',function(source,...) MFS.Smoke(source,true); end)
ESX.RegisterUsableItem('cigarette',function(source,...) MFS.Smoke(source,false); end)
ESX.RegisterUsableItem('beer',function(source,...) MFS.Drink(source,true); end)
ESX.RegisterUsableItem('soda',function(source,...) MFS.Drink(source,false); end)
TriggerEvent("es:addGroupCommand",'healStress', "admin", function(source,args) TriggerClientEvent('Stress:Heal',source); end)