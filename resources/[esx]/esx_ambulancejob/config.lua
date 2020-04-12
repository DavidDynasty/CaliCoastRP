Config                            = {}

Config.DrawDistance               = 25.0

Config.Marker                     = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 0, a = 100, rotate = false}

Config.ReviveReward               = 700  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'en'

Config.EarlyRespawnTimer          = 60000 * 1  -- time til respawn is available
Config.BleedoutTimer              = 60000 * 10 -- time til the player bleeds out

Config.EnablePlayerManagement     = false

Config.RemoveWeaponsAfterRPDeath  = true
Config.RemoveCashAfterRPDeath     = true
Config.RemoveItemsAfterRPDeath    = true

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = true
Config.EarlyRespawnFineAmount     = 2500

Config.RespawnPoint = {coords = vector3(365.92, -582.63, 43.28), heading = 119.71}

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(300.19, -584.99, 43.28),
			sprite = 61,
			scale  = 1.0,
			color  = 2
		},

		AmbulanceActions = {
			vector3(298.850, -598.200, 42.290),
		},

		Pharmacies = {
			vector3(356.000, -601.900, 42.290)
		},

		Vehicles = {
			{
				Spawner = vector3(334.400, -560.800, 28.700),
				InsideShop = vector3(329.85, -555.61, 28.51),
				Marker = {type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 0, b = 0, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(337.95, -559.39, 28.51), heading = 340.57, radius = 4.0},
					{coords = vector3(341.26, -560.56, 28.51), heading = 340.41, radius = 4.0},
					{coords = vector3(344.46, -561.71, 28.51), heading = 340.24, radius = 6.0}
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.52, -587.86, 74.17),
				InsideShop = vector3(351.3, -588.04, 74.17),
				Marker = {type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true},
				SpawnPoints = {
					{coords = vector3(350.6, -588.04, 74.17), heading = 339.88, radius = 10.0}
				}
			}
		},

		FastTravels = {
			{
				From = vector3(333.10, -568.4, 42.290),
				To = {coords = vector3(318.29, -556.48, 28.74), heading = 267.05},
				Marker = {type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 0, a = 100, rotate = false}
			},

			{
				From = vector3(320.10, -560.80, 27.750),
				To = {coords = vector3(332.07, -571.6, 43.28), heading = 154.4},
				Marker = {type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 0, a = 100, rotate = false}
			},

			{
				From = vector3(330.650, -601.14, 42.300),
				To = {coords = vector3(357.56, -597.2, 28.63), heading = 249.31},
				Marker = {type = 27, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 0, a = 100, rotate = false}
			},

			{
				From = vector3(354.900, -596.100, 27.800),
				To = {coords = vector3(328.2, -600.34, 43.28), heading = 333.58},
				Marker = {type = 27, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 0, a = 100, rotate = false}
			},

			{
				From = vector3(234.5, -1373.7, 20.9),
				To = {coords = vector3(320.9, -1478.6, 28.8), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			},

			{
				From = vector3(317.9, -1476.1, 28.9),
				To = {coords = vector3(238.6, -1368.4, 23.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 1.0, r = 102, g = 0, b = 102, a = 100, rotate = false}
			}
		},

		FastTravelsPrompt = {
			{
				From = vector3(237.4, -1373.8, 26.0),
				To = {coords = vector3(251.9, -1363.3, 38.5), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			},

			{
				From = vector3(256.5, -1357.7, 36.0),
				To = {coords = vector3(235.4, -1372.8, 26.3), heading = 0.0},
				Marker = {type = 1, x = 1.5, y = 1.5, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false},
				Prompt = _U('fast_travel')
			}
		}

	}
}

Config.AuthorizedVehicles = {
	car = {
		ambulance = {
			{model = 'ambulance', price = 5000}
		},

		doctor = {
			{model = 'ambulance', price = 4500}
		},

		chief_doctor = {
			{model = 'ambulance', price = 3000}
		},

		boss = {
			{model = 'ambulance', price = 2000}
		}
	},

	helicopter = {
		ambulance = {},

		doctor = {
			{model = 'buzzard2', price = 150000}
		},

		chief_doctor = {
			{model = 'buzzard2', price = 150000},
			{model = 'seasparrow', price = 300000}
		},

		boss = {
			{model = 'buzzard2', price = 10000},
			{model = 'seasparrow', price = 250000}
		}
	}
}
