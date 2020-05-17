Config = {}
Config.Locale = 'en'

Config.DoorList = {

	--
	-- Mission Row First Floor
	--

	-- Entrance Doors
	{
		textCoords = vector3(434.7, -981.93, 32.15),
		authorizedJobs = {'police'},
		locked = false,
		size = 0.7,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_door01'), objHeading = 270.0, objCoords = vector3(434.7, -980.6, 30.8)},
			{objHash = GetHashKey('v_ilev_ph_door002'), objHeading = 270.0, objCoords = vector3(434.7, -983.2, 30.8)}
		}
	},

	-- To locker room & roof
	{
		objHash = GetHashKey('v_ilev_ph_gendoor004'),
		objHeading = 90.0,
		objCoords = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.4, 32.15),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 1.50
	},

	-- Hallway to roof
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 90.0,
		objCoords = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.3, -985.9, 32.15),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 1.25
	},

	-- Rooftop
	{
		objHash = GetHashKey('v_ilev_gtdoor02'),
		objHeading = 90.0,
		objCoords = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 45.1),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 1.25
	},

	-- Armory  Needs editing
	{
		objHash = GetHashKey('v_ilev_arm_secdoor'),
		objHeading = 270.0,
		objCoords = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 32.15),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Captain Office
	{
		objHash = GetHashKey('v_ilev_ph_gendoor002'),
		objHeading = 180.0,
		objCoords = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 32.15),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 1.25
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 32.15),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 180.0, objCoords = vector3(443.9, -989.0, 30.6)},
			{objHash = GetHashKey('v_ilev_ph_gendoor005'), objHeading = 0.0, objCoords = vector3(445.3, -988.7, 30.6)}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 0.0,
		objCoords = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 1
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 270.0,
		objCoords = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 2
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- Cell 3
	{
		objHash = GetHashKey('v_ilev_ph_cellgate'),
		objHeading = 90.0,
		objCoords = vector3(462.7, -1001.9, 24.9),
		textCoords = vector3(461.8, -1002.4, 25.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	-- To Back
	{
		objHash = GetHashKey('v_ilev_gtdoor'),
		objHeading = 0.0,
		objCoords = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 1.25
	},

	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 4,
		doors = {
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 0.0, objCoords  = vector3(467.3, -1014.4, 26.5)},
			{objHash = GetHashKey('v_ilev_rc_door2'), objHeading = 180.0, objCoords  = vector3(469.9, -1014.4, 26.5)}
		}
	},

	-- Back Gate
	{
		objHash = GetHashKey('hei_prop_station_gate'),
		objHeading = 90.0,
		objCoords = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 30.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objHash = GetHashKey('v_ilev_shrfdoor'),
		objHeading = 30.0,
		objCoords = vector3(1855.1, 3683.5, 34.2),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 1.25
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = {'police'},
		locked = false,
		maxDistance = 2.5,
		doors = {
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 315.0, objCoords  = vector3(-443.1, 6015.6, 31.7)},
			{objHash = GetHashKey('v_ilev_shrf2door'), objHeading = 135.0, objCoords  = vector3(-443.9, 6016.6, 31.7)}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	{
		objHash = GetHashKey('prop_gate_prison_01'),
		objCoords = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = {'police'},
		locked = true,
		maxDistance = 12,
		size = 2
	},

	--
	-- Prison
	--

	-- Cell Entrance
	{
		objHash = 430324891,
		objCoords = vector3(1786.08, 2590.04, 45.8),
		textCoords = vector3(1787.22, 2589.60, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Kitchen Door From Cleaks Office
	{
		objHash = 1028191914,
		objCoords = vector3(1783.78, 2598.4, 45.8),
		textCoords = vector3(1783.78, 2598.55, 47.25),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- First Floor --

	-- Cell 1
	{
		objHash = 430324891,
		objCoords = vector3(1787.6, 2586.26, 45.8),
		textCoords = vector3(1787.6, 2587.20, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 2
	{
		objHash = 430324891,
		objCoords = vector3(1787.55, 2582.3, 45.8),
		textCoords = vector3(1787.55, 2583.25, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 3
	{
		objHash = 430324891,
		objCoords = vector3(1787.58, 2578.47, 45.8),
		textCoords = vector3(1787.58, 2579.35, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 4
	{
		objHash = 430324891,
		objCoords = vector3(1787.57, 2574.64, 45.8),
		textCoords = vector3(1787.58, 2575.45, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Left Back Exit
	{
		objHash = 430324891,
		objCoords = vector3(1784.79, 2572.04, 45.8),
		textCoords = vector3(1784.35, 2572.0, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Yard Cell Door
	{
		objHash = 430324891,
		objCoords = vector3(1768.31, 2569.99, 45.8),
		textCoords = vector3(1768.40, 2570.80, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Yard Door Exit
	{
		objHash = 1645000677,
		objCoords = vector3(1765.78, 2567.08, 45.8),
		textCoords = vector3(1765.65, 2566.60, 47.35),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Right Back Exit
	{
		objHash = 430324891,
		objCoords = vector3(1773.3, 2572.07, 45.8),
		textCoords = vector3(1772.20, 2572.07, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 2,
	},

	-- Cell 5
	{
		objHash = 430324891,
		objCoords = vector3(1771.98, 2574.72, 45.8),
		textCoords = vector3(1771.60, 2572.60, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 6
	{
		objHash = 430324891,
		objCoords = vector3(1771.58, 2577.39, 45.8),
		textCoords = vector3(1771.60, 2576.53, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 7
	{
		objHash = 430324891,
		objCoords = vector3(1771.66, 2581.35, 45.8),
		textCoords = vector3(1771.66, 2580.43, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Cell 8
	{
		objHash = 430324891,
		objCoords = vector3(1771.64, 2585.32, 45.8),
		textCoords = vector3(1771.64, 2584.40, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Workout Room
	{
		objHash = 430324891,
		objCoords = vector3(1773.69, 2589.95, 45.8),
		textCoords = vector3(1774.40, 2590.50, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Kitchen Door From Workout Room
	{
		objHash = 1028191914,
		objCoords = vector3(1775.03, 2593.01, 45.8),
		textCoords = vector3(1775.03, 2593.15, 47.25),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Showers
	{
		objHash = 430324891,
		objCoords = vector3(1763.35, 2587.63, 45.8),
		textCoords = vector3(1764.25, 2587.63, 45.90),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Security / Med Room Door
	{
		objHash = 1028191914,
		objCoords = vector3(1785.92, 2566.8, 45.8),
		textCoords = vector3(1785.30, 2566.90, 47.25),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Med Room Left Double Doors
	{
		objHash = 580361003,
		objCoords = vector3(1783.08, 2558.29, 45.8),
		textCoords = vector3(1783.08, 2558.29, 47.25),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Med Room Right Double Doors
	{
		objHash = 580361003,
		objCoords = vector3(1783.15, 2558.34, 45.8),
		textCoords = vector3(1783.08, 2558.29, 47.25),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	},

	-- Yard Exit From Security / Med Room Door
	{
		objHash = 1645000677,
		objCoords = vector3(1776.15, 2552.01, 45.8),
		textCoords = vector3(1776.15, 2552.01, 47.35),
		authorizedJobs = {'police'},
		locked = true,
		size = 0.7,
		maxDistance = 3,
	}
}