Config = {}

Config.Locale = 'en'

Config.Delays = {
	WeedProcessing = 1000 * 10,
	CokeProcessing = 1000 * 10,
	OpiumProcessing = 1000 * 10,
	MethPrep = 1500 * 10,

}
Config.LicenseEnabled = false

Config.CircleZones = {
	WeedField = {coords = vector3(308.68, 4337.25, 48.79), name = _U('blip_weedfield'), color = 25, sprite = 496, radius = 0.0, shown = true},
	WeedProcessing = {coords = vector3(2329.02, 2571.29, 46.9), name = _U('blip_weedprocessing'), color = 25, sprite = 496, radius = 5.0, shown = true},
	CokeField = {coords = vector3(2014.66, -1869.8, 117.05), name = _U('blip_cokefield'), color = 45, sprite = 501, radius = 0.0, shown = false},
	CokeProcessing = {coords = vector3(1443.26, 6332.23, 23.98), name = _U('blip_cokeprocessing'), color = 45, sprite = 501, radius = 0.0, shown = false},
	OpiumField = {coords = vector3(-2204.66, 2481.38, 7.42), name = _U('blip_opiumfield'), color = 70, sprite = 51, radius = 0.0, shown = false},
	OpiumProcessing = {coords = vector3(2435.79, 4965.28, 42.35), name = _U('blip_opiumprocessing'), color = 70, sprite = 51, radius = 0.0, shown = false},
	MethProcessing = {coords = vector3(1389.34, 3604.48, 38.94), name = _U('blip_methprocessing'), color = 50, sprite = 499, radius = 0.0, shown = false},
	MethPackaging = {coords = vector3(3304.17, 5184.82, 19.71), name = _U('blip_methpackaging'), color = 50, sprite = 499, radius = 0.0, shown = false}
}
