local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="NightClub", colour=83, id=590, x = 192.21, y = -3166.95, z = 5.79},
     {title="Diamond Casino", colour=67, id=58, x = 924.74, y = 46.61, z = 81.11}
     --{title="Diamond Casino", colour=67, id=58, x = 924.74, y = 46.61, z = 81.11}
     --{title="Diamond Casino", colour=67, id=58, x = 924.74, y = 46.61, z = 81.11}
     --{title="Diamond Casino", colour=67, id=58, x = 924.74, y = 46.61, z = 81.11}
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.7)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)