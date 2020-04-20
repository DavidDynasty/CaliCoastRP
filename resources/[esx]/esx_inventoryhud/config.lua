Config = {}
Config.Locale = 'en'
Config.IncludeCash = true -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
Config.CheckOwnership = true -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.
Config.OpenKey = 311 -- Key for opening trunk

-- List of item names that will close ui when used
Config.CloseUiItems = {"headbag", "fishingrod", "tunerlaptop", "binoculars", "gps", "joint", "cigarette", "cigar", "fixkit", "rollingpaper", "cocaine", "meth"}

Config.ShopBlipID = 52
Config.LiquorBlipID = 93
Config.YouToolBlipID = 402
Config.PrisonShopBlipID = 52
Config.WeedStoreBlipID = 140
Config.WeaponShopBlipID = 110
Config.MeleeShopBlipID = 110
Config.WeaponShop1BlipID = 110

Config.ShopLength = 14
Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2
Config.WeaponShopLenght = 2

Config.Color = 2
Config.WeaponColor = 1

Config.WeaponLiscence = {x = 12.47, y = -1105.5, z = 29.8}
Config.LicensePrice = 500

Config.Shops = {
    RegularShop = {
        Locations = {
		{x = 373.875, y = 325.896, z = 102.566},
		{x = 2557.458, y = 382.282, z = 107.622},
		{x = -3038.939, y = 585.954, z = 6.908},
		{x = -3241.927, y = 1001.462, z = 11.830},
		{x = 547.431,   y = 2671.710, z = 41.156},
		{x = 1961.464,  y = 3740.672, z = 31.343},
		{x = 2678.916,  y = 3280.671, z = 54.241},
		{x = 1729.216,  y = 6414.131, z = 34.037},
		{x = -48.519,   y = -1757.514, z = 28.421},
		{x = 1163.373,  y = -323.801,  z = 68.205},
		{x = -707.501,  y = -914.260,  z = 18.215},
		{x = -1820.523, y = 792.518,   z = 137.118},
		{x = 1698.388,  y = 4924.404,  z = 41.063},
		{x = 25.723,   y = -1346.966, z = 28.497}, 
        },
        Items = {
            {name = 'bread',},
			{name = 'water'},
			{name = 'phone'},
            {name = 'binoculars'}
     }},

    RobsLiquor = {
		Locations = {
			{x = 1135.808,  y = -982.281,  z = 45.415},
			{x = -1222.915, y = -906.983,  z = 11.326},
			{x = -1487.553, y = -379.107,  z = 39.163},
			{x = -2968.243, y = 390.910,   z = 14.043},
			{x = 1166.024,  y = 2708.930,  z = 37.157},
			{x = 1392.562,  y = 3604.684,  z = 33.980}
			--{x = -1393.409, y = -606.624,  z = 29.319}
        },
        Items = {
            {name = 'beer'}, -- Doesn't work
            {name = 'wine'}, -- Doesn't work
            {name = 'vodka'}, -- Doesn't work
            {name = 'tequila'}, -- Doesn't work
            {name = 'whisky'}, -- Doesn't work
            {name = 'grand_cru'} -- Doesn't work
    }},

    YouTool = {
        Locations = {
            {x = 2748.0, y = 3473.0, z = 55.68},
        },
        Items = {
            {name = 'drill'},
            {name = 'binocular'},
            {name = 'fixkit'},
            {name = 'gps'},
            {name = 'lockpick'},
            {name = 'scubagear'},
            {name = 'blowtorch'},
            {name = '1gbag'},
            {name = '5gbag'},
            {name = '50gbag'},
            {name = '100gbag'},
            {name = 'lowgradefert'},
            {name = 'highgradefert'},
            {name = 'plantpot'},
            {name = 'drugscales'}
    }},

    PrisonShop = {
        Locations = {
            {x = 1728.41, y = 2584.31, z = 45.84},
        },
        Items = {
            {name = 'bread'},
            {name = 'water'},
            {name = 'cigarette'},
            {name = 'lighter'},
            {name = 'sandwich'},
            {name = 'chips'}
    }},

    WeaponShop = {
        Locations = {
            --{ x = -662.180, y = -934.961, z = 20.829 },
            --{ x = 810.25, y = -2157.60, z = 28.62 },
            --{ x = 1693.44, y = 3760.16, z = 33.71 },
            --{ x = -330.24, y = 6083.88, z = 30.45 },
            --{ x = 252.63, y = -50.00, z = 68.94 },
            --{ x = 22.09, y = -1107.28, z = 28.80 },
            { x = 2567.69, y = 294.38, z = 107.73 },
            { x = -1117.58, y = 2698.61, z = 17.55 },
            { x = 842.44, y = -1033.42, z = 27.19 },
        },
        Weapons = {

			-- Melee
			--{name = "WEAPON_DAGGER", ammo = 1},
			--{name = "WEAPON_BAT", ammo = 1},
			--{name = "WEAPON_BOTTLE", ammo = 1},
			{name = "WEAPON_CROWBAR", ammo = 0},
			--{name = "WEAPON_FLASHLIGHT", ammo = 1},
			--{name = "WEAPON_GOLFCLUB", ammo = 1},
			{name = "WEAPON_HAMMER", ammo = 0},
			--{name = "WEAPON_HATCHET", ammo = 1},
			--{name = "WEAPON_KNUCKLE", ammo = 1},
			{name = "WEAPON_KNIFE", ammo = 0},
			--{name = "WEAPON_MACHETE", ammo = 1},
			--{name = "WEAPON_SWITCHBLADE", ammo = 1},
			--{name = "WEAPON_WRENCH", ammo = 1},
			--{name = "WEAPON_BATTLEAXE", ammo = 1},
			--{name = "WEAPON_POOLCUE", ammo = 1},

            -- Handgus
			--{name = "WEAPON_PISTOL", ammo = 17}, -- M92 A1
			--{name = "WEAPON_PISTOL_MK2", ammo = 1},
			{name = "WEAPON_COMBATPISTOL", ammo = 0}, -- S&W M&P Shield
			--{name = "WEAPON_APPISTOL", ammo = 27},  -- Pernach OTs-33    Black Market Weapon
			--{name = "WEAPON_STUNGUN", ammo = 1},  -- Taser Pulse
			--{name = "WEAPON_PISTOL50", ammo = 7}, -- Desert Eagle
			{name = "WEAPON_SNSPISTOL", ammo = 0}, -- P7M8
			--{name = "WEAPON_SNSPISTOL_MK2", ammo = 1},
			--{name = "WEAPON_HEAVYPISTOL", ammo = 18},  -- TP9SFx
			--{name = "WEAPON_VINTAGEPISTOL", ammo = 1},
			--{name = "WEAPON_FLAREGUN", ammo = 1},
			--{name = "WEAPON_MARKSMANPISTOL", ammo = 1},
			{name = "WEAPON_REVOLVER", ammo = 0}, -- Raging Bull
			--{name = "WEAPON_REVOLVER_MK2", ammo = 1},
			--{name = "WEAPON_DOUBLEACTION", ammo = 1},
			--{name = "WEAPON_RAYPISTOL", ammo = 1},
			--{name = "WEAPON_CERAMICPISTOL", ammo = 1},
			--{name = "WEAPON_NAVYREVOLVER", ammo = 1},

			--[[ Submachine Guns
			{name = "WEAPON_MICROSMG", ammo = 1},
			{name = "WEAPON_SMG", ammo = 1},
			{name = "WEAPON_SMG_MK2", ammo = 1},
			{name = "WEAPON_ASSAULTSMG", ammo = 1},
			{name = "WEAPON_COMBATPDW", ammo = 1},
			{name = "WEAPON_MACHINEPISTOL", ammo = 1},
			{name = "WEAPON_MINISMG", ammo = 1},
			{name = "WEAPON_RAYCARBINE", ammo = 1},]]


			--Shotguns
			{name = "WEAPON_PUMPSHOTGUN", ammo = 1},
			--{name = "WEAPON_PUMPSHOTGUN_MK2", ammo = 1},
			--{name = "WEAPON_SAWNOFFSHOTGUN", ammo = 1},
			--{name = "WEAPON_ASSAULTSHOTGUN", ammo = 1},
			--{name = "WEAPON_BULLPUPSHOTGUN", ammo = 1},
			--{name = "WEAPON_MUSKET", ammo = 1},
			--{name = "WEAPON_HEAVYSHOTGUN", ammo = 1},
			--{name = "WEAPON_DBSHOTGUN", ammo = 1},
			--{name = "WEAPON_AUTOSHOTGUN", ammo = 1},


			--[[ Assault Rifles
			{name = "WEAPON_ASSAULTRIFE", ammo = 1},
			{name = "WEAPON_ASSAULTRIFLE_MK2", ammo = 1},
			{name = "WEAPON_CARBINERIFLE", ammo = 1},
			{name = "WEAPON_CARBINERIFLE_MK2", ammo = 1},
			{name = "WEAPON_ADVANCEDRIFLE", ammo = 1},
			{name = "WEAPON_SPECIALCARBINE", ammo = 1},
			{name = "WEAPON_SPECIALCARBINE_MK2", ammo = 1},
			{name = "WEAPON_BULLPUPRIFLE", ammo = 1},
			{name = "WEAPON_BULLPUPRIFLE_MKS", ammo = 1},
			{name = "WEAPON_COMPACTRIFLE", ammo = 1},


			-- Light Machine Guns
			{name = "WEAPON_MG", ammo = 1},
			{name = "WEAPON_COMBATMG", ammo = 1},
			{name = "WEAPON_COMBATMG_MK2", ammo = 1},
			{name = "WEAPON_GUSENBERG", ammo = 1},


			-- Sniper Rifles
			{name = "WEAPON_SNIPERRIFLE", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER_MK2", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE_MK2", ammo = 1},


			-- Heavy Weapons
			{name = "WEAPON_RPG", ammo = 1},
			{name = "WEAPON_GRENADELAUNCHER", ammo = 1},
			{name = "WEAPON_GRENADELAUNCHER_SMOKE", ammo = 1},
			{name = "WEAPON_MINIGUN", ammo = 1},
			{name = "WEAPON_FIREWORK", ammo = 1},
			{name = "WEAPON_RAILGUN", ammo = 1},
			{name = "WEAPON_HOMINGLAUNCHER", ammo = 1},
			{name = "WEAPON_COMPACTLAUNCHER", ammo = 1},
			{name = "WEAPON_RAYMINIGUN", ammo = 1},


			-- Throwables
			{name = "WEAPON_GRENADE", ammo = 2},
			{name = "WEAPON_BZGAS", ammo = 2},
			{name = "WEAPON_MOLOTOV", ammo = 3},
			{name = "WEAPON_STICKYBOMB", ammo = 1},
			{name = "WEAPON_PROXMINE", ammo = 1},
			{name = "WEAPON_PIPEBOMB", ammo = 1},
			{name = "WEAPON_BALL", ammo = 1},
			{name = "WEAPON_SMOKEGRENADE", ammo = 2},
			{name = "WEAPON_FLARE", ammo = 3},


			-- Miscellaneous
			{name = "WEAPON_PETROLCAN", ammo = 1},
			{name = "WEAPON_PARACHUTE", ammo = 1},
			{name = "WEAPON_FIREEXTINGUISHER", ammo = 1},
			{name = "WEAPON_HAZARDCAN", ammo = 1},]]

        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 12}
        },
        Items = {
			{name = 'clip'}
		}
	},

	MeleeShop = {
        Locations = {
			--{ x = -662.180, y = -934.961, z = 20.829 },
            --{ x = 810.25, y = -2157.60, z = 28.62 },
            --{ x = 1693.44, y = 3760.16, z = 33.71 },
            { x = -330.24, y = 6083.88, z = 30.45 },
            { x = 252.63, y = -50.00, z = 68.94 },
            { x = 22.09, y = -1107.28, z = 28.80 },
            --{ x = 2567.69, y = 294.38, z = 107.73 },
            --{ x = -1117.58, y = 2698.61, z = 17.55 },
            --{ x = 842.44, y = -1033.42, z = 27.19 },
            
        },
        Weapons = {

			-- Melee
			--{name = "WEAPON_DAGGER", ammo = 0},
			{name = "WEAPON_BAT", ammo = 0},
			--{name = "WEAPON_BOTTLE", ammo = 0},
			--{name = "WEAPON_CROWBAR", ammo = 0},
			{name = "WEAPON_FLASHLIGHT", ammo = 0},
			--{name = "WEAPON_GOLFCLUB", ammo = 0},
			--{name = "WEAPON_HAMMER", ammo = 0},
			{name = "WEAPON_HATCHET", ammo = 0},
			--{name = "WEAPON_KNUCKLE", ammo = 0},
			{name = "WEAPON_KNIFE", ammo = 0},
			--{name = "WEAPON_MACHETE", ammo = 0},
			--{name = "WEAPON_SWITCHBLADE", ammo = 0},
			--{name = "WEAPON_WRENCH", ammo = 0},
			{name = "WEAPON_BATTLEAXE", ammo = 0},
			--{name = "WEAPON_POOLCUE", ammo = 0},

            -- Handgus
			{name = "WEAPON_PISTOL", ammo = 0}, -- M92 A1
			--{name = "WEAPON_PISTOL_MK2", ammo = 0},
			--{name = "WEAPON_COMBATPISTOL", ammo = 0}, -- S&W M&P Shield
			--{name = "WEAPON_APPISTOL", ammo = 0},  -- Pernach OTs-33    Black Market Weapon
			{name = "WEAPON_STUNGUN", ammo = 0},  -- Taser Pulse
			--{name = "WEAPON_PISTOL50", ammo = 0}, -- Desert Eagle
			{name = "WEAPON_SNSPISTOL", ammo = 0}, -- P7M8
			--{name = "WEAPON_SNSPISTOL_MK2", ammo = 0},
			--{name = "WEAPON_HEAVYPISTOL", ammo = 0},  -- TP9SFx
			--{name = "WEAPON_VINTAGEPISTOL", ammo = 0},
			--{name = "WEAPON_FLAREGUN", ammo = 0},
			--{name = "WEAPON_MARKSMANPISTOL", ammo = 0},
			--{name = "WEAPON_REVOLVER", ammo = 0}, -- Raging Bull
			--{name = "WEAPON_REVOLVER_MK2", ammo = 0},
			--{name = "WEAPON_DOUBLEACTION", ammo = 0},
			--{name = "WEAPON_RAYPISTOL", ammo = 0},
			--{name = "WEAPON_CERAMICPISTOL", ammo = 0},
			--{name = "WEAPON_NAVYREVOLVER", ammo = 0},

			-- Shotguns
			{name = "WEAPON_PUMPSHOTGUN", ammo = 0},
			--{name = "WEAPON_PUMPSHOTGUN_MK2", ammo = 0},
			--{name = "WEAPON_SAWNOFFSHOTGUN", ammo = 0},
			--{name = "WEAPON_ASSAULTSHOTGUN", ammo = 0},
			--{name = "WEAPON_BULLPUPSHOTGUN", ammo = 0},
			--{name = "WEAPON_MUSKET", ammo = 0},
			--{name = "WEAPON_HEAVYSHOTGUN", ammo = 0},
			--{name = "WEAPON_DBSHOTGUN", ammo = 0},
			--{name = "WEAPON_AUTOSHOTGUN", ammo = 0},

			--[[ Sniper Rifles
			{name = "WEAPON_SNIPERRIFLE", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER_MK2", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE_MK2", ammo = 1},

			-- Throwables
			{name = "WEAPON_BALL", ammo = 1},
			{name = "WEAPON_FLARE", ammo = 3},


			-- Miscellaneous
			{name = "WEAPON_PETROLCAN", ammo = 1},
			{name = "WEAPON_PARACHUTE", ammo = 1},
			{name = "WEAPON_FIREEXTINGUISHER", ammo = 1},]]

        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 12}
        },
        Items = {
			{name = 'clip'}
		}
	},

	WeaponShop1 = {
        Locations = {
			{ x = -662.180, y = -934.961, z = 20.829 },
            { x = 810.25, y = -2157.60, z = 28.62 },
            { x = 1693.44, y = 3760.16, z = 33.71 },
            --{ x = -330.24, y = 6083.88, z = 30.45 },
            --{ x = 252.63, y = -50.00, z = 68.94 },
        	--{ x = 22.09, y = -1107.28, z = 28.80 },
            --{ x = 2567.69, y = 294.38, z = 107.73 },
            --{ x = -1117.58, y = 2698.61, z = 17.55 },
            --{ x = 842.44, y = -1033.42, z = 27.19 },
            
        },
        Weapons = {

			-- Melee
			--{name = "WEAPON_DAGGER", ammo = 1},
			{name = "WEAPON_BAT", ammo = 0},
			--{name = "WEAPON_BOTTLE", ammo = 1},
			--{name = "WEAPON_CROWBAR", ammo = 1},
			{name = "WEAPON_FLASHLIGHT", ammo = 0},
			--{name = "WEAPON_GOLFCLUB", ammo = 1},
			--{name = "WEAPON_HAMMER", ammo = 1},
			{name = "WEAPON_HATCHET", ammo = 0},
			--{name = "WEAPON_KNUCKLE", ammo = 1},
			{name = "WEAPON_KNIFE", ammo = 0},
			--{name = "WEAPON_MACHETE", ammo = 1},
			--{name = "WEAPON_SWITCHBLADE", ammo = 1},
			--{name = "WEAPON_WRENCH", ammo = 0},
			{name = "WEAPON_BATTLEAXE", ammo = 0},
			--{name = "WEAPON_POOLCUE", ammo = 1},

            -- Handgus
			{name = "WEAPON_PISTOL", ammo = 0}, -- M92 A1
			--{name = "WEAPON_PISTOL_MK2", ammo = 1},
			--{name = "WEAPON_COMBATPISTOL", ammo = 8}, -- S&W M&P Shield
			--{name = "WEAPON_APPISTOL", ammo = 27},  -- Pernach OTs-33    Black Market Weapon
			{name = "WEAPON_STUNGUN", ammo = 0},  -- Taser Pulse
			--{name = "WEAPON_PISTOL50", ammo = 7}, -- Desert Eagle
			{name = "WEAPON_SNSPISTOL", ammo = 0}, -- P7M8
			--{name = "WEAPON_SNSPISTOL_MK2", ammo = 1},
			--{name = "WEAPON_HEAVYPISTOL", ammo = 18},  -- TP9SFx
			--{name = "WEAPON_VINTAGEPISTOL", ammo = 1},
			--{name = "WEAPON_FLAREGUN", ammo = 1},
			--{name = "WEAPON_MARKSMANPISTOL", ammo = 1},
			--{name = "WEAPON_REVOLVER", ammo = 6}, -- Raging Bull
			--{name = "WEAPON_REVOLVER_MK2", ammo = 1},
			--{name = "WEAPON_DOUBLEACTION", ammo = 1},
			--{name = "WEAPON_RAYPISTOL", ammo = 1},
			--{name = "WEAPON_CERAMICPISTOL", ammo = 1},
			--{name = "WEAPON_NAVYREVOLVER", ammo = 1},

			--[[ Shotguns
			{name = "WEAPON_PUMPSHOTGUN", ammo = 1},
			{name = "WEAPON_PUMPSHOTGUN_MK2", ammo = 1},
			{name = "WEAPON_SAWNOFFSHOTGUN", ammo = 1},
			{name = "WEAPON_ASSAULTSHOTGUN", ammo = 1},
			{name = "WEAPON_BULLPUPSHOTGUN", ammo = 1},
			{name = "WEAPON_MUSKET", ammo = 1},
			{name = "WEAPON_HEAVYSHOTGUN", ammo = 1},
			{name = "WEAPON_DBSHOTGUN", ammo = 1},
			{name = "WEAPON_AUTOSHOTGUN", ammo = 1},

			-- Sniper Rifles
			{name = "WEAPON_SNIPERRIFLE", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER", ammo = 1},
			{name = "WEAPON_HEAVYSNIPER_MK2", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE", ammo = 1},
			{name = "WEAPON_MARKSMANRIFLE_MK2", ammo = 1},

			-- Throwables
			{name = "WEAPON_BALL", ammo = 1},
			{name = "WEAPON_FLARE", ammo = 3},


			-- Miscellaneous
			{name = "WEAPON_PETROLCAN", ammo = 1},
			{name = "WEAPON_PARACHUTE", ammo = 1},
			{name = "WEAPON_FIREEXTINGUISHER", ammo = 1},]]

        },
        Ammo = {
            {name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24},
            {name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 12}
        },
        Items = {
			{name = 'clip'}
		}
	},
}

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
	AED = 100,
	alive_chicken = 100,
	bandage = 100,
	beer = 100,
	blowpipe = 100,
	bong = 100,
	bread = 125,
	weed = 100,
	carokit = 100,
	carotool = 100,
	chocolate = 100,
	cigarett = 100,
	clip = 100,
	clothe = 100,
	cocacola = 100,
	cocaine = 100,
	coffe = 100,
	coke_pooch = 100,
	copper = 100,
	cupcake = 100,
	cutted_wood = 100,
	diamond = 100,
	essence = 100,
	fabric = 100,
	fish = 100,
	fishbait = 100,
	fishingrod = 100,
	fixkit = 100,
	fixtool = 100,
	gazbottle = 100,
	gold = 100,
	hamajifish = 100,
	hamburger = 100,
	icetea = 100,
	iron = 100,
	leather = 100,
	lighter = 100,
	marijuana = 350,
	marijuana_cigarette = 100,
	medikit = 100,
	meth = 100,
	meth_pooch = 100,
	milk = 100,
	oxygen_mask = 100,
	packaged_chicken = 100,
	packaged_plank = 100,
	petrol = 400,
	petrol_raffin = 100,
	prawn = 100,
	prawnbait = 100,
	sandwich = 100,
	shark = 100,
	slaughtered_chicken = 100,
	squid = 100,
	squidbait = 100,
	stone = 100,
	tequila = 100,
	turtle = 100,
	turtlebait = 100,
	vodka = 100,
	washed_stone = 100,
	water = 100,
	weaponflashlight = 100,
	weapongrip = 100,
	weaponskin = 100,
	weed_pooch = 100,
	whisky = 100,
	wine = 100,
	wood = 100,
	wool = 100,
	worm = 100,
	nothing = 300,
	porkpackage = 300,
	pork = 300,
	rice_pro = 300,
	rice = 300,
	phone = 300,
	chest_a = 25,
	chest_a = 25,
	nurek = 25,
	honey_b = 25,
	honey_a = 25,
	marijuana = 25,
	cannabis = 25,
	sickle = 25,
	pizza = 25,
	burger = 25,
	pastacarbonara = 25,
	macka = 25,
	cigarett = 25,
	pro_wood = 25,
	wood = 25,
	meth_pooch = 25,
	meth = 25,
	marijuana = 25,
	cannabis = 25,
	wool = 25,
	clothe = 25,
	glass = 25,
	sands = 25,
	bcabbage = 25,
	acabbage = 25,
	gold_t = 25,
	gold_o = 25,
	mushroom = 25,
	mushroom_d = 25,
	mushroom_p = 25,
	oil_b = 25,
	oil_a = 25,
	leather_a = 25,
	meat_a = 25,
	meat_w = 25,
	drill = 25,
	medikit = 25,
	medikit = 25,
	bandage = 25,
	gps = 25,
	fishingrod = 25,
	Cottageleaves_box = 25,
	marijuana = 25,
	cannabis = 25,
	WEAPONN_MARKSMANPISTOL = 250,
	WEAPON_ADVANCEDRIFLE = 250,
	WEAPON_APPISTOL = 250,
	WEAPON_ASSAULTRIFLE = 250,
	WEAPON_ASSAULTRIFLE_MK2 = 250,
	WEAPON_ASSAULTSHOTGUN = 250,
	WEAPON_ASSAULTSMG = 250,
	WEAPON_AUTOSHOTGUN = 250,
	WEAPON_BALL = 250,
	WEAPON_BAT = 250,
	WEAPON_BATTLEAXE = 250,
	WEAPON_BOTTLE = 250,
	WEAPON_BULLPUPRIFLE = 250,
	WEAPON_BULLPUPRIFLE_MK2 = 250,
	WEAPON_BULLPUPSHOTGUN = 250,
	WEAPON_BZGAS = 250,
	WEAPON_CARBINERIFL = 250,
	WEAPON_CARBINERIFLE_MK2 = 250,
	WEAPON_CERAMICPISTOL = 250,
	WEAPON_COMBATMG = 250,
	WEAPON_COMBATMG_MK2 = 250,
	WEAPON_COMBATPDW = 250,
	WEAPON_COMBATPISTOL = 250,
	WEAPON_COMPACTLAUNCHER = 250,
	WEAPON_COMPACTRIFLE = 250,
	WEAPON_CROWBAR = 250,
	WEAPON_DAGGER = 250,
	WEAPON_DBSHOTGUN = 250,
	WEAPON_DOUBLEACTION = 250,
	WEAPON_FIREEXTINGUISHER = 250,
	WEAPON_FIREWORK = 250,
	WEAPON_FLARE = 250,
	WEAPON_FLAREGUN = 250,
	WEAPON_FLASHLIGHT = 250,
	WEAPON_GOLFCLUB = 250,
	WEAPON_GRENADE = 250,
	WEAPON_GRENADELAUNCH = 250,
	WEAPON_GRENADELAUNCHER_SMOKE = 250,
	WEAPON_GUSENBERG = 250,
	WEAPON_HAMMER = 250,
	WEAPON_HATCHET = 250,
	WEAPON_HAZARDCAN = 250,
	WEAPON_HEAVYPISTOL = 250,
	WEAPON_HEAVYSHOTGUN = 250,
	WEAPON_HEAVYSNIPER = 250,
	WEAPON_HEAVYSNIPER_MK2 = 250,
	WEAPON_HOMINGLAUNCHER = 250,
	WEAPON_KNIFE = 250,
	WEAPON_KNUCKLE = 250,
	WEAPON_MACHETE = 250,
	WEAPON_MACHINEPISTOL = 250,
	WEAPON_MARKSMANRIFLE = 250,
	WEAPON_MARKSMANRIFLE_MK2 = 250,
	WEAPON_MG = 250,
	WEAPON_MICROSMG = 250,
	WEAPON_MINIGUN = 250,
	WEAPON_MINISMG = 250,
	WEAPON_MOLOTOV = 250,
	WEAPON_MUSKET = 250,
	WEAPON_NAVYREVOLVER = 250,
	WEAPON_PARACHUTE = 250,
	WEAPON_PETROLCAN = 250,
	WEAPON_PIPEBOMB = 250,
	WEAPON_PISTOL = 250,
	WEAPON_PISTOL50 = 250,
	WEAPON_PISTOL_MK2 = 250,
	WEAPON_POOLCUE = 250,
	WEAPON_PROXMINE = 250,
	WEAPON_PUMPSHOTGUN = 250,
	WEAPON_PUMPSHOTGUN_MK2 = 250,
	WEAPON_RAILGUN = 250,
	WEAPON_RAYCARBINE = 250,
	WEAPON_RAYMINIGUN = 250,
	WEAPON_RAYPISTOL = 250,
	WEAPON_REVOLVER = 250,
	WEAPON_REVOLVER_MK2 = 250,
	WEAPON_RPG = 250,
	WEAPON_SAWNOFFSHOTGUN = 250,
	WEAPON_SMG = 250,
	WEAPON_SMG_MK2 = 250,
	WEAPON_SMOKEGRENADE = 250,
	WEAPON_SNIPERRIFLE = 250,
	WEAPON_SNOWBALL = 250,
	WEAPON_SNSPISTOL = 250,
	WEAPON_SNSPISTOL_MK2 = 250,
	WEAPON_SPECIALCARBINE = 250,
	WEAPON_SPECIALCARBINE_MK2 = 250,
	WEAPON_STICKYBOMB = 250,
	WEAPON_STONE_HATCHET = 250,
	WEAPON_STUNGUN = 250,
	WEAPON_SWITCHBLADE = 250,
	WEAPON_VINTAGEPISTOL = 250,
	WEAPON_WRENCH = 250

}

Config.VehicleLimit = {
    [0] = 30000, --Compact
    [1] = 40000, --Sedan
    [2] = 70000, --SUV
    [3] = 25000, --Coupes
    [4] = 30000, --Muscle
    [5] = 10000, --Sports Classics
    [6] = 5000, --Sports
    [7] = 5000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 5000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
