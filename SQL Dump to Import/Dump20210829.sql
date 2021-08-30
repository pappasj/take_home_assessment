-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: bestmatchedrestuarantsschema
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cuisines`
--

DROP TABLE IF EXISTS `cuisines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisines` (
  `id` int DEFAULT NULL,
  `name` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisines`
--

LOCK TABLES `cuisines` WRITE;
/*!40000 ALTER TABLE `cuisines` DISABLE KEYS */;
INSERT INTO `cuisines` VALUES (1,'American'),(2,'Chinese'),(3,'Thai'),(4,'Italian'),(5,'French'),(6,'Japanese'),(7,'Turkish'),(8,'Korean'),(9,'Vietnamese'),(10,'Indian'),(11,'Spanish'),(12,'Greek'),(13,'Mexican'),(14,'Malaysian'),(15,'African'),(16,'German'),(17,'Indonesian'),(18,'Russian'),(19,'Other');
/*!40000 ALTER TABLE `cuisines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `name` text,
  `customer_rating` int DEFAULT NULL,
  `distance` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `cuisine_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES ('Deliciousgenix',4,1,10,11),('Herbed Delicious',4,7,20,9),('Deliciousscape',3,7,50,1),('Hideaway Delicious',2,5,40,12),('Cuts Delicious',3,9,25,8),('Lord Delicious',1,7,35,18),('Hilltop Delicious',3,3,45,6),('Fine Delicious',4,5,45,4),('Deliciousish',1,3,50,12),('Havana Delicious',3,1,35,8),('Deliciouspad',3,10,40,13),('Deliciousbea',5,6,50,15),('Deliciousquipo',2,2,10,19),('Fed Delicious',2,9,35,4),('Hotspot Delicious',4,10,25,13),('Gusto Delicious',5,3,50,2),('Deliciouszen',2,6,30,5),('Deliciouszilla',4,1,15,2),('Deliciousio',5,9,40,19),('Local Delicious',5,4,20,12),('Crisp Delicious',5,2,45,18),('Deliciousoryx',1,5,25,2),('Bang Delicious',5,2,15,18),('Deliciouszoid',3,2,30,4),('Hearty ChowClick',2,6,25,8),('Traditional Chow',5,2,15,11),('Bash Chow',2,6,45,9),('Minty Chow',4,8,35,5),('Chowaza',3,9,20,12),('Lucha Chow',3,4,25,14),('Hut Chow',2,2,10,3),('Wish Chow',3,1,40,1),('Chowish',3,8,10,19),('Bazaar Chow',4,4,40,1),('Story Chow',2,10,30,19),('Hideout Chow',2,7,10,15),('Strip Chow',5,9,35,19),('Aroma Chow',5,10,10,18),('Chowology',5,9,30,6),('Chowify',4,4,45,2),('Piece Chow',4,9,10,13),('Cave Chow',3,4,40,6),('Wagon Chow',3,9,10,1),('Choworyx',2,3,40,7),('Whole Chow',2,7,15,4),('Central Chow',3,7,45,1),('Ambrosial Chow',4,5,50,15),('Place Chow',2,2,15,11),('Reservation Table',4,3,20,13),('Chopped Table',1,5,40,3),('Herbed Table',1,1,15,12),('Palate Table',1,1,15,14),('Grove Table',5,2,10,13),('Fodder Table',4,1,20,8),('Tablebes',4,2,40,13),('Chow Table',1,1,10,2),('Bay Table',3,7,50,18),('Tablebea',1,7,25,10),('Fine Table',2,5,15,12),('Cellar Table',4,8,25,8),('Boy Table',3,9,30,13),('Tableomatic',1,5,20,16),('Tableque',4,3,10,4),('Tableio',3,3,40,1),('Tableoont',5,10,20,12),('Tableadora',5,2,25,8),('Tableooze',3,1,50,16),('Garnish Table',4,9,40,4),('Brew Table',2,10,15,8),('Hotspot Table',3,7,40,15),('Fresh Table',3,2,30,1),('Appetite Table',1,10,40,8),('Cave Tasty',5,10,15,18),('Whole Tasty',1,1,30,5),('Tastyio',3,10,30,14),('Lane Tasty',5,5,35,2),('Nouveau Tasty',1,9,50,9),('Relish Tasty',3,8,50,13),('Tastyooze',3,6,20,11),('Binge Tasty',1,8,10,4),('Fed Tasty',3,5,25,2),('Diced Tasty',5,4,40,7),('Tastylux',5,8,35,14),('Tastyaza',3,7,45,18),('Grill Tasty',2,2,30,2),('Tastyopolis',1,6,20,8),('Stand Tasty',4,3,40,16),('Feast Tasty',2,8,20,18),('Baby Tasty',3,1,20,8),('Fodder Tasty',4,4,30,9),('Takeout Tasty',5,5,20,11),('Wrap Tasty',1,10,30,4),('Tastylia',3,4,50,3),('Havana Tasty',4,10,15,11),('Crumb Tasty',2,5,25,11),('Dished Tasty',1,7,25,18),('Chop Grill',5,8,10,17),('Festive Grill',2,4,35,6),('Me Grill',5,5,25,9),('Lounge Grill',3,10,40,5),('Coastal Grill',2,7,10,17),('Perfection Grill',3,3,50,7),('Hungry Grill',3,4,50,9),('Cater Grill',4,3,50,5),('Presto Grill',5,2,40,15),('Crispy Grill',1,7,45,19),('Grilltastic',3,3,30,14),('Grillsio',3,4,15,19),('Tasteful Grill',5,9,10,2),('Yummy Grill',1,8,50,15),('Crisp Grill',2,6,50,19),('Grillya',2,7,40,13),('Cuts Grill',1,7,30,8),('Grillarc',2,3,25,13),('Wish Grill',1,8,30,3),('Dished Grill',3,1,10,8),('Divine Grill',1,9,25,7),('Wedge Grill',2,4,35,2),('Gusto Grill',3,10,10,3),('Chef Grill',5,4,35,19),('Grove Palace',2,4,20,1),('Tasteful Palace',2,3,20,12),('Perfection Palace',3,1,20,3),('Palaceio',4,7,45,14),('Palaceado',3,6,25,4),('Flavor Palace',2,2,20,14),('Palaceadri',4,8,50,11),('Hotspot Palace',1,3,35,3),('Palaceopedia',5,10,25,8),('Gusto Palace',5,10,30,9),('Feed Palace',2,5,20,7),('Smash Palace',1,9,10,1),('Gnaw Palace',1,3,50,13),('Dished Palace',5,7,25,5),('Spicy PalaceClick to check domain availability.',2,6,10,9),('Nouveau Palace',3,8,15,4),('Relish Palace',2,3,40,9),('Palaceistic',2,10,45,9),('Palacearo',1,4,50,4),('Place Palace',5,2,40,17),('Aroma Palace',2,5,40,1),('Fury Palace',5,3,30,17),('Palacex',2,6,15,18),('Palaceocity',1,7,25,15),('Ambrosial Yummy',3,7,50,17),('Nibble Yummy',1,8,15,2),('Accent Yummy',5,3,40,17),('Yummylia',1,1,40,5),('Hotspot Yummy',1,3,45,17),('Chef Yummy',4,9,10,12),('Acclaimed Yummy',5,8,50,8),('Yummyella',2,3,40,6),('Palace Yummy',4,2,50,19),('Sizzle Yummy',3,1,15,18),('Galore Yummy',2,9,40,9),('Yummyquipo',2,3,45,7),('Divine Yummy',1,10,25,13),('Aladdin Yummy',1,4,30,15),('Yummyscape',1,3,35,13),('Yummylance',1,9,10,6),('Crisp Yummy',1,10,25,13),('Cantina Yummy',5,6,20,18),('Cellar Yummy',2,8,50,6),('Festive Yummy',2,2,25,15),('Upscale Yummy',2,10,45,11),('Lucha Yummy',1,10,40,3),('Diced Yummy',5,3,20,14),('Factory Yummy',4,3,15,13),('Dude Kitchen',4,10,35,5),('Kitchengenics',4,3,20,8),('Galore Kitchen',5,10,45,11),('Story Kitchen',5,3,20,15),('Kitchenbia',2,1,30,12),('Fuel Kitchen',4,7,40,2),('Dished Kitchen',5,3,30,14),('Kitchenish',3,2,20,6),('Bang Kitchen',1,1,40,11),('Bit Kitchen',1,1,30,18),('Kitchenlia',2,7,50,1),('Kitchenster',2,1,10,1),('Devine Kitchen',3,9,30,16),('Connoisseur Kitchen',2,6,30,19),('Munchies Kitchen',5,5,45,9),('Fine Kitchen',2,10,20,17),('Crisp Kitchen',1,3,35,2),('Hut Kitchen',3,5,10,17),('Kitchenvio',3,1,50,12),('Kitchenarc',2,5,10,15),('Kitchenry',4,6,40,11),('Safety Kitchen',2,4,20,6),('Smash Kitchen',1,2,50,7),('Brew Kitchen',2,4,40,18),('Connoisseur Bar',2,2,25,17),('Bariva',5,10,40,10),('Barscape',3,4,15,4),('Hot Bar',4,4,20,2),('Place Bar',3,5,50,13),('Grill Bar',1,9,40,5),('Dine Bar',5,10,35,15),('Wave Bar',4,8,20,3);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bestmatchedrestuarantsschema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-29 22:48:37
