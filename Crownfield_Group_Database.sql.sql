-- CPU4:103 assessment edition. Original MySQL dump plus documented extensions.
-- MySQL dump 10.13  Distrib 8.4.11, for Win64 (x86_64)
--
-- Host: localhost    Database: crownfield_ro_pl_demo
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Current Database: `crownfield_ro_pl_demo`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `crownfield_ro_pl_demo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `crownfield_ro_pl_demo`;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `Appointment_ID` int NOT NULL,
  `Patient_ID` varchar(10) NOT NULL,
  `Clinician_ID` int NOT NULL,
  `Clinic_ID` int NOT NULL,
  `Appointment_Date` date NOT NULL,
  `Appointment_Time` time NOT NULL,
  `Appointment_Type` varchar(50) DEFAULT NULL,
  `Status` varchar(20) NOT NULL DEFAULT 'Scheduled',
  `Notes` text,
  PRIMARY KEY (`Appointment_ID`),
  KEY `fk_appointment_patient` (`Patient_ID`),
  KEY `fk_appointment_clinician` (`Clinician_ID`),
  KEY `fk_appointment_clinic` (`Clinic_ID`),
  CONSTRAINT `fk_appointment_clinic` FOREIGN KEY (`Clinic_ID`) REFERENCES `clinic` (`Clinic_ID`),
  CONSTRAINT `fk_appointment_clinician` FOREIGN KEY (`Clinician_ID`) REFERENCES `clinician` (`Clinician_ID`),
  CONSTRAINT `fk_appointment_patient` FOREIGN KEY (`Patient_ID`) REFERENCES `patient` (`Patient_ID`),
  CONSTRAINT `chk_appointment_status` CHECK ((`Status` in (_utf8mb4'Scheduled',_utf8mb4'Completed',_utf8mb4'Cancelled')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'OP001',1,1,'2026-11-02','09:00:00','Eye Examination','Scheduled',NULL),(2,'OP002',2,2,'2026-11-02','10:00:00','Glaucoma Review','Scheduled',NULL),(3,'OP003',3,3,'2026-11-03','11:00:00','Retina Examination','Scheduled',NULL),(4,'OP004',4,4,'2026-11-03','12:00:00','Cataract Consultation','Scheduled',NULL),(5,'OP005',5,5,'2026-11-04','09:30:00','Vision Assessment','Scheduled',NULL),(6,'OP006',6,6,'2026-11-04','10:30:00','Cornea Examination','Scheduled',NULL),(7,'OP007',7,7,'2026-11-05','11:30:00','Eye Examination','Scheduled',NULL),(8,'OP008',8,8,'2026-11-05','14:00:00','Follow-up Consultation','Scheduled',NULL),(9,'OP009',9,9,'2026-11-06','09:00:00','Retina Review','Scheduled',NULL),(10,'OP010',10,10,'2026-11-06','10:00:00','Vision Assessment','Scheduled',NULL),(11,'OP011',11,11,'2026-11-09','09:00:00','Eye Examination','Scheduled',NULL),(12,'OP012',12,12,'2026-11-09','10:00:00','Glaucoma Review','Scheduled',NULL),(13,'OP013',13,13,'2026-11-10','11:00:00','Retina Examination','Scheduled',NULL),(14,'OP014',1,1,'2026-11-10','14:00:00','Eye Examination','Scheduled',NULL),(15,'OP001',2,1,'2026-11-16','09:30:00','Glaucoma Review','Scheduled',NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinic`
--

DROP TABLE IF EXISTS `clinic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinic` (
  `Clinic_ID` int NOT NULL,
  `Clinic_Name` varchar(120) NOT NULL,
  `Hospital_Name` varchar(140) NOT NULL,
  `City` varchar(80) NOT NULL,
  `Country` varchar(40) NOT NULL,
  PRIMARY KEY (`Clinic_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinic`
--

LOCK TABLES `clinic` WRITE;
/*!40000 ALTER TABLE `clinic` DISABLE KEYS */;
INSERT INTO `clinic` VALUES (1,'City Road Eye Clinic','Crownfield Eye Hospital','London','United Kingdom'),(2,'Islington Glaucoma Clinic','Crownfield Eye Hospital','London','United Kingdom'),(3,'Camden Retina Clinic','Crownfield Eye Hospital','London','United Kingdom'),(4,'Hackney Cataract Clinic','Crownfield Eye Hospital','London','United Kingdom'),(5,'Enfield Vision Clinic','Crownfield Eye Hospital','London','United Kingdom'),(6,'Haringey Cornea Clinic','Crownfield Eye Hospital','London','United Kingdom'),(7,'Barnet Eye Clinic','Crownfield Eye Hospital','London','United Kingdom'),(8,'Westminster Eye Clinic','Crownfield Eye Hospital','London','United Kingdom'),(9,'Ealing Retina Clinic','Crownfield Eye Hospital','London','United Kingdom'),(10,'Croydon Vision Clinic','Crownfield Eye Hospital','London','United Kingdom'),(11,'Greenwich Eye Clinic','Crownfield Eye Hospital','London','United Kingdom'),(12,'Waltham Forest Glaucoma Clinic','Crownfield Eye Hospital','London','United Kingdom'),(13,'Lewisham Eye Clinic','Crownfield Eye Hospital','London','United Kingdom');
/*!40000 ALTER TABLE `clinic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinician`
--

DROP TABLE IF EXISTS `clinician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinician` (
  `Clinician_ID` int NOT NULL,
  `First_Name` varchar(60) NOT NULL,
  `Last_Name` varchar(60) NOT NULL,
  `Specialty_ID` int NOT NULL,
  `Email` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`Clinician_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_clinician_specialty` (`Specialty_ID`),
  CONSTRAINT `fk_clinician_specialty` FOREIGN KEY (`Specialty_ID`) REFERENCES `specialty` (`Specialty_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinician`
--

LOCK TABLES `clinician` WRITE;
/*!40000 ALTER TABLE `clinician` DISABLE KEYS */;
INSERT INTO `clinician` VALUES (1,'Ana','Georgescu',1,'ana.georgescu@crownfield.example'),(2,'Mateusz','Lewandowski',2,'mateusz.lewandowski@crownfield.example'),(3,'Cristina','Pavel',3,'cristina.pavel@crownfield.example'),(4,'Agnieszka','Kaminska',4,'agnieszka.kaminska@crownfield.example'),(5,'Mihai','Radu',5,'mihai.radu@crownfield.example'),(6,'Zofia','Kowalczyk',6,'zofia.kowalczyk@crownfield.example'),(7,'Irina','Munteanu',7,'irina.munteanu@crownfield.example'),(8,'Piotr','Mazur',8,'piotr.mazur@crownfield.example'),(9,'Andrei','Dobre',9,'andrei.dobre@crownfield.example'),(10,'Katarzyna','Jankowska',10,'katarzyna.jankowska@crownfield.example'),(11,'Elena','Vasilescu',1,'elena.vasilescu@crownfield.example'),(12,'Tomasz','Wrobel',2,'tomasz.wrobel@crownfield.example'),(13,'Sorina','Iliescu',3,'sorina.iliescu@crownfield.example');
/*!40000 ALTER TABLE `clinician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis` (
  `Diagnosis_ID` int NOT NULL,
  `Appointment_ID` int NOT NULL,
  `Diagnosis_Name` varchar(120) NOT NULL,
  `Diagnosis_Notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Diagnosis_ID`),
  KEY `fk_diagnosis_appointment` (`Appointment_ID`),
  CONSTRAINT `fk_diagnosis_appointment` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (1,1,'Dry Eye Syndrome','Mild symptoms'),(2,2,'Glaucoma','Routine monitoring'),(3,3,'Diabetic Retinopathy','Retinal examination'),(4,4,'Cataract','Initial assessment'),(5,5,'Myopia','Vision assessment'),(6,6,'Keratitis','Cornea assessment'),(7,7,'Conjunctivitis','Mild irritation'),(8,8,'Astigmatism','Follow-up review'),(9,9,'Macular Degeneration','Retina review'),(10,10,'Hyperopia','Vision assessment'),(11,11,'Dry Eye Syndrome','Routine examination'),(12,12,'Glaucoma','Pressure monitoring'),(13,13,'Retinal Tear','Retina assessment'),(14,14,'Blepharitis','Eyelid inflammation'),(15,15,'Glaucoma','Follow-up monitoring');
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_up`
--

DROP TABLE IF EXISTS `follow_up`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_up` (
  `Follow_Up_ID` int NOT NULL,
  `Appointment_ID` int NOT NULL,
  `Follow_Up_Date` date NOT NULL,
  `Plan` varchar(250) NOT NULL,
  `Priority` varchar(20) NOT NULL DEFAULT 'Routine',
  `Status` varchar(20) NOT NULL DEFAULT 'Pending',
  CONSTRAINT `chk_followup_priority` CHECK (`Priority` IN ('Routine','High','Urgent')),
  CONSTRAINT `chk_followup_status` CHECK (`Status` IN ('Pending','Completed','Cancelled')),
  PRIMARY KEY (`Follow_Up_ID`),
  UNIQUE KEY `Appointment_ID` (`Appointment_ID`),
  CONSTRAINT `fk_followup_appointment` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up`
--

LOCK TABLES `follow_up` WRITE;
/*!40000 ALTER TABLE `follow_up` DISABLE KEYS */;
INSERT INTO `follow_up` (`Follow_Up_ID`,`Appointment_ID`,`Follow_Up_Date`,`Plan`) VALUES (1,1,'2026-12-02','Routine eye review'),(2,2,'2026-12-02','Glaucoma monitoring'),(3,3,'2026-12-03','Retina assessment'),(4,4,'2026-12-03','Cataract consultation review'),(5,5,'2026-12-04','Vision reassessment'),(6,6,'2026-12-04','Cornea review'),(7,7,'2026-12-05','General eye review'),(8,8,'2026-12-05','Follow-up examination'),(9,9,'2026-12-06','Retina monitoring'),(10,10,'2026-12-06','Vision review'),(11,11,'2026-12-09','Dry eye review'),(12,12,'2026-12-09','Eye pressure monitoring'),(13,13,'2026-12-10','Retina follow-up'),(14,15,'2026-12-16','Glaucoma follow-up');
/*!40000 ALTER TABLE `follow_up` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `Medicine_ID` int NOT NULL,
  `Medicine_Name` varchar(100) NOT NULL,
  `Form` varchar(50) NOT NULL,
  PRIMARY KEY (`Medicine_ID`),
  UNIQUE KEY `Medicine_Name` (`Medicine_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Latanoprost','Eye Drops'),(2,'Timolol','Eye Drops'),(3,'Brimonidine','Eye Drops'),(4,'Dorzolamide','Eye Drops'),(5,'Artificial Tears','Eye Drops'),(6,'Carbomer Gel','Eye Gel'),(7,'Sodium Hyaluronate','Eye Drops'),(8,'Olopatadine','Eye Drops'),(9,'Ketotifen','Eye Drops'),(10,'Chloramphenicol','Eye Drops'),(11,'Aciclovir','Eye Ointment'),(12,'Cyclopentolate','Eye Drops'),(13,'Prednisolone Acetate','Eye Drops'),(14,'Acetazolamide','Tablets');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `Patient_ID` varchar(10) NOT NULL,
  `First_Name` varchar(60) NOT NULL,
  `Last_Name` varchar(60) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Phone` varchar(25) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `City` varchar(80) NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('OP001','Andreea','Popescu','1971-02-02','07000000001','patient001@crownfield.example','Bucharest'),('OP002','Jakub','Kowalski','1972-03-03','07000000002','patient002@crownfield.example','Warsaw'),('OP003','Ioana','Ionescu','1973-04-04','07000000003','patient003@crownfield.example','Cluj-Napoca'),('OP004','Zofia','Nowak','1974-05-05','07000000004','patient004@crownfield.example','Kraków'),('OP005','Mihai','Dumitrescu','1975-06-06','07000000005','patient005@crownfield.example','Bucharest'),('OP006','Aleksandra','Wiśniewska','1976-07-07','07000000006','patient006@crownfield.example','Warsaw'),('OP007','Elena','Stan','1977-08-08','07000000007','patient007@crownfield.example','Cluj-Napoca'),('OP008','Piotr','Zieliński','1978-09-09','07000000008','patient008@crownfield.example','Kraków'),('OP009','Radu','Marinescu','1979-10-10','07000000009','patient009@crownfield.example','Bucharest'),('OP010','Katarzyna','Wójcik','1980-11-11','07000000010','patient010@crownfield.example','Warsaw'),('OP011','Cristina','Pavel','1981-12-12','07000000011','patient011@crownfield.example','Cluj-Napoca'),('OP012','Mateusz','Lewandowski','1982-01-13','07000000012','patient012@crownfield.example','Kraków'),('OP013','Sorina','Georgescu','1983-02-14','07000000013','patient013@crownfield.example','Bucharest'),('OP014','Tomasz','Kamiński','1984-03-15','07000000014','patient014@crownfield.example','Warsaw');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `Prescription_ID` int NOT NULL,
  `Appointment_ID` int NOT NULL,
  `Issued_Date` date NOT NULL,
  `Instructions` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Prescription_ID`),
  KEY `fk_prescription_appointment` (`Appointment_ID`),
  CONSTRAINT `fk_prescription_appointment` FOREIGN KEY (`Appointment_ID`) REFERENCES `appointment` (`Appointment_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,'2026-11-02','Follow clinician instructions'),(2,2,'2026-11-02','Review at next appointment'),(3,3,'2026-11-03','Follow treatment plan'),(4,4,'2026-11-03','Review after consultation'),(5,5,'2026-11-04','Follow clinician instructions'),(6,6,'2026-11-04','Review symptoms'),(7,7,'2026-11-05','Follow treatment plan'),(8,8,'2026-11-05','Review at follow-up'),(9,9,'2026-11-06','Follow clinician instructions'),(10,10,'2026-11-06','Review if symptoms change'),(11,11,'2026-11-09','Follow treatment plan'),(12,12,'2026-11-09','Review eye pressure'),(13,13,'2026-11-10','Follow clinician instructions'),(14,15,'2026-11-16','Review at next appointment');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_item`
--

DROP TABLE IF EXISTS `prescription_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_item` (
  `Prescription_Item_ID` int NOT NULL,
  `Prescription_ID` int NOT NULL,
  `Medicine_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Dose` varchar(100) NOT NULL,
  `Route` varchar(50) NOT NULL DEFAULT 'Ophthalmic',
  `Frequency` varchar(100) NOT NULL DEFAULT 'As directed',
  `Duration` varchar(50) NOT NULL DEFAULT 'As directed',
  PRIMARY KEY (`Prescription_Item_ID`),
  KEY `fk_item_prescription` (`Prescription_ID`),
  KEY `fk_item_medicine` (`Medicine_ID`),
  CONSTRAINT `fk_item_medicine` FOREIGN KEY (`Medicine_ID`) REFERENCES `medicine` (`Medicine_ID`),
  CONSTRAINT `fk_item_prescription` FOREIGN KEY (`Prescription_ID`) REFERENCES `prescription` (`Prescription_ID`),
  CONSTRAINT `chk_item_quantity` CHECK ((`Quantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_item`
--

LOCK TABLES `prescription_item` WRITE;
/*!40000 ALTER TABLE `prescription_item` DISABLE KEYS */;
INSERT INTO `prescription_item` (`Prescription_Item_ID`,`Prescription_ID`,`Medicine_ID`,`Quantity`,`Dose`) VALUES (1,1,5,1,'As directed by clinician'),(2,2,1,1,'As directed by clinician'),(3,2,2,1,'As directed by clinician'),(4,3,7,1,'As directed by clinician'),(5,4,12,1,'As directed by clinician'),(6,5,5,1,'As directed by clinician'),(7,6,6,1,'As directed by clinician'),(8,7,10,1,'As directed by clinician'),(9,8,7,1,'As directed by clinician'),(10,9,13,1,'As directed by clinician'),(11,10,5,1,'As directed by clinician'),(12,11,6,1,'As directed by clinician'),(13,12,3,1,'As directed by clinician'),(14,13,12,1,'As directed by clinician'),(15,14,1,1,'As directed by clinician');
/*!40000 ALTER TABLE `prescription_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialty`
--

DROP TABLE IF EXISTS `specialty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specialty` (
  `Specialty_ID` int NOT NULL,
  `Specialty_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Specialty_ID`),
  UNIQUE KEY `Specialty_Name` (`Specialty_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialty`
--

LOCK TABLES `specialty` WRITE;
/*!40000 ALTER TABLE `specialty` DISABLE KEYS */;
INSERT INTO `specialty` VALUES (4,'Cataract Surgery'),(6,'Cornea'),(1,'General Ophthalmology'),(2,'Glaucoma'),(10,'Low Vision'),(9,'Medical Retina'),(7,'Neuro-Ophthalmology'),(8,'Oculoplastics'),(5,'Paediatric Ophthalmology'),(3,'Retina');
/*!40000 ALTER TABLE `specialty` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-31 21:01:38


-- ============================================================================
-- CROWNFIELD EYE HOSPITAL: INDIVIDUAL ASSESSMENT EXTENSIONS (MySQL 8.4)
-- This is a fictional dataset. Review and explain each feature yourself.
-- This file is intended for a NEW/DEDICATED local database: it drops tables.
-- ============================================================================
USE `crownfield_ro_pl_demo`;

-- B. Enrich synthetic follow-up and prescription-item data.
-- The original dump inserts rows using INSERT ... VALUES without column lists.
-- Since the new columns have defaults, those original INSERTs still work.
UPDATE follow_up
SET Priority = CASE WHEN Follow_Up_ID IN (2,3,12,14) THEN 'High'
                    WHEN Follow_Up_ID = 13 THEN 'Urgent'
                    ELSE 'Routine' END,
    Status = CASE WHEN Follow_Up_ID = 1 THEN 'Completed' ELSE 'Pending' END;

UPDATE prescription_item
SET Route = CASE WHEN Medicine_ID = 14 THEN 'Oral' ELSE 'Ophthalmic' END,
    Frequency = CASE WHEN Medicine_ID IN (1,2,3,4) THEN 'Twice daily'
                     WHEN Medicine_ID IN (5,6,7) THEN 'As needed'
                     ELSE 'Once daily' END,
    Duration = CASE WHEN Medicine_ID IN (5,6,7) THEN '30 days'
                    ELSE '14 days' END;

-- B. Controlled UPDATE and DELETE with ROLLBACK: no permanent sample data lost.
START TRANSACTION;
UPDATE appointment SET Status = 'Completed' WHERE Appointment_ID = 1;
SELECT Appointment_ID, Status FROM appointment WHERE Appointment_ID = 1;
ROLLBACK;

START TRANSACTION;
INSERT INTO diagnosis (Diagnosis_ID, Appointment_ID, Diagnosis_Name, Diagnosis_Notes)
VALUES (9999, 1, 'Temporary test diagnosis', 'Transaction demonstration only');
DELETE FROM diagnosis WHERE Diagnosis_ID = 9999;
SELECT COUNT(*) AS remaining_temporary_diagnoses FROM diagnosis WHERE Diagnosis_ID = 9999;
ROLLBACK;

-- C. Individual SQL examples. Run each SELECT and save screenshots.
-- Q1: Which clinicians have at least one appointment?
SELECT c.Clinician_ID, CONCAT(c.First_Name, ' ', c.Last_Name) AS Clinician,
       COUNT(a.Appointment_ID) AS Appointment_Count
FROM clinician c JOIN appointment a ON a.Clinician_ID = c.Clinician_ID
GROUP BY c.Clinician_ID, c.First_Name, c.Last_Name
HAVING COUNT(a.Appointment_ID) >= 1
ORDER BY Appointment_Count DESC, Clinician;

-- Q2: Which patients are booked with which clinicians and clinics?
SELECT a.Appointment_ID, CONCAT(p.First_Name,' ',p.Last_Name) AS Patient,
       CONCAT(c.First_Name,' ',c.Last_Name) AS Clinician,
       cl.Clinic_Name, a.Appointment_Date
FROM appointment a
INNER JOIN patient p ON p.Patient_ID = a.Patient_ID
INNER JOIN clinician c ON c.Clinician_ID = a.Clinician_ID
INNER JOIN clinic cl ON cl.Clinic_ID = a.Clinic_ID
ORDER BY a.Appointment_Date, a.Appointment_ID;

-- Q3: Which appointments do not have follow-up plans?
SELECT a.Appointment_ID, a.Appointment_Date, f.Follow_Up_ID
FROM appointment a LEFT JOIN follow_up f ON f.Appointment_ID = a.Appointment_ID
WHERE f.Follow_Up_ID IS NULL;

-- Q4: Which appointments have more prescription items than average?
SELECT a.Appointment_ID, COUNT(pi.Prescription_Item_ID) AS Item_Count
FROM appointment a
JOIN prescription p ON p.Appointment_ID = a.Appointment_ID
JOIN prescription_item pi ON pi.Prescription_ID = p.Prescription_ID
GROUP BY a.Appointment_ID
HAVING COUNT(pi.Prescription_Item_ID) > (
    SELECT AVG(item_count) FROM (
        SELECT COUNT(pi2.Prescription_Item_ID) AS item_count
        FROM prescription p2
        JOIN prescription_item pi2 ON pi2.Prescription_ID = p2.Prescription_ID
        GROUP BY p2.Prescription_ID
    ) AS prescription_counts
);

-- C. Stored procedure: Q5, look up all appointments for one patient.
DROP PROCEDURE IF EXISTS GetPatientAppointments;
DELIMITER $$
CREATE PROCEDURE GetPatientAppointments(IN p_patient_id VARCHAR(10))
BEGIN
  SELECT a.Appointment_ID, a.Appointment_Date, a.Appointment_Time,
         a.Status, cl.Clinic_Name
  FROM appointment a
  JOIN clinic cl ON cl.Clinic_ID = a.Clinic_ID
  WHERE a.Patient_ID = p_patient_id
  ORDER BY a.Appointment_Date, a.Appointment_Time;
END$$
DELIMITER ;
CALL GetPatientAppointments('OP001');

-- C. Trigger: Q6, audit any appointment status change.
CREATE TABLE IF NOT EXISTS appointment_status_audit (
  Audit_ID BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Appointment_ID INT NOT NULL,
  Old_Status VARCHAR(20) NOT NULL,
  New_Status VARCHAR(20) NOT NULL,
  Changed_At TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_audit_appointment FOREIGN KEY (Appointment_ID)
    REFERENCES appointment(Appointment_ID)
) ENGINE=InnoDB;

DROP TRIGGER IF EXISTS trg_appointment_status_audit;
DELIMITER $$
CREATE TRIGGER trg_appointment_status_audit
AFTER UPDATE ON appointment
FOR EACH ROW
BEGIN
  IF NOT (OLD.Status <=> NEW.Status) THEN
    INSERT INTO appointment_status_audit (Appointment_ID, Old_Status, New_Status)
    VALUES (NEW.Appointment_ID, OLD.Status, NEW.Status);
  END IF;
END$$
DELIMITER ;

-- Demonstrate the trigger inside a rolled-back transaction.
START TRANSACTION;
UPDATE appointment SET Status = 'Completed' WHERE Appointment_ID = 1;
SELECT * FROM appointment_status_audit WHERE Appointment_ID = 1 ORDER BY Audit_ID DESC;
ROLLBACK;

-- D. Data protection: one-way SHA-256 hashing demonstration on synthetic data.
-- For real passwords, use an application-level password hashing algorithm
-- (Argon2id, bcrypt or scrypt with unique salts), NOT bare SHA-256.
CREATE TABLE IF NOT EXISTS demo_protected_token (
  Token_ID INT PRIMARY KEY,
  Token_Hash CHAR(64) NOT NULL
) ENGINE=InnoDB;
INSERT INTO demo_protected_token (Token_ID, Token_Hash)
VALUES (1, SHA2('fictional-training-token-001',256))
ON DUPLICATE KEY UPDATE Token_Hash = VALUES(Token_Hash);
SELECT Token_ID, Token_Hash FROM demo_protected_token;

-- D. Demonstration roles and least-privilege grants.
-- Requires CREATE ROLE and GRANT privileges. Run as a local administrator.
-- No real database accounts or passwords are created here.
CREATE ROLE IF NOT EXISTS 'crownfield_admin', 'crownfield_doctor',
                          'crownfield_receptionist', 'crownfield_patient';
GRANT ALL PRIVILEGES ON crownfield_ro_pl_demo.* TO 'crownfield_admin';
GRANT SELECT ON crownfield_ro_pl_demo.patient TO 'crownfield_doctor';
GRANT SELECT ON crownfield_ro_pl_demo.appointment TO 'crownfield_doctor';
GRANT SELECT ON crownfield_ro_pl_demo.diagnosis TO 'crownfield_doctor';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.prescription TO 'crownfield_doctor';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.prescription_item TO 'crownfield_doctor';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.follow_up TO 'crownfield_doctor';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.appointment TO 'crownfield_receptionist';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.patient TO 'crownfield_receptionist';
GRANT SELECT ON crownfield_ro_pl_demo.clinic TO 'crownfield_receptionist';
-- A public-information-only view: no patient-identifying information.
CREATE OR REPLACE VIEW public_clinic_directory AS
SELECT Clinic_Name, City, Country FROM clinic;
GRANT SELECT ON crownfield_ro_pl_demo.public_clinic_directory TO 'crownfield_patient';
-- Note: the patient role is deliberately NOT given direct patient-table access.
-- Per-patient record access would require authenticated row-level filtering
-- in an application; granting SELECT on patient would expose all patients.
SHOW GRANTS FOR 'crownfield_doctor';
SHOW GRANTS FOR 'crownfield_receptionist';
SHOW GRANTS FOR 'crownfield_patient';

-- Validation queries: verify expected table counts and constraints manually.
SELECT 'patient' AS Table_Name, COUNT(*) AS Records FROM patient
UNION ALL SELECT 'appointment', COUNT(*) FROM appointment
UNION ALL SELECT 'prescription_item', COUNT(*) FROM prescription_item
UNION ALL SELECT 'follow_up', COUNT(*) FROM follow_up;
