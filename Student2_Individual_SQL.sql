
-- Crownfield Eye Hospital
-- Student 2 - Clinic and Appointment
-- My SQL queries and tests
-- Run the group database file first.

USE crownfield_ro_pl_demo;

-- 1. GROUP BY and HAVING
-- I used this query to find clinics with more than one appointment.
SELECT c.Clinic_Name, COUNT(a.Appointment_ID) AS Total_Appointments
FROM clinic c
JOIN appointment a ON c.Clinic_ID = a.Clinic_ID
GROUP BY c.Clinic_ID, c.Clinic_Name
HAVING COUNT(a.Appointment_ID) > 1;

-- 2. INNER JOIN
-- This shows the patient, clinician and clinic for each appointment.
SELECT a.Appointment_ID, p.First_Name AS Patient,
       c.First_Name AS Clinician, cl.Clinic_Name
FROM appointment a
JOIN patient p ON a.Patient_ID = p.Patient_ID
JOIN clinician c ON a.Clinician_ID = c.Clinician_ID
JOIN clinic cl ON a.Clinic_ID = cl.Clinic_ID;

-- 3. LEFT JOIN
-- I checked which appointments do not have a follow-up.
SELECT a.Appointment_ID, a.Appointment_Date
FROM appointment a
LEFT JOIN follow_up f ON a.Appointment_ID = f.Appointment_ID
WHERE f.Follow_Up_ID IS NULL;

-- 4. Subquery
-- This finds clinics with more appointments than the average.
SELECT c.Clinic_Name, COUNT(a.Appointment_ID) AS Total
FROM clinic c
LEFT JOIN appointment a ON c.Clinic_ID = a.Clinic_ID
GROUP BY c.Clinic_ID, c.Clinic_Name
HAVING COUNT(a.Appointment_ID) >
    (SELECT COUNT(*) / (SELECT COUNT(*) FROM clinic) FROM appointment);

-- 5. Stored procedure
-- I created a procedure to see appointments for a selected clinic.
DROP PROCEDURE IF EXISTS GetClinicAppointments;
DELIMITER //
CREATE PROCEDURE GetClinicAppointments(IN p_clinic_id INT)
BEGIN
    SELECT Appointment_ID, Appointment_Date, Appointment_Time, Status
    FROM appointment
    WHERE Clinic_ID = p_clinic_id;
END//
DELIMITER ;

-- I tested it using Clinic_ID 1.
CALL GetClinicAppointments(1);

-- 6. Trigger
-- This stops an appointment being added without an appointment type.
DROP TRIGGER IF EXISTS CheckAppointmentType;
DELIMITER //
CREATE TRIGGER CheckAppointmentType
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
    IF NEW.Appointment_Type IS NULL OR TRIM(NEW.Appointment_Type) = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Appointment type is required';
    END IF;
END//
DELIMITER ;

-- Trigger test: I ran this separately to check that it gives an error.
-- It is commented out here because the test is supposed to fail.
-- INSERT INTO appointment
-- (Appointment_ID, Patient_ID, Clinician_ID, Clinic_ID,
--  Appointment_Date, Appointment_Time, Appointment_Type, Status)
-- VALUES (9999, 'OP001', 1, 1, '2026-12-20', '10:00:00', NULL, 'Scheduled');

-- Testing database rules
-- These tests should give errors, so I left them commented out.
-- UPDATE appointment SET Status = 'Unknown' WHERE Appointment_ID = 1;
-- DELETE FROM clinic WHERE Clinic_ID = 1;

-- Receptionist role
-- I gave receptionists access to view, add and update appointments and patients.
CREATE ROLE IF NOT EXISTS 'receptionist_role';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.appointment TO 'receptionist_role';
GRANT SELECT, INSERT, UPDATE ON crownfield_ro_pl_demo.patient TO 'receptionist_role';
SHOW GRANTS FOR 'receptionist_role';

-- Patient role
-- I limited this role to reading three columns from the patient table.
-- This does not limit the role to one patient's own row.
CREATE ROLE IF NOT EXISTS 'patient_role';
GRANT SELECT (Patient_ID, First_Name, Last_Name)
ON crownfield_ro_pl_demo.patient TO 'patient_role';
SHOW GRANTS FOR 'patient_role';

-- Hashing test
-- I used a made-up phone number to test SHA2.
SELECT '07123456789' AS Original_Phone,
       SHA2('07123456789', 256) AS Hashed_Phone;

-- Transaction test: ROLLBACK
-- I changed the status and then cancelled the change.
START TRANSACTION;
UPDATE appointment SET Status = 'Completed' WHERE Appointment_ID = 1;
SELECT Appointment_ID, Status FROM appointment WHERE Appointment_ID = 1;
ROLLBACK;
SELECT Appointment_ID, Status FROM appointment WHERE Appointment_ID = 1;

-- Transaction test: COMMIT
-- I saved the Scheduled status for Appointment 1.
START TRANSACTION;
UPDATE appointment SET Status = 'Scheduled' WHERE Appointment_ID = 1;
COMMIT;
SELECT Appointment_ID, Status FROM appointment WHERE Appointment_ID = 1;
