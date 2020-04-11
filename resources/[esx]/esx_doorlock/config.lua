Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
--	{
--		objName = 'v_ilev_ph_door01',
--		objCoords  = {x = 434.747, y = -980.618, z = 30.839},
--		textCoords = {x = 434.747, y = -981.50, z = 31.50},
--		authorizedJobs = { 'police' },
--		locked = false,
--		distance = 2.5
--	},
--
--	{
--		objName = 'v_ilev_ph_door002',
--		objCoords  = {x = 434.747, y = -983.215, z = 30.839},
--		textCoords = {x = 434.747, y = -982.50, z = 31.50},
--		authorizedJobs = { 'police' },
--		locked = false,
--		distance = 2.5
--	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objCoords  = {x = 449.698, y = -986.469, z = 30.689},
		textCoords = {x = 450.104, y = -986.388, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		size = 0.5
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objCoords  = {x = 464.361, y = -984.678, z = 43.834},
		textCoords = {x = 464.361, y = -984.050, z = 45.200},
		authorizedJobs = { 'police' },
		locked = true,
		size = 0.5
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objCoords  = {x = 461.286, y = -985.320, z = 30.839},
		textCoords = {x = 461.100, y = -986.00, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		size = 0.5
	},

	-- Armory
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 452.618, y = -982.702, z = 30.689},
		textCoords = {x = 453.079, y = -982.600, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		size = 0.5
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objCoords  = {x = 447.238, y = -980.630, z = 30.689},
		textCoords = {x = 447.200, y = -980.010, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		size = 0.5
	},

	-- To downstairs (double doors)
	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 443.97, y = -989.033, z = 30.6896},
		textCoords = {x = 444.020, y = -989.445, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	{
		objName = 'v_ilev_ph_gendoor005',
		objCoords  = {x = 445.37, y = -988.705, z = 30.6896},
		textCoords = {x = 445.350, y = -989.445, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Parking Lot (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 446.83, y = -996.75, z = 30.69},
		textCoords = {x = 445.83, y = -996.75, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 445.52, y = -997.14, z = 30.69},
		textCoords = {x = 453.079, y = -982.600, z = 32.200},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- 
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 463.815, y = -992.686, z = 24.9149},
		textCoords = {x = 463.800, y = -992.686, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Holding Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.381, y = -993.651, z = 24.914},
		textCoords = {x = 461.806, y = -993.800, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Holding Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.331, y = -998.152, z = 24.914},
		textCoords = {x = 461.806, y = -998.300, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Holding Cell 3
	{
		objName = 'v_ilev_ph_cellgate',
		objCoords  = {x = 462.704, y = -1001.92, z = 24.9149},
		textCoords = {x = 461.806, y = -1001.900, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Cell 1
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.97, y = -996.63, z = 24.91},
		textCoords = {x = 467.800, y = -996.600, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- Cell 2
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 472.300, y = -996.400, z = 24.900},
		textCoords = {x = 472.100, y = -996.400, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- Cell 3
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.600, y = -996.400, z = 24.900},
		textCoords = {x = 476.300, y = -996.400, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- Cell 4
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 480.700, y = -996.200, z = 24.900},
		textCoords = {x = 480.650, y = -996.400, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- Interview Room 1
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 467.700, y = -1003.900, z = 24.900},
		textCoords = {x = 467.900, y = -1003.400, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- Interview Room 2
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 476.200, y = -1003.300, z = 24.900},
		textCoords = {x = 476.400, y = -1003.300, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},
	
	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = {x = 463.478, y = -1003.538, z = 25.005},
		textCoords = {x = 464.100, y = -1003.50, z = 26.300},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 467.371, y = -1014.452, z = 26.536},
		textCoords = {x = 468.09, y = -1014.452, z = 27.850},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	{
		objName = 'v_ilev_rc_door2',
		objCoords  = {x = 469.967, y = -1014.452, z = 26.536},
		textCoords = {x = 469.35, y = -1014.452, z = 27.850},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 2,
		size = 0.5
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objCoords  = {x = 488.894, y = -1017.210, z = 27.146},
		textCoords = {x = 488.800, y = -1023.000, z = 27.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 1
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objCoords  = {x = 1855.105, y = 3683.516, z = 34.266},
		textCoords = {x = 1855.105, y = 3683.516, z = 35.00},
		authorizedJobs = { 'police' },
		locked = false
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.14, y = 6015.685, z = 31.716},
		textCoords = {x = -443.14, y = 6015.685, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	{
		objName = 'v_ilev_shrf2door',
		objCoords  = {x = -443.951, y = 6016.622, z = 31.716},
		textCoords = {x = -443.951, y = 6016.622, z = 32.00},
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1844.998, y = 2604.810, z = 44.638},
		textCoords = {x = 1844.998, y = 2608.50, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = {x = 1818.542, y = 2604.812, z = 44.611},
		textCoords = {x = 1818.542, y = 2608.40, z = 48.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 12,
		size = 2
	},

	--
	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = {x = 420.133, y = -1017.301, z = 28.086},
		textCoords = {x = 420.133, y = -1021.00, z = 32.00},
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}