local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

     {title="Night Club", colour=83, id=590, x = 192.21, y = -3166.95, z = 5.79},
     {title="Diamond Casino", colour=67, id=58, x = 924.74, y = 46.61, z = 81.11},
     {title="Vanilla Unicorn", colour=8, id=121, x = 128.7, y = -1298.6, z = 29.23},
     {title="Local Bars", colour=48, id=93, x = -564.49, y = 276.09, z = 83.12},
     {title="Life Invader", colour=26, id=102, x = -1081.99, y = -259.96, z = 37.81},
     {title="Local Bars", colour=48, id=93, x = -430.15, y = 261.88, z = 83.0},
     {title="Local Bars", colour=48, id=93, x = -1388.42, y = -586.93, z = 30.22}
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)