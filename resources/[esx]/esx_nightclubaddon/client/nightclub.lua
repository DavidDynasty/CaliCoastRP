
Citizen.CreateThread(function()
    -- Getting the object to interact with
    Citizen.Wait(1000)		
    AfterHoursNightclubs = exports['bob74_ipl']:GetAfterHoursNightclubsObject()
    Citizen.Wait(1000)		

    -------------------------------------------
    -- Interior part


    -- Interior setup
    AfterHoursNightclubs.Ipl.Interior.Load()
    
    -- Setting the name of the club to The Palace
    AfterHoursNightclubs.Interior.Name.Set(AfterHoursNightclubs.Interior.Name.galaxy, true)

    -- Glamorous style
    AfterHoursNightclubs.Interior.Style.Set(AfterHoursNightclubs.Interior.Style.edgy, true)

    -- Glam podiums
    AfterHoursNightclubs.Interior.Podium.Set(AfterHoursNightclubs.Interior.Podium.edgy, true)

    -- speakers
    AfterHoursNightclubs.Interior.Speakers.Set(AfterHoursNightclubs.Interior.Speakers.upgrade, true)

    -- security
    AfterHoursNightclubs.Interior.Security.Set(AfterHoursNightclubs.Interior.Security.on, true)
    
    -- Setting turntables
    AfterHoursNightclubs.Interior.Turntables.Set(AfterHoursNightclubs.Interior.Turntables.style03, true)

    -- Lights --
	
	--Laser--
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.white, true)
    AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.yellow, true)
	AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.purple, true)
	AfterHoursNightclubs.Interior.Lights.Lasers.Set(AfterHoursNightclubs.Interior.Lights.Lasers.green, true)
	--Bands--
	AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.white, true)
	AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.green, true)
    AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.yellow, true)
    AfterHoursNightclubs.Interior.Lights.Bands.Set(AfterHoursNightclubs.Interior.Lights.Bands.cyan, true)
   --Neons--
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.yellow, true)
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.purple, true)
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.white, true)
    AfterHoursNightclubs.Interior.Lights.Neons.Set(AfterHoursNightclubs.Interior.Lights.Neons.cyan, true)
	--Droplets--
	AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.green, true)
	AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.purple, true)
    AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.yellow, true)
    AfterHoursNightclubs.Interior.Lights.Droplets.Set(AfterHoursNightclubs.Interior.Lights.Droplets.white,  true)
   
   -- Details
   --AfterHoursNightclubs.Interior.Details.Enable(true)
   AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.truck, true)
   AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.dryIce, true)
    
    -- Enabling bottles behind the bar
    AfterHoursNightclubs.Interior.Bar.Enable(true)

    -- Enabling all booze bottles
    AfterHoursNightclubs.Interior.Booze.Enable(AfterHoursNightclubs.Interior.Booze.C, true)

    -- Adding trophies on the desk
    AfterHoursNightclubs.Interior.Trophy.Enable(AfterHoursNightclubs.Interior.Trophy.battler, true, AfterHoursNightclubs.Interior.Trophy.Color.gold)
    
    -- Refreshing interior to apply changes
    RefreshInterior(AfterHoursNightclubs.interiorId)

    -- Dry ice
    AfterHoursNightclubs.Interior.DryIce.Enable(true)

    -- Chest on VIP desk
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.chest, true)

    -- Work lamps + trash
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.worklamps, false)

    -- Floor lights ment to go with trad style
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.floorTradLights, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.vaultAmmunations, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(AfterHoursNightclubs.Interior.Details.vaultCash, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(details, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(details, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(details, true)

    --
    AfterHoursNightclubs.Interior.Details.Enable(details, true)

    -------------------------------------------
    -- Exterior part


    -- La Mesa - Exterior
    -- No barriers
    AfterHoursNightclubs.Mesa.Barrier.Enable(true)

    -- Only "For sale" poster
    AfterHoursNightclubs.Mesa.Posters.Enable(AfterHoursNightclubs.Posters.forSale, true)


    -- Mission Row - Exterior
    -- Barriers
    AfterHoursNightclubs.Mesa.Barrier.Enable(true)

    -- Posters for Dixon and Madonna only
    AfterHoursNightclubs.Mesa.Posters.Enable({AfterHoursNightclubs.Posters.dixon, AfterHoursNightclubs.Posters.madonna}, true)
	
end)
