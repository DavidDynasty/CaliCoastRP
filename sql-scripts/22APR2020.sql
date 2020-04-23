-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.29-log - MySQL Community Server (GPL)
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

-- Dumping data for table essentialmode.addon_account: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Bank Savings', 0),
	('caution', 'Caution', 0),
	('property_black_money', 'Money Sale Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
	('society_cardealer', 'Dealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_realestateagent', 'Real Estate Company', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_account_data
DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_account_data: ~10 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_ambulance', 0, NULL),
	(2, 'society_banker', 0, NULL),
	(3, 'society_cardealer', 0, NULL),
	(4, 'society_mechanic', 0, NULL),
	(5, 'society_police', 0, NULL),
	(6, 'society_realestateagent', 0, NULL),
	(7, 'society_taxi', 0, NULL),
	(8, 'bank_savings', 0, '5d95643a350dcb5aa0f14598a720d4ecd758b87f'),
	(9, 'caution', 0, '5d95643a350dcb5aa0f14598a720d4ecd758b87f'),
	(10, 'property_black_money', 0, '5d95643a350dcb5aa0f14598a720d4ecd758b87f');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory: ~6 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Dealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory_items
DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.billing
DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
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

-- Dumping data for table essentialmode.datastore: ~8 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table essentialmode.datastore_data
DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.datastore_data: ~8 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
REPLACE INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
	(1, 'society_ambulance', NULL, '{}'),
	(2, 'society_police', NULL, '{}'),
	(3, 'society_taxi', NULL, '{}'),
	(4, 'property', '5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{}'),
	(5, 'user_ears', '5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{}'),
	(6, 'user_glasses', '5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{}'),
	(7, 'user_helmet', '5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{}'),
	(8, 'user_mask', '5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{}');
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.dopeplants
DROP TABLE IF EXISTS `dopeplants`;
CREATE TABLE IF NOT EXISTS `dopeplants` (
  `owner` varchar(50) NOT NULL,
  `plant` longtext NOT NULL,
  `plantid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.dopeplants: ~0 rows (approximately)
/*!40000 ALTER TABLE `dopeplants` DISABLE KEYS */;
/*!40000 ALTER TABLE `dopeplants` ENABLE KEYS */;

-- Dumping structure for table essentialmode.dpkeybinds
DROP TABLE IF EXISTS `dpkeybinds`;
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.dpkeybinds: ~3 rows (approximately)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
REPLACE INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('steam:1100001083da79f', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:110000100bc09b3', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
	('steam:11000013a865c79', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Dumping structure for table essentialmode.fine_types
DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.fine_types: ~52 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Misuse of a horn', 30, 0),
	(2, 'Illegally Crossing a continuous Line', 40, 0),
	(3, 'Driving on the wrong side of the road', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Illegally Driving Off-road', 170, 0),
	(6, 'Refusing a Lawful Command', 30, 0),
	(7, 'Illegally Stopping a Vehicle', 150, 0),
	(8, 'Illegal Parking', 70, 0),
	(9, 'Failing to Yield to the right', 70, 0),
	(10, 'Failure to comply with Vehicle Information', 90, 0),
	(11, 'Failing to stop at a Stop Sign ', 105, 0),
	(12, 'Failing to stop at a Red Light', 130, 0),
	(13, 'Illegal Passing', 100, 0),
	(14, 'Driving an illegal Vehicle', 100, 0),
	(15, 'Driving without a License', 1500, 0),
	(16, 'Hit and Run', 800, 0),
	(17, 'Exceeding Speeds Over < 5 mph', 90, 0),
	(18, 'Exceeding Speeds Over 5-15 mph', 120, 0),
	(19, 'Exceeding Speeds Over 15-30 mph', 180, 0),
	(20, 'Exceeding Speeds Over > 30 mph', 300, 0),
	(21, 'Impeding traffic flow', 110, 1),
	(22, 'Public Intoxication', 90, 1),
	(23, 'Disorderly conduct', 90, 1),
	(24, 'Obstruction of Justice', 130, 1),
	(25, 'Insults towards Civilans', 75, 1),
	(26, 'Disrespecting of an LEO', 110, 1),
	(27, 'Verbal Threat towards a Civilan', 90, 1),
	(28, 'Verbal Threat towards an LEO', 150, 1),
	(29, 'Providing False Information', 250, 1),
	(30, 'Attempt of Corruption', 1500, 1),
	(31, 'Brandishing a weapon in city Limits', 120, 2),
	(32, 'Brandishing a Lethal Weapon in city Limits', 300, 2),
	(33, 'No Firearms License', 600, 2),
	(34, 'Possession of an Illegal Weapon', 700, 2),
	(35, 'Possession of Burglary Tools', 300, 2),
	(36, 'Grand Theft Auto', 1800, 2),
	(37, 'Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	(38, 'Frabrication of an Illegal Substance', 1500, 2),
	(39, 'Possession of an Illegal Substance ', 650, 2),
	(40, 'Kidnapping of a Civilan', 1500, 2),
	(41, 'Kidnapping of an LEO', 2000, 2),
	(42, 'Robbery', 650, 2),
	(43, 'Armed Robbery of a Store', 650, 2),
	(44, 'Armed Robbery of a Bank', 1500, 2),
	(45, 'Assault on a Civilian', 2000, 3),
	(46, 'Assault of an LEO', 2500, 3),
	(47, 'Attempt of Murder of a Civilian', 3000, 3),
	(48, 'Attempt of Murder of an LEO', 5000, 3),
	(49, 'Murder of a Civilian', 10000, 3),
	(50, 'Murder of an LEO', 30000, 3),
	(51, 'Involuntary manslaughter', 1800, 3),
	(52, 'Fraud', 2000, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table essentialmode.glovebox_inventory
DROP TABLE IF EXISTS `glovebox_inventory`;
CREATE TABLE IF NOT EXISTS `glovebox_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.glovebox_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `glovebox_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `glovebox_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.insto_accounts
DROP TABLE IF EXISTS `insto_accounts`;
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.insto_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `insto_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `insto_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.insto_instas
DROP TABLE IF EXISTS `insto_instas`;
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table essentialmode.insto_instas: ~0 rows (approximately)
/*!40000 ALTER TABLE `insto_instas` DISABLE KEYS */;
/*!40000 ALTER TABLE `insto_instas` ENABLE KEYS */;

-- Dumping structure for table essentialmode.insto_likes
DROP TABLE IF EXISTS `insto_likes`;
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.insto_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `insto_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `insto_likes` ENABLE KEYS */;

-- Dumping structure for table essentialmode.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.items: ~197 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`, `price`) VALUES
	('100gbag', 'Ziploc Bag[100g]', 20, 0, 1, 0),
	('1gbag', 'Ziploc Bag[1g]', 20, 0, 1, 0),
	('50gbag', 'Ziploc Bag[50g]', 20, 0, 1, 0),
	('5gbag', 'Ziploc Bag[5g]', 20, 0, 1, 0),
	('9mm_rounds', '9mm Rounds', 20, 0, 1, 0),
	('alive_chicken', 'living chicken', 20, 0, 1, 0),
	('bagofdope', 'Bag of Dope', -1, 0, 1, 0),
	('bait', 'Worms', 1, 0, 1, 0),
	('bandage', 'Bandage', 2, 0, 1, 0),
	('beer', 'Beer', 20, 0, 1, 0),
	('betequilaer', 'Margarita', 1, 0, 1, 0),
	('binocular', 'Binoculars', 20, 0, 1, 0),
	('binoculars', 'Binoculars', 1, 0, 1, 0),
	('black_chip', 'ROM Chip', 1, 0, 1, 0),
	('blowtorch', 'Blowtorch', 20, 0, 1, 0),
	('bolcacahuetes', 'Roasted Peanuts', 1, 0, 1, 0),
	('bolchips', 'Lays Chips', 1, 0, 1, 0),
	('bolnoixcajou', 'Cajou', 1, 0, 1, 0),
	('bolpistache', 'Pistaches', 1, 0, 1, 0),
	('bulletproof', 'Bullet Proof', 1, 0, 1, 0),
	('cannabis', 'Weed Bud', 1, 0, 1, 0),
	('caprisun', 'Capri Sun', 1, 0, 1, 0),
	('carokit', 'Body Kit', 3, 0, 1, 0),
	('cash', 'Cash', 1, 0, 1, 0),
	('cashew', 'Cashew', 20, 0, 1, 0),
	('cchip', 'Poker Chips', 1, 0, 1, 0),
	('cheesebows', 'Chesse Puffs', 1, 0, 1, 0),
	('chickensandwich', 'Chicken Sandwich', 1, 0, 1, 0),
	('chips', 'Chips', 20, 0, 1, 0),
	('chocolate', 'Chocolate', 20, 0, 1, 0),
	('cigarett', 'Cigarette', 1, 0, 1, 0),
	('cigarette', 'Cigarette', 20, 0, 1, 0),
	('clip', 'Weapon Clip', -1, 0, 1, 0),
	('clothe', 'cloth', 40, 0, 1, 0),
	('cocacola', 'Coca-Cola', 20, 0, 1, 0),
	('cocaine', 'Cocaine', 1, 0, 1, 0),
	('coffee', 'Coffee', 1, 0, 1, 0),
	('cokebrick', 'Coke Brick', 1, 0, 1, 0),
	('cokeounce', 'Coke', 1, 0, 1, 0),
	('contrat', 'Contrat', 1, 0, 1, 0),
	('copper', 'copper', 56, 0, 1, 0),
	('crunchytaco', 'Taco', 1, 0, 1, 0),
	('cupcake', 'Cupcake', 20, 0, 1, 0),
	('cutted_wood', 'cut wood', 20, 0, 1, 0),
	('darknet', 'Dark Net', 1, 0, 1, 0),
	('diamond', 'diamond', 50, 0, 1, 0),
	('dopebag', 'Ziplock Bag', -1, 0, 1, 0),
	('drill', 'Drill', 20, 0, 1, 0),
	('drpepper', 'Dr Pepper', 20, 0, 1, 0),
	('drugscales', 'Scales', 20, 0, 1, 0),
	('electronics', 'EPROM Chip', 1, 0, 1, 0),
	('energy', 'Energy Drink', 20, 0, 1, 0),
	('essence', 'gas', 24, 0, 1, 0),
	('fabric', 'fabric', 80, 0, 1, 0),
	('fakeplates', 'Fake Plates', 1, 0, 1, 0),
	('fanta', 'Fanta', 1, 0, 1, 0),
	('firstaid', 'Med Bag', 1, 0, 1, 0),
	('firstaidkit', 'First Aid Kit', -1, 0, 1, 0),
	('fish', 'fish', 100, 0, 1, 0),
	('fishingrod', 'Fishing Rod', 1, 0, 1, 0),
	('fixkit', 'Fix Kit', 20, 0, 1, 0),
	('fries', 'Fries', 1, 0, 1, 0),
	('GADGET_PARACHUTE', 'Parachute', 1, 0, 1, 0),
	('gatorade', 'Gatorade', 1, 0, 1, 0),
	('gauze', 'Gauze', 1, 0, 1, 0),
	('gold', 'gold', 21, 0, 1, 0),
	('goldchain', 'Gold Chain', 1, 0, 1, 0),
	('goldring', 'Gold Ring ', 1, 0, 1, 0),
	('gps', 'GPS', 20, 0, 1, 0),
	('grand_cru', 'Champagne', 20, 0, 1, 0),
	('grapperaisin', 'Grappe Raisin', 1, 0, 1, 0),
	('hamburger', 'Hamburger', 20, 0, 1, 0),
	('heartstopper', 'Heart Stopper', 1, 0, 1, 0),
	('highgradefemaleseed', '(HG) Female Seed', -1, 0, 1, 0),
	('highgradefert', 'Fertilizer [high]', 20, 0, 1, 0),
	('highgrademaleseed', '(HG) Male Seed', -1, 0, 1, 0),
	('hydrocodone', 'Hydrocodone', 1, 0, 1, 0),
	('ice', 'Ice', 1, 0, 1, 0),
	('icetea', 'Ice-Tea', 20, 0, 1, 0),
	('iron', 'iron', 42, 0, 1, 0),
	('jewels', 'Jewels', 1, 0, 1, 0),
	('joint', 'Joint', 1, 0, 1, 0),
	('jusfruit', 'Grappe Juice', 1, 0, 1, 0),
	('lemonade', 'Lemonade', 20, 0, 1, 0),
	('lighter', 'Lighter', 20, 0, 1, 0),
	('lockpick', 'Lockpick', 20, 0, 1, 0),
	('lotteryticket', 'Lottery Ticket', 1, 0, 1, 0),
	('lowgradefemaleseed', '(LG) Female Seed', -1, 0, 1, 0),
	('lowgradefert', 'Fertilizer [low]', 20, 0, 1, 0),
	('lowgrademaleseed', '(LG) Male Seed', -1, 0, 1, 0),
	('medikit', 'Medikit', 2, 0, 1, 0),
	('meth', 'Meth', 1, 0, 1, 0),
	('meth_pooch', 'Meth Brick', 1, 0, 1, 0),
	('moneyshot', 'Bleeder', 1, 0, 1, 0),
	('morphine', 'Morphone', 1, 0, 1, 0),
	('oxy', 'Oxycodone', 1, 0, 1, 0),
	('oxygen_mask', 'Oxygen Mask', -1, 0, 1, 0),
	('packaged_chicken', 'chicken fillet', 100, 0, 1, 0),
	('packaged_plank', 'packaged wood', 100, 0, 1, 0),
	('petrol', 'oil', 24, 0, 1, 0),
	('petrol_raffin', 'processed oil', 24, 0, 1, 0),
	('phone', 'Phone', 20, 0, 1, 0),
	('pills', 'Pills', 1, 0, 1, 0),
	('pistachio', 'Pistachio', 20, 0, 1, 0),
	('pizza', 'Pizza', 1, 0, 1, 0),
	('plantpot', 'Plant Pot', 20, 0, 1, 0),
	('purifiedwater', 'Purified Water', -1, 0, 1, 0),
	('radio', 'Radio', 1, 0, 1, 0),
	('raisin', 'Grappe', 1, 0, 1, 0),
	('rawgold', 'Raw Gold', 1, 0, 1, 0),
	('redbull', 'Red Bull', 1, 0, 1, 0),
	('rhum', 'Rum', 1, 0, 1, 0),
	('rhumcoca', 'Rum & Coka', 1, 0, 1, 0),
	('rollingpaper', 'Rolling Paper', 20, 0, 1, 0),
	('sandwich', 'Sandwich', 20, 0, 1, 0),
	('saucisson', 'Saucisson', 1, 0, 1, 0),
	('scubagear', 'Scuba Gear', 20, 0, 1, 0),
	('shark', 'Shark', 1, 0, 1, 0),
	('shotgun_shells', 'Shotgun Shells', 20, 0, 1, 0),
	('slaughtered_chicken', 'slaughtered chicken', 20, 0, 1, 0),
	('soda', 'Dr Pepper', 1, 0, 1, 0),
	('stone', 'stone', 7, 0, 1, 0),
	('tequila', 'Tequila', 20, 0, 1, 0),
	('trimmedweed', 'Trimmed Weed', -1, 0, 1, 0),
	('tunerlaptop', 'Laptop', 1, 0, 1, 0),
	('turtle', 'Turtle', 1, 0, 1, 0),
	('turtlebait', 'Turtle Bait', 1, 0, 1, 0),
	('vine', 'Wine', 1, 0, 1, 0),
	('vodka', 'Vodka', 20, 0, 1, 0),
	('washed_stone', 'washed stone', 7, 0, 1, 0),
	('watch', 'Watch', 1, 0, 1, 0),
	('wateringcan', 'Watering Can', -1, 0, 1, 0),
	('WEAPON_ADVANCEDRIFLE', 'Advanced Rifle', 1, 0, 1, 0),
	('WEAPON_APPISTOL', 'AP Pistol', 1, 0, 1, 0),
	('WEAPON_ASSAULTRIFLE', 'Assault Rifle', 1, 0, 1, 0),
	('WEAPON_ASSAULTSHOTGUN', 'Assault Shotgun', 1, 0, 1, 0),
	('WEAPON_ASSAULTSMG', 'Assault SMG', 1, 0, 1, 0),
	('WEAPON_BALL', 'Ball', 1, 0, 1, 0),
	('WEAPON_BAT', 'Baseball Bat', 1, 0, 1, 0),
	('WEAPON_BATTLEAXE', 'Battle Axe', 1, 0, 1, 0),
	('WEAPON_BOTTLE', 'Broken Bottle', 1, 0, 1, 0),
	('WEAPON_BULLPUPRIFLE', 'Bullpup Rifle', 1, 0, 1, 0),
	('WEAPON_BULLPUPSHOTGUN', 'Bullpup Shotgun', 1, 0, 1, 0),
	('WEAPON_BZGAS', 'BZ Gas', 1, 0, 1, 0),
	('WEAPON_CARBINERIFLE', 'Carbine Rifle', 1, 0, 1, 0),
	('WEAPON_COMBATMG', 'Combat MG', 1, 0, 1, 0),
	('WEAPON_COMBATPDW', 'Combat PDW', 1, 0, 1, 0),
	('WEAPON_COMBATPISTOL', 'Combat Pistol', 1, 0, 1, 0),
	('WEAPON_COMPACTRIFLE', 'Compact Rifle', 1, 0, 1, 0),
	('WEAPON_CROWBAR', 'Crowbar', 1, 0, 1, 0),
	('WEAPON_DAGGER', 'Cavalry Dagger', 1, 0, 1, 0),
	('WEAPON_DBSHOTGUN', 'Double Barrel Shotgun', 1, 0, 1, 0),
	('WEAPON_DOUBLEACTION', 'Double Action Revolver', 1, 0, 1, 0),
	('WEAPON_FIREEXTINGUISHER', 'Fire Extinguisher', 1, 0, 1, 0),
	('WEAPON_FLARE', 'Flare', 1, 0, 1, 0),
	('WEAPON_FLAREGUN', 'Flare Gun', 1, 0, 1, 0),
	('WEAPON_FLASHLIGHT', 'Flashlight', 1, 0, 1, 0),
	('WEAPON_GOLFCLUB', 'Golf Club', 1, 0, 1, 0),
	('WEAPON_GUSENBERG', 'Gusenberg Sweeper', 1, 0, 1, 0),
	('WEAPON_HAMMER', 'Hammer', 1, 0, 1, 0),
	('WEAPON_HATCHET', 'Hatchet', 1, 0, 1, 0),
	('WEAPON_HEAVYPISTOL', 'Heavy Pistol', 1, 0, 1, 0),
	('WEAPON_HEAVYSHOTGUN', 'Heavy Shotgun', 1, 0, 1, 0),
	('WEAPON_HEAVYSNIPER', 'Heavy Sniper', 1, 0, 1, 0),
	('WEAPON_KNIFE', 'Knife', 100, 1, 1, 0),
	('WEAPON_KNUCKLE', 'Brass Knuckles', 1, 0, 1, 0),
	('WEAPON_MACHETE', 'Machete', 1, 0, 1, 0),
	('WEAPON_MACHINEPISTOL', 'Machine Pistol', 1, 0, 1, 0),
	('WEAPON_MARKSMANPISTOL', 'Marksman Pistol', 1, 0, 1, 0),
	('WEAPON_MG', 'MG', 1, 0, 1, 0),
	('WEAPON_MICROSMG', 'Micro SMG', 1, 0, 1, 0),
	('WEAPON_MINISMG', 'Mini SMG', 1, 0, 1, 0),
	('WEAPON_MOLOTOV', 'Molotov Cocktail', 1, 0, 1, 0),
	('WEAPON_PETROLCAN', 'Jerry Can', 1, 0, 1, 0),
	('WEAPON_PISTOL', 'Pistol', 100, 1, 1, 0),
	('WEAPON_PISTOL50', 'Pistol .50', 1, 0, 1, 0),
	('WEAPON_POOLCUE', 'Pool Cue', 1, 0, 1, 0),
	('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1, 0),
	('WEAPON_REVOLVER', 'Heavy Revolver', 1, 0, 1, 0),
	('WEAPON_RPG', 'RPG', 1, 0, 1, 0),
	('WEAPON_SAWOFFSHOTGUN', 'Sawed-Off Shotgun', 1, 0, 1, 0),
	('WEAPON_SMG', 'SMG', 1, 0, 1, 0),
	('WEAPON_SMOKEGRENADE', 'Tear Gas', 1, 0, 1, 0),
	('WEAPON_SNIPERRIFLE', 'Sniper Rifle', 1, 0, 1, 0),
	('WEAPON_SNSPISTOL', 'SNS Pistol', 1, 0, 1, 0),
	('WEAPON_SPECIALCARBINE', 'Special Carbine', 1, 0, 1, 0),
	('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 0),
	('WEAPON_SWITCHBLADE', 'Switchblade', 1, 0, 1, 0),
	('WEAPON_WRENCH', 'Pipe Wrench', 1, 0, 1, 0),
	('weedeight', 'Weed Baggie', 1, 0, 1, 0),
	('weedqtr', 'Weed Brick', 1, 0, 1, 0),
	('weedseed', 'Weed Seed', 1, 0, 1, 0),
	('whisky', 'Whisky', 20, 0, 1, 0),
	('whiskycoca', 'Whisky & coka', 1, 0, 1, 0),
	('wine', 'Wine', 20, 0, 1, 0),
	('wood', 'wood', 20, 0, 1, 0),
	('wool', 'wool', 40, 0, 1, 0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table essentialmode.jobs
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.jobs: ~14 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('banker', 'Banker', 0),
	('cardealer', 'Dealer', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Fueler', 0),
	('lumberjack', 'Lumberjack', 0),
	('mechanic', 'Mechanic', 0),
	('miner', 'Miner', 0),
	('police', 'Police', 0),
	('realestateagent', 'Realtor', 0),
	('reporter', 'Journaliste', 0),
	('slaughterer', 'Abatteur', 0),
	('tailor', 'Couturier', 0),
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.job_grades: ~39 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Unemployed', 200, '{}', '{}'),
	(2, 'lumberjack', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(3, 'fisherman', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(4, 'fueler', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(5, 'reporter', 0, 'employee', 'Intérimaire', 0, '{}', '{}'),
	(6, 'tailor', 0, 'employee', 'Intérimaire', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(7, 'miner', 0, 'employee', 'Intérimaire', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(8, 'slaughterer', 0, 'employee', 'Intérimaire', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(9, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
	(10, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
	(11, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
	(12, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
	(13, 'police', 0, 'recruit', 'Recruit', 20, '{}', '{}'),
	(14, 'police', 1, 'officer', 'Officer', 40, '{}', '{}'),
	(15, 'police', 2, 'sergeant', 'Sergeant', 60, '{}', '{}'),
	(16, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(17, 'police', 4, 'boss', 'Chief', 100, '{}', '{}'),
	(18, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(19, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(20, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(21, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(22, 'banker', 0, 'advisor', 'Advisor', 10, '{}', '{}'),
	(23, 'banker', 1, 'banker', 'Banker', 20, '{}', '{}'),
	(24, 'banker', 2, 'business_banker', 'Business Banker', 30, '{}', '{}'),
	(25, 'banker', 3, 'trader', 'Trader', 40, '{}', '{}'),
	(26, 'banker', 4, 'boss', 'Lead Banker', 0, '{}', '{}'),
	(27, 'realestateagent', 0, 'location', 'Renting Agent', 10, '{}', '{}'),
	(28, 'realestateagent', 1, 'vendeur', 'Agent', 25, '{}', '{}'),
	(29, 'realestateagent', 2, 'gestion', 'Management', 40, '{}', '{}'),
	(30, 'realestateagent', 3, 'boss', 'Broker', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Recruit', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Cabby', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experienced', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Uber Cabby', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(37, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(38, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(39, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(40, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table essentialmode.licenses
DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.licenses: ~7 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Boat License'),
	('dmv', 'Driving Permit'),
	('drive', 'Drivers License'),
	('drive_bike', 'Motorcycle License'),
	('drive_truck', 'Commercial Drivers License'),
	('weapon', 'Weapon licensee'),
	('weed_processing', 'Weed Processing License');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table essentialmode.owned_vehicles
DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.owned_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_ch_reddit
DROP TABLE IF EXISTS `phone_ch_reddit`;
CREATE TABLE IF NOT EXISTS `phone_ch_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_ch_reddit: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_ch_reddit` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_ch_reddit` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_reddit
DROP TABLE IF EXISTS `phone_reddit`;
CREATE TABLE IF NOT EXISTS `phone_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_reddit: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_reddit` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_reddit` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_shops
DROP TABLE IF EXISTS `phone_shops`;
CREATE TABLE IF NOT EXISTS `phone_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.phone_shops: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_shops` DISABLE KEYS */;
REPLACE INTO `phone_shops` (`id`, `store`, `item`, `price`, `label`) VALUES
	(18, 'https://img.pngio.com/sim-card-png-clipart-sim-cards-png-1483_1162.png', 'sim', 50, 'SIM CARD');
/*!40000 ALTER TABLE `phone_shops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.playerstattoos
DROP TABLE IF EXISTS `playerstattoos`;
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `tattoos` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.playerstattoos: ~0 rows (approximately)
/*!40000 ALTER TABLE `playerstattoos` DISABLE KEYS */;
/*!40000 ALTER TABLE `playerstattoos` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.properties: ~72 rows (approximately)
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
REPLACE INTO `properties` (`id`, `name`, `label`, `entering`, `exit`, `inside`, `outside`, `ipls`, `gateway`, `is_single`, `is_room`, `is_gateway`, `room_menu`, `price`) VALUES
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
	(12, 'MiltonDrive', 'Milton Drive', '{"x":-775.17,"y":312.01,"z":84.658}', NULL, NULL, '{"x":-775.346,"y":306.776,"z":84.7}', '[]', NULL, 0, 0, 1, NULL, 0),
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
	(37, 'IntegrityWay', '4 Integrity Way', '{"x":-47.804,"y":-585.867,"z":36.956}', NULL, NULL, '{"x":-54.178,"y":-583.762,"z":35.798}', '[]', NULL, 0, 0, 1, NULL, 0),
	(38, 'IntegrityWay28', '4 Integrity Way - Apt 28', NULL, '{"x":-31.409,"y":-594.927,"z":79.03}', '{"x":-26.098,"y":-596.909,"z":79.03}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-11.923,"y":-597.083,"z":78.43}', 1700000),
	(39, 'IntegrityWay30', '4 Integrity Way - Apt 30', NULL, '{"x":-17.702,"y":-588.524,"z":89.114}', '{"x":-16.21,"y":-582.569,"z":89.114}', NULL, '[]', 'IntegrityWay', 0, 1, 0, '{"x":-26.327,"y":-588.384,"z":89.123}', 1700000),
	(40, 'DellPerroHeights', 'Dell Perro Heights', '{"x":-1447.06,"y":-538.28,"z":33.74}', NULL, NULL, '{"x":-1440.022,"y":-548.696,"z":33.74}', '[]', NULL, 0, 0, 1, NULL, 0),
	(41, 'DellPerroHeightst4', 'Dell Perro Heights - Apt 28', NULL, '{"x":-1452.125,"y":-540.591,"z":73.044}', '{"x":-1455.435,"y":-535.79,"z":73.044}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1467.058,"y":-527.571,"z":72.443}', 1700000),
	(42, 'DellPerroHeightst7', 'Dell Perro Heights - Apt 30', NULL, '{"x":-1451.562,"y":-523.535,"z":55.928}', '{"x":-1456.02,"y":-519.209,"z":55.929}', NULL, '[]', 'DellPerroHeights', 0, 1, 0, '{"x":-1457.026,"y":-530.219,"z":55.937}', 1700000),
	(43, 'MazeBankBuilding', 'Maze Bank Building', '{"x":-79.18,"y":-795.92,"z":43.35}', NULL, NULL, '{"x":-72.50,"y":-786.92,"z":43.40}', '[]', NULL, 0, 0, 1, NULL, 0),
	(44, 'OldSpiceWarm', 'Old Spice Warm', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(45, 'OldSpiceClassical', 'Old Spice Classical', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(46, 'OldSpiceVintage', 'Old Spice Vintage', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_01c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(47, 'ExecutiveRich', 'Executive Rich', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(48, 'ExecutiveCool', 'Executive Cool', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(49, 'ExecutiveContrast', 'Executive Contrast', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_02a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(50, 'PowerBrokerIce', 'Power Broker Ice', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03a"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(51, 'PowerBrokerConservative', 'Power Broker Conservative', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03b"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(52, 'PowerBrokerPolished', 'Power Broker Polished', NULL, '{"x":-75.69,"y":-827.08,"z":242.43}', '{"x":-75.51,"y":-823.90,"z":242.43}', NULL, '["ex_dt1_11_office_03c"]', 'MazeBankBuilding', 0, 1, 0, '{"x":-71.81,"y":-814.34,"z":242.39}', 5000000),
	(53, 'LomBank', 'Lom Bank', '{"x":-1581.36,"y":-558.23,"z":34.07}', NULL, NULL, '{"x":-1583.60,"y":-555.12,"z":34.07}', '[]', NULL, 0, 0, 1, NULL, 0),
	(54, 'LBOldSpiceWarm', 'LB Old Spice Warm', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(55, 'LBOldSpiceClassical', 'LB Old Spice Classical', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(56, 'LBOldSpiceVintage', 'LB Old Spice Vintage', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_01c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(57, 'LBExecutiveRich', 'LB Executive Rich', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(58, 'LBExecutiveCool', 'LB Executive Cool', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(59, 'LBExecutiveContrast', 'LB Executive Contrast', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_02a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(60, 'LBPowerBrokerIce', 'LB Power Broker Ice', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03a"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(61, 'LBPowerBrokerConservative', 'LB Power Broker Conservative', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03b"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(62, 'LBPowerBrokerPolished', 'LB Power Broker Polished', NULL, '{"x":-1579.53,"y":-564.89,"z":107.62}', '{"x":-1576.42,"y":-567.57,"z":107.62}', NULL, '["ex_sm_13_office_03c"]', 'LomBank', 0, 1, 0, '{"x":-1571.26,"y":-575.76,"z":107.52}', 3500000),
	(63, 'MazeBankWest', 'Maze Bank West', '{"x":-1379.58,"y":-499.63,"z":32.22}', NULL, NULL, '{"x":-1378.95,"y":-502.82,"z":32.22}', '[]', NULL, 0, 0, 1, NULL, 0),
	(64, 'MBWOldSpiceWarm', 'MBW Old Spice Warm', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(65, 'MBWOldSpiceClassical', 'MBW Old Spice Classical', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(66, 'MBWOldSpiceVintage', 'MBW Old Spice Vintage', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_01c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(67, 'MBWExecutiveRich', 'MBW Executive Rich', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(68, 'MBWExecutiveCool', 'MBW Executive Cool', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(69, 'MBWExecutive Contrast', 'MBW Executive Contrast', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_02a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(70, 'MBWPowerBrokerIce', 'MBW Power Broker Ice', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03a"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(71, 'MBWPowerBrokerConvservative', 'MBW Power Broker Convservative', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03b"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000),
	(72, 'MBWPowerBrokerPolished', 'MBW Power Broker Polished', NULL, '{"x":-1392.74,"y":-480.18,"z":71.14}', '{"x":-1389.43,"y":-479.01,"z":71.14}', NULL, '["ex_sm_15_office_03c"]', 'MazeBankWest', 0, 1, 0, '{"x":-1390.76,"y":-479.22,"z":72.04}', 2700000);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.shops: ~6 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
REPLACE INTO `shops` (`id`, `store`, `item`, `price`) VALUES
	(1, 'TwentyFourSeven', 'bread', 30),
	(2, 'TwentyFourSeven', 'water', 15),
	(3, 'RobsLiquor', 'bread', 30),
	(4, 'RobsLiquor', 'water', 15),
	(5, 'LTDgasoline', 'bread', 30),
	(6, 'LTDgasoline', 'water', 15);
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.sim
DROP TABLE IF EXISTS `sim`;
CREATE TABLE IF NOT EXISTS `sim` (
  `identifier` varchar(50) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.sim: 4 rows
/*!40000 ALTER TABLE `sim` DISABLE KEYS */;
REPLACE INTO `sim` (`identifier`, `phone_number`) VALUES
	('steam:1100001083da79f', '5555849'),
	('steam:1100001083da79f', '55533889'),
	('steam:1100001083da79f', '5558228'),
	('5d95643a350dcb5aa0f14598a720d4ecd758b87f', '130-7251');
/*!40000 ALTER TABLE `sim` ENABLE KEYS */;

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

-- Dumping structure for table essentialmode.trunk_inventory
DROP TABLE IF EXISTS `trunk_inventory`;
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.trunk_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `trunk_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunk_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_accounts
DROP TABLE IF EXISTS `twitter_accounts`;
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.twitter_accounts: ~2 rows (approximately)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
REPLACE INTO `twitter_accounts` (`id`, `username`, `password`, `avatar_url`) VALUES
	(38, 'David Dynasty', '1letmein', 'https://i.imgur.com/TAW4aVJ.gif'),
	(39, 'webjocky', '1letmein2', 'https://i.imgur.com/JQWg7XL.jpg');
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_likes
DROP TABLE IF EXISTS `twitter_likes`;
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.twitter_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table essentialmode.twitter_tweets: ~1 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table essentialmode.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `position` varchar(53) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(50) DEFAULT '',
  `lastname` varchar(50) DEFAULT '',
  `dateofbirth` varchar(25) DEFAULT '',
  `sex` varchar(10) DEFAULT '',
  `height` varchar(5) DEFAULT '',
  `skin` longtext,
  `is_dead` tinyint(1) DEFAULT '0',
  `last_property` varchar(255) DEFAULT NULL,
  `status` longtext,
  `tattoos` longtext,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`identifier`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `is_dead`, `last_property`, `status`, `tattoos`, `phone_number`) VALUES
	('5d95643a350dcb5aa0f14598a720d4ecd758b87f', '{"money":0,"black_money":0,"bank":55800}', 'user', '{"cannabis":6}', 'police', 4, '[]', '{"z":176.0,"heading":340.4,"x":7.6,"y":535.2}', 'David', 'Dynasty', '1986-08-25', 'm', '160', '{"shoes_1":18,"bodyb_1":0,"pants_1":20,"bodyb_2":0,"arms":12,"age_1":0,"beard_3":0,"helmet_1":-1,"bracelets_1":-1,"lipstick_1":0,"skin":25,"tshirt_1":33,"complexion_2":0,"bproof_1":0,"bags_1":23,"moles_1":0,"ears_1":-1,"eyebrows_4":0,"blemishes_1":0,"ears_2":0,"eye_color":2,"decals_1":0,"eyebrows_3":0,"sun_1":0,"chain_1":0,"hair_2":0,"blush_2":0,"bracelets_2":0,"helmet_2":0,"moles_2":0,"blush_1":0,"age_2":0,"eyebrows_2":0,"torso_2":5,"blush_3":0,"lipstick_4":0,"pants_2":0,"shoes_2":0,"watches_1":-1,"face":0,"chain_2":0,"hair_color_2":5,"hair_1":38,"hair_color_1":3,"makeup_2":0,"beard_4":0,"eyebrows_1":0,"sex":0,"torso_1":31,"chest_1":0,"lipstick_2":0,"mask_1":111,"bproof_2":0,"chest_3":0,"watches_2":0,"beard_1":0,"mask_2":15,"beard_2":0,"glasses_2":4,"glasses_1":7,"blemishes_2":0,"decals_2":0,"arms_2":0,"lipstick_3":0,"complexion_1":0,"makeup_4":0,"sun_2":0,"bags_2":15,"makeup_1":0,"chest_2":0,"makeup_3":0,"tshirt_2":5}', 0, NULL, '[{"val":233600,"name":"hunger","percent":23.36},{"val":425200,"name":"thirst","percent":42.52},{"val":410000.0,"name":"stress","percent":41.0}]', NULL, '130-7251');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_accounts
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_accounts: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_accounts` DISABLE KEYS */;
REPLACE INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
	(1, 'steam:1100001083da79f', 'black_money', 0),
	(2, 'steam:11000013dbc0313', 'black_money', 0),
	(3, 'steam:110000100bc09b3', 'black_money', 0),
	(4, 'steam:11000013a865c79', 'black_money', 0);
/*!40000 ALTER TABLE `user_accounts` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_inventory
DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_inventory: ~246 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
REPLACE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(836, 'steam:1100001083da79f', 'hqscale', 0),
	(837, 'steam:1100001083da79f', 'morphine', 0),
	(838, 'steam:1100001083da79f', 'highgrademaleseed', 0),
	(839, 'steam:1100001083da79f', 'sandwich', 0),
	(840, 'steam:1100001083da79f', 'firstaidkit', 0),
	(841, 'steam:1100001083da79f', 'cashew', 0),
	(842, 'steam:1100001083da79f', 'wateringcan', 0),
	(843, 'steam:1100001083da79f', 'raisin', 0),
	(844, 'steam:1100001083da79f', 'washed_stone', 0),
	(845, 'steam:1100001083da79f', 'chocolate', 0),
	(846, 'steam:1100001083da79f', 'medikit', 0),
	(847, 'steam:1100001083da79f', 'methburn', 0),
	(848, 'steam:1100001083da79f', 'weedeight', 0),
	(849, 'steam:1100001083da79f', 'petrol_raffin', 0),
	(850, 'steam:1100001083da79f', 'bolcacahuetes', 0),
	(851, 'steam:1100001083da79f', 'crunchytaco', 0),
	(852, 'steam:1100001083da79f', 'cocaine', 0),
	(853, 'steam:1100001083da79f', 'turtle', 0),
	(854, 'steam:1100001083da79f', 'oxy', 0),
	(855, 'steam:1100001083da79f', 'grand_cru', 0),
	(856, 'steam:1100001083da79f', 'meth1g', 0),
	(857, 'steam:1100001083da79f', 'cupcake', 0),
	(858, 'steam:1100001083da79f', 'trimmedweed', 0),
	(859, 'steam:1100001083da79f', 'cannabis', 0),
	(860, 'steam:1100001083da79f', 'fishingrod', 0),
	(861, 'steam:1100001083da79f', 'clothe', 0),
	(862, 'steam:1100001083da79f', 'pills', 0),
	(863, 'steam:1100001083da79f', 'weed4g', 0),
	(864, 'steam:1100001083da79f', 'carokit', 0),
	(865, 'steam:1100001083da79f', 'vodka', 0),
	(866, 'steam:1100001083da79f', 'rollingpaper', 0),
	(867, 'steam:1100001083da79f', 'whisky', 0),
	(868, 'steam:1100001083da79f', 'drill', 0),
	(869, 'steam:1100001083da79f', 'hamburger', 0),
	(870, 'steam:1100001083da79f', 'rhumcoca', 0),
	(871, 'steam:1100001083da79f', 'packaged_plank', 0),
	(872, 'steam:1100001083da79f', 'moneyshot', 0),
	(873, 'steam:1100001083da79f', 'dopebag', 0),
	(874, 'steam:1100001083da79f', 'caprisun', 0),
	(875, 'steam:1100001083da79f', 'sim', 0),
	(876, 'steam:1100001083da79f', 'cokebrick', 0),
	(877, 'steam:1100001083da79f', 'black_chip', 0),
	(878, 'steam:1100001083da79f', 'weedbrick', 0),
	(879, 'steam:1100001083da79f', 'redbull', 0),
	(880, 'steam:1100001083da79f', 'gps', 0),
	(881, 'steam:1100001083da79f', 'cutted_wood', 0),
	(882, 'steam:1100001083da79f', 'lowgradefemaleseed', 0),
	(883, 'steam:1100001083da79f', 'meth', 0),
	(884, 'steam:1100001083da79f', 'methbrick', 0),
	(885, 'steam:1100001083da79f', 'pizza', 0),
	(886, 'steam:1100001083da79f', 'weedburn', 0),
	(887, 'steam:1100001083da79f', '100gbag', 0),
	(888, 'steam:1100001083da79f', 'essence', 0),
	(889, 'steam:1100001083da79f', 'heartstopper', 0),
	(890, 'steam:1100001083da79f', 'lemonade', 0),
	(891, 'steam:1100001083da79f', 'highgradefert', 0),
	(892, 'steam:1100001083da79f', 'coke10g', 0),
	(893, 'steam:1100001083da79f', 'oxygen_mask', 0),
	(894, 'steam:1100001083da79f', 'betequilaer', 0),
	(895, 'steam:1100001083da79f', 'alive_chicken', 0),
	(896, 'steam:1100001083da79f', 'tequila', 0),
	(897, 'steam:1100001083da79f', 'cigarette', 0),
	(898, 'steam:1100001083da79f', 'pistachio', 0),
	(899, 'steam:1100001083da79f', 'clip', 4),
	(900, 'steam:1100001083da79f', 'darknet', 0),
	(901, 'steam:1100001083da79f', 'drugbags', 0),
	(902, 'steam:1100001083da79f', 'gauze', 0),
	(903, 'steam:1100001083da79f', 'hydrocodone', 0),
	(904, 'steam:1100001083da79f', 'goldchain', 0),
	(905, 'steam:1100001083da79f', 'bolnoixcajou', 0),
	(906, 'steam:1100001083da79f', 'slaughtered_chicken', 0),
	(907, 'steam:1100001083da79f', 'lowgrademaleseed', 0),
	(908, 'steam:1100001083da79f', 'firstaid', 0),
	(909, 'steam:1100001083da79f', 'purifiedwater', 0),
	(910, 'steam:1100001083da79f', 'copper', 0),
	(911, 'steam:1100001083da79f', 'rawgold', 0),
	(912, 'steam:1100001083da79f', 'WEAPON_PUMPSHOTGUN', 0),
	(913, 'steam:1100001083da79f', 'lotteryticket', 0),
	(914, 'steam:1100001083da79f', 'bait', 0),
	(915, 'steam:1100001083da79f', 'joint', 0),
	(916, 'steam:1100001083da79f', 'meth_pooch', 0),
	(917, 'steam:1100001083da79f', 'grapperaisin', 0),
	(918, 'steam:1100001083da79f', 'fries', 0),
	(919, 'steam:1100001083da79f', 'cheesebows', 0),
	(920, 'steam:1100001083da79f', 'goldring', 0),
	(921, 'steam:1100001083da79f', 'wool', 0),
	(922, 'steam:1100001083da79f', 'wood', 0),
	(923, 'steam:1100001083da79f', 'wine', 0),
	(924, 'steam:1100001083da79f', 'whiskycoca', 0),
	(925, 'steam:1100001083da79f', 'beer', 0),
	(926, 'steam:1100001083da79f', '1gbag', 0),
	(927, 'steam:1100001083da79f', 'jewels', 0),
	(928, 'steam:1100001083da79f', 'weedseed', 0),
	(929, 'steam:1100001083da79f', 'weedqtr', 0),
	(930, 'steam:1100001083da79f', '5gbag', 0),
	(931, 'steam:1100001083da79f', 'scubagear', 0),
	(932, 'steam:1100001083da79f', 'fixkit', 0),
	(933, 'steam:1100001083da79f', 'weed20g', 0),
	(934, 'steam:1100001083da79f', 'WEAPON_BAT', 0),
	(935, 'steam:1100001083da79f', 'WEAPON_PISTOL', 0),
	(936, 'steam:1100001083da79f', 'diamond', 0),
	(937, 'steam:1100001083da79f', 'bread', 0),
	(938, 'steam:1100001083da79f', 'WEAPON_KNIFE', 0),
	(939, 'steam:1100001083da79f', 'energy', 0),
	(940, 'steam:1100001083da79f', 'WEAPON_FLASHLIGHT', 0),
	(941, 'steam:1100001083da79f', 'WEAPON_STUNGUN', 0),
	(942, 'steam:1100001083da79f', 'water', 0),
	(943, 'steam:1100001083da79f', 'watch', 0),
	(944, 'steam:1100001083da79f', 'vine', 0),
	(945, 'steam:1100001083da79f', 'blowtorch', 0),
	(946, 'steam:1100001083da79f', 'turtlebait', 0),
	(947, 'steam:1100001083da79f', 'lighter', 0),
	(948, 'steam:1100001083da79f', 'tunerlaptop', 0),
	(949, 'steam:1100001083da79f', 'fish', 0),
	(950, 'steam:1100001083da79f', 'stone', 0),
	(951, 'steam:1100001083da79f', 'soda', 0),
	(952, 'steam:1100001083da79f', '50gbag', 0),
	(953, 'steam:1100001083da79f', 'marijuana', 0),
	(954, 'steam:1100001083da79f', 'gold', 0),
	(955, 'steam:1100001083da79f', 'contrat', 0),
	(956, 'steam:1100001083da79f', 'cokeounce', 0),
	(957, 'steam:1100001083da79f', 'jusfruit', 0),
	(958, 'steam:1100001083da79f', 'iron', 0),
	(959, 'steam:1100001083da79f', 'drugscales', 0),
	(960, 'steam:1100001083da79f', 'cocacola', 0),
	(961, 'steam:1100001083da79f', 'bagofdope', 0),
	(962, 'steam:1100001083da79f', 'shark', 0),
	(963, 'steam:1100001083da79f', 'bandage', 0),
	(964, 'steam:1100001083da79f', 'rolpaper', 0),
	(965, 'steam:1100001083da79f', 'lockpick', 0),
	(966, 'steam:1100001083da79f', 'joint2g', 0),
	(967, 'steam:1100001083da79f', 'highgradefemaleseed', 0),
	(968, 'steam:1100001083da79f', 'fabric', 0),
	(969, 'steam:1100001083da79f', 'bulletproof', 0),
	(970, 'steam:1100001083da79f', 'fakeplates', 0),
	(971, 'steam:1100001083da79f', 'coffee', 0),
	(972, 'steam:1100001083da79f', 'bolchips', 0),
	(973, 'steam:1100001083da79f', 'rhum', 0),
	(974, 'steam:1100001083da79f', 'radio', 0),
	(975, 'steam:1100001083da79f', 'packaged_chicken', 0),
	(976, 'steam:1100001083da79f', 'cash', 0),
	(977, 'steam:1100001083da79f', 'drpepper', 0),
	(978, 'steam:1100001083da79f', 'icetea', 0),
	(979, 'steam:1100001083da79f', 'electronics', 0),
	(980, 'steam:1100001083da79f', 'phone', 1),
	(981, 'steam:1100001083da79f', 'cchip', 0),
	(982, 'steam:1100001083da79f', 'petrol', 0),
	(983, 'steam:1100001083da79f', 'cokeburn', 0),
	(984, 'steam:1100001083da79f', 'coke1g', 0),
	(985, 'steam:1100001083da79f', 'meth10g', 0),
	(986, 'steam:1100001083da79f', 'saucisson', 0),
	(987, 'steam:1100001083da79f', 'lowgradefert', 0),
	(988, 'steam:1100001083da79f', 'binoculars', 0),
	(989, 'steam:1100001083da79f', 'ice', 0),
	(990, 'steam:1100001083da79f', 'chickensandwich', 0),
	(991, 'steam:1100001083da79f', 'fanta', 0),
	(992, 'steam:1100001083da79f', 'chips', 0),
	(993, 'steam:1100001083da79f', 'bolpistache', 0),
	(994, 'steam:1100001083da79f', 'plantpot', 0),
	(995, 'steam:1100001083da79f', 'WEAPON_PROXMINE', 0),
	(996, 'steam:1100001083da79f', 'WEAPON_REVOLVER_MK2', 0),
	(997, 'steam:1100001083da79f', 'WEAPON_SWITCHBLADE', 0),
	(998, 'steam:1100001083da79f', 'WEAPON_RAYPISTOL', 0),
	(999, 'steam:1100001083da79f', 'WEAPON_SMOKEGRENADE', 0),
	(1000, 'steam:1100001083da79f', 'WEAPON_FIREWORK', 0),
	(1001, 'steam:1100001083da79f', 'WEAPON_GRENADELAUNCHER_SMOKE', 0),
	(1002, 'steam:1100001083da79f', 'WEAPON_BOTTLE', 0),
	(1003, 'steam:1100001083da79f', 'WEAPON_PISTOL_MK2', 0),
	(1004, 'steam:1100001083da79f', 'WEAPON_MINISMG', 0),
	(1005, 'steam:1100001083da79f', 'WEAPON_WRENCH', 0),
	(1006, 'steam:1100001083da79f', 'WEAPON_NAVYREVOLVER', 0),
	(1007, 'steam:1100001083da79f', 'WEAPON_STICKYBOMB', 0),
	(1008, 'steam:1100001083da79f', 'WEAPON_RPG', 0),
	(1009, 'steam:1100001083da79f', 'WEAPON_STONE_HATCHET', 0),
	(1010, 'steam:1100001083da79f', 'WEAPON_PETROLCAN', 0),
	(1011, 'steam:1100001083da79f', 'WEAPON_SPECIALCARBINE', 0),
	(1012, 'steam:1100001083da79f', 'WEAPON_SPECIALCARBINE_MK2', 0),
	(1013, 'steam:1100001083da79f', 'WEAPON_REVOLVER', 0),
	(1014, 'steam:1100001083da79f', 'WEAPON_SNSPISTOL', 0),
	(1015, 'steam:1100001083da79f', 'WEAPON_MACHETE', 0),
	(1016, 'steam:1100001083da79f', 'WEAPON_CERAMICPISTOL', 0),
	(1017, 'steam:1100001083da79f', 'WEAPON_RAYCARBINE', 0),
	(1018, 'steam:1100001083da79f', 'WEAPON_FLAREGUN', 0),
	(1019, 'steam:1100001083da79f', 'WEAPON_SNIPERRIFLE', 0),
	(1020, 'steam:1100001083da79f', 'WEAPON_SMG_MK2', 0),
	(1021, 'steam:1100001083da79f', 'WEAPON_MICROSMG', 0),
	(1022, 'steam:1100001083da79f', 'WEAPON_SMG', 0),
	(1023, 'steam:1100001083da79f', 'WEAPON_SAWNOFFSHOTGUN', 0),
	(1024, 'steam:1100001083da79f', 'WEAPON_RAYMINIGUN', 0),
	(1025, 'steam:1100001083da79f', 'WEAPON_SNOWBALL', 0),
	(1026, 'steam:1100001083da79f', 'WEAPON_CARBINERIFLE', 0),
	(1027, 'steam:1100001083da79f', 'WEAPON_RAILGUN', 0),
	(1028, 'steam:1100001083da79f', 'WEAPON_PUMPSHOTGUN_MK2', 0),
	(1029, 'steam:1100001083da79f', 'WEAPON_BULLPUPRIFLE_MK2', 0),
	(1030, 'steam:1100001083da79f', 'WEAPON_COMBATPISTOL', 0),
	(1031, 'steam:1100001083da79f', 'WEAPON_ASSAULTRIFLE_MK2', 0),
	(1032, 'steam:1100001083da79f', 'WEAPON_PISTOL50', 0),
	(1033, 'steam:1100001083da79f', 'WEAPON_ADVANCEDRIFLE', 0),
	(1034, 'steam:1100001083da79f', 'WEAPON_PIPEBOMB', 0),
	(1035, 'steam:1100001083da79f', 'WEAPON_PARACHUTE', 0),
	(1036, 'steam:1100001083da79f', 'WEAPON_VINTAGEPISTOL', 0),
	(1037, 'steam:1100001083da79f', 'WEAPON_MUSKET', 0),
	(1038, 'steam:1100001083da79f', 'WEAPON_MOLOTOV', 0),
	(1039, 'steam:1100001083da79f', 'WEAPON_MINIGUN', 0),
	(1040, 'steam:1100001083da79f', 'WEAPON_FLARE', 0),
	(1041, 'steam:1100001083da79f', 'WEAPON_MARKSMANRIFLE', 0),
	(1042, 'steam:1100001083da79f', 'WEAPON_HEAVYPISTOL', 0),
	(1043, 'steam:1100001083da79f', 'WEAPON_MACHINEPISTOL', 0),
	(1044, 'steam:1100001083da79f', 'WEAPON_KNUCKLE', 0),
	(1045, 'steam:1100001083da79f', 'WEAPON_HOMINGLAUNCHER', 0),
	(1046, 'steam:1100001083da79f', 'WEAPON_HEAVYSNIPER_MK2', 0),
	(1047, 'steam:1100001083da79f', 'WEAPON_HEAVYSHOTGUN', 0),
	(1048, 'steam:1100001083da79f', 'WEAPON_FIREEXTINGUISHER', 0),
	(1049, 'steam:1100001083da79f', 'WEAPON_COMBATMG_MK2', 0),
	(1050, 'steam:1100001083da79f', 'WEAPON_DOUBLEACTION', 0),
	(1051, 'steam:1100001083da79f', 'WEAPON_HAMMER', 0),
	(1052, 'steam:1100001083da79f', 'WEAPON_GUSENBERG', 0),
	(1053, 'steam:1100001083da79f', 'WEAPON_GRENADELAUNCHER', 0),
	(1054, 'steam:1100001083da79f', 'WEAPON_APPISTOL', 0),
	(1055, 'steam:1100001083da79f', 'WEAPON_GOLFCLUB', 0),
	(1056, 'steam:1100001083da79f', 'WEAPON_ASSAULTSMG', 0),
	(1057, 'steam:1100001083da79f', 'WEAPON_BULLPUPSHOTGUN', 0),
	(1058, 'steam:1100001083da79f', 'WEAPON_HATCHET', 0),
	(1059, 'steam:1100001083da79f', 'WEAPON_DBSHOTGUN', 0),
	(1060, 'steam:1100001083da79f', 'WEAPON_DAGGER', 0),
	(1061, 'steam:1100001083da79f', 'WEAPON_COMBATPDW', 0),
	(1062, 'steam:1100001083da79f', 'WEAPON_COMPACTRIFLE', 0),
	(1063, 'steam:1100001083da79f', 'WEAPON_COMPACTLAUNCHER', 0),
	(1064, 'steam:1100001083da79f', 'WEAPON_POOLCUE', 0),
	(1065, 'steam:1100001083da79f', 'WEAPON_CROWBAR', 0),
	(1066, 'steam:1100001083da79f', 'WEAPON_HAZARDCAN', 0),
	(1067, 'steam:1100001083da79f', 'WEAPON_COMBATMG', 0),
	(1068, 'steam:1100001083da79f', 'WEAPON_CARBINERIFLE_MK2', 0),
	(1069, 'steam:1100001083da79f', 'WEAPON_BZGAS', 0),
	(1070, 'steam:1100001083da79f', 'WEAPON_BULLPUPRIFLE', 0),
	(1071, 'steam:1100001083da79f', 'WEAPON_BATTLEAXE', 0),
	(1072, 'steam:1100001083da79f', 'WEAPON_HEAVYSNIPER', 0),
	(1073, 'steam:1100001083da79f', 'WEAPON_BALL', 0),
	(1074, 'steam:1100001083da79f', 'WEAPON_AUTOSHOTGUN', 0),
	(1075, 'steam:1100001083da79f', 'WEAPON_ASSAULTSHOTGUN', 0),
	(1076, 'steam:1100001083da79f', 'WEAPON_ASSAULTRIFLE', 0),
	(1077, 'steam:1100001083da79f', 'WEAPONN_MARKSMANPISTOL', 0),
	(1078, 'steam:1100001083da79f', 'WEAPON_MG', 0),
	(1079, 'steam:1100001083da79f', 'WEAPON_MARKSMANRIFLE_MK2', 0),
	(1080, 'steam:1100001083da79f', 'WEAPON_SNSPISTOL_MK2', 0),
	(1081, 'steam:1100001083da79f', 'WEAPON_GRENADE', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
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
  `vehicle` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_parkings: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_policearmory
DROP TABLE IF EXISTS `user_policearmory`;
CREATE TABLE IF NOT EXISTS `user_policearmory` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weapons` longtext COLLATE utf8mb4_bin,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_policearmory: ~3 rows (approximately)
/*!40000 ALTER TABLE `user_policearmory` DISABLE KEYS */;
REPLACE INTO `user_policearmory` (`identifier`, `weapons`) VALUES
	('steam:110000100bc09b3', 'WEAPON_CARBINERIFLE, '),
	('steam:1100001083da79f', 'WEAPON_CARBINERIFLE, '),
	('steam:11000013a865c79', 'WEAPON_BZGAS, WEAPON_STUNGUN, WEAPON_PISTOL, WEAPON_FLASHLIGHT, WEAPON_CARBINERIFLE, ');
/*!40000 ALTER TABLE `user_policearmory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_sim
DROP TABLE IF EXISTS `user_sim`;
CREATE TABLE IF NOT EXISTS `user_sim` (
  `identifier` varchar(50) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(10) DEFAULT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table essentialmode.user_sim: 2 rows
/*!40000 ALTER TABLE `user_sim` DISABLE KEYS */;
REPLACE INTO `user_sim` (`identifier`, `id`, `phone_number`, `label`) VALUES
	('steam:1100001083da79f', 1, '55579388', 'Dynasty'),
	('steam:1100001083da79f', 2, '55533889', 'Drug Lord');
/*!40000 ALTER TABLE `user_sim` ENABLE KEYS */;

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
REPLACE INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
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
REPLACE INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compacts'),
	('coupes', 'Coupés'),
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.weashops: ~40 rows (approximately)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
REPLACE INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
	(1, 'GunShop', 'WEAPON_PISTOL', 300),
	(2, 'BlackWeashop', 'WEAPON_PISTOL', 500),
	(3, 'GunShop', 'WEAPON_FLASHLIGHT', 60),
	(4, 'BlackWeashop', 'WEAPON_FLASHLIGHT', 70),
	(5, 'GunShop', 'WEAPON_MACHETE', 90),
	(6, 'BlackWeashop', 'WEAPON_MACHETE', 110),
	(7, 'GunShop', 'WEAPON_NIGHTSTICK', 150),
	(8, 'BlackWeashop', 'WEAPON_NIGHTSTICK', 150),
	(9, 'GunShop', 'WEAPON_BAT', 100),
	(10, 'BlackWeashop', 'WEAPON_BAT', 100),
	(11, 'GunShop', 'WEAPON_STUNGUN', 50),
	(12, 'BlackWeashop', 'WEAPON_STUNGUN', 50),
	(13, 'GunShop', 'WEAPON_MICROSMG', 1400),
	(14, 'BlackWeashop', 'WEAPON_MICROSMG', 1700),
	(15, 'GunShop', 'WEAPON_PUMPSHOTGUN', 3400),
	(16, 'BlackWeashop', 'WEAPON_PUMPSHOTGUN', 3500),
	(17, 'GunShop', 'WEAPON_ASSAULTRIFLE', 10000),
	(18, 'BlackWeashop', 'WEAPON_ASSAULTRIFLE', 11000),
	(19, 'GunShop', 'WEAPON_SPECIALCARBINE', 15000),
	(20, 'BlackWeashop', 'WEAPON_SPECIALCARBINE', 16500),
	(21, 'GunShop', 'WEAPON_SNIPERRIFLE', 22000),
	(22, 'BlackWeashop', 'WEAPON_SNIPERRIFLE', 24000),
	(23, 'GunShop', 'WEAPON_FIREWORK', 18000),
	(24, 'BlackWeashop', 'WEAPON_FIREWORK', 20000),
	(25, 'GunShop', 'WEAPON_GRENADE', 500),
	(26, 'BlackWeashop', 'WEAPON_GRENADE', 650),
	(27, 'GunShop', 'WEAPON_BZGAS', 200),
	(28, 'BlackWeashop', 'WEAPON_BZGAS', 350),
	(29, 'GunShop', 'WEAPON_FIREEXTINGUISHER', 100),
	(30, 'BlackWeashop', 'WEAPON_FIREEXTINGUISHER', 100),
	(31, 'GunShop', 'WEAPON_BALL', 50),
	(32, 'BlackWeashop', 'WEAPON_BALL', 50),
	(33, 'GunShop', 'WEAPON_SMOKEGRENADE', 100),
	(34, 'BlackWeashop', 'WEAPON_SMOKEGRENADE', 100),
	(35, 'BlackWeashop', 'WEAPON_APPISTOL', 1100),
	(36, 'BlackWeashop', 'WEAPON_CARBINERIFLE', 12000),
	(37, 'BlackWeashop', 'WEAPON_HEAVYSNIPER', 30000),
	(38, 'BlackWeashop', 'WEAPON_MINIGUN', 45000),
	(39, 'BlackWeashop', 'WEAPON_RAILGUN', 50000),
	(40, 'BlackWeashop', 'WEAPON_STICKYBOMB', 500);
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

-- Dumping structure for table essentialmode.weed
DROP TABLE IF EXISTS `weed`;
CREATE TABLE IF NOT EXISTS `weed` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Spot` int(10) NOT NULL,
  `Timer` int(10) NOT NULL,
  `Status` int(10) NOT NULL,
  `Ready` int(10) NOT NULL,
  `Water` int(10) NOT NULL,
  `Fertilizer` int(10) NOT NULL,
  `Quality` int(10) NOT NULL,
  `QualityCounter` int(10) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.weed: ~4 rows (approximately)
/*!40000 ALTER TABLE `weed` DISABLE KEYS */;
REPLACE INTO `weed` (`ID`, `Spot`, `Timer`, `Status`, `Ready`, `Water`, `Fertilizer`, `Quality`, `QualityCounter`) VALUES
	(1, 1, 0, 0, 0, 0, 0, 0, 0),
	(2, 2, 260, 1, 0, 0, 0, 5, 94),
	(3, 3, 260, 1, 0, 0, 0, 5, 92),
	(4, 4, 260, 1, 0, 0, 0, 5, 91);
/*!40000 ALTER TABLE `weed` ENABLE KEYS */;

-- Dumping structure for table essentialmode.whitelist
DROP TABLE IF EXISTS `whitelist`;
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(70) NOT NULL,
  `last_connection` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ban_reason` text,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.whitelist: ~2 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
REPLACE INTO `whitelist` (`identifier`, `last_connection`, `ban_reason`, `ban_until`, `vip`) VALUES
	('steam:110000100bc09b3', '2020-04-21 18:20:42', NULL, NULL, 0),
	('steam:1100001083da79f', '2020-04-21 18:19:39', NULL, NULL, 0);
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

-- Dumping structure for table essentialmode.yellow_tweets
DROP TABLE IF EXISTS `yellow_tweets`;
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table essentialmode.yellow_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `yellow_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `yellow_tweets` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
