local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},

    {title="ATM", colour=69, id=277, x = 149.4551, y = -1038.95, z = 29.366}, -- Bank
    {title="ATM", colour=69, id=277, x = -1215.64, y = -332.231, z = 37.881}, -- Bank
    {title="ATM", colour=69, id=277, x = -110.753, y = 6467.703, z = 31.784}, -- Blaine County Bank  (Paleto)
    {title="ATM", colour=69, id=277, x = -351.534, y = -49.529,  z = 49.042}, -- Bank
	  {title="ATM", colour=69, id=277, x = 1653.11,  y = 4850.6,   z = 42.02}, -- Grapeseed Bank
    {title="ATM", colour=69, id=277, x = -2962.60, y = 482.1914, z = 15.762},  -- Rout 1 Bank
	  {title="ATM", colour=69, id=277, x = 1174.532, y = 2705.278, z = 38.027}, -- Route 68 Bank
    {title="ATM", colour=69, id=277, x = 236.4638, y = 217.4718, z = 106.840},  -- Pacific Standard Bank (city)
    {title="ATM", colour=69, id=277, x = 2558.051, y = 389.4817, z = 108.660},  -- Route 15 atm
    {title="ATM", colour=69, id=277, x = 2742.46,  y = 3464.58,  z = 55.67},  -- UTool atm
    {title="ATM", colour=69, id=277, x = -386.733, y = 6045.953, z = 31.501}, -- Paleto atm
	  {title="ATM", colour=69, id=277, x = 155.4300, y = 6641.991, z = 31.784}, -- Paleto atm
	  {title="ATM", colour=69, id=277, x = 1967.333, y = 3744.293, z = 32.272}, -- Sandy Shores atm
    {title="ATM", colour=69, id=277, x = -3241.10, y = 996.6881, z = 12.500}, -- Route 1 atm
    {title="ATM", colour=69, id=277, x = -284.037, y = 6224.385, z = 31.187}, -- Paleto atm
    {title="ATM", colour=69, id=277, x = 1153.884, y = -326.540, z = 69.245}, -- atm
    {title="ATM", colour=69, id=277, x = -717.614, y = -915.880, z = 19.268} -- atm
  }
      
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	    BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)