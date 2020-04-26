Config               = {}

Config.Locale        = 'en'

Config.LicenseEnable = true -- enable boat license? Requires esx_license
Config.LicensePrice  = 2000

Config.MarkerType    = 35
Config.DrawDistance  = 100.0

Config.Marker = {
	r = 255, g = 255, b = 255, -- color
	x = 0.5, y = 0.5, z = 0.5  -- standard size circle
}

Config.StoreMarker = {
	r = 225, g = 225, b = 225,     -- color
	x = 1.0, y = 1.0, z = 1.0  -- big circle for storing boat
}

Config.Zones = {

	Garages = {
		{ -- Shank St  boat garage  Done
			GaragePos  = vector3(-727.39, -1332.19, 1.6),
			SpawnPoint = vector4(-729.38, -1334.13, 0.31, 230.09),
			StorePos   = vector3(-729.38, -1334.13, 0.31),
			StoreTP    = vector4(-727.39, -1332.19, 1.6, 46.78)
		},

		{ -- Navy Creek boat garage  DONE
			GaragePos  = vector3(-2078.8, 2603.63, 2.0),
			SpawnPoint = vector4(-2084.99, 2601.4, 0.0, 200.58),
			StorePos   = vector3(-2084.99, 2601.4, 0.0),
			StoreTP    = vector4(-2078.8, 2603.65, 2.0, 60.12)
		},

		{ -- Catfish View  DONE
			GaragePos  = vector3(3857.91, 4459.43, 1.82),
			SpawnPoint = vector4(3858.4, 4454.46, 0.0, 268.44),
			StorePos   = vector3(3858.4, 4454.46, 0.0),
			StoreTP    = vector4(3857.31, 4459.43, 1.82, 86.62)
		},

		{ -- Great Ocean Highway   DONE
			GaragePos  = vector3(-1604.88, 5257.21, 2.0),
			SpawnPoint = vector4(-1600.45, 5258.08, 0.0, 19.4),
			StorePos   = vector3(-1600.45, 5258.08, 0.5),
			StoreTP    = vector4(-1604.76, 5257.19, 2.0, 25.74)
		},

		{ -- North Calafia Way   DONE
			GaragePos  = vector3(1336.71, 4269.73, 31.5),
			SpawnPoint = vector4(1333.54, 4264.12, 30.2, 259.25),
			StorePos   = vector3(1333.54, 4264.12, 30.9),
			StoreTP    = vector4(1336.71, 4269.73, 31.5, 74.1)
		},

		{ -- Elysian Fields     DONE
			GaragePos  = vector3(13.59, -2799.87, 2.53),
			SpawnPoint = vector4(6.85, -2798.59, 1.37, 180.68),
			StorePos   = vector3(6.85, -2798.59, 1.37),
			StoreTP    = vector4(13.59, -2799.87, 2.53, 358.57)
		},

		{ -- Barbareno Rd     DONE
			GaragePos  = vector3(-3424.85, 981.8, 8.35),
			SpawnPoint = vector4(-3424.38, 986.36, 0.3, 269.63),
			StorePos   = vector3(-3424.38, 986.36, 0.3),
			StoreTP    = vector4(-3424.85, 981.8, 8.35, 176.63)
		}
	},

	BoatShops = {
		{ -- Millars Boat Shop
			Outside = vector3(1309.34, 4362.07, 41.50),
			Inside = vector4(1315.3, 4238.92, 29.9, 264.09)
		}
	}

}

Config.Vehicles = {
	{model = 'seashark', label = 'Seashark (Random Color)', price = 7500},
	{model = 'seashark3', label = 'Seashark (Dark Blue)', price = 7500},
	{model = 'suntrap', label = 'Suntrap', price = 10000},
	{model = 'jetmax', label = 'Jetmax', price = 45000},
	{model = 'tropic2', label = 'Tropic', price = 65000},
	{model = 'dinghy2', label = 'Dinghy (Black)', price = 32500},
	{model = 'dinghy', label = 'Dinghy 2 (Random Color)', price = 40000},
	{model = 'speeder', label = 'Speeder', price = 85000},
	{model = 'squalo', label = 'Squalo (Random Color)', price = 61000},
	{model = 'toro', label = 'Toro', price = 200000}
}