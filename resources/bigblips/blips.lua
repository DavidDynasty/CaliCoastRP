local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Diamond Casino", colour=67, id=304, x = 924.74, y = 46.61, z = 81.11},
     {title="City Hall", colour=0, id=419, x = -544.6, y = -205.06, z = 38.22},
     {title="California State Prison", colour=0, id=188, x = 1848.84, y = 2585.85, z = 45.67},
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)