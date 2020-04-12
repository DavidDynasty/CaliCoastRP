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

-- Dumping data for table essentialmode.addon_account: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Bank Savings', 0),
	('caution', 'caution', 0),
	('property_black_money', 'Money Sale Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_banker', 'Bank', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_account_data: ~8 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
REPLACE INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 0, NULL),
	(2, 'caution', 4000, 'steam:1100001083da79f'),
	(3, 'caution', 0, 'steam:11000013dbc0313'),
	(5, 'caution', 0, 'steam:110000100bc09b3'),
	(7, 'property_black_money', 0, 'steam:1100001083da79f'),
	(8, 'property_black_money', 0, 'steam:110000100bc09b3'),
	(9, 'society_banker', 0, NULL),
	(10, 'society_taxi', 0, NULL),
	(11, 'bank_savings', 0, 'steam:1100001083da79f'),
	(12, 'bank_savings', 0, 'steam:110000100bc09b3'),
	(13, 'society_police', 0, NULL),
	(14, 'society_mechanic', 5000, NULL),
	(15, 'society_ambulance', 0, NULL),
	(16, 'bank_savings', 0, 'steam:11000013a865c79'),
	(17, 'caution', 0, 'steam:11000013a865c79'),
	(18, 'property_black_money', 0, 'steam:11000013a865c79');
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table essentialmode.addon_inventory
DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory: ~5 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
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
  `owner` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
REPLACE INTO `addon_inventory_items` (`id`, `inventory_name`, `name`, `count`, `owner`) VALUES
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

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
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('account', 'Account', 1),
	('car', 'Car', 1),
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

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

-- Dumping data for table essentialmode.dpkeybinds: ~0 rows (approximately)
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
	(1, 'Usage abusif du klaxon', 30, 0),
	(2, 'Franchir une ligne continue', 40, 0),
	(3, 'Circulation à contresens', 250, 0),
	(4, 'Demi-tour non autorisé', 250, 0),
	(5, 'Circulation hors-route', 170, 0),
	(6, 'Non-respect des distances de sécurité', 30, 0),
	(7, 'Arrêt dangereux / interdit', 150, 0),
	(8, 'Stationnement gênant / interdit', 70, 0),
	(9, 'Non respect  de la priorité à droite', 70, 0),
	(10, 'Non-respect à un véhicule prioritaire', 90, 0),
	(11, 'Non-respect d\'un stop', 105, 0),
	(12, 'Non-respect d\'un feu rouge', 130, 0),
	(13, 'Dépassement dangereux', 100, 0),
	(14, 'Véhicule non en état', 100, 0),
	(15, 'Conduite sans permis', 1500, 0),
	(16, 'Délit de fuite', 800, 0),
	(17, 'Excès de vitesse < 5 kmh', 90, 0),
	(18, 'Excès de vitesse 5-15 kmh', 120, 0),
	(19, 'Excès de vitesse 15-30 kmh', 180, 0),
	(20, 'Excès de vitesse > 30 kmh', 300, 0),
	(21, 'Entrave de la circulation', 110, 1),
	(22, 'Dégradation de la voie publique', 90, 1),
	(23, 'Trouble à l\'ordre publique', 90, 1),
	(24, 'Entrave opération de police', 130, 1),
	(25, 'Insulte envers / entre civils', 75, 1),
	(26, 'Outrage à agent de police', 110, 1),
	(27, 'Menace verbale ou intimidation envers civil', 90, 1),
	(28, 'Menace verbale ou intimidation envers policier', 150, 1),
	(29, 'Manifestation illégale', 250, 1),
	(30, 'Tentative de corruption', 1500, 1),
	(31, 'Arme blanche sortie en ville', 120, 2),
	(32, 'Arme léthale sortie en ville', 300, 2),
	(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
	(34, 'Port d\'arme illégal', 700, 2),
	(35, 'Pris en flag lockpick', 300, 2),
	(36, 'Vol de voiture', 1800, 2),
	(37, 'Vente de drogue', 1500, 2),
	(38, 'Fabriquation de drogue', 1500, 2),
	(39, 'Possession de drogue', 650, 2),
	(40, 'Prise d\'ôtage civil', 1500, 2),
	(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
	(42, 'Braquage particulier', 650, 2),
	(43, 'Braquage magasin', 650, 2),
	(44, 'Braquage de banque', 1500, 2),
	(45, 'Tir sur civil', 2000, 3),
	(46, 'Tir sur agent de l\'état', 2500, 3),
	(47, 'Tentative de meurtre sur civil', 3000, 3),
	(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
	(49, 'Meurtre sur civil', 10000, 3),
	(50, 'Meurte sur agent de l\'état', 30000, 3),
	(51, 'Meurtre involontaire', 1800, 3),
	(52, 'Escroquerie à l\'entreprise', 2000, 2);
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

-- Dumping structure for table essentialmode.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  `price` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.items: ~145 rows (approximately)
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
	('bulletproof', 'Bullet-Proof Vest', -1, 0, 1, 0),
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
	('WEAPON_BAT', 'Baseball Bat', 1, 0, 1, 0),
	('WEAPON_FLASHLIGHT', 'Flashlight', 1, 0, 1, 0),
	('WEAPON_KNIFE', 'Knife', 100, 1, 1, 0),
	('WEAPON_PISTOL', 'Pistol', 100, 1, 1, 0),
	('WEAPON_PUMPSHOTGUN', 'Pump Shotgun', 1, 0, 1, 0),
	('WEAPON_STUNGUN', 'Taser', 100, 1, 1, 0),
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
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.jobs: ~9 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'EMS', 0),
	('banker', 'Banker', 0),
	('cardealer', 'Cardealer', 0),
	('fisherman', 'Fisherman', 0),
	('fueler', 'Fueler', 0),
	('lumberjack', 'Lumberjack', 0),
	('mechanic', 'Mechanic', 0),
	('miner', 'Miner', 0),
	('police', 'LSPD', 0),
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.job_grades: ~53 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
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
	(24, 'taxi', 4, 'boss', 'Lead Cabby', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(25, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
	(26, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
	(27, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
	(28, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
	(29, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}'),
	(30, 'mechanic', 0, 'recrue', 'Recruit', 12, '{}', '{}'),
	(31, 'mechanic', 1, 'novice', 'Novice', 24, '{}', '{}'),
	(32, 'mechanic', 2, 'experimente', 'Experienced', 36, '{}', '{}'),
	(33, 'mechanic', 3, 'chief', 'Leader', 48, '{}', '{}'),
	(34, 'mechanic', 4, 'boss', 'Boss', 0, '{}', '{}'),
	(35, 'poolcleaner', 0, 'interim', 'Cleaner', 400, '{}', '{}'),
	(36, 'ambulance', 0, 'ambulance', 'Jr. EMT', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(37, 'ambulance', 1, 'doctor', 'EMT', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(38, 'ambulance', 2, 'chief_doctor', 'Sr. EMT', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(39, 'ambulance', 3, 'boss', 'EMT Supervisor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(40, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(41, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(42, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(43, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(44, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(45, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(46, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(47, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(48, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(49, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(50, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(51, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(52, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(53, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(54, 'lumberjack', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(55, 'fisherman', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(56, 'fueler', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(57, 'reporter', 0, 'employee', 'Employee', 0, '{}', '{}'),
	(58, 'tailor', 0, 'employee', 'Employee', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(59, 'miner', 0, 'employee', 'Employee', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(60, 'slaughterer', 0, 'employee', 'Employee', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}');
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

-- Dumping data for table essentialmode.owned_vehicles: ~12 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
REPLACE INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
	('steam:1100001083da79f', 'AYFK2860', '{"neonEnabled":[false,false,false,false],"modGrille":-1,"color2":0,"modRoof":-1,"modRearBumper":-1,"modSuspension":-1,"modDial":-1,"modTrimA":-1,"dirtLevel":9.8,"plateIndex":0,"modTrimB":-1,"modSideSkirt":-1,"modStruts":-1,"modRightFender":-1,"engineHealth":1000.0,"modHydrolic":-1,"modTurbo":false,"wheelColor":156,"modExhaust":-1,"modFrontWheels":-1,"modEngineBlock":-1,"model":-344943009,"modAirFilter":-1,"modDashboard":-1,"tyreSmokeColor":[255,255,255],"modSeats":-1,"modFender":-1,"modSpeakers":-1,"modSpoilers":-1,"modWindows":-1,"modFrontBumper":-1,"modTrunk":-1,"pearlescentColor":111,"modFrame":-1,"plate":"AYFK2860","modBrakes":-1,"modEngine":-1,"modHood":-1,"modArchCover":-1,"modSteeringWheel":-1,"modAPlate":-1,"neonColor":[255,0,255],"modArmor":-1,"modTransmission":-1,"modPlateHolder":-1,"modXenon":false,"modShifterLeavers":-1,"modVanityPlate":-1,"extras":{"12":true,"10":false},"wheels":0,"windowTint":-1,"fuelLevel":55.9,"modSmokeEnabled":false,"modTank":-1,"modDoorSpeaker":-1,"bodyHealth":1000.0,"color1":6,"modAerials":-1,"modBackWheels":-1,"modHorns":-1,"modLivery":-1,"modOrnaments":-1}', 'car', '', 1),
	('steam:1100001083da79f', 'CAVH7315', '{"modSpeakers":-1,"plate":"CAVH7315","modHorns":-1,"extras":{"1":true},"modAPlate":-1,"modFrontWheels":-1,"modRearBumper":-1,"modEngine":-1,"modAerials":-1,"modSuspension":-1,"modTrimA":-1,"dirtLevel":3.0,"neonColor":[255,0,255],"modRightFender":-1,"modTrunk":-1,"modShifterLeavers":-1,"fuelLevel":49.8,"modTrimB":-1,"modVanityPlate":-1,"modRoof":-1,"modArmor":-1,"modSmokeEnabled":false,"modFender":-1,"neonEnabled":[false,false,false,false],"model":1171614426,"modSeats":-1,"color1":112,"modTurbo":false,"modHood":-1,"modPlateHolder":-1,"modArchCover":-1,"windowTint":-1,"modAirFilter":-1,"bodyHealth":1000.0,"modWindows":-1,"plateIndex":4,"modTransmission":-1,"modStruts":-1,"modExhaust":-1,"tyreSmokeColor":[255,255,255],"modXenon":false,"modOrnaments":-1,"engineHealth":1000.0,"modFrame":-1,"modEngineBlock":-1,"modSideSkirt":-1,"wheels":0,"modGrille":-1,"modFrontBumper":-1,"modLivery":1,"modHydrolic":-1,"pearlescentColor":112,"modSteeringWheel":-1,"modBackWheels":-1,"modDoorSpeaker":-1,"modSpoilers":-1,"color2":28,"modDashboard":-1,"modBrakes":-1,"wheelColor":156,"modDial":-1,"modTank":-1}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'IARR8877', '{"engineHealth":1000.0,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modRoof":-1,"modShifterLeavers":-1,"modSideSkirt":-1,"modTank":-1,"color2":28,"modSeats":-1,"modDoorSpeaker":-1,"wheels":0,"model":1171614426,"modAerials":-1,"modFrontBumper":-1,"modExhaust":-1,"modHydrolic":-1,"plate":"IARR8877","windowTint":-1,"modRightFender":-1,"modTransmission":-1,"pearlescentColor":112,"modTurbo":false,"modBrakes":-1,"modOrnaments":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"plateIndex":4,"color1":112,"neonColor":[255,0,255],"modHood":-1,"modLivery":0,"modSuspension":-1,"extras":{"1":false},"modWindows":-1,"modAirFilter":-1,"bodyHealth":1000.0,"modTrimB":-1,"modFrame":-1,"modTrunk":-1,"dirtLevel":5.0,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modRearBumper":-1,"modXenon":false,"modStruts":-1,"wheelColor":156,"modDial":-1,"modPlateHolder":-1,"modVanityPlate":-1,"modAPlate":-1,"modSpoilers":-1,"modBackWheels":-1,"modTrimA":-1,"modFender":-1,"fuelLevel":30.4,"modSmokeEnabled":false}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'JDRH5862', '{"modRearBumper":-1,"modDashboard":-1,"modAerials":-1,"windowTint":-1,"modWindows":-1,"dirtLevel":7.0,"wheelColor":156,"modSpeakers":-1,"model":745926877,"modSuspension":-1,"modHood":-1,"tyreSmokeColor":[255,255,255],"plate":"JDRH5862","modAPlate":-1,"modFrame":-1,"modSeats":-1,"modOrnaments":-1,"modHorns":-1,"modEngine":-1,"modGrille":-1,"modSteeringWheel":-1,"modFrontBumper":-1,"modTrimA":-1,"modTank":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"modTrimB":-1,"modRightFender":-1,"modStruts":-1,"modDoorSpeaker":-1,"color1":0,"modArmor":-1,"modSpoilers":-1,"engineHealth":1000.0,"modShifterLeavers":-1,"modArchCover":-1,"pearlescentColor":0,"modHydrolic":-1,"modLivery":-1,"wheels":0,"plateIndex":4,"color2":112,"neonColor":[255,0,255],"bodyHealth":1000.0,"modAirFilter":-1,"modTransmission":-1,"modRoof":-1,"extras":{"1":true,"2":true,"7":true},"modDial":-1,"modSideSkirt":-1,"modFrontWheels":-1,"modXenon":false,"modBackWheels":-1,"modEngineBlock":-1,"modBrakes":-1,"modTrunk":-1,"modExhaust":-1,"modTurbo":false,"fuelLevel":46.3,"modSmokeEnabled":false,"modFender":-1,"modVanityPlate":-1}', 'helicopter', 'ambulance', 1),
	('steam:1100001083da79f', 'MXGN9638', '{"modRightFender":-1,"modAerials":-1,"wheelColor":156,"modFrontBumper":-1,"modHydrolic":-1,"modArmor":-1,"plate":"MXGN9638","engineHealth":1000.0,"modSteeringWheel":-1,"model":353883353,"modTransmission":-1,"modShifterLeavers":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modSuspension":-1,"modSpoilers":-1,"wheels":0,"fuelLevel":29.0,"modExhaust":-1,"modDashboard":-1,"modTurbo":false,"modStruts":-1,"modPlateHolder":-1,"modHood":-1,"modSeats":-1,"modFrame":-1,"modHorns":-1,"modSideSkirt":-1,"pearlescentColor":112,"modFender":-1,"windowTint":-1,"modBrakes":-1,"modAPlate":-1,"color2":0,"modFrontWheels":-1,"modSpeakers":-1,"modWindows":-1,"plateIndex":4,"modSmokeEnabled":false,"bodyHealth":1000.0,"modRoof":-1,"tyreSmokeColor":[255,255,255],"modDial":-1,"modBackWheels":-1,"extras":{"2":true,"10":true,"1":true,"11":true,"7":true},"modEngine":-1,"modVanityPlate":-1,"modGrille":-1,"modTrimA":-1,"modRearBumper":-1,"neonEnabled":[false,false,false,false],"modTrimB":-1,"dirtLevel":8.0,"modLivery":0,"color1":134,"modXenon":false,"modTank":-1,"neonColor":[255,0,255],"modEngineBlock":-1,"modTrunk":-1,"modOrnaments":-1,"modArchCover":-1}', 'helicopter', 'police', 1),
	('steam:1100001083da79f', 'PZUJ7871', '{"neonColor":[255,0,255],"modArchCover":-1,"modEngine":-1,"modPlateHolder":-1,"modAPlate":-1,"modEngineBlock":-1,"modSpoilers":-1,"modShifterLeavers":-1,"modDial":-1,"modRearBumper":-1,"modSpeakers":-1,"plate":"PZUJ7871","plateIndex":4,"modSteeringWheel":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"modTank":-1,"dirtLevel":0.0,"modLivery":1,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modFender":-1,"modGrille":-1,"modRightFender":-1,"modSmokeEnabled":false,"color1":112,"modBrakes":-1,"modDashboard":-1,"modOrnaments":-1,"modXenon":false,"pearlescentColor":112,"wheelColor":156,"wheels":0,"modHydrolic":-1,"engineHealth":1000.0,"windowTint":-1,"bodyHealth":1000.0,"modTrunk":-1,"modStruts":-1,"modTurbo":false,"modBackWheels":-1,"modSideSkirt":-1,"modAerials":-1,"modVanityPlate":-1,"modArmor":-1,"modWindows":-1,"modTrimB":-1,"model":1171614426,"modSeats":-1,"modFrontWheels":-1,"modExhaust":-1,"modSuspension":-1,"modHorns":-1,"extras":{"1":true},"color2":28,"fuelLevel":73.3,"modFrontBumper":-1,"modHood":-1,"modTrimA":-1}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'RNZW6550', '{"neonColor":[255,0,255],"modArchCover":-1,"modEngine":-1,"modPlateHolder":-1,"modAPlate":-1,"modEngineBlock":-1,"modSpoilers":-1,"modShifterLeavers":-1,"modDial":-1,"modRearBumper":-1,"modSpeakers":-1,"plate":"RNZW6550","plateIndex":4,"modSteeringWheel":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"modTank":-1,"dirtLevel":6.0,"modLivery":2,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modFender":-1,"modGrille":-1,"modRightFender":-1,"modSmokeEnabled":false,"color1":112,"modBrakes":-1,"modDashboard":-1,"modOrnaments":-1,"modXenon":false,"pearlescentColor":112,"wheelColor":156,"wheels":0,"modHydrolic":-1,"engineHealth":1000.0,"windowTint":-1,"bodyHealth":1000.0,"modTrunk":-1,"modStruts":-1,"modTurbo":false,"modBackWheels":-1,"modSideSkirt":-1,"modAerials":-1,"modVanityPlate":-1,"modArmor":-1,"modWindows":-1,"modTrimB":-1,"model":1171614426,"modSeats":-1,"modFrontWheels":-1,"modExhaust":-1,"modSuspension":-1,"modHorns":-1,"extras":{"1":false},"color2":28,"fuelLevel":67.9,"modFrontBumper":-1,"modHood":-1,"modTrimA":-1}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'SHYB6222', '{"engineHealth":1000.0,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modRoof":-1,"modShifterLeavers":-1,"modSideSkirt":-1,"modTank":-1,"color2":28,"modSeats":-1,"modDoorSpeaker":-1,"wheels":0,"model":1171614426,"modAerials":-1,"modFrontBumper":-1,"modExhaust":-1,"modHydrolic":-1,"plate":"SHYB6222","windowTint":-1,"modRightFender":-1,"modTransmission":-1,"pearlescentColor":112,"modTurbo":false,"modBrakes":-1,"modOrnaments":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"plateIndex":4,"color1":112,"neonColor":[255,0,255],"modHood":-1,"modLivery":2,"modSuspension":-1,"extras":{"1":false},"modWindows":-1,"modAirFilter":-1,"bodyHealth":1000.0,"modTrimB":-1,"modFrame":-1,"modTrunk":-1,"dirtLevel":3.0,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modRearBumper":-1,"modXenon":false,"modStruts":-1,"wheelColor":156,"modDial":-1,"modPlateHolder":-1,"modVanityPlate":-1,"modAPlate":-1,"modSpoilers":-1,"modBackWheels":-1,"modTrimA":-1,"modFender":-1,"fuelLevel":59.3,"modSmokeEnabled":false}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'SOQN7593', '{"modSpeakers":-1,"windowTint":-1,"modTrunk":-1,"modWindows":-1,"bodyHealth":1000.0,"dirtLevel":6.0,"modHydrolic":-1,"modAirFilter":-1,"modTransmission":-1,"modFrontBumper":-1,"modRearBumper":-1,"tyreSmokeColor":[255,255,255],"modHood":-1,"modArmor":-1,"modVanityPlate":-1,"color1":4,"modSmokeEnabled":false,"extras":[],"modFrontWheels":-1,"modFrame":-1,"color2":41,"modDoorSpeaker":-1,"modDashboard":-1,"modSteeringWheel":-1,"modHorns":-1,"modSideSkirt":-1,"modTank":-1,"wheels":7,"neonColor":[255,0,255],"modPlateHolder":-1,"modGrille":-1,"modTrimB":-1,"modDial":-1,"modBackWheels":-1,"modStruts":-1,"pearlescentColor":111,"modAerials":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"modFender":-1,"modTurbo":false,"modArchCover":-1,"modLivery":-1,"plate":"SOQN7593","modBrakes":-1,"engineHealth":1000.0,"fuelLevel":65.0,"plateIndex":0,"modSeats":-1,"modSuspension":-1,"modSpoilers":-1,"modAPlate":-1,"modXenon":false,"modRoof":-1,"modTrimA":-1,"modRightFender":-1,"model":-1403128555,"modExhaust":-1,"wheelColor":156,"modEngineBlock":-1,"modOrnaments":-1,"modShifterLeavers":-1}', 'car', '', 1),
	('steam:1100001083da79f', 'ULHK3203', '{"modDial":-1,"modHorns":-1,"modHood":-1,"modAirFilter":-1,"neonColor":[255,0,255],"modOrnaments":-1,"modDoorSpeaker":-1,"plateIndex":4,"modFrontBumper":-1,"modTransmission":-1,"model":745926877,"modTurbo":false,"modEngineBlock":-1,"fuelLevel":28.0,"modSuspension":-1,"modAerials":-1,"modSmokeEnabled":false,"modExhaust":-1,"modHydrolic":-1,"engineHealth":1000.0,"modWindows":-1,"modXenon":false,"modTrunk":-1,"color1":0,"modArmor":-1,"neonEnabled":[false,false,false,false],"modPlateHolder":-1,"tyreSmokeColor":[255,255,255],"wheels":0,"modBackWheels":-1,"modGrille":-1,"pearlescentColor":0,"modTrimB":-1,"extras":{"1":true,"7":true,"2":true},"bodyHealth":1000.0,"modSteeringWheel":-1,"modSpeakers":-1,"modFrontWheels":-1,"modArchCover":-1,"modStruts":-1,"dirtLevel":5.0,"modFrame":-1,"modSeats":-1,"modShifterLeavers":-1,"modEngine":-1,"modVanityPlate":-1,"modBrakes":-1,"modLivery":-1,"modFender":-1,"modDashboard":-1,"modRearBumper":-1,"plate":"ULHK3203","modRoof":-1,"color2":112,"modSpoilers":-1,"wheelColor":156,"windowTint":-1,"modTrimA":-1,"modRightFender":-1,"modAPlate":-1,"modSideSkirt":-1,"modTank":-1}', 'helicopter', 'ambulance', 1),
	('steam:1100001083da79f', 'VXGK7081', '{"engineHealth":1000.0,"tyreSmokeColor":[255,255,255],"modHorns":-1,"modEngineBlock":-1,"modSteeringWheel":-1,"modArmor":-1,"modFrontWheels":-1,"modGrille":-1,"modRoof":-1,"modShifterLeavers":-1,"modSideSkirt":-1,"modTank":-1,"color2":28,"modSeats":-1,"modDoorSpeaker":-1,"wheels":0,"model":1171614426,"modAerials":-1,"modFrontBumper":-1,"modExhaust":-1,"modHydrolic":-1,"plate":"VXGK7081","windowTint":-1,"modRightFender":-1,"modTransmission":-1,"pearlescentColor":112,"modTurbo":false,"modBrakes":-1,"modOrnaments":-1,"modDashboard":-1,"neonEnabled":[false,false,false,false],"plateIndex":4,"color1":112,"neonColor":[255,0,255],"modHood":-1,"modLivery":1,"modSuspension":-1,"extras":{"1":false},"modWindows":-1,"modAirFilter":-1,"bodyHealth":1000.0,"modTrimB":-1,"modFrame":-1,"modTrunk":-1,"dirtLevel":5.0,"modEngine":-1,"modArchCover":-1,"modSpeakers":-1,"modRearBumper":-1,"modXenon":false,"modStruts":-1,"wheelColor":156,"modDial":-1,"modPlateHolder":-1,"modVanityPlate":-1,"modAPlate":-1,"modSpoilers":-1,"modBackWheels":-1,"modTrimA":-1,"modFender":-1,"fuelLevel":29.8,"modSmokeEnabled":false}', 'car', 'ambulance', 1),
	('steam:1100001083da79f', 'WWGA6276', '{"modFender":-1,"modRightFender":-1,"modHood":-1,"modEngine":-1,"modOrnaments":-1,"bodyHealth":999.5,"modDial":-1,"modSuspension":-1,"modRoof":-1,"modAPlate":-1,"modPlateHolder":-1,"modFrame":-1,"modWindows":-1,"modTank":-1,"modXenon":false,"neonColor":[255,0,255],"modRearBumper":-1,"color1":6,"modLivery":-1,"modBackWheels":-1,"wheelColor":156,"modEngineBlock":-1,"modTrimA":-1,"modAirFilter":-1,"windowTint":-1,"pearlescentColor":111,"extras":[],"modFrontBumper":-1,"modHorns":-1,"modDoorSpeaker":-1,"modSmokeEnabled":false,"plate":"WWGA6276","color2":6,"wheels":4,"modVanityPlate":-1,"modSideSkirt":-1,"fuelLevel":43.0,"modShifterLeavers":-1,"modSteeringWheel":-1,"tyreSmokeColor":[255,255,255],"modTrimB":-1,"modFrontWheels":-1,"modArmor":-1,"neonEnabled":[false,false,false,false],"modArchCover":-1,"modBrakes":-1,"modGrille":-1,"dirtLevel":9.3,"plateIndex":0,"engineHealth":1000.0,"modTurbo":false,"modExhaust":-1,"modTransmission":-1,"model":-1237253773,"modHydrolic":-1,"modDashboard":-1,"modStruts":-1,"modSeats":-1,"modSpoilers":-1,"modSpeakers":-1,"modTrunk":-1,"modAerials":-1}', 'car', '', 1),
	('steam:1100001083da79f', 'YLGH9688', '{"neonColor":[255,0,255],"modArchCover":-1,"modEngine":-1,"modPlateHolder":-1,"modAPlate":-1,"modEngineBlock":-1,"modSpoilers":-1,"modShifterLeavers":-1,"modDial":-1,"modRearBumper":-1,"modSpeakers":-1,"plate":"YLGH9688","plateIndex":4,"modSteeringWheel":-1,"modFrame":-1,"neonEnabled":[false,false,false,false],"modTank":-1,"dirtLevel":2.0,"modLivery":2,"tyreSmokeColor":[255,255,255],"modRoof":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modAirFilter":-1,"modFender":-1,"modGrille":-1,"modRightFender":-1,"modSmokeEnabled":false,"color1":112,"modBrakes":-1,"modDashboard":-1,"modOrnaments":-1,"modXenon":false,"pearlescentColor":112,"wheelColor":156,"wheels":0,"modHydrolic":-1,"engineHealth":1000.0,"windowTint":-1,"bodyHealth":1000.0,"modTrunk":-1,"modStruts":-1,"modTurbo":false,"modBackWheels":-1,"modSideSkirt":-1,"modAerials":-1,"modVanityPlate":-1,"modArmor":-1,"modWindows":-1,"modTrimB":-1,"model":1171614426,"modSeats":-1,"modFrontWheels":-1,"modExhaust":-1,"modSuspension":-1,"modHorns":-1,"extras":{"1":false},"color2":28,"fuelLevel":56.9,"modFrontBumper":-1,"modHood":-1,"modTrimA":-1}', 'car', 'ambulance', 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_app_chat
DROP TABLE IF EXISTS `phone_app_chat`;
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
REPLACE INTO `phone_app_chat` (`id`, `channel`, `message`, `time`) VALUES
	(28, 'guns', 'Test', '2019-12-14 23:32:33');
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_calls
DROP TABLE IF EXISTS `phone_calls`;
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_calls: ~16 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
REPLACE INTO `phone_calls` (`id`, `owner`, `num`, `incoming`, `time`, `accepts`) VALUES
	(124, '827-5849', '785-8943', 1, '2019-12-14 21:41:37', 1),
	(125, '785-8943', '827-5849', 0, '2019-12-14 21:41:37', 1),
	(126, '827-5849', '785-8943', 1, '2019-12-14 21:42:37', 0),
	(127, '785-8943', '827-5849', 0, '2019-12-14 21:42:37', 0),
	(128, '785-8943', '827-5849', 1, '2019-12-14 21:58:46', 0),
	(129, '827-5849', '785-8943', 0, '2019-12-14 21:58:46', 0),
	(130, '827-5849', '785-8943', 1, '2019-12-14 21:58:58', 1),
	(131, '785-8943', '827-5849', 0, '2019-12-14 21:58:58', 1),
	(132, '827-5849', '785-8943', 1, '2019-12-14 21:58:59', 1),
	(133, '785-8943', '827-5849', 0, '2019-12-14 21:58:59', 1),
	(134, '785-8943', '827-5849', 1, '2019-12-14 22:03:05', 1),
	(135, '827-5849', '785-8943', 0, '2019-12-14 22:03:05', 1),
	(136, '785-8943', '827-5849', 1, '2019-12-14 22:05:43', 1),
	(137, '827-5849', '785-8943', 0, '2019-12-14 22:05:43', 1),
	(138, '827-5849', '785-8943', 1, '2019-12-14 23:12:55', 0),
	(139, '785-8943', '827-5849', 0, '2019-12-14 23:12:55', 0),
	(140, '827-5849', '827-5894', 1, '2019-12-14 23:13:58', 0);
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_messages
DROP TABLE IF EXISTS `phone_messages`;
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_messages: 12 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
REPLACE INTO `phone_messages` (`id`, `transmitter`, `receiver`, `message`, `time`, `isRead`, `owner`) VALUES
	(107, '827-5849', '785-8943', 'testing', '2019-12-14 21:33:11', 1, 0),
	(108, '785-8943', '827-5849', 'testing', '2019-12-14 21:33:11', 1, 1),
	(109, '785-8943', '827-5849', 'GPS: 842.62530517578, -1016.6405639648', '2019-12-14 21:33:34', 1, 0),
	(110, '827-5849', '785-8943', 'GPS: 842.62530517578, -1016.6405639648', '2019-12-14 21:33:35', 1, 1),
	(111, '827-5849', '785-8943', 'TESTING', '2019-12-14 21:40:57', 1, 0),
	(112, '785-8943', '827-5849', 'TESTING', '2019-12-14 21:40:57', 1, 1),
	(113, '827-5849', '785-8943', 'test', '2019-12-14 21:58:06', 1, 0),
	(114, '785-8943', '827-5849', 'test', '2019-12-14 21:58:07', 1, 1),
	(115, '785-8943', '827-5849', '123', '2019-12-14 21:58:14', 1, 0),
	(116, '827-5849', '785-8943', '123', '2019-12-14 21:58:14', 1, 1),
	(117, '827-5849', '785-8943', 'GPS: 846.23217773438, -1012.4412231445', '2019-12-14 21:58:18', 1, 0),
	(118, '785-8943', '827-5849', 'GPS: 846.23217773438, -1012.4412231445', '2019-12-14 21:58:18', 1, 1);
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table essentialmode.phone_users_contacts
DROP TABLE IF EXISTS `phone_users_contacts`;
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table essentialmode.phone_users_contacts: 1 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
REPLACE INTO `phone_users_contacts` (`id`, `identifier`, `number`, `display`) VALUES
	(7, 'steam:1100001083da79f', '785-8943', 'Web');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.properties: ~42 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.shops: ~29 rows (approximately)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
REPLACE INTO `shops` (`id`, `store`, `item`, `price`) VALUES
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
	(22, 'TequilaLaLa', 'water', 100),
	(24, 'LTDgasoline', 'sandwich', 100),
	(27, 'LTDgasoline', 'phone', 1200),
	(28, 'RobsLiquor', 'wine', 400),
	(29, 'RobsLiquor', 'vodka', 250),
	(30, 'RobsLiquor', 'whisky', 60),
	(32, 'ExtraItemsShop', 'lockpick', 20),
	(33, 'ExtraItemsShop', 'darknet', 25),
	(34, 'ExtraItemsShop', 'drill', 180),
	(35, 'ExtraItemsShop', 'binoculars', 10),
	(36, 'ExtraItemsShop', 'oxygen_mask', 400),
	(37, 'ExtraItemsShop', 'bulletproof', 300),
	(38, 'ExtraItemsShop', 'firstaidkit', 80),
	(39, 'ExtraItemsShop', 'clip', 250);
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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.twitter_likes: ~2 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
REPLACE INTO `twitter_likes` (`id`, `authorId`, `tweetId`) VALUES
	(137, 38, 171),
	(138, 39, 172);
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table essentialmode.twitter_tweets
DROP TABLE IF EXISTS `twitter_tweets`;
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table essentialmode.twitter_tweets: ~3 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
REPLACE INTO `twitter_tweets` (`id`, `authorId`, `realUser`, `message`, `time`, `likes`) VALUES
	(170, 38, 'steam:1100001083da79f', 'Hello hello hello', '2019-12-14 17:39:25', 0),
	(171, 39, 'steam:110000100bc09b3', '@David Dynasty whattup!', '2019-12-14 21:32:06', 1),
	(172, 38, 'steam:1100001083da79f', '@webjocky nothing much man just working hard.', '2019-12-14 21:32:26', 1);
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

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
  `tattoos` varchar(255) COLLATE utf8mb4_bin DEFAULT '{}',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `is_dead` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.users: ~2 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `status`, `last_property`, `tattoos`, `phone_number`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `is_dead`) VALUES
	('steam:110000100bc09b3', 'license:c17a03efdcbc2641b14660923607732ff4602934', 0, 'webjocky', '{"shoes_2":0,"blush_3":0,"skin":0,"bracelets_2":0,"beard_2":0,"bags_1":0,"makeup_4":0,"tshirt_2":0,"makeup_3":0,"mask_2":0,"blush_2":0,"decals_1":0,"glasses_2":0,"helmet_2":0,"sex":0,"eyebrows_4":0,"lipstick_1":0,"pants_1":0,"beard_1":0,"sun_2":0,"complexion_1":0,"torso_1":0,"ears_1":-1,"eyebrows_1":0,"makeup_2":0,"blemishes_1":0,"pants_2":0,"ears_2":0,"eyebrows_3":0,"lipstick_2":0,"blush_1":0,"moles_1":0,"chain_2":0,"hair_color_2":0,"blemishes_2":0,"bodyb_1":0,"hair_1":0,"age_1":0,"torso_2":0,"bodyb_2":0,"makeup_1":0,"lipstick_3":0,"age_2":0,"glasses_1":0,"chest_1":0,"chest_2":0,"helmet_1":-1,"sun_1":0,"eye_color":0,"bproof_2":0,"watches_1":-1,"hair_color_1":0,"complexion_2":0,"decals_2":0,"bracelets_1":-1,"chest_3":0,"beard_3":0,"tshirt_1":0,"watches_2":0,"hair_2":0,"shoes_1":0,"mask_1":0,"lipstick_4":0,"arms_2":0,"eyebrows_2":0,"bproof_1":0,"bags_2":0,"chain_1":0,"beard_4":0,"moles_2":0,"arms":0,"face":0}', 'fueler', 0, '[]', '{"x":266.2,"y":-3013.3,"z":5.7}', 2250, 0, 'user', '[{"val":468200,"name":"hunger","percent":46.82},{"val":476150,"name":"thirst","percent":47.615}]', NULL, '{}', '785-8943', 'Semore', 'Butts', '1980-04-25', 'm', '188', 0),
	('steam:1100001083da79f', 'license:5d95643a350dcb5aa0f14598a720d4ecd758b87f', 4995000, 'YouLoveTurd', '{"age_2":0,"decals_1":0,"helmet_1":-1,"lipstick_3":11,"hair_color_2":6,"blush_3":0,"moles_1":0,"eyebrows_2":10,"complexion_2":0,"makeup_2":0,"eyebrows_4":0,"lipstick_1":2,"blemishes_1":0,"bags_1":0,"hair_2":0,"helmet_2":0,"tshirt_1":33,"torso_1":31,"age_1":0,"beard_1":4,"bodyb_2":0,"ears_2":1,"shoes_1":10,"mask_1":0,"glasses_2":0,"hair_color_1":0,"watches_2":0,"tshirt_2":0,"blemishes_2":0,"sun_1":0,"torso_2":0,"chest_1":0,"skin":0,"bproof_2":0,"glasses_1":7,"chest_3":0,"chain_1":26,"makeup_3":0,"pants_1":10,"blush_1":0,"beard_3":0,"makeup_1":0,"pants_2":0,"beard_4":0,"bracelets_1":-1,"arms_2":0,"bodyb_1":0,"eyebrows_3":0,"makeup_4":0,"shoes_2":0,"bproof_1":0,"lipstick_4":26,"sun_2":0,"face":0,"eyebrows_1":12,"sex":0,"moles_2":0,"bags_2":0,"chest_2":0,"mask_2":0,"eye_color":0,"complexion_1":0,"lipstick_2":2,"arms":4,"decals_2":0,"bracelets_2":0,"chain_2":12,"beard_2":10,"blush_2":0,"ears_1":5,"hair_1":11,"watches_1":-1}', 'police', 4, '[{"name":"WEAPON_PISTOL","ammo":240,"label":"Beretta 92FS","components":["clip_default"]},{"name":"WEAPON_SMG","ammo":0,"label":"MP5","components":["clip_default"]},{"name":"WEAPON_PUMPSHOTGUN","ammo":0,"label":"12 Gauge Shotgun","components":[]},{"name":"WEAPON_CARBINERIFLE","ammo":0,"label":"M4 Carbine","components":["clip_default","flashlight"]},{"name":"WEAPON_BZGAS","ammo":13,"label":"Bz gas","components":[]}]', '{"z":-39.0,"y":-3191.4,"x":1088.9}', 4995594, 0, 'user', '[{"name":"hunger","val":239900,"percent":23.99},{"name":"thirst","val":429925,"percent":42.9925}]', NULL, '[{"collection":"mpbusiness_overlays","texture":1},{"collection":"mpbusiness_overlays","texture":4},{"collection":"mpbusiness_overlays","texture":5},{"collection":"mpbusiness_overlays","texture":1},{"collection":"mpbusiness_overlays","texture":2},{"collect', '827-5849', 'David', 'Bell', '19860825', 'm', '164', 0),
	('steam:11000013a865c79', 'license:5c312d68ae6c1e6240e25347eba93cd3e832fa4e', 4995000, 'ridlinz', '{"pants_1":14,"hair_2":0,"torso_2":0,"hair_color_1":17,"decals_2":0,"lipstick_1":0,"beard_4":0,"chest_1":0,"blush_1":0,"shoes_2":0,"blemishes_1":0,"moles_1":0,"bproof_1":0,"tshirt_2":0,"helmet_2":0,"pants_2":9,"eye_color":0,"lipstick_4":0,"complexion_2":0,"age_1":0,"bags_2":0,"bags_1":0,"complexion_1":0,"bracelets_2":0,"arms_2":0,"makeup_3":0,"lipstick_2":6,"eyebrows_4":0,"blemishes_2":0,"beard_3":0,"lipstick_3":18,"glasses_1":5,"eyebrows_1":1,"chain_1":0,"eyebrows_3":17,"mask_1":0,"sex":1,"shoes_1":3,"bproof_2":0,"makeup_4":0,"beard_2":0,"sun_1":0,"chest_3":0,"bodyb_1":0,"moles_2":8,"mask_2":0,"bodyb_2":0,"face":40,"ears_1":-1,"watches_2":0,"sun_2":0,"bracelets_1":-1,"eyebrows_2":10,"decals_1":0,"makeup_1":1,"age_2":0,"torso_1":0,"helmet_1":-1,"beard_1":0,"makeup_2":10,"arms":0,"blush_2":0,"chest_2":0,"chain_2":0,"ears_2":0,"blush_3":0,"tshirt_1":0,"hair_1":15,"hair_color_2":17,"glasses_2":0,"skin":25,"watches_1":-1}', 'police', 4, '[{"name":"WEAPON_NIGHTSTICK","components":[],"label":"Nightstick","ammo":0},{"name":"WEAPON_PISTOL","components":["clip_default"],"label":"Beretta 92FS","ammo":212},{"name":"WEAPON_PUMPSHOTGUN","components":[],"label":"12 Gauge Shotgun","ammo":0},{"name":"WEAPON_CARBINERIFLE","components":["clip_default"],"label":"M4 Carbine","ammo":0},{"name":"WEAPON_BZGAS","components":[],"label":"Bz gas","ammo":25},{"name":"WEAPON_STUNGUN","components":[],"label":"Taser Pulse","ammo":250},{"name":"WEAPON_FLASHLIGHT","components":[],"label":"Maglite","ammo":0}]', '{"z":29.5,"y":-963.1,"x":413.9}', 700, 0, 'user', '[{"name":"hunger","val":993300,"percent":99.33},{"name":"thirst","val":994975,"percent":99.4975}]', NULL, '{}', '531-3502', 'Olive', 'Baker', '1994-07-01', 'f', '156', 0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_accounts
DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_accounts: ~0 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=575 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_inventory: ~360 rows (approximately)
/*!40000 ALTER TABLE `user_inventory` DISABLE KEYS */;
REPLACE INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
	(1, 'steam:1100001083da79f', 'essence', 0),
	(2, 'steam:1100001083da79f', 'stone', 0),
	(3, 'steam:1100001083da79f', 'packaged_chicken', 0),
	(4, 'steam:1100001083da79f', 'alive_chicken', 0),
	(5, 'steam:1100001083da79f', 'fabric', 5),
	(6, 'steam:1100001083da79f', 'diamond', 0),
	(7, 'steam:1100001083da79f', 'fish', 5),
	(9, 'steam:1100001083da79f', 'slaughtered_chicken', 0),
	(11, 'steam:1100001083da79f', 'washed_stone', 0),
	(12, 'steam:1100001083da79f', 'petrol', 0),
	(13, 'steam:1100001083da79f', 'cutted_wood', 0),
	(14, 'steam:1100001083da79f', 'gold', 1),
	(15, 'steam:1100001083da79f', 'copper', 5),
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
	(39, 'steam:1100001083da79f', 'bread', 0),
	(40, 'steam:1100001083da79f', 'cloth', 0),
	(41, 'steam:1100001083da79f', 'water', 0),
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
	(61, 'steam:1100001083da79f', 'WEAPON_PUMPSHOTGUN', 0),
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
	(119, 'steam:1100001083da79f', 'disc_ammo_rifle', 1),
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
	(272, 'steam:110000100bc09b3', 'poolreceipt', 0),
	(273, 'steam:1100001083da79f', 'sandwich', 0),
	(274, 'steam:1100001083da79f', 'phone', 1),
	(275, 'steam:110000100bc09b3', 'phone', 0),
	(276, 'steam:110000100bc09b3', 'sandwich', 0),
	(277, 'steam:1100001083da79f', 'goldchain', 0),
	(278, 'steam:1100001083da79f', 'joint', 0),
	(279, 'steam:1100001083da79f', 'vodka', 0),
	(280, 'steam:1100001083da79f', 'soda', 0),
	(281, 'steam:1100001083da79f', 'cokebrick', 0),
	(282, 'steam:1100001083da79f', 'cokeounce', 0),
	(283, 'steam:1100001083da79f', 'watch', 0),
	(284, 'steam:1100001083da79f', 'coffee', 0),
	(285, 'steam:1100001083da79f', 'suppressor', 0),
	(286, 'steam:1100001083da79f', 'fakeplates', 0),
	(287, 'steam:1100001083da79f', 'raisin', 0),
	(288, 'steam:1100001083da79f', '5dollartaco', 0),
	(289, 'steam:1100001083da79f', 'cheesebows', 0),
	(290, 'steam:1100001083da79f', 'cocacola', 0),
	(291, 'steam:1100001083da79f', 'pizza', 0),
	(292, 'steam:1100001083da79f', 'firstaid', 0),
	(293, 'steam:1100001083da79f', 'jewels', 0),
	(294, 'steam:1100001083da79f', 'meth', 0),
	(295, 'steam:1100001083da79f', 'cannabis', 0),
	(296, 'steam:1100001083da79f', 'gatorade', 0),
	(297, 'steam:1100001083da79f', 'jusfruit', 0),
	(298, 'steam:1100001083da79f', 'hydrocodone', 0),
	(299, 'steam:1100001083da79f', 'cchip', 0),
	(300, 'steam:1100001083da79f', 'lighter', 0),
	(301, 'steam:1100001083da79f', 'tunerlaptop', 0),
	(302, 'steam:1100001083da79f', 'fries', 0),
	(303, 'steam:1100001083da79f', 'rhumcoca', 0),
	(304, 'steam:1100001083da79f', 'redbull', 0),
	(305, 'steam:1100001083da79f', 'cocaine', 0),
	(306, 'steam:1100001083da79f', 'chocolate', 0),
	(307, 'steam:1100001083da79f', 'rhum', 0),
	(308, 'steam:1100001083da79f', 'wine', 0),
	(309, 'steam:1100001083da79f', 'cupcake', 0),
	(310, 'steam:1100001083da79f', 'cash', 0),
	(311, 'steam:1100001083da79f', 'vine', 0),
	(312, 'steam:1100001083da79f', 'whiskycoca', 0),
	(313, 'steam:1100001083da79f', 'whisky', 0),
	(314, 'steam:1100001083da79f', 'beer', 1),
	(315, 'steam:1100001083da79f', 'weedseed', 0),
	(316, 'steam:1100001083da79f', 'bolchips', 0),
	(317, 'steam:1100001083da79f', 'chips', 0),
	(318, 'steam:1100001083da79f', 'weedqtr', 0),
	(319, 'steam:1100001083da79f', 'weedeight', 0),
	(320, 'steam:1100001083da79f', 'lotteryticket', 0),
	(321, 'steam:1100001083da79f', 'electronics', 0),
	(322, 'steam:1100001083da79f', 'energy', 0),
	(323, 'steam:1100001083da79f', 'goldring', 0),
	(324, 'steam:1100001083da79f', 'saucisson', 0),
	(325, 'steam:1100001083da79f', 'advdecryptor', 0),
	(326, 'steam:1100001083da79f', 'ice', 0),
	(327, 'steam:1100001083da79f', 'cigarett', 0),
	(328, 'steam:1100001083da79f', 'fanta', 0),
	(329, 'steam:1100001083da79f', 'gauze', 0),
	(330, 'steam:1100001083da79f', 'bolnoixcajou', 0),
	(331, 'steam:1100001083da79f', 'moneyshot', 0),
	(332, 'steam:1100001083da79f', 'radio', 0),
	(333, 'steam:1100001083da79f', 'fishingrod', 0),
	(334, 'steam:1100001083da79f', 'shark', 0),
	(335, 'steam:1100001083da79f', 'turtle', 0),
	(336, 'steam:1100001083da79f', 'contrat', 0),
	(337, 'steam:1100001083da79f', 'grand_cru', 0),
	(338, 'steam:1100001083da79f', 'rawgold', 0),
	(339, 'steam:1100001083da79f', 'oxy', 0),
	(340, 'steam:1100001083da79f', 'turtlebait', 0),
	(341, 'steam:1100001083da79f', 'repairkit', 0),
	(342, 'steam:1100001083da79f', 'bolcacahuetes', 0),
	(343, 'steam:1100001083da79f', 'chickensandwich', 0),
	(344, 'steam:1100001083da79f', 'bolpistache', 0),
	(345, 'steam:1100001083da79f', 'hamburger', 0),
	(346, 'steam:1100001083da79f', 'bandage', 0),
	(347, 'steam:1100001083da79f', 'medikit', 0),
	(348, 'steam:1100001083da79f', 'grapperaisin', 0),
	(349, 'steam:1100001083da79f', 'crunchytaco', 0),
	(350, 'steam:1100001083da79f', 'morphine', 0),
	(351, 'steam:1100001083da79f', 'betequilaer', 0),
	(352, 'steam:1100001083da79f', 'pills', 0),
	(353, 'steam:1100001083da79f', 'decryptor', 0),
	(354, 'steam:1100001083da79f', 'bait', 0),
	(355, 'steam:1100001083da79f', 'meth_pooch', 0),
	(356, 'steam:1100001083da79f', 'heartstopper', 0),
	(357, 'steam:1100001083da79f', 'caprisun', 0),
	(358, 'steam:1100001083da79f', 'black_chip', 0),
	(359, 'steam:1100001083da79f', 'drugscales', 0),
	(360, 'steam:1100001083da79f', 'cashew', 0),
	(361, 'steam:1100001083da79f', 'icetea', 0),
	(362, 'steam:1100001083da79f', 'drpepper', 0),
	(363, 'steam:1100001083da79f', 'gps', 0),
	(364, 'steam:1100001083da79f', 'fixkit', 0),
	(365, 'steam:1100001083da79f', 'blowtorch', 0),
	(366, 'steam:1100001083da79f', 'highgradefert', 4),
	(367, 'steam:1100001083da79f', 'plantpot', 0),
	(368, 'steam:1100001083da79f', 'rollingpaper', 0),
	(369, 'steam:1100001083da79f', 'scubagear', 0),
	(370, 'steam:1100001083da79f', '5gbag', 0),
	(371, 'steam:1100001083da79f', '50gbag', 0),
	(372, 'steam:1100001083da79f', 'tequila', 0),
	(373, 'steam:1100001083da79f', 'cigarette', 0),
	(374, 'steam:1100001083da79f', 'pistachio', 0),
	(375, 'steam:1100001083da79f', '9mm_rounds', 0),
	(376, 'steam:1100001083da79f', '100gbag', 0),
	(377, 'steam:1100001083da79f', 'binocular', 0),
	(378, 'steam:1100001083da79f', '1gbag', 0),
	(379, 'steam:1100001083da79f', 'lemonade', 0),
	(380, 'steam:1100001083da79f', 'lowgradefert', 0),
	(381, 'steam:1100001083da79f', 'shotgun_shells', 0),
	(382, 'steam:110000100bc09b3', 'gps', 0),
	(383, 'steam:110000100bc09b3', 'tequila', 0),
	(384, 'steam:110000100bc09b3', 'binocular', 0),
	(385, 'steam:110000100bc09b3', 'drugscales', 0),
	(386, 'steam:110000100bc09b3', 'chips', 0),
	(387, 'steam:110000100bc09b3', 'chocolate', 0),
	(388, 'steam:110000100bc09b3', 'energy', 0),
	(389, 'steam:110000100bc09b3', 'plantpot', 0),
	(390, 'steam:110000100bc09b3', 'blowtorch', 0),
	(391, 'steam:110000100bc09b3', 'cocacola', 0),
	(392, 'steam:110000100bc09b3', 'wine', 0),
	(393, 'steam:110000100bc09b3', '1gbag', 0),
	(394, 'steam:110000100bc09b3', 'scubagear', 0),
	(395, 'steam:110000100bc09b3', '5gbag', 0),
	(396, 'steam:110000100bc09b3', '50gbag', 0),
	(397, 'steam:110000100bc09b3', 'cupcake', 0),
	(398, 'steam:110000100bc09b3', '100gbag', 0),
	(399, 'steam:110000100bc09b3', 'cashew', 0),
	(400, 'steam:110000100bc09b3', 'fixkit', 0),
	(401, 'steam:110000100bc09b3', 'icetea', 0),
	(402, 'steam:110000100bc09b3', 'whisky', 0),
	(403, 'steam:110000100bc09b3', 'shotgun_shells', 0),
	(404, 'steam:110000100bc09b3', 'vodka', 0),
	(405, 'steam:110000100bc09b3', 'grand_cru', 0),
	(406, 'steam:110000100bc09b3', 'rollingpaper', 0),
	(407, 'steam:110000100bc09b3', 'drpepper', 0),
	(408, 'steam:110000100bc09b3', 'hamburger', 0),
	(409, 'steam:110000100bc09b3', 'lemonade', 0),
	(410, 'steam:110000100bc09b3', 'beer', 0),
	(411, 'steam:110000100bc09b3', '9mm_rounds', 0),
	(412, 'steam:110000100bc09b3', 'lowgradefert', 0),
	(413, 'steam:110000100bc09b3', 'cigarette', 0),
	(414, 'steam:110000100bc09b3', 'highgradefert', 0),
	(415, 'steam:110000100bc09b3', 'pistachio', 0),
	(416, 'steam:110000100bc09b3', 'lighter', 0),
	(417, 'steam:1100001083da79f', 'carokit', 0),
	(418, 'steam:110000100bc09b3', 'bandage', 0),
	(419, 'steam:110000100bc09b3', 'medikit', 0),
	(420, 'steam:110000100bc09b3', 'carokit', 0),
	(421, 'steam:1100001083da79f', 'bagofdope', 0),
	(422, 'steam:1100001083da79f', 'highgradefemaleseed', 1),
	(423, 'steam:1100001083da79f', 'lowgrademaleseed', 0),
	(424, 'steam:1100001083da79f', 'wateringcan', 1),
	(425, 'steam:1100001083da79f', 'trimmedweed', 0),
	(426, 'steam:1100001083da79f', 'dopebag', 0),
	(427, 'steam:1100001083da79f', 'highgrademaleseed', 0),
	(428, 'steam:1100001083da79f', 'lowgradefemaleseed', 0),
	(429, 'steam:1100001083da79f', 'purifiedwater', 4),
	(430, 'steam:11000013a865c79', 'cocaine', 0),
	(431, 'steam:11000013a865c79', 'contrat', 0),
	(432, 'steam:11000013a865c79', 'clothe', 0),
	(433, 'steam:11000013a865c79', 'lemonade', 0),
	(434, 'steam:11000013a865c79', 'binoculars', 0),
	(435, 'steam:11000013a865c79', 'electronics', 0),
	(436, 'steam:11000013a865c79', 'iron', 0),
	(437, 'steam:11000013a865c79', 'bandage', 0),
	(438, 'steam:11000013a865c79', 'lighter', 0),
	(439, 'steam:11000013a865c79', 'cokebrick', 0),
	(440, 'steam:11000013a865c79', 'icetea', 0),
	(441, 'steam:11000013a865c79', 'hydrocodone', 0),
	(442, 'steam:11000013a865c79', 'heartstopper', 0),
	(443, 'steam:11000013a865c79', 'bolcacahuetes', 0),
	(444, 'steam:11000013a865c79', 'medikit', 0),
	(445, 'steam:11000013a865c79', 'clip', 0),
	(446, 'steam:11000013a865c79', 'grapperaisin', 0),
	(447, 'steam:11000013a865c79', 'diamond', 0),
	(448, 'steam:11000013a865c79', '5gbag', 0),
	(449, 'steam:11000013a865c79', 'turtlebait', 0),
	(450, 'steam:11000013a865c79', 'rhumcoca', 0),
	(451, 'steam:11000013a865c79', 'cashew', 0),
	(452, 'steam:11000013a865c79', 'stone', 0),
	(453, 'steam:11000013a865c79', 'fishingrod', 0),
	(454, 'steam:11000013a865c79', 'rhum', 0),
	(455, 'steam:11000013a865c79', 'beer', 0),
	(456, 'steam:11000013a865c79', 'highgradefemaleseed', 0),
	(457, 'steam:11000013a865c79', 'firstaidkit', 0),
	(458, 'steam:11000013a865c79', 'crunchytaco', 0),
	(459, 'steam:11000013a865c79', 'packaged_plank', 0),
	(460, 'steam:11000013a865c79', 'bagofdope', 0),
	(461, 'steam:11000013a865c79', 'jusfruit', 0),
	(462, 'steam:11000013a865c79', 'petrol_raffin', 0),
	(463, 'steam:11000013a865c79', 'meth', 0),
	(464, 'steam:11000013a865c79', 'fries', 0),
	(465, 'steam:11000013a865c79', 'highgrademaleseed', 0),
	(466, 'steam:11000013a865c79', 'pills', 0),
	(467, 'steam:11000013a865c79', 'watch', 0),
	(468, 'steam:11000013a865c79', 'firstaid', 0),
	(469, 'steam:11000013a865c79', 'energy', 0),
	(470, 'steam:11000013a865c79', 'alive_chicken', 0),
	(471, 'steam:11000013a865c79', 'binocular', 0),
	(472, 'steam:11000013a865c79', 'vodka', 0),
	(473, 'steam:11000013a865c79', 'packaged_chicken', 0),
	(474, 'steam:11000013a865c79', 'darknet', 0),
	(475, 'steam:11000013a865c79', 'carokit', 0),
	(476, 'steam:11000013a865c79', 'weedqtr', 0),
	(477, 'steam:11000013a865c79', 'tunerlaptop', 0),
	(478, 'steam:11000013a865c79', 'gauze', 0),
	(479, 'steam:11000013a865c79', '50gbag', 0),
	(480, 'steam:11000013a865c79', 'ice', 0),
	(481, 'steam:11000013a865c79', 'essence', 0),
	(482, 'steam:11000013a865c79', 'pizza', 0),
	(483, 'steam:11000013a865c79', 'weedeight', 0),
	(484, 'steam:11000013a865c79', '100gbag', 0),
	(485, 'steam:11000013a865c79', 'highgradefert', 0),
	(486, 'steam:11000013a865c79', 'scubagear', 0),
	(487, 'steam:11000013a865c79', 'fanta', 0),
	(488, 'steam:11000013a865c79', 'WEAPON_PUMPSHOTGUN', 0),
	(489, 'steam:11000013a865c79', 'WEAPON_PISTOL', 0),
	(490, 'steam:11000013a865c79', 'fixkit', 0),
	(491, 'steam:11000013a865c79', 'tequila', 0),
	(492, 'steam:11000013a865c79', 'drill', 0),
	(493, 'steam:11000013a865c79', 'fabric', 0),
	(494, 'steam:11000013a865c79', 'purifiedwater', 0),
	(495, 'steam:11000013a865c79', 'petrol', 0),
	(496, 'steam:11000013a865c79', 'redbull', 0),
	(497, 'steam:11000013a865c79', 'cheesebows', 0),
	(498, 'steam:11000013a865c79', 'bolpistache', 0),
	(499, 'steam:11000013a865c79', 'cokeounce', 0),
	(500, 'steam:11000013a865c79', 'gatorade', 0),
	(501, 'steam:11000013a865c79', 'fish', 0),
	(502, 'steam:11000013a865c79', 'bait', 0),
	(503, 'steam:11000013a865c79', 'moneyshot', 0),
	(504, 'steam:11000013a865c79', 'morphine', 0),
	(505, 'steam:11000013a865c79', 'cannabis', 0),
	(506, 'steam:11000013a865c79', 'drugscales', 0),
	(507, 'steam:11000013a865c79', 'wool', 0),
	(508, 'steam:11000013a865c79', 'caprisun', 0),
	(509, 'steam:11000013a865c79', 'pistachio', 0),
	(510, 'steam:11000013a865c79', 'wine', 0),
	(511, 'steam:11000013a865c79', 'lotteryticket', 0),
	(512, 'steam:11000013a865c79', 'shotgun_shells', 0),
	(513, 'steam:11000013a865c79', 'grand_cru', 0),
	(514, 'steam:11000013a865c79', 'vine', 0),
	(515, 'steam:11000013a865c79', 'sandwich', 0),
	(516, 'steam:11000013a865c79', 'chickensandwich', 0),
	(517, 'steam:11000013a865c79', 'whiskycoca', 0),
	(518, 'steam:11000013a865c79', 'whisky', 0),
	(519, 'steam:11000013a865c79', 'lowgrademaleseed', 0),
	(520, 'steam:11000013a865c79', 'goldring', 0),
	(521, 'steam:11000013a865c79', 'betequilaer', 0),
	(522, 'steam:11000013a865c79', '9mm_rounds', 0),
	(523, 'steam:11000013a865c79', 'chocolate', 0),
	(524, 'steam:11000013a865c79', 'WEAPON_STUNGUN', 0),
	(525, 'steam:11000013a865c79', 'WEAPON_KNIFE', 0),
	(526, 'steam:11000013a865c79', 'WEAPON_FLASHLIGHT', 0),
	(527, 'steam:11000013a865c79', '1gbag', 0),
	(528, 'steam:11000013a865c79', 'lockpick', 0),
	(529, 'steam:11000013a865c79', 'hamburger', 0),
	(530, 'steam:11000013a865c79', 'black_chip', 0),
	(531, 'steam:11000013a865c79', 'cutted_wood', 0),
	(532, 'steam:11000013a865c79', 'raisin', 0),
	(533, 'steam:11000013a865c79', 'plantpot', 0),
	(534, 'steam:11000013a865c79', 'washed_stone', 0),
	(535, 'steam:11000013a865c79', 'gps', 0),
	(536, 'steam:11000013a865c79', 'cash', 0),
	(537, 'steam:11000013a865c79', 'coffee', 0),
	(538, 'steam:11000013a865c79', 'turtle', 0),
	(539, 'steam:11000013a865c79', 'bolnoixcajou', 0),
	(540, 'steam:11000013a865c79', 'trimmedweed', 0),
	(541, 'steam:11000013a865c79', 'shark', 0),
	(542, 'steam:11000013a865c79', 'radio', 0),
	(543, 'steam:11000013a865c79', 'jewels', 0),
	(544, 'steam:11000013a865c79', 'drpepper', 0),
	(545, 'steam:11000013a865c79', 'soda', 0),
	(546, 'steam:11000013a865c79', 'slaughtered_chicken', 0),
	(547, 'steam:11000013a865c79', 'goldchain', 0),
	(548, 'steam:11000013a865c79', 'weedseed', 0),
	(549, 'steam:11000013a865c79', 'oxy', 0),
	(550, 'steam:11000013a865c79', 'saucisson', 0),
	(551, 'steam:11000013a865c79', 'rollingpaper', 0),
	(552, 'steam:11000013a865c79', 'rawgold', 0),
	(553, 'steam:11000013a865c79', 'fakeplates', 0),
	(554, 'steam:11000013a865c79', 'bolchips', 0),
	(555, 'steam:11000013a865c79', 'joint', 0),
	(556, 'steam:11000013a865c79', 'chips', 0),
	(557, 'steam:11000013a865c79', 'lowgradefemaleseed', 0),
	(558, 'steam:11000013a865c79', 'blowtorch', 0),
	(559, 'steam:11000013a865c79', 'wateringcan', 0),
	(560, 'steam:11000013a865c79', 'wood', 0),
	(561, 'steam:11000013a865c79', 'cocacola', 0),
	(562, 'steam:11000013a865c79', 'phone', 0),
	(563, 'steam:11000013a865c79', 'cupcake', 0),
	(564, 'steam:11000013a865c79', 'bulletproof', 0),
	(565, 'steam:11000013a865c79', 'meth_pooch', 0),
	(566, 'steam:11000013a865c79', 'cigarett', 0),
	(567, 'steam:11000013a865c79', 'oxygen_mask', 0),
	(568, 'steam:11000013a865c79', 'gold', 0),
	(569, 'steam:11000013a865c79', 'dopebag', 0),
	(570, 'steam:11000013a865c79', 'WEAPON_BAT', 0),
	(571, 'steam:11000013a865c79', 'copper', 0),
	(572, 'steam:11000013a865c79', 'cigarette', 0),
	(573, 'steam:11000013a865c79', 'lowgradefert', 0),
	(574, 'steam:11000013a865c79', 'cchip', 0);
/*!40000 ALTER TABLE `user_inventory` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_licenses
DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.user_licenses: ~5 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
REPLACE INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'weapon', 'steam:1100001083da79f'),
	(2, 'weapon', 'steam:1100001083da79f'),
	(3, 'weapon', 'steam:1100001083da79f'),
	(4, 'weapon', 'steam:1100001083da79f'),
	(5, 'weapon', 'steam:1100001083da79f'),
	(6, 'weapon', 'steam:11000013a865c79'),
	(7, 'weapon', 'steam:1100001083da79f');
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
REPLACE INTO `user_parkings` (`id`, `identifier`, `garage`, `zone`, `vehicle`) VALUES
	(3, 'steam:1100001083da79f', 'VinewoodEstate2650', 10, '{"modSideSkirt":-1,"modHood":-1,"modArmor":-1,"plateIndex":0,"modDoorSpeaker":-1,"modStruts":-1,"pearlescentColor":73,"modTank":-1,"modShifterLeavers":-1,"modSeats":-1,"modDashboard":-1,"modFrontBumper":-1,"modFrontWheels":-1,"extras":[],"modWindows":-1,"modDial":-1,"modSpeakers":-1,"modEngine":-1,"modTrimB":-1,"neonEnabled":[false,false,false,false],"bodyHealth":964.8,"modBackWheels":-1,"modSuspension":-1,"neonColor":[255,0,255],"modFender":-1,"modArchCover":-1,"wheelColor":0,"modGrille":-1,"plate":"21EAX810","modSteeringWheel":-1,"modOrnaments":-1,"modXenon":false,"modTurbo":false,"model":-1848994066,"color2":0,"modSpoilers":-1,"modRoof":-1,"engineHealth":1000.0,"windowTint":-1,"modTrunk":-1,"modExhaust":-1,"modVanityPlate":-1,"modFrame":-1,"modRightFender":-1,"color1":64,"modBrakes":-1,"dirtLevel":1.5,"modAPlate":-1,"modAirFilter":-1,"modHydrolic":-1,"modTransmission":-1,"modHorns":-1,"modAerials":-1,"fuelLevel":65.0,"modEngineBlock":-1,"tyreSmokeColor":[255,255,255],"modRearBumper":-1,"modTrimA":-1,"modLivery":-1,"modPlateHolder":-1,"modSmokeEnabled":false,"wheels":0}'),
	(4, 'steam:1100001083da79f', 'VinewoodEstate2650', 1, '{"modStruts":-1,"modEngineBlock":-1,"modSuspension":-1,"modAPlate":-1,"modPlateHolder":-1,"modOrnaments":-1,"wheels":0,"modXenon":false,"modRightFender":-1,"modVanityPlate":-1,"modAerials":-1,"modSideSkirt":-1,"modTrunk":-1,"modBrakes":-1,"modArchCover":-1,"color1":64,"modSeats":-1,"windowTint":-1,"modFrontBumper":-1,"modBackWheels":-1,"modDashboard":-1,"extras":[],"neonEnabled":[false,false,false,false],"pearlescentColor":73,"tyreSmokeColor":[255,255,255],"modHood":-1,"neonColor":[255,0,255],"modAirFilter":-1,"modWindows":-1,"modHorns":-1,"modTrimA":-1,"modTrimB":-1,"modRearBumper":-1,"modHydrolic":-1,"engineHealth":968.4,"plate":"63QKU468","plateIndex":0,"modFrame":-1,"modShifterLeavers":-1,"modExhaust":-1,"wheelColor":0,"modRoof":-1,"modFrontWheels":-1,"modDoorSpeaker":-1,"modEngine":-1,"fuelLevel":65.0,"modLivery":-1,"color2":0,"modTank":-1,"dirtLevel":5.8,"modSmokeEnabled":false,"model":-1848994066,"modTransmission":-1,"bodyHealth":867.7,"modSpeakers":-1,"modFender":-1,"modArmor":-1,"modDial":-1,"modGrille":-1,"modTurbo":false,"modSteeringWheel":-1,"modSpoilers":-1}'),
	(11, 'steam:1100001083da79f', 'SteeleWay1150', 5, '{"modArchCover":-1,"modSteeringWheel":-1,"neonEnabled":[false,false,false,false],"modExhaust":-1,"modFender":-1,"modTransmission":-1,"modSpoilers":-1,"modSeats":-1,"neonColor":[255,0,255],"fuelLevel":65.0,"pearlescentColor":73,"plateIndex":0,"dirtLevel":2.4,"tyreSmokeColor":[255,255,255],"modBackWheels":-1,"modSmokeEnabled":false,"modHood":-1,"modDashboard":-1,"modEngine":-1,"color2":0,"modWindows":-1,"wheelColor":0,"modArmor":-1,"modShifterLeavers":-1,"modRearBumper":-1,"modTrimA":-1,"modOrnaments":-1,"wheels":0,"windowTint":-1,"modSuspension":-1,"modDoorSpeaker":-1,"engineHealth":1000.0,"modHydrolic":-1,"model":-1848994066,"modTrimB":-1,"modFrame":-1,"modRightFender":-1,"modFrontWheels":-1,"modXenon":false,"modGrille":-1,"modVanityPlate":-1,"color1":64,"modPlateHolder":-1,"modBrakes":-1,"modTank":-1,"modFrontBumper":-1,"modLivery":-1,"modHorns":-1,"modDial":-1,"modAPlate":-1,"modSpeakers":-1,"modRoof":-1,"modTurbo":false,"modAirFilter":-1,"modEngineBlock":-1,"plate":"81QLT453","modTrunk":-1,"extras":[],"modAerials":-1,"modStruts":-1,"modSideSkirt":-1,"bodyHealth":978.2}');
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for table essentialmode.user_policearmory
DROP TABLE IF EXISTS `user_policearmory`;
CREATE TABLE IF NOT EXISTS `user_policearmory` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weapons` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table essentialmode.user_policearmory: ~2 rows (approximately)
/*!40000 ALTER TABLE `user_policearmory` DISABLE KEYS */;
REPLACE INTO `user_policearmory` (`identifier`, `weapons`) VALUES
	('steam:110000100bc09b3', 'WEAPON_CARBINERIFLE, '),
	('steam:1100001083da79f', 'WEAPON_CARBINERIFLE, WEAPON_PISTOL, WEAPON_SMG, WEAPON_BZGAS, '),
	('steam:11000013a865c79', 'WEAPON_BZGAS, WEAPON_STUNGUN, WEAPON_PISTOL, WEAPON_FLASHLIGHT, WEAPON_CARBINERIFLE, ');
/*!40000 ALTER TABLE `user_policearmory` ENABLE KEYS */;

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
REPLACE INTO `weashops` (`id`, `zone`, `item`, `price`) VALUES
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
  `last_connection` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ban_reason` text DEFAULT NULL,
  `ban_until` timestamp NULL DEFAULT NULL,
  `vip` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table essentialmode.whitelist: ~2 rows (approximately)
/*!40000 ALTER TABLE `whitelist` DISABLE KEYS */;
REPLACE INTO `whitelist` (`identifier`, `last_connection`, `ban_reason`, `ban_until`, `vip`) VALUES
	('steam:110000100bc09b3', '2019-11-29 13:33:18', NULL, NULL, 0),
	('steam:1100001083da79f', '2019-11-25 19:55:06', NULL, NULL, 0),
	('steam:11000013a865c79', '2020-04-10 22:13:27', NULL, NULL, 0);
/*!40000 ALTER TABLE `whitelist` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
