-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for essentialmode
DROP DATABASE IF EXISTS `essentialmode`;
CREATE DATABASE IF NOT EXISTS `essentialmode` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `essentialmode`;

-- Dumping structure for table essentialmode.addon_account
DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_account: ~5 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Bank Savings', 0),
	('caution', 'caution', 0),
	('property_black_money', 'Money Sale Property', 0),
	('society_banker', 'Bank', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_account_data
DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_account_data: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
INSERT IGNORE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'caution', 0, 'steam:1100001083da79f'),
	(3, 'caution', 0, 'steam:11000013dbc0313'),
	(5, 'caution', 0, 'steam:110000100bc09b3'),
	(7, 'property_black_money', 0, 'steam:1100001083da79f'),
	(8, 'property_black_money', 0, 'steam:110000100bc09b3'),
	(9, 'society_banker', 0, NULL),
	(10, 'society_taxi', 0, NULL),
	(11, 'bank_savings', 0, 'steam:1100001083da79f');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory: ~2 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_cardealer', 'Cardealer', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory_items
DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory_items: ~1 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
INSERT IGNORE INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
	(1, 'society_taxi', 'water', 0, NULL);
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.billing
DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.billing: ~0 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table essentialmode.cardealer_vehicles
DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore
DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.datastore: ~3 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
INSERT IGNORE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('account', 'Account', 1),
	('car', 'Car', 1),
	('property', 'Property', 0),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore_data
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.datastore_data: ~3 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
INSERT IGNORE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(2, 'car', 'steam:1100001083da79f', '{}'),
	(3, 'account', NULL, '{}'),
	(4, 'property', 'steam:1100001083da79f', '{}'),
	(5, 'property', 'steam:110000100bc09b3', '{}'),
	(6, 'society_taxi', NULL, '{"garage":[{"plateIndex":0,"modDoorSpeaker":-1,"pearlescentColor":5,"extras":{"6":false,"7":false,"8":true,"9":true,"11":true,"10":false,"5":false},"modGrille":-1,"modXenon":false,"modTank":-1,"modEngine":-1,"modFrontBumper":-1,"modBackWheels":-1,"modAPlate":-1,"neonColor":[255,0,255],"modRoof":-1,"plate":"86VAL679","modTrunk":-1,"modExhaust":-1,"modDial":-1,"modOrnaments":-1,"modEngineBlock":-1,"modHorns":-1,"modFrontWheels":-1,"engineHealth":977.2,"modHood":-1,"modSeats":-1,"model":-956048545,"wheelColor":156,"modTrimB":-1,"modAerials":-1,"modArmor":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modTrimA":-1,"modSmokeEnabled":false,"fuelLevel":46.6,"modTurbo":false,"windowTint":-1,"modWindows":-1,"modTransmission":-1,"bodyHealth":984.8,"modHydrolic":-1,"modVanityPlate":-1,"modBrakes":-1,"modShifterLeavers":-1,"modFrame":-1,"modAirFilter":-1,"dirtLevel":3.5,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modSideSkirt":-1,"modLivery":-1,"color2":77,"wheels":0,"modSuspension":-1,"color1":88,"modSteeringWheel":-1,"modSpeakers":-1,"modDashboard":-1,"modPlateHolder":-1,"modRightFender":-1,"modFender":-1,"modRearBumper":-1,"modStruts":-1},{"plateIndex":0,"modDoorSpeaker":-1,"pearlescentColor":5,"extras":{"6":false,"7":true,"8":false,"9":true,"11":false,"10":false,"5":false},"modGrille":-1,"plate":"86ELN779","modTank":-1,"modEngine":-1,"modFrontBumper":-1,"modBackWheels":-1,"modAPlate":-1,"neonColor":[255,0,255],"modRoof":-1,"modAirFilter":-1,"modTrunk":-1,"modExhaust":-1,"modDial":-1,"modOrnaments":-1,"modEngineBlock":-1,"modHorns":-1,"modFrontWheels":-1,"wheelColor":156,"modHood":-1,"modPlateHolder":-1,"modShifterLeavers":-1,"windowTint":-1,"modTrimB":-1,"modAerials":-1,"color2":77,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"modTrimA":-1,"modSpeakers":-1,"modTurbo":false,"modSmokeEnabled":false,"fuelLevel":64.4,"modWindows":-1,"modTransmission":-1,"bodyHealth":1000.0,"modHydrolic":-1,"modVanityPlate":-1,"model":-956048545,"modXenon":false,"modFrame":-1,"modBrakes":-1,"dirtLevel":12.5,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modSideSkirt":-1,"modLivery":-1,"engineHealth":1000.0,"modArmor":-1,"modSeats":-1,"color1":88,"modSteeringWheel":-1,"modFender":-1,"modDashboard":-1,"modSuspension":-1,"modRightFender":-1,"wheels":0,"modRearBumper":-1,"modStruts":-1}]}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.disc_ammo
DROP TABLE IF EXISTS `disc_ammo`;
CREATE TABLE IF NOT EXISTS `disc_ammo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `hash` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.disc_ammo: ~12 rows (approximately)
/*!40000 ALTER TABLE `disc_ammo` DISABLE KEYS */;
INSERT IGNORE INTO `disc_ammo` (`id`, `owner`, `hash`, `count`) VALUES
	(1, 'steam:1100001083da79f', '-771403250', 78),
	(2, 'steam:1100001083da79f', '-1716589765', 0),
	(3, 'steam:1100001083da79f', '-275439685', 0),
	(4, 'steam:1100001083da79f', '-2084633992', 0),
	(5, 'steam:1100001083da79f', '-1074790547', 90),
	(6, 'steam:1100001083da79f', '-1063057011', 0),
	(7, 'steam:1100001083da79f', '584646201', 0),
	(8, 'steam:1100001083da79f', '324215364', 28),
	(9, 'steam:1100001083da79f', '453432689', 53),
	(10, 'steam:1100001083da79f', '1593441988', 41),
	(11, 'steam:1100001083da79f', '-1121678507', 25),
	(12, 'steam:1100001083da79f', '736523883', 45),
	(13, 'steam:1100001083da79f', '487013001', 0);
/*!40000 ALTER TABLE `disc_ammo` ENABLE KEYS */;

-- Dumping structure for table essentialmode.disc_inventory
DROP TABLE IF EXISTS `disc_inventory`;
CREATE TABLE IF NOT EXISTS `disc_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` text NOT NULL,
  `type` text DEFAULT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.disc_inventory: ~6 rows (approximately)
/*!40000 ALTER TABLE `disc_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `disc_inventory` (`id`, `owner`, `type`, `data`) VALUES
	(3, 'steam:110000100bc09b3', 'player', '{"2":{"count":42,"name":"WEAPON_SNIPERRIFLE"}}'),
	(12, 'x911y-1025z37', 'drop', '{"5":{"count":1,"name":"WEAPON_PUMPSHOTGUN"},"1":{"count":1,"name":"WEAPON_PISTOL"},"2":{"count":72,"name":"WEAPON_FLASHLIGHT"},"3":{"count":1,"name":"WEAPON_COMBATPISTOL"},"4":{"count":1,"name":"WEAPON_MARKSMANPISTOL"}}'),
	(13, 'x845y-1020z27', 'drop', '{"3":{"count":1,"name":"WEAPON_SNSPISTOL"},"4":{"count":1,"name":"WEAPON_PISTOL"},"1":{"count":49,"name":"disc_ammo_pistol"}}'),
	(14, 'x-7y-1095z26', 'drop', '{"2":{"count":42,"name":"WEAPON_BAT"},"1":{"count":42,"name":"WEAPON_FLASHLIGHT"},"4":{"count":1,"name":"water"},"3":{"count":42,"name":"WEAPON_GRENADE"}}'),
	(16, 'x-607y-1611z26', 'drop', '{"5":{"name":"WEAPON_CARBINERIFLE","count":1},"1":{"name":"WEAPON_MICROSMG","count":1},"2":{"name":"WEAPON_APPISTOL","count":1},"3":{"name":"WEAPON_SPECIALCARBINE","count":1},"4":{"name":"WEAPON_ASSAULTRIFLE","count":1}}'),
	(18, 'steam:1100001083da79f', 'player', '{"3":{"name":"WEAPON_PUMPSHOTGUN","count":1},"1":{"name":"water","count":6},"2":{"name":"bread","count":5}}');
/*!40000 ALTER TABLE `disc_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.disc_inventory_itemdata
DROP TABLE IF EXISTS `disc_inventory_itemdata`;
CREATE TABLE IF NOT EXISTS `disc_inventory_itemdata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT 0,
  `closeonuse` tinyint(1) NOT NULL DEFAULT 0,
  `max` int(11) NOT NULL DEFAULT 100,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.disc_inventory_itemdata: ~0 rows (approximately)
/*!40000 ALTER TABLE `disc_inventory_itemdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `disc_inventory_itemdata` ENABLE KEYS */;

-- Dumping structure for table essentialmode.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.items: ~108 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'living chicken', 1, 0, 1),
	('binoculars', 'Binoculars', 1, 0, 1),
	('bread', 'bread', 1, 0, 1),
	('bulletproof', 'Bullet-Proof Vest', 1, 0, 1),
	('clip', 'Weapon Clip', 1, 0, 1),
	('clothe', 'cloth', 1, 0, 1),
	('copper', 'copper', 1, 0, 1),
	('cutted_wood', 'cut wood', 1, 0, 1),
	('darknet', 'Dark Net', 1, 0, 1),
	('diamond', 'diamond', 1, 0, 1),
	('disc_ammo_pistol', 'Pistol Ammo', 1, 0, 1),
	('disc_ammo_pistol_large', 'Pistol Ammo Large', 1, 0, 1),
	('disc_ammo_rifle', 'Rifle Ammo', 1, 0, 1),
	('disc_ammo_rifle_large', 'Rifle Ammo Large', 1, 0, 1),
	('disc_ammo_shotgun', 'Shotgun Shells', 1, 0, 1),
	('disc_ammo_shotgun_large', 'Shotgun Shells Large', 1, 0, 1),
	('disc_ammo_smg', 'SMG Ammo', 1, 0, 1),
	('disc_ammo_smg_large', 'SMG Ammo Large', 1, 0, 1),
	('disc_ammo_snp', 'Sniper Ammo', 1, 0, 1),
	('disc_ammo_snp_large', 'Sniper Ammo Large', 1, 0, 1),
	('drill', 'Drill', 1, 0, 1),
	('essence', 'gas', 1, 0, 1),
	('fabric', 'fabric', 1, 0, 1),
	('firstaidkit', 'First Aid Kit', 1, 0, 1),
	('fish', 'fish', 1, 0, 1),
	('flashlight', 'Flashlight', 1, 0, 1),
	('gold', 'gold', 1, 0, 1),
	('grip', 'Grip', 1, 0, 1),
	('iron', 'iron', 1, 0, 1),
	('lockpick', 'Lock Pick', 1, 0, 1),
	('magazine', 'Extended Magazine', 1, 0, 1),
	('oxygen_mask', 'Oxygen Mask', 1, 0, 1),
	('packaged_chicken', 'chicken fillet', 1, 0, 1),
	('packaged_plank', 'packaged wood', 1, 0, 1),
	('petrol', 'oil', 1, 0, 1),
	('petrol_raffin', 'processed oil', 1, 0, 1),
	('poolreceipt', 'Receipt', 1, 0, 1),
	('scope', 'Weapon Scope', 1, 0, 1),
	('silencer', 'Silencer', 1, 0, 1),
	('slaughtered_chicken', 'slaughtered chicken', 1, 0, 1),
	('stone', 'stone', 1, 0, 1),
	('washed_stone', 'washed stone', 1, 0, 1),
	('water', 'water', 1, 0, 1),
	('WEAPON_ADVANCEDRIFLE', 'Famas', 1, 0, 1),
	('WEAPON_APPISTOL', 'AP Pistol', 1, 0, 1),
	('WEAPON_ASSAULTRIFLE', 'AK-47', 1, 0, 1),
	('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 0, 1),
	('WEAPON_ASSAULTSMG', 'FN Herstal', 1, 0, 1),
	('WEAPON_AUTOSHOTGUN', 'Auto Shotgun', 1, 0, 1),
	('WEAPON_BALL', 'Ball', 1, 0, 1),
	('WEAPON_BAT', 'Baseball Bat', 1, 0, 1),
	('WEAPON_BATTLEAXE', 'Battle Axe', 1, 0, 1),
	('WEAPON_BOTTLE', 'Bottle', 1, 0, 1),
	('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1, 0, 1),
	('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1, 0, 1),
	('WEAPON_BZGAS', 'BZ Gas', 1, 0, 1),
	('WEAPON_CARBINERIFLE', 'M4 Carbine', 1, 0, 1),
	('WEAPON_COMBATMG', 'Combat MG', 1, 0, 1),
	('WEAPON_COMBATPDW', 'Combat PDW', 1, 0, 1),
	('WEAPON_COMBATPISTOL', 'Glock 19', 1, 0, 1),
	('WEAPON_COMPACTLAUNCHER', 'Compact Launcher', 1, 0, 1),
	('WEAPON_COMPACTRIFLE', 'Mini Draco', 1, 0, 1),
	('WEAPON_CROWBAR', 'Crowbar', 1, 0, 1),
	('WEAPON_DAGGER', 'Dagger', 1, 0, 1),
	('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1, 0, 1),
	('WEAPON_DIGISCANNER', 'Digiscanner', 1, 0, 1),
	('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1, 0, 1),
	('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1, 0, 1),
	('WEAPON_FIREWORK', 'Firework Launcher', 1, 0, 1),
	('WEAPON_FLARE', 'Flare', 1, 0, 1),
	('WEAPON_FLAREGUN', 'Flare Gun', 1, 0, 1),
	('WEAPON_FLASHLIGHT', 'Maglite', 1, 0, 1),
	('WEAPON_GARBAGEBAG', 'Garbage Bag', 1, 0, 1),
	('WEAPON_GOLFCLUB', 'PXG 9 Iron', 1, 0, 1),
	('WEAPON_GRENADE', 'Gernade', 1, 0, 1),
	('WEAPON_GRENADELAUNCHER', 'Gernade Launcher', 1, 0, 1),
	('WEAPON_GUSENBERG', 'Gusenberg', 1, 0, 1),
	('WEAPON_HAMMER', 'Hammer', 1, 0, 1),
	('WEAPON_HANDCUFFS', 'Handcuffs', 1, 0, 1),
	('WEAPON_HATCHET', 'Hatchet', 1, 0, 1),
	('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1, 0, 1),
	('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1, 0, 1),
	('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 0, 1),
	('WEAPON_HOMINGLAUNCHER', 'Homing Launcher', 1, 0, 1),
	('WEAPON_KNIFE', 'Knife', 1, 0, 1),
	('WEAPON_KNUCKLE', 'Knuckle Dusters ', 1, 0, 1),
	('WEAPON_MACHETE', 'Machete', 1, 0, 1),
	('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1, 0, 1),
	('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1, 0, 1),
	('WEAPON_MARKSMANRIFLE', 'Marksman Rifle', 1, 0, 1),
	('WEAPON_MG', 'MG', 1, 0, 1),
	('WEAPON_MICROSMG', 'Mini Uzi', 1, 0, 1),
	('WEAPON_MINIGUN', 'Minigun', 1, 0, 1),
	('WEAPON_MINISMG', 'Mini SMG', 1, 0, 1),
	('WEAPON_MOLOTOV', 'Molotov', 1, 0, 1),
	('WEAPON_MUSKET', 'Musket', 1, 0, 1),
	('WEAPON_NIGHTSTICK', 'Police Baton', 1, 0, 1),
	('WEAPON_PETROLCAN', 'Petrol Can', 1, 0, 1),
	('WEAPON_PIPEBOMB', 'Pipe Bomb', 1, 0, 1),
	('WEAPON_PISTOL', 'Beretta 92FS', 1, 0, 1),
	('WEAPON_PISTOL50', 'HK Tactical', 1, 0, 1),
	('WEAPON_POOLCUE', 'Pool Cue', 1, 0, 1),
	('WEAPON_PROXMINE', 'Proximity Mine', 1, 0, 1),
	('WEAPON_PUMPSHOTGUN', '12 Gauge Shotgun', 1, 0, 1),
	('WEAPON_RAILGUN', 'Rail Gun', 1, 0, 1),
	('WEAPON_REVOLVER', 'Revolver', 1, 0, 1),
	('WEAPON_RPG', 'RPG', 1, 0, 1),
	('WEAPON_SAWNOFFSHOTGUN', 'Sawn Off Shotgun', 1, 0, 1),
	('WEAPON_SMG', 'MP5', 1, 0, 1),
	('WEAPON_SMOKEGRENADE', 'Smoke Gernade', 1, 0, 1),
	('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1, 0, 1),
	('WEAPON_SNOWBALL', 'Snow Ball', 1, 0, 1),
	('WEAPON_SNSPISTOL', 'SNS Pistol', 1, 0, 1),
	('WEAPON_SPECIALCARBINE', 'Special Rifle', 1, 0, 1),
	('WEAPON_STICKYBOMB', 'Sticky Bombs', 1, 0, 1),
	('WEAPON_STINGER', 'Stinger', 1, 0, 1),
	('WEAPON_STUNGUN', 'Taser Pulse', 1, 0, 1),
	('WEAPON_SWITCHBLADE', 'Switch Blade', 1, 0, 1),
	('WEAPON_VINTAGEPISTOL', 'Vintage Pistol', 1, 0, 1),
	('WEAPON_WRENCH', 'Wrench', 1, 0, 1),
	('wood', 'wood', 1, 0, 1),
	('wool', 'wool', 1, 0, 1),
	('yusuf', 'Deluxe Skin', 1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.jobs: ~9 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT IGNORE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('banker', 'Banker', 0),
	('cardealer', 'Cardealer', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Fueler', 0),
	('lumberjack', 'Lumberjack', 0),
	('miner', 'Miner', 0),
	('poolcleaner', 'Neptunes Pools', 0),
	('reporter', 'Reporter', 0),
	('slaughterer', 'Butcher', 0),
	('tailor', 'Tailor', 0),
	('taxi', 'Taxi', 0),
	('unemployed', 'Unemployed', 0);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table essentialmode.job_grades
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.job_grades: ~24 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
INSERT IGNORE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(3, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(4, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(5, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(6, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(7, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(8, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(9, 'cardealer', 0, 'recruit', 'Recruit', 10, '{}', '{}'),
	(10, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(11, 'cardealer', 2, 'experienced', 'Experienced', 40, '{}', '{}'),
	(12, 'cardealer', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(13, 'poolcleaner', 0, 'interim', 'Cleaner', 400, '{}', '{}'),
	(14, 'poolcleaner', 0, 'interim', 'Cleaner', 400, '{}', '{}'),
	(15, 'banker', 0, 'advisor', 'Advisor', 10, '{}', '{}'),
	(16, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
	(17, 'banker', 2, 'business_banker', 'Business Banker', 30, '{}', '{}'),
	(18, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
	(19, 'banker', 4, 'boss', 'Lead Banker', 0, '{}', '{}'),
	(20, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(21, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(22, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(23, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(24, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table essentialmode.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
INSERT IGNORE INTO `licenses` (`type`, `label`) VALUES
	('weapon', 'License to carry a weapon');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_properties
DROP TABLE IF EXISTS `owned_properties`;
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_vehicles
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(30) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) NOT NULL DEFAULT '',
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
	('steam:1100001083da79f', 'AYFK2860', '{"modFender":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"fuelLevel":45.2,"modSpeakers":-1,"extras":{"10":false,"12":true},"modAirFilter":-1,"modTransmission":-1,"pearlescentColor":111,"modDial":-1,"modSteeringWheel":-1,"modLivery":-1,"modAerials":-1,"modTrimA":-1,"modDoorSpeaker":-1,"modHydrolic":-1,"modSmokeEnabled":false,"modTrimB":-1,"model":-344943009,"modRoof":-1,"modSideSkirt":-1,"modHorns":-1,"color1":6,"modTurbo":false,"modXenon":false,"modBackWheels":-1,"modEngineBlock":-1,"modFrame":-1,"modVanityPlate":-1,"modSpoilers":-1,"modSeats":-1,"modGrille":-1,"modTrunk":-1,"plateIndex":0,"modHood":-1,"modPlateHolder":-1,"modRightFender":-1,"dirtLevel":8.4,"modFrontWheels":-1,"modSuspension":-1,"modTank":-1,"plate":"AYFK2860","modDashboard":-1,"modShifterLeavers":-1,"modExhaust":-1,"engineHealth":1000.0,"wheelColor":156,"windowTint":-1,"modAPlate":-1,"neonEnabled":[false,false,false,false],"modWindows":-1,"modOrnaments":-1,"modEngine":-1,"bodyHealth":1000.0,"neonColor":[255,0,255],"modFrontBumper":-1,"wheels":0,"modArmor":-1,"modArchCover":-1,"modStruts":-1,"color2":0,"modBrakes":-1}', 'car', '', 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.properties
DROP TABLE IF EXISTS `properties`;
CREATE TABLE IF NOT EXISTS `properties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entering` varchar(255) DEFAULT NULL,
  `exit` varchar(255) DEFAULT NULL,
  `inside` varchar(255) DEFAULT NULL,
  `outside` varchar(255) DEFAULT NULL,
  `ipls` varchar(255) DEFAULT '[]',
  `gateway` varchar(255) DEFAULT NULL,
  `is_single` int(11) DEFAULT NULL,
  `is_room` int(11) DEFAULT NULL,
  `is_gateway` int(11) DEFAULT NULL,
  `room_menu` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.properties: ~42 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT IGNORE INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
	(1, 'WhispymoundDrive', '2677 Whispymound Drive', '{"y":564.89,"z":182.959,"x":119.384}', '{"x":117.347,"y":559.506,"z":183.304}', '{"y":557.032,"z":183.301,"x":118.037}', '{"y":567.798,"z":182.131,"x":119.249}', '[]', NULL, 1, 1, 0, '{"x":118.748,"y":566.573,"z":175.697}', 1500000),
	(2, 'NorthConkerAvenue2045', '2045 North Conker Avenue', '{"x":372.796,"y":428.327,"z":144.685}', '{"x":373.548,"y":422.982,"z":144.907},', '{"y":420.075,"z":145.904,"x":372.161}', '{"x":372.454,"y":432.886,"z":143.443}', '[]', NULL, 1, 1, 0, '{"x":377.349,"y":429.422,"z":137.3}', 1500000),
	(3, 'RichardMajesticApt2', 'Richard Majestic, Apt 2', '{"y":-379.165,"z":37.961,"x":-936.363}', '{"y":-365.476,"z":113.274,"x":-913.097}', '{"y":-367.637,"z":113.274,"x":-918.022}', '{"y":-382.023,"z":37.961,"x":-943.626}', '[]', NULL, 1, 1, 0, '{"x":-927.554,"y":-377.744,"z":112.674}', 1700000),
	(4, 'NorthConkerAvenue2044', '2044 North Conker Avenue', '{"y":440.8,"z":146.702,"x":346.964}', '{"y":437.456,"z":148.394,"x":341.683}', '{"y":435.626,"z":148.394,"x":339.595}', '{"x":350.535,"y":443.329,"z":145.764}', '[]', NULL, 1, 1, 0, '{"x":337.726,"y":436.985,"z":140.77}', 1500000),
	(5, 'WildOatsDrive', '3655 Wild Oats Drive', '{"y":502.696,"z":136.421,"x":-176.003}', '{"y":497.817,"z":136.653,"x":-174.349}', '{"y":495.069,"z":136.666,"x":-173.331}', '{"y":506.412,"z":135.0664,"x":-177.927}', '[]', NULL, 1, 1, 0, '{"x":-174.725,"y":493.095,"z":129.043}', 1500000),
	(6, 'HillcrestAvenue2862', '2862 Hillcrest Avenue', '{"y":596.58,"z":142.641,"x":-686.554}', '{"y":591.988,"z":144.392,"x":-681.728}', '{"y":590.608,"z":144.392,"x":-680.124}', '{"y":599.019,"z":142.059,"x":-689.492}', '[]', NULL, 1, 1, 0, '{"x":-680.46,"y":588.6,"z":136.769}', 1500000),
	(7, 'LowEndApartment', 'Basic apartment', '{"y":-1078.735,"z":28.4031,"x":292.528}', '{"y":-1007.152,"z":-102.002,"x":265.845}', '{"y":-1002.802,"z":-100.008,"x":265.307}', '{"y":-1078.669,"z":28.401,"x":296.738}', '[]', NULL, 1, 1, 0, '{"x":265.916,"y":-999.38,"z":-100.008}', 562500),
	(8, 'MadWayneThunder', '2113 Mad Wayne Thunder', '{"y":454.955,"z":96.462,"x":-1294.433}', '{"x":-1289.917,"y":449.541,"z":96.902}', '{"y":446.322,"z":96.899,"x":-1289.642}', '{"y":455.453,"z":96.517,"x":-1298.851}', '[]', NULL, 1, 1, 0, '{"x":-1287.306,"y":455.901,"z":89.294}', 1500000),
	(9, 'HillcrestAvenue2874', '2874 Hillcrest Avenue', '{"x":-853.346,"y":696.678,"z":147.782}', '{"y":690.875,"z":151.86,"x":-859.961}', '{"y":688.361,"z":151.857,"x":-859.395}', '{"y":701.628,"z":147.773,"x":-855.007}', '[]', NULL, 1, 1, 0, '{"x":-858.543,"y":697.514,"z":144.253}', 1500000),
	(10, 'HillcrestAvenue2868', '2868 Hillcrest Avenue', '{"y":620.494,"z":141.588,"x":-752.82}', '{"y":618.62,"z":143.153,"x":-759.317}', '{"y":617.629,"z":143.153,"x":-760.789}', '{"y":621.281,"z":141.254,"x":-750.919}', '[]', NULL, 1, 1, 0, '{"x":-762.504,"y":618.992,"z":135.53}', 1500000),
	(11, 'TinselTowersApt12', 'Tinsel Towers, Apt 42', '{"y":37.025,"z":42.58,"x":-618.299}', '{"y":58.898,"z":97.2,"x":-603.301}', '{"y":58.941,"z":97.2,"x":-608.741}', '{"y":30.603,"z":42.524,"x":-620.017}', '[]', NULL, 1, 1, 0, '{"x":-622.173,"y":54.585,"z":96.599}', 1700000),
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 1000000),
	(13, 'Modern1Apartment', 'Modern Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_01_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.661,"y":327.672,"z":210.396}', 1300000),
	(14, 'Modern2Apartment', 'Modern Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_01_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.735,"y":326.757,"z":186.313}', 1300000),
	(15, 'Modern3Apartment', 'Modern Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_01_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.386,"y":330.782,"z":195.08}', 1300000),
	(16, 'Mody1Apartment', 'Mody Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_02_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.615,"y":327.878,"z":210.396}', 1300000),
	(17, 'Mody2Apartment', 'Mody Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_02_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.297,"y":327.092,"z":186.313}', 1300000),
	(18, 'Mody3Apartment', 'Mody Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_02_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.303,"y":330.932,"z":195.085}', 1300000),
	(19, 'Vibrant1Apartment', 'Vibrant Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_03_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.885,"y":327.641,"z":210.396}', 1300000),
	(20, 'Vibrant2Apartment', 'Vibrant Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_03_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.607,"y":327.344,"z":186.313}', 1300000),
	(21, 'Vibrant3Apartment', 'Vibrant Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_03_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.525,"y":330.851,"z":195.085}', 1300000),
	(22, 'Sharp1Apartment', 'Sharp Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_04_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.527,"y":327.89,"z":210.396}', 1300000),
	(23, 'Sharp2Apartment', 'Sharp Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_04_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.642,"y":326.497,"z":186.313}', 1300000),
	(24, 'Sharp3Apartment', 'Sharp Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_04_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.503,"y":331.318,"z":195.085}', 1300000),
	(25, 'Monochrome1Apartment', 'Monochrome Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_05_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.289,"y":328.086,"z":210.396}', 1300000),
	(26, 'Monochrome2Apartment', 'Monochrome Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_05_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.692,"y":326.762,"z":186.313}', 1300000),
	(27, 'Monochrome3Apartment', 'Monochrome Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_05_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.094,"y":330.976,"z":195.085}', 1300000),
	(28, 'Seductive1Apartment', 'Seductive Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_06_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.263,"y":328.104,"z":210.396}', 1300000),
	(29, 'Seductive2Apartment', 'Seductive Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_06_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.655,"y":326.611,"z":186.313}', 1300000),
	(30, 'Seductive3Apartment', 'Seductive Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_06_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.3,"y":331.414,"z":195.085}', 1300000),
	(31, 'Regal1Apartment', 'Regal Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_07_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.956,"y":328.257,"z":210.396}', 1300000),
	(32, 'Regal2Apartment', 'Regal Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_07_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.545,"y":326.659,"z":186.313}', 1300000),
	(33, 'Regal3Apartment', 'Regal Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_07_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.087,"y":331.429,"z":195.123}', 1300000),
	(34, 'Aqua1Apartment', 'Aqua Apartment 1', NULL, '{"x":-784.194,"y":323.636,"z":210.997}', '{"x":-779.751,"y":323.385,"z":210.997}', NULL, '["apa_v_mp_h_08_a"]', 'MiltonDrive', 0, 1, 0, '{"x":-766.187,"y":328.47,"z":210.396}', 1300000),
	(35, 'Aqua2Apartment', 'Aqua Apartment 2', NULL, '{"x":-786.8663,"y":315.764,"z":186.913}', '{"x":-781.808,"y":315.866,"z":186.913}', NULL, '["apa_v_mp_h_08_c"]', 'MiltonDrive', 0, 1, 0, '{"x":-795.658,"y":326.563,"z":186.313}', 1300000),
	(36, 'Aqua3Apartment', 'Aqua Apartment 3', NULL, '{"x":-774.012,"y":342.042,"z":195.686}', '{"x":-779.057,"y":342.063,"z":195.686}', NULL, '["apa_v_mp_h_08_b"]', 'MiltonDrive', 0, 1, 0, '{"x":-765.287,"y":331.084,"z":195.086}', 1300000),
	(37, 'IntegrityWay', '4 Integrity Way', '', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'Innocence Blvd', '9154 Jamestown', '{"x":500.69,"y":-1697.21,"z":29.79}', '', '', '', '[]', NULL, NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.rented_vehicles
DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.rented_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.shops
DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.shops: ~16 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT IGNORE INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'water', 30),
	(2, 'TwentyFourSeven', 'bread', 15),
	(3, 'RobsLiquor', 'water', 30),
	(4, 'RobsLiquor', 'bread', 15),
	(5, 'LTDgasoline', 'water', 30),
	(6, 'LTDgasoline', 'bread', 15),
	(13, 'ExtraItemsShop', 'lockpick', 20),
	(14, 'ExtraItemsShop', 'darknet', 25),
	(15, 'ExtraItemsShop', 'drill', 180),
	(16, 'ExtraItemsShop', 'binoculars', 10),
	(17, 'ExtraItemsShop', 'oxygen_mask', 400),
	(18, 'ExtraItemsShop', 'bulletproof', 300),
	(19, 'ExtraItemsShop', 'firstaidkit', 80),
	(20, 'VanillaUnicorn', 'water', 100),
	(21, 'BahamaMama', 'water', 100),
	(22, 'TequilaLaLa', 'water', 100);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.society_moneywash
DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table essentialmode.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `position` varchar(36) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT IGNORE INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `status`, `last_property`) VALUES
	('steam:110000100bc09b3', 'license:c17a03efdcbc2641b14660923607732ff4602934', 915700, 'webjocky', '{"chain_2":0,"moles_2":0,"hair_2":0,"bodyb_1":0,"decals_2":0,"shoes_1":0,"blush_2":0,"lipstick_2":0,"arms":0,"watches_1":-1,"chain_1":0,"lipstick_3":0,"eyebrows_3":0,"bproof_1":0,"ears_2":0,"eyebrows_2":0,"glasses_2":0,"shoes_2":0,"sex":0,"torso_2":0,"makeup_2":0,"arms_2":0,"bproof_2":0,"blush_3":0,"eyebrows_4":0,"complexion_1":0,"chest_1":0,"makeup_4":0,"blemishes_1":0,"makeup_1":0,"chest_2":0,"helmet_1":-1,"bracelets_2":0,"bags_1":0,"bags_2":0,"sun_1":0,"beard_2":0,"glasses_1":0,"lipstick_1":0,"beard_3":0,"complexion_2":0,"pants_1":0,"blemishes_2":0,"tshirt_1":0,"hair_color_1":0,"face":0,"tshirt_2":0,"age_2":0,"lipstick_4":0,"chest_3":0,"age_1":0,"eye_color":0,"mask_1":0,"beard_4":0,"watches_2":0,"torso_1":0,"sun_2":0,"decals_1":0,"beard_1":0,"hair_color_2":0,"skin":0,"pants_2":0,"moles_1":0,"helmet_2":0,"hair_1":0,"blush_1":0,"eyebrows_1":0,"bracelets_1":-1,"mask_2":0,"makeup_3":0,"bodyb_2":0,"ears_1":-1}', 'unemployed', 0, '[]', '{"z":27.6,"y":-1016.6,"x":842.6}', 1000, 0, 'user', '[{"percent":80.33,"val":803300,"name":"hunger"},{"percent":85.2475,"val":852475,"name":"thirst"}]', NULL),
	('steam:1100001083da79f', 'license:5d95643a350dcb5aa0f14598a720d4ecd758b87f', 435124, 'YouLoveTurd', '{"chest_3":0,"blush_3":0,"helmet_1":-1,"beard_3":0,"beard_2":10,"ears_2":1,"makeup_3":0,"complexion_2":0,"beard_1":4,"moles_1":0,"hair_2":0,"skin":0,"sun_2":0,"eyebrows_1":12,"chest_1":0,"lipstick_2":2,"blush_1":0,"torso_2":0,"glasses_1":7,"ears_1":5,"decals_1":0,"tshirt_1":33,"mask_1":0,"blush_2":0,"face":0,"pants_1":10,"bproof_1":0,"arms_2":0,"bracelets_1":-1,"moles_2":0,"hair_color_1":0,"pants_2":0,"bags_1":0,"helmet_2":0,"hair_1":11,"glasses_2":0,"torso_1":31,"eyebrows_3":0,"eyebrows_2":10,"sex":0,"chain_2":12,"blemishes_2":0,"bodyb_2":0,"watches_2":0,"decals_2":0,"makeup_2":0,"watches_1":-1,"tshirt_2":0,"mask_2":0,"shoes_1":10,"eye_color":0,"blemishes_1":0,"bodyb_1":0,"age_2":0,"hair_color_2":6,"makeup_4":0,"age_1":0,"chain_1":26,"bproof_2":0,"lipstick_3":11,"makeup_1":0,"bracelets_2":0,"sun_1":0,"chest_2":0,"beard_4":0,"lipstick_4":26,"shoes_2":0,"eyebrows_4":0,"lipstick_1":2,"arms":4,"bags_2":0,"complexion_1":0}', 'taxi', 0, '[]', '{"y":-173.0,"z":74.2,"x":910.5}', 10098037, 0, 'user', '[{"percent":12.61,"val":126100,"name":"hunger"},{"percent":34.4575,"val":344575,"name":"thirst"}]', NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_accounts
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
INSERT IGNORE INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(1, 'steam:1100001083da79f', 'black_money', 10145400),
	(2, 'steam:11000013dbc0313', 'black_money', 0),
	(3, 'steam:110000100bc09b3', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_inventory
DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_inventory: ~263 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
INSERT IGNORE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:1100001083da79f', 'essence', 0),
	(2, 'steam:1100001083da79f', 'stone', 0),
	(3, 'steam:1100001083da79f', 'packaged_chicken', 0),
	(4, 'steam:1100001083da79f', 'alive_chicken', 0),
	(5, 'steam:1100001083da79f', 'fabric', 0),
	(6, 'steam:1100001083da79f', 'diamond', 0),
	(7, 'steam:1100001083da79f', 'fish', 0),
	(9, 'steam:1100001083da79f', 'slaughtered_chicken', 0),
	(11, 'steam:1100001083da79f', 'washed_stone', 0),
	(12, 'steam:1100001083da79f', 'petrol', 0),
	(13, 'steam:1100001083da79f', 'cutted_wood', 0),
	(14, 'steam:1100001083da79f', 'gold', 0),
	(15, 'steam:1100001083da79f', 'copper', 0),
	(16, 'steam:1100001083da79f', 'iron', 0),
	(17, 'steam:1100001083da79f', 'petrol_raffin', 0),
	(18, 'steam:1100001083da79f', 'packaged_plank', 0),
	(19, 'steam:1100001083da79f', 'clothe', 0),
	(21, 'steam:11000013dbc0313', 'fabric', 0),
	(22, 'steam:11000013dbc0313', 'slaughtered_chicken', 0),
	(23, 'steam:11000013dbc0313', 'petrol', 0),
	(24, 'steam:11000013dbc0313', 'fish', 0),
	(25, 'steam:11000013dbc0313', 'cutted_wood', 0),
	(26, 'steam:11000013dbc0313', 'iron', 0),
	(27, 'steam:11000013dbc0313', 'packaged_chicken', 0),
	(28, 'steam:11000013dbc0313', 'essence', 0),
	(29, 'steam:11000013dbc0313', 'copper', 0),
	(30, 'steam:11000013dbc0313', 'packaged_plank', 0),
	(31, 'steam:11000013dbc0313', 'washed_stone', 0),
	(33, 'steam:11000013dbc0313', 'alive_chicken', 0),
	(34, 'steam:11000013dbc0313', 'clothe', 0),
	(35, 'steam:11000013dbc0313', 'gold', 0),
	(36, 'steam:11000013dbc0313', 'stone', 0),
	(37, 'steam:11000013dbc0313', 'petrol_raffin', 0),
	(38, 'steam:11000013dbc0313', 'diamond', 0),
	(39, 'steam:1100001083da79f', 'bread', 5),
	(40, 'steam:1100001083da79f', 'cloth', 0),
	(41, 'steam:1100001083da79f', 'water', 6),
	(42, 'steam:1100001083da79f', 'WEAPON_MACHINEPISTOL', 0),
	(43, 'steam:1100001083da79f', 'WEAPON_FLAREGUN', 0),
	(44, 'steam:1100001083da79f', 'WEAPON_COMBATPISTOL', 0),
	(45, 'steam:1100001083da79f', 'WEAPON_CARBINERIFLE', 0),
	(46, 'steam:1100001083da79f', 'WEAPON_FIREWORK', 0),
	(47, 'steam:1100001083da79f', 'WEAPON_PISTOL', 0),
	(48, 'steam:1100001083da79f', 'WEAPON_SPECIALCARBINE', 0),
	(49, 'steam:1100001083da79f', 'WEAPON_NIGHTSTICK', 0),
	(50, 'steam:1100001083da79f', 'WEAPON_GUSENBERG', 0),
	(51, 'steam:1100001083da79f', 'WEAPON_BALL', 0),
	(52, 'steam:1100001083da79f', 'WEAPON_BOTTLE', 0),
	(53, 'steam:1100001083da79f', 'WEAPON_ASSAULTSMG', 0),
	(54, 'steam:1100001083da79f', 'WEAPON_FLARE', 0),
	(55, 'steam:1100001083da79f', 'WEAPON_BULLPUPSHOTGUN', 0),
	(56, 'steam:1100001083da79f', 'WEAPON_COMBATMG', 0),
	(57, 'steam:1100001083da79f', 'WEAPON_APPISTOL', 0),
	(58, 'steam:1100001083da79f', 'WEAPON_MUSKET', 0),
	(59, 'steam:1100001083da79f', 'WEAPON_SNOWBALL', 0),
	(60, 'steam:1100001083da79f', 'WEAPON_BATTLEAXE', 0),
	(61, 'steam:1100001083da79f', 'WEAPON_PUMPSHOTGUN', 1),
	(62, 'steam:1100001083da79f', 'WEAPON_COMPACTRIFLE', 0),
	(63, 'steam:1100001083da79f', 'WEAPON_GRENADE', 0),
	(64, 'steam:1100001083da79f', 'WEAPON_BAT', 0),
	(65, 'steam:1100001083da79f', 'WEAPON_ASSAULTRIFLE', 0),
	(66, 'steam:1100001083da79f', 'WEAPON_KNUCKLE', 0),
	(67, 'steam:1100001083da79f', 'WEAPON_MINIGUN', 0),
	(68, 'steam:1100001083da79f', 'WEAPON_MARKSMANPISTOL', 0),
	(69, 'steam:1100001083da79f', 'WEAPON_KNIFE', 0),
	(70, 'steam:1100001083da79f', 'WEAPON_GOLFCLUB', 0),
	(71, 'steam:1100001083da79f', 'WEAPON_PIPEBOMB', 0),
	(72, 'steam:1100001083da79f', 'WEAPON_STINGER', 0),
	(73, 'steam:1100001083da79f', 'WEAPON_WRENCH', 0),
	(74, 'steam:1100001083da79f', 'WEAPON_AUTOSHOTGUN', 0),
	(75, 'steam:1100001083da79f', 'WEAPON_HEAVYSNIPER', 0),
	(76, 'steam:1100001083da79f', 'WEAPON_COMBATPDW', 0),
	(77, 'steam:1100001083da79f', 'WEAPON_SWITCHBLADE', 0),
	(78, 'steam:1100001083da79f', 'WEAPON_HEAVYPISTOL', 0),
	(79, 'steam:1100001083da79f', 'WEAPON_STUNGUN', 0),
	(80, 'steam:1100001083da79f', 'WEAPON_SNIPERRIFLE', 0),
	(81, 'steam:1100001083da79f', 'WEAPON_SMG', 0),
	(82, 'steam:1100001083da79f', 'WEAPON_RPG', 0),
	(83, 'steam:1100001083da79f', 'WEAPON_FIREEXTINGUISHER', 0),
	(84, 'steam:1100001083da79f', 'WEAPON_SMOKEGRENADE', 0),
	(85, 'steam:1100001083da79f', 'WEAPON_MARKSMANRIFLE', 0),
	(86, 'steam:1100001083da79f', 'WEAPON_DBSHOTGUN', 0),
	(87, 'steam:1100001083da79f', 'WEAPON_STICKYBOMB', 0),
	(88, 'steam:1100001083da79f', 'WEAPON_HANDCUFFS', 0),
	(89, 'steam:1100001083da79f', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(90, 'steam:1100001083da79f', 'WEAPON_SNSPISTOL', 0),
	(91, 'steam:1100001083da79f', 'WEAPON_REVOLVER', 0),
	(92, 'steam:1100001083da79f', 'WEAPON_MOLOTOV', 0),
	(93, 'steam:1100001083da79f', 'WEAPON_PROXMINE', 0),
	(94, 'steam:1100001083da79f', 'WEAPON_PISTOL50', 0),
	(95, 'steam:1100001083da79f', 'WEAPON_FLASHLIGHT', 0),
	(96, 'steam:1100001083da79f', 'WEAPON_PETROLCAN', 0),
	(97, 'steam:1100001083da79f', 'WEAPON_RAILGUN', 0),
	(98, 'steam:1100001083da79f', 'WEAPON_MINISMG', 0),
	(99, 'steam:1100001083da79f', 'WEAPON_DIGISCANNER', 0),
	(100, 'steam:1100001083da79f', 'WEAPON_GRENADELAUNCHER', 0),
	(101, 'steam:1100001083da79f', 'WEAPON_BULLPUPRIFLE', 0),
	(102, 'steam:1100001083da79f', 'WEAPON_MG', 0),
	(103, 'steam:1100001083da79f', 'WEAPON_BZGAS', 0),
	(104, 'steam:1100001083da79f', 'WEAPON_ADVANCEDRIFLE', 0),
	(105, 'steam:1100001083da79f', 'WEAPON_DOUBLEACTION', 0),
	(106, 'steam:1100001083da79f', 'WEAPON_MACHETE', 0),
	(107, 'steam:1100001083da79f', 'WEAPON_HOMINGLAUNCHER', 0),
	(108, 'steam:1100001083da79f', 'WEAPON_VINTAGEPISTOL', 0),
	(109, 'steam:1100001083da79f', 'WEAPON_HEAVYSHOTGUN', 0),
	(110, 'steam:1100001083da79f', 'WEAPON_MICROSMG', 0),
	(111, 'steam:1100001083da79f', 'WEAPON_GARBAGEBAG', 0),
	(112, 'steam:1100001083da79f', 'WEAPON_HAMMER', 0),
	(113, 'steam:1100001083da79f', 'WEAPON_COMPACTLAUNCHER', 0),
	(114, 'steam:1100001083da79f', 'WEAPON_HATCHET', 0),
	(115, 'steam:1100001083da79f', 'WEAPON_ASSAULTSHOTGUN', 0),
	(116, 'steam:1100001083da79f', 'WEAPON_DAGGER', 0),
	(117, 'steam:1100001083da79f', 'WEAPON_CROWBAR', 0),
	(118, 'steam:1100001083da79f', 'WEAPON_POOLCUE', 0),
	(119, 'steam:1100001083da79f', 'disc_ammo_rifle', 0),
	(120, 'steam:1100001083da79f', 'disc_ammo_rifle_large', 0),
	(121, 'steam:1100001083da79f', 'disc_ammo_shotgun', 0),
	(122, 'steam:1100001083da79f', 'disc_ammo_smg', 0),
	(123, 'steam:1100001083da79f', 'disc_ammo_pistol', 0),
	(124, 'steam:1100001083da79f', 'disc_ammo_snp_large', 0),
	(125, 'steam:1100001083da79f', 'disc_ammo_smg_large', 0),
	(126, 'steam:1100001083da79f', 'disc_ammo_pistol_large', 0),
	(127, 'steam:1100001083da79f', 'disc_ammo_shotgun_large', 0),
	(128, 'steam:1100001083da79f', 'disc_ammo_snp', 0),
	(129, 'steam:110000100bc09b3', 'WEAPON_FLASHLIGHT', 0),
	(130, 'steam:110000100bc09b3', 'WEAPON_DOUBLEACTION', 0),
	(131, 'steam:110000100bc09b3', 'gold', 0),
	(132, 'steam:110000100bc09b3', 'disc_ammo_rifle', 0),
	(133, 'steam:110000100bc09b3', 'WEAPON_PISTOL50', 0),
	(134, 'steam:110000100bc09b3', 'disc_ammo_smg', 0),
	(135, 'steam:110000100bc09b3', 'fish', 0),
	(136, 'steam:110000100bc09b3', 'petrol', 0),
	(137, 'steam:110000100bc09b3', 'WEAPON_HAMMER', 0),
	(138, 'steam:110000100bc09b3', 'WEAPON_DIGISCANNER', 0),
	(139, 'steam:110000100bc09b3', 'essence', 0),
	(140, 'steam:110000100bc09b3', 'WEAPON_GARBAGEBAG', 0),
	(141, 'steam:110000100bc09b3', 'WEAPON_BZGAS', 0),
	(142, 'steam:110000100bc09b3', 'WEAPON_ASSAULTSMG', 0),
	(143, 'steam:110000100bc09b3', 'WEAPON_SMOKEGRENADE', 0),
	(144, 'steam:110000100bc09b3', 'WEAPON_POOLCUE', 0),
	(145, 'steam:110000100bc09b3', 'iron', 0),
	(146, 'steam:110000100bc09b3', 'WEAPON_PISTOL', 0),
	(149, 'steam:110000100bc09b3', 'WEAPON_ASSAULTRIFLE', 0),
	(150, 'steam:110000100bc09b3', 'WEAPON_GRENADE', 0),
	(151, 'steam:110000100bc09b3', 'WEAPON_MINISMG', 0),
	(152, 'steam:110000100bc09b3', 'fabric', 0),
	(153, 'steam:110000100bc09b3', 'WEAPON_WRENCH', 0),
	(154, 'steam:110000100bc09b3', 'WEAPON_BOTTLE', 0),
	(155, 'steam:110000100bc09b3', 'WEAPON_SWITCHBLADE', 0),
	(156, 'steam:110000100bc09b3', 'WEAPON_HEAVYSHOTGUN', 0),
	(157, 'steam:110000100bc09b3', 'WEAPON_REVOLVER', 0),
	(158, 'steam:110000100bc09b3', 'WEAPON_BULLPUPSHOTGUN', 0),
	(159, 'steam:110000100bc09b3', 'WEAPON_MACHETE', 0),
	(160, 'steam:110000100bc09b3', 'WEAPON_STINGER', 0),
	(161, 'steam:110000100bc09b3', 'WEAPON_SPECIALCARBINE', 0),
	(162, 'steam:110000100bc09b3', 'disc_ammo_shotgun_large', 0),
	(163, 'steam:110000100bc09b3', 'WEAPON_RPG', 0),
	(164, 'steam:110000100bc09b3', 'WEAPON_SNSPISTOL', 0),
	(165, 'steam:110000100bc09b3', 'WEAPON_COMBATMG', 0),
	(166, 'steam:110000100bc09b3', 'WEAPON_ASSAULTSHOTGUN', 0),
	(167, 'steam:110000100bc09b3', 'WEAPON_SNOWBALL', 0),
	(168, 'steam:110000100bc09b3', 'WEAPON_DBSHOTGUN', 0),
	(169, 'steam:110000100bc09b3', 'slaughtered_chicken', 0),
	(170, 'steam:110000100bc09b3', 'WEAPON_PIPEBOMB', 0),
	(171, 'steam:110000100bc09b3', 'WEAPON_SMG', 0),
	(172, 'steam:110000100bc09b3', 'disc_ammo_pistol_large', 0),
	(173, 'steam:110000100bc09b3', 'WEAPON_MINIGUN', 0),
	(174, 'steam:110000100bc09b3', 'WEAPON_GUSENBERG', 0),
	(175, 'steam:110000100bc09b3', 'bread', 0),
	(176, 'steam:110000100bc09b3', 'disc_ammo_snp', 0),
	(177, 'steam:110000100bc09b3', 'WEAPON_STUNGUN', 0),
	(178, 'steam:110000100bc09b3', 'WEAPON_RAILGUN', 0),
	(179, 'steam:110000100bc09b3', 'WEAPON_FIREWORK', 0),
	(180, 'steam:110000100bc09b3', 'WEAPON_DAGGER', 0),
	(181, 'steam:110000100bc09b3', 'WEAPON_KNIFE', 0),
	(182, 'steam:110000100bc09b3', 'WEAPON_PROXMINE', 0),
	(183, 'steam:110000100bc09b3', 'WEAPON_APPISTOL', 0),
	(184, 'steam:110000100bc09b3', 'WEAPON_HATCHET', 0),
	(185, 'steam:110000100bc09b3', 'WEAPON_COMPACTLAUNCHER', 0),
	(186, 'steam:110000100bc09b3', 'WEAPON_PETROLCAN', 0),
	(187, 'steam:110000100bc09b3', 'WEAPON_FLARE', 0),
	(188, 'steam:110000100bc09b3', 'WEAPON_NIGHTSTICK', 0),
	(189, 'steam:110000100bc09b3', 'WEAPON_MOLOTOV', 0),
	(190, 'steam:110000100bc09b3', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(191, 'steam:110000100bc09b3', 'disc_ammo_smg_large', 0),
	(192, 'steam:110000100bc09b3', 'disc_ammo_pistol', 0),
	(193, 'steam:110000100bc09b3', 'WEAPON_HOMINGLAUNCHER', 0),
	(194, 'steam:110000100bc09b3', 'WEAPON_MG', 0),
	(195, 'steam:110000100bc09b3', 'WEAPON_MICROSMG', 0),
	(196, 'steam:110000100bc09b3', 'WEAPON_BALL', 0),
	(197, 'steam:110000100bc09b3', 'WEAPON_PUMPSHOTGUN', 0),
	(198, 'steam:110000100bc09b3', 'WEAPON_MACHINEPISTOL', 0),
	(199, 'steam:110000100bc09b3', 'WEAPON_CARBINERIFLE', 0),
	(200, 'steam:110000100bc09b3', 'WEAPON_STICKYBOMB', 0),
	(201, 'steam:110000100bc09b3', 'WEAPON_BATTLEAXE', 0),
	(202, 'steam:110000100bc09b3', 'WEAPON_KNUCKLE', 0),
	(203, 'steam:110000100bc09b3', 'WEAPON_HEAVYSNIPER', 0),
	(204, 'steam:110000100bc09b3', 'WEAPON_HEAVYPISTOL', 0),
	(205, 'steam:110000100bc09b3', 'WEAPON_HANDCUFFS', 0),
	(206, 'steam:110000100bc09b3', 'WEAPON_GRENADELAUNCHER', 0),
	(207, 'steam:110000100bc09b3', 'WEAPON_COMBATPDW', 0),
	(208, 'steam:110000100bc09b3', 'WEAPON_COMBATPISTOL', 0),
	(209, 'steam:110000100bc09b3', 'diamond', 0),
	(210, 'steam:110000100bc09b3', 'washed_stone', 0),
	(211, 'steam:110000100bc09b3', 'WEAPON_BAT', 0),
	(212, 'steam:110000100bc09b3', 'stone', 0),
	(213, 'steam:110000100bc09b3', 'WEAPON_GOLFCLUB', 0),
	(214, 'steam:110000100bc09b3', 'WEAPON_CROWBAR', 0),
	(215, 'steam:110000100bc09b3', 'packaged_plank', 0),
	(216, 'steam:110000100bc09b3', 'WEAPON_FLAREGUN', 0),
	(217, 'steam:110000100bc09b3', 'WEAPON_MUSKET', 0),
	(218, 'steam:110000100bc09b3', 'WEAPON_ADVANCEDRIFLE', 0),
	(219, 'steam:110000100bc09b3', 'WEAPON_COMPACTRIFLE', 0),
	(220, 'steam:110000100bc09b3', 'petrol_raffin', 0),
	(221, 'steam:110000100bc09b3', 'WEAPON_FIREEXTINGUISHER', 0),
	(222, 'steam:110000100bc09b3', 'WEAPON_AUTOSHOTGUN', 0),
	(223, 'steam:110000100bc09b3', 'WEAPON_SNIPERRIFLE', 0),
	(224, 'steam:110000100bc09b3', 'disc_ammo_rifle_large', 0),
	(225, 'steam:110000100bc09b3', 'WEAPON_MARKSMANPISTOL', 0),
	(226, 'steam:110000100bc09b3', 'WEAPON_VINTAGEPISTOL', 0),
	(227, 'steam:110000100bc09b3', 'clothe', 0),
	(228, 'steam:110000100bc09b3', 'WEAPON_BULLPUPRIFLE', 0),
	(229, 'steam:110000100bc09b3', 'packaged_chicken', 0),
	(230, 'steam:110000100bc09b3', 'cutted_wood', 0),
	(231, 'steam:110000100bc09b3', 'disc_ammo_snp_large', 0),
	(232, 'steam:110000100bc09b3', 'alive_chicken', 0),
	(233, 'steam:110000100bc09b3', 'disc_ammo_shotgun', 0),
	(234, 'steam:110000100bc09b3', 'water', 0),
	(235, 'steam:110000100bc09b3', 'WEAPON_MARKSMANRIFLE', 0),
	(236, 'steam:110000100bc09b3', 'copper', 0),
	(237, 'steam:1100001083da79f', 'WEAPON_GLOCK19', 0),
	(238, 'steam:1100001083da79f', 'firstaidkit', 0),
	(239, 'steam:1100001083da79f', 'clip', 0),
	(240, 'steam:1100001083da79f', 'oxygen_mask', 0),
	(241, 'steam:1100001083da79f', 'bulletproof', 0),
	(242, 'steam:1100001083da79f', 'drill', 0),
	(243, 'steam:1100001083da79f', 'darknet', 0),
	(244, 'steam:1100001083da79f', 'binoculars', 0),
	(245, 'steam:1100001083da79f', 'lockpick', 0),
	(247, 'steam:1100001083da79f', 'silencer', 0),
	(248, 'steam:1100001083da79f', 'scope', 0),
	(249, 'steam:1100001083da79f', 'flashlight', 0),
	(250, 'steam:1100001083da79f', 'magazine', 0),
	(251, 'steam:1100001083da79f', 'grip', 0),
	(252, 'steam:1100001083da79f', 'wool', 0),
	(253, 'steam:1100001083da79f', 'wood', 0),
	(254, 'steam:1100001083da79f', 'yusuf', 0),
	(255, 'steam:110000100bc09b3', 'flashlight', 0),
	(256, 'steam:110000100bc09b3', 'grip', 0),
	(257, 'steam:110000100bc09b3', 'yusuf', 0),
	(258, 'steam:110000100bc09b3', 'wool', 0),
	(259, 'steam:110000100bc09b3', 'firstaidkit', 0),
	(260, 'steam:110000100bc09b3', 'wood', 0),
	(261, 'steam:110000100bc09b3', 'bulletproof', 0),
	(262, 'steam:110000100bc09b3', 'scope', 0),
	(263, 'steam:110000100bc09b3', 'drill', 0),
	(264, 'steam:110000100bc09b3', 'lockpick', 0),
	(265, 'steam:110000100bc09b3', 'silencer', 0),
	(266, 'steam:110000100bc09b3', 'clip', 0),
	(267, 'steam:110000100bc09b3', 'magazine', 0),
	(268, 'steam:110000100bc09b3', 'binoculars', 0),
	(269, 'steam:110000100bc09b3', 'darknet', 0),
	(270, 'steam:110000100bc09b3', 'oxygen_mask', 0),
	(271, 'steam:1100001083da79f', 'poolreceipt', 0),
	(272, 'steam:110000100bc09b3', 'poolreceipt', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_licenses: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_parkings
DROP TABLE IF EXISTS `user_parkings`;
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_parkings: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
INSERT IGNORE INTO `user_parkings` (`id`, `identifier`, `garage`, `zone`, `vehicle`) VALUES
	(3, 'steam:1100001083da79f', 'VinewoodEstate2650', 10, '{"modSideSkirt":-1,"modHood":-1,"modArmor":-1,"plateIndex":0,"modDoorSpeaker":-1,"modStruts":-1,"pearlescentColor":73,"modTank":-1,"modShifterLeavers":-1,"modSeats":-1,"modDashboard":-1,"modFrontBumper":-1,"modFrontWheels":-1,"extras":[],"modWindows":-1,"modDial":-1,"modSpeakers":-1,"modEngine":-1,"modTrimB":-1,"neonEnabled":[false,false,false,false],"bodyHealth":964.8,"modBackWheels":-1,"modSuspension":-1,"neonColor":[255,0,255],"modFender":-1,"modArchCover":-1,"wheelColor":0,"modGrille":-1,"plate":"21EAX810","modSteeringWheel":-1,"modOrnaments":-1,"modXenon":false,"modTurbo":false,"model":-1848994066,"color2":0,"modSpoilers":-1,"modRoof":-1,"engineHealth":1000.0,"windowTint":-1,"modTrunk":-1,"modExhaust":-1,"modVanityPlate":-1,"modFrame":-1,"modRightFender":-1,"color1":64,"modBrakes":-1,"dirtLevel":1.5,"modAPlate":-1,"modAirFilter":-1,"modHydrolic":-1,"modTransmission":-1,"modHorns":-1,"modAerials":-1,"fuelLevel":65.0,"modEngineBlock":-1,"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modTrimA":-1,"modLivery":-1,"modPlateHolder":-1,"modSmokeEnabled":false,"wheels":0}'),
	(4, 'steam:1100001083da79f', 'VinewoodEstate2650', 1, '{"modStruts":-1,"modEngineBlock":-1,"modSuspension":-1,"modAPlate":-1,"modPlateHolder":-1,"modOrnaments":-1,"wheels":0,"modXenon":false,"modRightFender":-1,"modVanityPlate":-1,"modAerials":-1,"modSideSkirt":-1,"modTrunk":-1,"modBrakes":-1,"modArchCover":-1,"color1":64,"modSeats":-1,"windowTint":-1,"modFrontBumper":-1,"modBackWheels":-1,"modDashboard":-1,"extras":[],"neonEnabled":[false,false,false,false],"pearlescentColor":73,"tyreSmokeColor":[255,255,255],"modHood":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modWindows":-1,"modHorns":-1,"modTrimA":-1,"modTrimB":-1,"modRearBumper":-1,"modHydrolic":-1,"engineHealth":968.4,"plate":"63QKU468","plateIndex":0,"modFrame":-1,"modShifterLeavers":-1,"modExhaust":-1,"wheelColor":0,"modRoof":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modEngine":-1,"fuelLevel":65.0,"modLivery":-1,"color2":0,"modTank":-1,"dirtLevel":5.8,"modSmokeEnabled":false,"model":-1848994066,"modTransmission":-1,"bodyHealth":867.7,"modSpeakers":-1,"modFender":-1,"modArmor":-1,"modDial":-1,"modGrille":-1,"modTurbo":false,"modSteeringWheel":-1,"modSpoilers":-1}'),
	(11, 'steam:1100001083da79f', 'SteeleWay1150', 5, '{"modArchCover":-1,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modExhaust":-1,"modFender":-1,"modTransmission":-1,"modSpoilers":-1,"modSeats":-1,"neonColor":[255,0,255],"fuelLevel":65.0,"pearlescentColor":73,"plateIndex":0,"dirtLevel":2.4,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modSmokeEnabled":false,"modHood":-1,"modDashboard":-1,"modEngine":-1,"color2":0,"modWindows":-1,"wheelColor":0,"modArmor":-1,"modShifterLeavers":-1,"modRearBumper":-1,"modTrimA":-1,"modOrnaments":-1,"wheels":0,"windowTint":-1,"modSuspension":-1,"modDoorSpeaker":-1,"engineHealth":1000.0,"modHydrolic":-1,"model":-1848994066,"modTrimB":-1,"modFrame":-1,"modRightFender":-1,"modFrontWheels":-1,"modXenon":false,"modGrille":-1,"modVanityPlate":-1,"color1":64,"modPlateHolder":-1,"modBrakes":-1,"modTank":-1,"modFrontBumper":-1,"modLivery":-1,"modHorns":-1,"modDial":-1,"modAPlate":-1,"modSpeakers":-1,"modRoof":-1,"modTurbo":false,"modAirFilter":-1,"modEngineBlock":-1,"plate":"81QLT453","modTrunk":-1,"extras":[],"modAerials":-1,"modStruts":-1,"modSideSkirt":-1,"bodyHealth":978.2}');
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicles
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.vehicles: ~240 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT IGNORE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Adder', 'adder', 900000, 'super'),
	('Akuma', 'AKUMA', 7500, 'motorcycles'),
	('Alpha', 'alpha', 60000, 'sports'),
	('Ardent', 'ardent', 1150000, 'sportsclassics'),
	('Asea', 'asea', 5500, 'sedans'),
	('Autarch', 'autarch', 1955000, 'super'),
	('Avarus', 'avarus', 18000, 'motorcycles'),
	('Bagger', 'bagger', 13500, 'motorcycles'),
	('Baller', 'baller2', 40000, 'suvs'),
	('Baller Sport', 'baller3', 60000, 'suvs'),
	('Banshee', 'banshee', 70000, 'sports'),
	('Banshee 900R', 'banshee2', 255000, 'super'),
	('Bati 801', 'bati', 12000, 'motorcycles'),
	('Bati 801RR', 'bati2', 19000, 'motorcycles'),
	('Bestia GTS', 'bestiagts', 55000, 'sports'),
	('BF400', 'bf400', 6500, 'motorcycles'),
	('Bf Injection', 'bfinjection', 16000, 'offroad'),
	('Bifta', 'bifta', 12000, 'offroad'),
	('Bison', 'bison', 45000, 'vans'),
	('Blade', 'blade', 15000, 'muscle'),
	('Blazer', 'blazer', 6500, 'offroad'),
	('Blazer Sport', 'blazer4', 8500, 'offroad'),
	('blazer5', 'blazer5', 1755600, 'offroad'),
	('Blista', 'blista', 8000, 'compacts'),
	('BMX (velo)', 'bmx', 160, 'motorcycles'),
	('Bobcat XL', 'bobcatxl', 32000, 'vans'),
	('Brawler', 'brawler', 45000, 'offroad'),
	('Brioso R/A', 'brioso', 18000, 'compacts'),
	('Btype', 'btype', 62000, 'sportsclassics'),
	('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
	('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
	('Buccaneer', 'buccaneer', 18000, 'muscle'),
	('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
	('Buffalo', 'buffalo', 12000, 'sports'),
	('Buffalo S', 'buffalo2', 20000, 'sports'),
	('Bullet', 'bullet', 90000, 'super'),
	('Burrito', 'burrito3', 19000, 'vans'),
	('Camper', 'camper', 42000, 'vans'),
	('Carbonizzare', 'carbonizzare', 75000, 'sports'),
	('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
	('Casco', 'casco', 30000, 'sportsclassics'),
	('Cavalcade', 'cavalcade2', 55000, 'suvs'),
	('Cheetah', 'cheetah', 375000, 'super'),
	('Chimera', 'chimera', 38000, 'motorcycles'),
	('Chino', 'chino', 15000, 'muscle'),
	('Chino Luxe', 'chino2', 19000, 'muscle'),
	('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
	('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
	('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
	('Comet', 'comet2', 65000, 'sports'),
	('Comet 5', 'comet5', 1145000, 'sports'),
	('Contender', 'contender', 70000, 'suvs'),
	('Coquette', 'coquette', 65000, 'sports'),
	('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
	('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
	('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
	('Cyclone', 'cyclone', 1890000, 'super'),
	('Daemon', 'daemon', 11500, 'motorcycles'),
	('Daemon High', 'daemon2', 13500, 'motorcycles'),
	('Defiler', 'defiler', 9800, 'motorcycles'),
	('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
	('Dominator', 'dominator', 35000, 'muscle'),
	('Double T', 'double', 28000, 'motorcycles'),
	('Dubsta', 'dubsta', 45000, 'suvs'),
	('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
	('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
	('Dukes', 'dukes', 28000, 'muscle'),
	('Dune Buggy', 'dune', 8000, 'offroad'),
	('Elegy', 'elegy2', 38500, 'sports'),
	('Emperor', 'emperor', 8500, 'sedans'),
	('Enduro', 'enduro', 5500, 'motorcycles'),
	('Entity XF', 'entityxf', 425000, 'super'),
	('Esskey', 'esskey', 4200, 'motorcycles'),
	('Exemplar', 'exemplar', 32000, 'coupes'),
	('F620', 'f620', 40000, 'coupes'),
	('Faction', 'faction', 20000, 'muscle'),
	('Faction Rider', 'faction2', 30000, 'muscle'),
	('Faction XL', 'faction3', 40000, 'muscle'),
	('Faggio', 'faggio', 1900, 'motorcycles'),
	('Vespa', 'faggio2', 2800, 'motorcycles'),
	('Felon', 'felon', 42000, 'coupes'),
	('Felon GT', 'felon2', 55000, 'coupes'),
	('Feltzer', 'feltzer2', 55000, 'sports'),
	('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
	('Fixter (velo)', 'fixter', 225, 'motorcycles'),
	('FMJ', 'fmj', 185000, 'super'),
	('Fhantom', 'fq2', 17000, 'suvs'),
	('Fugitive', 'fugitive', 12000, 'sedans'),
	('Furore GT', 'furoregt', 45000, 'sports'),
	('Fusilade', 'fusilade', 40000, 'sports'),
	('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
	('Gauntlet', 'gauntlet', 30000, 'muscle'),
	('Gang Burrito', 'gburrito', 45000, 'vans'),
	('Burrito', 'gburrito2', 29000, 'vans'),
	('Glendale', 'glendale', 6500, 'sedans'),
	('Grabger', 'granger', 50000, 'suvs'),
	('Gresley', 'gresley', 47500, 'suvs'),
	('GT 500', 'gt500', 785000, 'sportsclassics'),
	('Guardian', 'guardian', 45000, 'offroad'),
	('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
	('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
	('Hermes', 'hermes', 535000, 'muscle'),
	('Hexer', 'hexer', 12000, 'motorcycles'),
	('Hotknife', 'hotknife', 125000, 'muscle'),
	('Huntley S', 'huntley', 40000, 'suvs'),
	('Hustler', 'hustler', 625000, 'muscle'),
	('Infernus', 'infernus', 180000, 'super'),
	('Innovation', 'innovation', 23500, 'motorcycles'),
	('Intruder', 'intruder', 7500, 'sedans'),
	('Issi', 'issi2', 10000, 'compacts'),
	('Jackal', 'jackal', 38000, 'coupes'),
	('Jester', 'jester', 65000, 'sports'),
	('Jester(Racecar)', 'jester2', 135000, 'sports'),
	('Journey', 'journey', 6500, 'vans'),
	('Kamacho', 'kamacho', 345000, 'offroad'),
	('Khamelion', 'khamelion', 38000, 'sports'),
	('Kuruma', 'kuruma', 30000, 'sports'),
	('Landstalker', 'landstalker', 35000, 'suvs'),
	('RE-7B', 'le7b', 325000, 'super'),
	('Lynx', 'lynx', 40000, 'sports'),
	('Mamba', 'mamba', 70000, 'sports'),
	('Manana', 'manana', 12800, 'sportsclassics'),
	('Manchez', 'manchez', 5300, 'motorcycles'),
	('Massacro', 'massacro', 65000, 'sports'),
	('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
	('Mesa', 'mesa', 16000, 'suvs'),
	('Mesa Trail', 'mesa3', 40000, 'suvs'),
	('Minivan', 'minivan', 13000, 'vans'),
	('Monroe', 'monroe', 55000, 'sportsclassics'),
	('The Liberator', 'monster', 210000, 'offroad'),
	('Moonbeam', 'moonbeam', 18000, 'vans'),
	('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
	('Nemesis', 'nemesis', 5800, 'motorcycles'),
	('Neon', 'neon', 1500000, 'sports'),
	('Nightblade', 'nightblade', 35000, 'motorcycles'),
	('Nightshade', 'nightshade', 65000, 'muscle'),
	('9F', 'ninef', 65000, 'sports'),
	('9F Cabrio', 'ninef2', 80000, 'sports'),
	('Omnis', 'omnis', 35000, 'sports'),
	('Oppressor', 'oppressor', 3524500, 'super'),
	('Oracle XS', 'oracle2', 35000, 'coupes'),
	('Osiris', 'osiris', 160000, 'super'),
	('Panto', 'panto', 10000, 'compacts'),
	('Paradise', 'paradise', 19000, 'vans'),
	('Pariah', 'pariah', 1420000, 'sports'),
	('Patriot', 'patriot', 55000, 'suvs'),
	('PCJ-600', 'pcj', 6200, 'motorcycles'),
	('Penumbra', 'penumbra', 28000, 'sports'),
	('Pfister', 'pfister811', 85000, 'super'),
	('Phoenix', 'phoenix', 12500, 'muscle'),
	('Picador', 'picador', 18000, 'muscle'),
	('Pigalle', 'pigalle', 20000, 'sportsclassics'),
	('Prairie', 'prairie', 12000, 'compacts'),
	('Premier', 'premier', 8000, 'sedans'),
	('Primo Custom', 'primo2', 14000, 'sedans'),
	('X80 Proto', 'prototipo', 2500000, 'super'),
	('Radius', 'radi', 29000, 'suvs'),
	('raiden', 'raiden', 1375000, 'sports'),
	('Rapid GT', 'rapidgt', 35000, 'sports'),
	('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
	('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
	('Reaper', 'reaper', 150000, 'super'),
	('Rebel', 'rebel2', 35000, 'offroad'),
	('Regina', 'regina', 5000, 'sedans'),
	('Retinue', 'retinue', 615000, 'sportsclassics'),
	('Revolter', 'revolter', 1610000, 'sports'),
	('riata', 'riata', 380000, 'offroad'),
	('Rocoto', 'rocoto', 45000, 'suvs'),
	('Ruffian', 'ruffian', 6800, 'motorcycles'),
	('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
	('Rumpo', 'rumpo', 15000, 'vans'),
	('Rumpo Trail', 'rumpo3', 19500, 'vans'),
	('Sabre Turbo', 'sabregt', 20000, 'muscle'),
	('Sabre GT', 'sabregt2', 25000, 'muscle'),
	('Sanchez', 'sanchez', 5300, 'motorcycles'),
	('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
	('Sanctus', 'sanctus', 25000, 'motorcycles'),
	('Sandking', 'sandking', 55000, 'offroad'),
	('Savestra', 'savestra', 990000, 'sportsclassics'),
	('SC 1', 'sc1', 1603000, 'super'),
	('Schafter', 'schafter2', 25000, 'sedans'),
	('Schafter V12', 'schafter3', 50000, 'sports'),
	('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
	('Seminole', 'seminole', 25000, 'suvs'),
	('Sentinel', 'sentinel', 32000, 'coupes'),
	('Sentinel XS', 'sentinel2', 40000, 'coupes'),
	('Sentinel3', 'sentinel3', 650000, 'sports'),
	('Seven 70', 'seven70', 39500, 'sports'),
	('ETR1', 'sheava', 220000, 'super'),
	('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
	('Slam Van', 'slamvan3', 11500, 'muscle'),
	('Sovereign', 'sovereign', 22000, 'motorcycles'),
	('Stinger', 'stinger', 80000, 'sportsclassics'),
	('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
	('Streiter', 'streiter', 500000, 'sports'),
	('Stretch', 'stretch', 90000, 'sedans'),
	('Stromberg', 'stromberg', 3185350, 'sports'),
	('Sultan', 'sultan', 15000, 'sports'),
	('Sultan RS', 'sultanrs', 65000, 'super'),
	('Super Diamond', 'superd', 130000, 'sedans'),
	('Surano', 'surano', 50000, 'sports'),
	('Surfer', 'surfer', 12000, 'vans'),
	('T20', 't20', 300000, 'super'),
	('Tailgater', 'tailgater', 30000, 'sedans'),
	('Tampa', 'tampa', 16000, 'muscle'),
	('Drift Tampa', 'tampa2', 80000, 'sports'),
	('Thrust', 'thrust', 24000, 'motorcycles'),
	('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
	('Trophy Truck', 'trophytruck', 60000, 'offroad'),
	('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
	('Tropos', 'tropos', 40000, 'sports'),
	('Turismo R', 'turismor', 350000, 'super'),
	('Tyrus', 'tyrus', 600000, 'super'),
	('Vacca', 'vacca', 120000, 'super'),
	('Vader', 'vader', 7200, 'motorcycles'),
	('Verlierer', 'verlierer2', 70000, 'sports'),
	('Vigero', 'vigero', 12500, 'muscle'),
	('Virgo', 'virgo', 14000, 'muscle'),
	('Viseris', 'viseris', 875000, 'sportsclassics'),
	('Visione', 'visione', 2250000, 'super'),
	('Voltic', 'voltic', 90000, 'super'),
	('Voltic 2', 'voltic2', 3830400, 'super'),
	('Voodoo', 'voodoo', 7200, 'muscle'),
	('Vortex', 'vortex', 9800, 'motorcycles'),
	('Warrener', 'warrener', 4000, 'sedans'),
	('Washington', 'washington', 9000, 'sedans'),
	('Windsor', 'windsor', 95000, 'coupes'),
	('Windsor Drop', 'windsor2', 125000, 'coupes'),
	('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
	('XLS', 'xls', 32000, 'suvs'),
	('Yosemite', 'yosemite', 485000, 'muscle'),
	('Youga', 'youga', 10800, 'vans'),
	('Youga Luxuary', 'youga2', 14500, 'vans'),
	('Z190', 'z190', 900000, 'sportsclassics'),
	('Zentorno', 'zentorno', 1500000, 'super'),
	('Zion', 'zion', 36000, 'coupes'),
	('Zion Cabrio', 'zion2', 45000, 'coupes'),
	('Zombie', 'zombiea', 9500, 'motorcycles'),
	('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
	('Z-Type', 'ztype', 220000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_categories
DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
INSERT IGNORE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupes'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Sports'),
	('sportsclassics', 'Sports Classics'),
	('super', 'Super'),
	('suvs', 'SUVs'),
	('vans', 'Vans');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table essentialmode.vehicle_sold
DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table essentialmode.weashops
DROP TABLE IF EXISTS `weashops`;
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2110 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.weashops: ~103 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
INSERT IGNORE INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(0, 'GunShop1', 'WEAPON_FLASHLIGHT', 9250),
	(1, 'GunShop1', 'WEAPON_STUNGUN', 43500),
	(3, 'GunShop1', 'WEAPON_PISTOL', 16500),
	(5, 'GunShop1', 'WEAPON_PISTOL50', 29000),
	(9, 'GunShop1', 'WEAPON_APPISTOL', 25500),
	(14, 'BlackWeashop', 'WEAPON_DBSHOTGUN', 500000),
	(20, 'BlackWeashop', 'WEAPON_MICROSMG', 1000000),
	(35, 'BlackWeashop', 'WEAPON_KNUCKLE', 25000),
	(36, 'BlackWeashop', 'WEAPON_SWITCHBLADE', 50000),
	(50, 'GunShop2', 'WEAPON_PUMPSHOTGUN', 35000),
	(51, 'GunShop3', 'WEAPON_PUMPSHOTGUN', 40000),
	(52, 'GunShop4', 'WEAPON_PUMPSHOTGUN', 47000),
	(54, 'GunShop5', 'WEAPON_PUMPSHOTGUN', 31000),
	(55, 'GunShop6', 'WEAPON_FLASHLIGHT', 35000),
	(56, 'GunShop7', 'WEAPON_PUMPSHOTGUN', 23000),
	(57, 'GunShop8', 'WEAPON_PUMPSHOTGUN', 25000),
	(58, 'GunShop9', 'WEAPON_PUMPSHOTGUN', 27000),
	(60, 'GunShop1', 'WEAPON_COMBATPISTOL', 10000),
	(2020, 'GunShop1', 'WEAPON_DOUBLEACTION', 19486),
	(2022, 'GunShop1', 'WEAPON_HEAVYPISTOL', 30000),
	(2023, 'GunShop1', 'WEAPON_MARKSMANPISTOL', 35000),
	(2024, 'GunShop1', 'WEAPON_SNSPISTOL', 27000),
	(2025, 'GunShop1', 'disc_ammo_pistol', 250),
	(2028, 'GunShop2', 'WEAPON_KNIFE', 10000),
	(2029, 'GunShop2', 'WEAPON_FLASHLIGHT', 9000),
	(2030, 'GunShop2', 'WEAPON_PISTOL', 19500),
	(2031, 'GunShop2', 'WEAPON_REVOLVER', 21000),
	(2032, 'GunShop2', 'WEAPON_STUNGUN', 15500),
	(2033, 'GunShop2', 'WEAPON_COMBATPISTOL', 24500),
	(2034, 'GunShop2', 'WEAPON_SNSPISTOL', 26000),
	(2035, 'GunShop2', 'WEAPON_PISTOL50', 18500),
	(2036, 'GunShop2', 'WEAPON_HEAVYPISTOL', 31500),
	(2037, 'GunShop3', 'WEAPON_KNIFE', 11000),
	(2038, 'GunShop3', 'WEAPON_HEAVYPISTOL', 29500),
	(2039, 'GunShop3', 'WEAPON_FLASHLIGHT', 10500),
	(2040, 'GunShop3', 'WEAPON_STUNGUN', 50000),
	(2041, 'GunShop3', 'WEAPON_REVOLVER', 19000),
	(2042, 'GunShop3', 'WEAPON_SNSPISTOL', 35000),
	(2043, 'GunShop3', 'WEAPON_HEAVYPISTOL', 32000),
	(2044, 'GunShop3', 'WEAPON_COMBATPISTOL', 25000),
	(2045, 'GunShop3', 'WEAPON_PISTOL', 20000),
	(2046, 'GunShop4', 'WEAPON_PISTOL', 22000),
	(2047, 'GunShop4', 'WEAPON_PISTOL50', 27500),
	(2048, 'GunShop4', 'WEAPON_KNIFE', 9000),
	(2049, 'GunShop4', 'WEAPON_STUNGUN', 45000),
	(2050, 'GunShop4', 'WEAPON_FLASHLIGHT', 9500),
	(2051, 'GunShop4', 'WEAPON_SNSPISTOL', 25000),
	(2052, 'GunShop4', 'WEAPON_COMBATPISTOL', 26500),
	(2053, 'GunShop4', 'WEAPON_HEAVYPISTOL', 30000),
	(2054, 'GunShop4', 'WEAPON_REVOLVER', 25000),
	(2055, 'GunShop5', 'WEAPON_MACHETE', 9000),
	(2056, 'GunShop5', 'WEAPON_REVOLVER', 21000),
	(2057, 'GunShop5', 'WEAPON_HEAVYPISTOL', 29500),
	(2058, 'GunShop5', 'WEAPON_DOUBLEACTION', 37500),
	(2059, 'GunShop5', 'WEAPON_DBSHOTGUN', 37000),
	(2060, 'GunShop5', 'WEAPON_FLASHLIGHT', 9000),
	(2061, 'GunShop5', 'WEAPON_REVOLVER', 18500),
	(2062, 'GunShop5', 'GADGET_PARACHUTE', 15000),
	(2063, 'GunShop5', 'WEAPON_HATCHET', 14500),
	(2064, 'GunShop6', 'WEAPON_SNSPISTOL', 24500),
	(2065, 'GunShop6', 'GADGET_PARACHUTE', 13500),
	(2066, 'GunShop6', 'WEAPON_PUMPSHOTGUN', 45000),
	(2067, 'GunShop6', 'WEAPON_COMBATPISTOL', 25000),
	(2068, 'GunShop6', 'WEAPON_HEAVYPISTOL', 25500),
	(2069, 'GunShop6', 'WEAPON_PISTOL', 19000),
	(2070, 'GunShop6', 'WEAPON_PISTOL50', 26000),
	(2071, 'GunShop6', 'WEAPON_STUNGUN', 40000),
	(2072, 'GunShop6', 'WEAPON_DAGGER', 37000),
	(2073, 'GunShop7', 'disc_ammo_pistol', 2000),
	(2074, 'GunShop7', 'WEAPON_PISTOL', 20000),
	(2075, 'GunShop7', 'WEAPON_HEAVYPISTOL', 55000),
	(2076, 'GunShop7', 'WEAPON_FLASHLIGHT', 9500),
	(2077, 'GunShop7', 'WEAPON_KNIFE', 12000),
	(2078, 'GunShop7', 'WEAPON_PISTOL50', 25500),
	(2079, 'GunShop7', 'disc_ammo_shotgun', 2500),
	(2080, 'GunShop7', 'WEAPON_SNSPISTOL', 35500),
	(2081, 'GunShop7', 'WEAPON_REVOLVER', 19000),
	(2082, 'GunShop8', 'WEAPON_MACHETE', 8400),
	(2083, 'GunShop8', 'WEAPON_HEAVYPISTOL', 26000),
	(2084, 'GunShop8', 'WEAPON_STUNGUN', 48500),
	(2085, 'GunShop8', 'GADGET_PARACHUTE', 10000),
	(2086, 'GunShop8', 'WEAPON_PISTOL', 15000),
	(2087, 'GunShop8', 'WEAPON_SNSPISTOL', 25000),
	(2088, 'GunShop8', 'WEAPON_REVOLVER', 16500),
	(2089, 'GunShop8', 'WEAPON_PISTOL', 30000),
	(2090, 'GunShop8', 'WEAPON_DOUBLEACTION', 35000),
	(2091, 'GunShop9', 'WEAPON_HATCHET', 13000),
	(2092, 'GunShop9', 'WEAPON_FLASHLIGHT', 12500),
	(2093, 'GunShop9', 'WEAPON_KNIFE', 10500),
	(2094, 'GunShop9', 'WEAPON_SNSPISTOL', 26500),
	(2095, 'GunShop9', 'WEAPON_PISTOL', 15000),
	(2096, 'GunShop9', 'GADGET_PARACHUTE', 12000),
	(2097, 'GunShop9', 'WEAPON_STUNGUN', 47000),
	(2098, 'GunShop9', 'WEAPON_HEAVYPISTOL', 25500),
	(2099, 'GunShop9', 'WEAPON_PISTOL50', 25000),
	(2100, 'Rifle_shop', 'WEAPON_ASSAULTRIFLE', 3000000),
	(2102, 'Bulletproof_Vest_shop', 'bulletproof', 50000),
	(2103, 'SMG_shop', 'WEAPON_MINISMG', 1500000),
	(2104, 'SMG_shop', 'WEAPON_COMPACTRIFLE', 2500000),
	(2105, 'Rifle_shop', 'WEAPON_ADVANCEDRIFLE', 5000000),
	(2106, 'Rifle_shop', 'WEAPON_CARBINERIFLE', 4000000),
	(2107, 'Rifle_shop', 'disc_ammo_rifle', 100000),
	(2108, 'SMG_shop', 'WEAPON_SMG', 2000000),
	(2109, 'SMG_shop', 'disc_ammo_smg', 50000);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.whitelist
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(70) NOT NULL,
  `last_connection` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ban_reason` text DEFAULT NULL,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.whitelist: ~2 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
INSERT IGNORE INTO `whitelist` (`identifier`, `last_connection`, `ban_reason`, `ban_until`, `vip`) VALUES
	('steam:110000100bc09b3', '2019-11-29 13:33:18', NULL, NULL, 0),
	('steam:1100001083da79f', '2019-11-25 19:55:06', NULL, NULL, 0);
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
