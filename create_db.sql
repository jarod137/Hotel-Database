-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: los_dulces_resort
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `los_dulces_resort`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `los_dulces_resort` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `los_dulces_resort`;

--
-- Table structure for table `affiliatedwith`
--

DROP TABLE IF EXISTS `affiliatedwith`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `affiliatedwith` (
  `employeeID` int DEFAULT NULL,
  `hotelID` int DEFAULT NULL,
  `deptID` int DEFAULT NULL,
  KEY `employeeID` (`employeeID`),
  KEY `hotelID` (`hotelID`),
  KEY `deptID` (`deptID`),
  CONSTRAINT `affiliatedwith_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `manager` (`employeeID`),
  CONSTRAINT `affiliatedwith_ibfk_2` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`),
  CONSTRAINT `affiliatedwith_ibfk_3` FOREIGN KEY (`deptID`) REFERENCES `department` (`deptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `affiliatedwith`
--

LOCK TABLES `affiliatedwith` WRITE;
/*!40000 ALTER TABLE `affiliatedwith` DISABLE KEYS */;
INSERT INTO `affiliatedwith` VALUES (1, 1, 1);
INSERT INTO `affiliatedwith` VALUES (2, 2, 2);
INSERT INTO `affiliatedwith` VALUES (3, 3, 3);
INSERT INTO `affiliatedwith` VALUES (4, 4, 4);
INSERT INTO `affiliatedwith` VALUES (5, 5, 5);
/*!40000 ALTER TABLE `affiliatedwith` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenity`
--

DROP TABLE IF EXISTS `amenity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenity` (
  `amenityID` int NOT NULL,
  `amenityType` varchar(30) DEFAULT NULL,
  `amenityName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`amenityID`),
  CONSTRAINT `amenity_chk_1` CHECK ((`amenityType` in (_utf8mb4'Consumable',_utf8mb4'Return'))),
  CONSTRAINT `amenity_chk_2` CHECK ((`amenityName` in (_utf8mb4'Pillow',_utf8mb4'Blanket',_utf8mb4'Iron',_utf8mb4'Robe',_utf8mb4'Hair Dryer',_utf8mb4'Toiletries')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenity`
--

LOCK TABLES `amenity` WRITE;
/*!40000 ALTER TABLE `amenity` DISABLE KEYS */;
INSERT INTO `amenity` VALUES (1, 'Return', 'Pillow');
INSERT INTO `amenity` VALUES (2, 'Return', 'Blanket');
INSERT INTO `amenity` VALUES (3, 'Return', 'Iron');
INSERT INTO `amenity` VALUES (4, 'Return', 'Robe');
INSERT INTO `amenity` VALUES (5, 'Consumable', 'Toiletries');
/*!40000 ALTER TABLE `amenity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivers`
--

DROP TABLE IF EXISTS `delivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivers` (
  `employeeID` int DEFAULT NULL,
  `guestID` int DEFAULT NULL,
  `amenityID` int DEFAULT NULL,
  `deliveryDateTime` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  KEY `employeeID` (`employeeID`),
  KEY `guestID` (`guestID`),
  KEY `amenityID` (`amenityID`),
  CONSTRAINT `delivers_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `staff` (`employeeID`),
  CONSTRAINT `delivers_ibfk_2` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`),
  CONSTRAINT `delivers_ibfk_3` FOREIGN KEY (`amenityID`) REFERENCES `amenity` (`amenityID`),
  CONSTRAINT `delivers_chk_1` CHECK ((`quantity` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivers`
--

LOCK TABLES `delivers` WRITE;
/*!40000 ALTER TABLE `delivers` DISABLE KEYS */;
INSERT INTO `delivers` VALUES (6, 1, 1, '2023-01-01 12:00:00', 2);
INSERT INTO `delivers` VALUES (7, 2, 2, '2023-01-02 13:00:00', 3);
INSERT INTO `delivers` VALUES (8, 3, 3, '2023-01-03 14:00:00', 1);
INSERT INTO `delivers` VALUES (9, 4, 4, '2023-01-04 15:00:00', 4);
INSERT INTO `delivers` VALUES (10, 5, 5, '2023-01-05 16:00:00', 5);
/*!40000 ALTER TABLE `delivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `deptID` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`deptID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `manager` (`employeeID`),
  CONSTRAINT `department_chk_1` CHECK ((`name` in (_utf8mb4'Facility',_utf8mb4'Office',_utf8mb4'Housekeeping',_utf8mb4'Restaurant',_utf8mb4'Security')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1, 'Facility', 1);
INSERT INTO `department` VALUES (2, 'Office', 2);
INSERT INTO `department` VALUES (3, 'Housekeeping', 3);
INSERT INTO `department` VALUES (4, 'Restaurant', 4);
INSERT INTO `department` VALUES (5, 'Security', 5);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guestID` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `roomID` int DEFAULT NULL,
  PRIMARY KEY (`guestID`),
  KEY `roomID` (`roomID`),
  CONSTRAINT `guest_ibfk_1` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (1, 'Guest 1', '123 Guest St', '555-123-4567', 1);
INSERT INTO `guest` VALUES (2, 'Guest 2', '456 Guest St', '555-456-7890', 2);
INSERT INTO `guest` VALUES (3, 'Guest 3', '789 Guest St', '555-789-0123', 3);
INSERT INTO `guest` VALUES (4, 'Guest 4', '101 Guest St', '555-101-2345', 4);
INSERT INTO `guest` VALUES (5, 'Guest 5', '202 Guest St', '555-202-3456', 5);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotelID` int NOT NULL,
  `hotelName` varchar(40) DEFAULT NULL,
  `hotelAddress` varchar(40) DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  PRIMARY KEY (`hotelID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `manager` (`employeeID`),
  CONSTRAINT `hotel_chk_1` CHECK ((`capacity` <= 250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (1,'Hotel Dulces SueÃ±os Silver City',NULL,250,1);
INSERT INTO `hotel` VALUES (2, 'Hotel B', '456 Elm St', 4, 2);
INSERT INTO `hotel` VALUES (3, 'Hotel C', '789 Oak St', 250, 3);
INSERT INTO `hotel` VALUES (4, 'Hotel D', '101 Pine St', 180, 4);
INSERT INTO `hotel` VALUES (5, 'Hotel E', '202 Maple St', 220, 5);
INSERT INTO `hotel` VALUES (6,'Hotel F',NULL,249,11);
INSERT INTO `hotel` VALUES (7,'Hotel G','789 Pine St',1,12);
INSERT INTO `hotel` VALUES (8,'Hotel H','101 Oak St',200,13);
INSERT INTO `hotel` VALUES (9,'Hotel I','202 Maple St',150,14);
INSERT INTO `hotel` VALUES (10,'Hotel J','303 Birch St',244,15);
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `employeeID` int NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `manager_chk_1` CHECK ((`position` in (_utf8mb4'General Manager',_utf8mb4'Rooms Manager',_utf8mb4'Housekeeping Manager',_utf8mb4'Restaurant Manager',_utf8mb4'Front Office Manager',_utf8mb4'Valet Manager',_utf8mb4'IT Manager',_utf8mb4'Facilities Manager')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1, 'John Doe', 'General Manager');
INSERT INTO `manager` VALUES (2, 'Alice Smith', 'Rooms Manager');
INSERT INTO `manager` VALUES (3, 'Bob Johnson', 'Housekeeping Manager');
INSERT INTO `manager` VALUES (4, 'Eve Davis', 'Restaurant Manager');
INSERT INTO `manager` VALUES (5, 'Charlie Brown', 'Front Office Manager');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oncall`
--

DROP TABLE IF EXISTS `oncall`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oncall` (
  `employeeID` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `oncall_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `staff` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oncall`
--

LOCK TABLES `oncall` WRITE;
/*!40000 ALTER TABLE `oncall` DISABLE KEYS */;
INSERT INTO `oncall` VALUES (6, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (7, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (8, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (9, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (10, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (11, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (12, '2023-01-01', '2023-01-07');
INSERT INTO `oncall` VALUES (13, '2023-01-01', '2023-01-07');
/*!40000 ALTER TABLE `oncall` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rental`
--

DROP TABLE IF EXISTS `rental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rental` (
  `guestID` int DEFAULT NULL,
  `itemName` varchar(40) DEFAULT NULL,
  `stayID` int DEFAULT NULL,
  `eventDate` date DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  KEY `guestID` (`guestID`),
  KEY `stayID` (`stayID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `rental_ibfk_1` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`),
  CONSTRAINT `rental_ibfk_2` FOREIGN KEY (`stayID`) REFERENCES `stay` (`stayID`),
  CONSTRAINT `rental_ibfk_3` FOREIGN KEY (`employeeID`) REFERENCES `staff` (`employeeID`),
  CONSTRAINT `rental_chk_1` CHECK ((`itemName` in (_utf8mb4'Golf clubs',_utf8mb4'Tennis racket',_utf8mb4'Bicycle',_utf8mb4'Golf cart',_utf8mb4'Games',_utf8mb4'Movies')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rental`
--

LOCK TABLES `rental` WRITE;
/*!40000 ALTER TABLE `rental` DISABLE KEYS */;
INSERT INTO `rental` VALUES (1, 'Golf clubs', 1, '2023-01-02', 6);
INSERT INTO `rental` VALUES (2, 'Tennis racket', 2, '2023-01-03', 7);
INSERT INTO `rental` VALUES (3, 'Bicycle', 3, '2023-01-04', 8);
INSERT INTO `rental` VALUES (4, 'Golf Cart', 4, '2023-01-05', 9);
INSERT INTO `rental` VALUES (5, 'Games', 5, '2023-01-06', 10);
/*!40000 ALTER TABLE `rental` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reserveID` int NOT NULL,
  `guestID` int DEFAULT NULL,
  `employeeID` int DEFAULT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `endDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`reserveID`),
  KEY `guestID` (`guestID`),
  KEY `employeeID` (`employeeID`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`employeeID`) REFERENCES `staff` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1, 1, 6, '2023-01-10 12:00:00', '2023-01-12 12:00:00');
INSERT INTO `reservation` VALUES (2, 2, 7, '2023-01-11 12:00:00', '2023-01-13 12:00:00');
INSERT INTO `reservation` VALUES (3, 3, 8, '2023-01-12 12:00:00', '2023-01-14 12:00:00');
INSERT INTO `reservation` VALUES (4, 4, 9, '2023-01-13 12:00:00', '2023-01-15 12:00:00');
INSERT INTO `reservation` VALUES (5, 5, 10, '2023-01-14 12:00:00', '2023-01-16 12:00:00');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `hotelID` int DEFAULT NULL,
  `roomID` int NOT NULL,
  `roomType` varchar(40) NOT NULL,
  `price` decimal(10,2),
  PRIMARY KEY (`roomID`,`roomType`),
  KEY `hotelID` (`hotelID`),
  CONSTRAINT `room_ibfk_1` FOREIGN KEY (`hotelID`) REFERENCES `hotel` (`hotelID`),
  CONSTRAINT `room_chk_1` CHECK ((`roomID` between 1 and 250)),
  CONSTRAINT `room_chk_2` CHECK ((`roomType` in (_utf8mb4'King',_utf8mb4'Double Queen',_utf8mb4'Double Queen Accessible')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1, 1, 'King', 200.00);
INSERT INTO `room` VALUES (2, 2, 'Double Queen', 250.00);
INSERT INTO `room` VALUES (3, 3, 'King', 200.00);
INSERT INTO `room` VALUES (4, 4, 'Double Queen', 250.00);
INSERT INTO `room` VALUES (5, 5, 'King', 200.00);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `employeeID` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `position` varchar(40) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `staff_chk_1` CHECK ((`position` in (_utf8mb4'Front Desk Clerk',_utf8mb4'Concierge',_utf8mb4'Housekeeper',_utf8mb4'Valet',_utf8mb4'Chef',_utf8mb4'Server',_utf8mb4'Security Officer')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1, 'Greg', 'staff0@example.com', 'Valet', '111-111-1111');
INSERT INTO `staff` VALUES (6, 'Staff 1', 'staff1@example.com', 'Front Desk Clerk', '555-111-2222');
INSERT INTO `staff` VALUES (7, 'Staff 2', 'staff2@example.com', 'Concierge', '555-222-3333');
INSERT INTO `staff` VALUES (8, 'Staff 3', 'staff3@example.com', 'Housekeeper', '555-333-4444');
INSERT INTO `staff` VALUES (9, 'Staff 4', 'staff4@example.com', 'Valet', '555-444-5555');
INSERT INTO `staff` VALUES (10, 'Staff 5', 'staff5@example.com', 'Chef', '555-555-6666');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stay`
--

DROP TABLE IF EXISTS `stay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stay` (
  `stayID` int NOT NULL,
  `guestID` int DEFAULT NULL,
  `roomID` int DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `cost` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`stayID`),
  KEY `guestID` (`guestID`),
  KEY `roomID` (`roomID`),
  CONSTRAINT `stay_ibfk_1` FOREIGN KEY (`guestID`) REFERENCES `guest` (`guestID`),
  CONSTRAINT `stay_ibfk_2` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`),
  CONSTRAINT `stay_chk_1` CHECK ((`cost` in (200,250)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stay`
--

LOCK TABLES `stay` WRITE;
/*!40000 ALTER TABLE `stay` DISABLE KEYS */;
INSERT INTO `stay` VALUES (1, 1, 1, '2023-01-01', '2023-01-03', 200.00);
INSERT INTO `stay` VALUES (2, 2, 2, '2023-01-02', '2023-01-04', 250.00);
INSERT INTO `stay` VALUES (3, 3, 3, '2023-01-03', '2023-01-05', 200.00);
INSERT INTO `stay` VALUES (4, 4, 4, '2023-01-04', '2023-01-06', 250.00);
INSERT INTO `stay` VALUES (5, 5, 5, '2023-01-05', '2023-01-07', 200.00);
/*!40000 ALTER TABLE `stay` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `employeeID` int NOT NULL,
  `hotelID` int not NULL,
  `roomID` int DEFAULT NULL,
  `roomType` varchar(40) DEFAULT NULL,
  `cleanDate` date NOT NULL,
  `cleanTime` time NOT NULL,
  `cost` decimal(10,2) NOT NULL, 
  PRIMARY KEY (`employeeID`, `hotelID`, `cleanDate`, `cleanTime`, `cost`),
  CONSTRAINT `staff_chk_1` FOREIGN KEY (`employeeID`) REFERENCES `staff` (`employeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (6, 1, 1, 'King', '2023-01-01', '08:00:00', 10.00);
INSERT INTO `service` VALUES (7, 2, 2, 'Double Queen', '2023-01-02', '09:00:00', 15.00);
INSERT INTO `service` VALUES (8, 3, 3, 'King', '2023-01-03', '10:00:00', 10.00);
INSERT INTO `service` VALUES (9, 4, 4, 'Double Queen', '2023-01-04', '11:00:00', 15.00);
INSERT INTO `service` VALUES (10, 5, 5, 'King', '2023-01-05', '12:00:00', 10.00);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-08 17:40:56
