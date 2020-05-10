Config = {}
Config.Locale = 'en'
Config.IncludeCash = false -- Include cash in inventory?
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
			{name = 'bandage'},
			{name = 'beer'},
			{name = 'bolcacahuetes'},
			{name = 'bolchips'},
			{name = 'bolpistache'},
			{name = 'caprisun'},
			{name = 'cheesebows'},
			{name = 'chickensandwich'},
			{name = 'chips'},
			{name = 'chocolate'},
			{name = 'cocacola'},
			{name = 'coffee'},
			{name = 'cupcake'},
			{name = 'fanta'},
			{name = 'gatorade'},
			{name = 'hamburger'},
			{name = 'icetea'},
			{name = 'lemonade'},
			{name = 'pistachio'},
			{name = 'redbull'},
			{name = 'rollingpaper'},
			{name = 'soda'}
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
			--{name = 'clip'}
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
Config.Limit = 30000

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
	AED = 1,
	alive_chicken = 1,
	bandage = 1,
	beer = 1,
	blowpipe = 1,
	bong = 1,
	bread = 1,
	weed = 1,
	carokit = 1,
	carotool = 1,
	chocolate = 1,
	cigarett = 1,
	clip = 1,
	clothe = 1,
	cocacola = 1,
	cocaine = 1,
	coffe = 1,
	coke_pooch = 1,
	copper = 1,
	cupcake = 1,
	cutted_wood = 1,
	diamond = 1,
	essence = 1,
	fabric = 1,
	fish = 1,
	fishbait = 1,
	fishingrod = 1,
	fixkit = 1,
	fixtool = 1,
	gazbottle = 1,
	gold = 1,
	hamajifish = 1,
	hamburger = 1,
	icetea = 1,
	iron = 1,
	leather = 1,
	lighter = 1,
	marijuana = 1,
	marijuana_cigarette = 1,
	medikit = 1,
	meth = 1,
	meth_pooch = 1,
	milk = 1,
	oxygen_mask = 1,
	packaged_chicken = 1,
	packaged_plank = 1,
	petrol = 4,
	petrol_raffin = 1,
	prawn = 1,
	prawnbait = 1,
	sandwich = 1,
	shark = 1,
	slaughtered_chicken = 1,
	squid = 1,
	squidbait = 1,
	stone = 1,
	tequila = 1,
	turtle = 1,
	turtlebait = 1,
	vodka = 1,
	washed_stone = 1,
	water = 1,
	weaponflashlight = 1,
	weapongrip = 1,
	weaponskin = 1,
	weed_pooch = 1,
	whisky = 1,
	wine = 1,
	wood = 1,
	wool = 1,
	worm = 1,
	nothing = 1,
	porkpackage = 1,
	pork = 1,
	rice_pro = 1,
	rice = 1,
	phone = 1,
	chest_a = 1,
	chest_a = 1,
	nurek = 1,
	honey_b = 1,
	honey_a = 1,
	marijuana = 1,
	cannabis = 1,
	sickle = 1,
	pizza = 1,
	burger = 1,
	pastacarbonara = 1,
	macka = 1,
	cigarett = 1,
	pro_wood = 1,
	wood = 1,
	meth_pooch = 1,
	meth = 1,
	marijuana = 1,
	cannabis = 1,
	wool = 1,
	clothe = 1,
	glass = 1,
	sands = 1,
	bcabbage = 1,
	acabbage = 1,
	gold_t = 1,
	gold_o = 1,
	mushroom = 1,
	mushroom_d = 1,
	mushroom_p = 1,
	oil_b = 1,
	oil_a = 1,
	leather_a = 1,
	meat_a = 1,
	meat_w = 1,
	drill = 1,
	medikit = 1,
	medikit = 1,
	bandage = 1,
	gps = 1,
	fishingrod = 1,
	Cottageleaves_box = 1,
	marijuana = 1,
	cannabis = 1,
	WEAPONN_MARKSMANPISTOL = 5,
	WEAPON_ADVANCEDRIFLE = 7,
	WEAPON_APPISTOL = 5,
	WEAPON_ASSAULTRIFLE = 7,
	WEAPON_ASSAULTRIFLE_MK2 = 7,
	WEAPON_ASSAULTSHOTGUN = 7,
	WEAPON_ASSAULTSMG =  6, 
	WEAPON_AUTOSHOTGUN = 8,
	WEAPON_BALL = 1,
	WEAPON_BAT = 3,
	WEAPON_BATTLEAXE = 2,
	WEAPON_BOTTLE = 2,
	WEAPON_BULLPUPRIFLE = 7,
	WEAPON_BULLPUPRIFLE_MK2 = 8,
	WEAPON_BULLPUPSHOTGUN = 8,
	WEAPON_BZGAS = 1,
	WEAPON_CARBINERIFL = 7,
	WEAPON_CARBINERIFLE_MK2 = 8,
	WEAPON_CERAMICPISTOL = 3,
	WEAPON_COMBATMG = 6,
	WEAPON_COMBATMG_MK2 = 7,
	WEAPON_COMBATPDW = 8,
	WEAPON_COMBATPISTOL = 5,
	WEAPON_COMPACTLAUNCHER  = 15,
	WEAPON_COMPACTRIFLE = 7,
	WEAPON_CROWBAR =  2,
	WEAPON_DAGGER = 1,
	WEAPON_DBSHOTGUN = 8,
	WEAPON_DOUBLEACTION = 9,
	WEAPON_FIREEXTINGUISHER = 4,
	WEAPON_FIREWORK = 2,
	WEAPON_FLARE = 1,
	WEAPON_FLAREGUN = 3,
	WEAPON_FLASHLIGHT = 1,
	WEAPON_GOLFCLUB = 4,
	WEAPON_GRENADE = 2,
	WEAPON_GRENADELAUNCH = 15,
	WEAPON_GRENADELAUNCHER_SMOKE = 15,
	WEAPON_GUSENBERG = 8,
	WEAPON_HAMMER = 1,
	WEAPON_HATCHET = 2,
	WEAPON_HAZARDCAN = 1,
	WEAPON_HEAVYPISTOL = 6,
	WEAPON_HEAVYSHOTGUN = 8,
	WEAPON_HEAVYSNIPER = 10,
	WEAPON_HEAVYSNIPER_MK2 = 11,
	WEAPON_HOMINGLAUNCHER = 20,
	WEAPON_KNIFE = 1,
	WEAPON_KNUCKLE = 1,
	WEAPON_MACHETE = 3,
	WEAPON_MACHINEPISTOL = 6,
	WEAPON_MARKSMANRIFLE = 7,
	WEAPON_MARKSMANRIFLE_MK2 = 8,
	WEAPON_MG = 20,
	WEAPON_MICROSMG = 9,
	WEAPON_MINIGUN = 25,
	WEAPON_MINISMG = 22,
	WEAPON_MOLOTOV = 2,
	WEAPON_MUSKET = 8,
	WEAPON_NAVYREVOLVER = 5,
	WEAPON_PARACHUTE = 6,
	WEAPON_PETROLCAN = 1,
	WEAPON_PIPEBOMB = 3,
	WEAPON_PISTOL = 4,
	WEAPON_PISTOL50 = 5,
	WEAPON_PISTOL_MK2 = 5,
	WEAPON_POOLCUE = 2,
	WEAPON_PROXMINE = 3,
	WEAPON_PUMPSHOTGUN = 8,
	WEAPON_PUMPSHOTGUN_MK2 = 8,
	WEAPON_RAILGUN = 21,
	WEAPON_RAYCARBINE = 22,
	WEAPON_RAYMINIGUN = 25,
	WEAPON_RAYPISTOL = 8,
	WEAPON_REVOLVER = 7,
	WEAPON_REVOLVER_MK2 = 8,
	WEAPON_RPG = 15,
	WEAPON_SAWNOFFSHOTGUN = 6,
	WEAPON_SMG = 9,
	WEAPON_SMG_MK2 = 9,
	WEAPON_SMOKEGRENADE = 1,
	WEAPON_SNIPERRIFLE = 10,
	WEAPON_SNOWBALL = 1,
	WEAPON_SNSPISTOL = 5,
	WEAPON_SNSPISTOL_MK2 = 6,
	WEAPON_SPECIALCARBINE = 9,
	WEAPON_SPECIALCARBINE_MK2 = 9,
	WEAPON_STICKYBOMB = 1,
	WEAPON_STONE_HATCHET = 3,
	WEAPON_STUNGUN = 3,
	WEAPON_SWITCHBLADE = 2,
	WEAPON_VINTAGEPISTOL = 7,
	WEAPON_WRENCH = 6

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
