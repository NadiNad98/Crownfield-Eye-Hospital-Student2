Logu.

-- Crownfield Eye Hospital
-- Student 2 - Clinic and Appointment
-- Individual SQL queries and tests
-- Run the group database script first.

USE crownfield_eye_hospital;

-- 1. GROUP BY and HAVING
-- Find clinics with more than one appointment.
SELECT c.Clinic_Name,
       COUNT(a.Appointment_ID) AS Total_Appointments
FROM clinic c
JOIN appointment a ON c.Clinic_ID = a.Clinic_ID
GROUP BY c.Clinic_ID, c.Clinic_Name
HAVING COUNT(a.Appointment_ID) > 1;


-- 2. INNER JOIN
-- Show the patient, clinician and clinic for each appointment.
SELECT a.Appointment_ID,
       p.First_Name AS Patient,
       c.First_Name AS Clinician,
       cl.Clinic_Name
FROM appointment a
JOIN patient p ON a.Patient_ID = p.Patient_ID
JOIN clinician c ON a.Clinician_ID = c.Clinician_ID
JOIN clinic cl ON a.Clinic_ID = cl.Clinic_ID;


-- 3. LEFT JOIN
-- Find appointments without a follow-up record.
SELECT a.Appointment_ID,
       a.Appointment_Date
FROM appointment a
LEFT JOIN follow_up f
    ON a.Appointment_ID = f.Appointment_ID
WHERE f.Follow_Up_ID IS NULL;


-- 4. Subquery
-- Find clinics with above-average appointment numbers.
SELECT c.Clinic_Name,
       COUNT(a.Appointment_ID) AS Total
FROM clinic c
LEFT JOIN appointment a
    ON c.Clinic_ID = a.Clinic_ID
GROUP BY c.Clinic_ID, c.Clinic_Name
HAVING COUNT(a.Appointment_ID) >
    (
        SELECT COUNT(*) /
               (SELECT COUNT(*) FROM clinic)
        FROM appointment
    );


-- 5. Stored procedure
-- List appointments for a selected clinic.
DROP PROCEDURE IF EXISTS Student2_GetClinicAppointments;

DELIMITER //

CREATE PROCEDURE Student2_GetClinicAppointments(
    IN p_clinic_id INT
)
BEGIN
    SELECT Appointment_ID,
           Appointment_Date,
           Appointment_Time,
           Status
    FROM appointment
    WHERE Clinic_ID = p_clinic_id;
END//

DELIMITER ;

-- Test with Clinic_ID 1.
CALL Student2_GetClinicAppointments(1);


-- 6. Trigger
-- Reject appointment statuses with surrounding spaces.
DROP TRIGGER IF EXISTS Student2_Appointment_Status_Trim;

DELIMITER //

CREATE TRIGGER Student2_Appointment_Status_Trim
BEFORE INSERT ON appointment
FOR EACH ROW
BEGIN
    IF NEW.Status <> TRIM(NEW.Status) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
            'Appointment status must not have surrounding spaces';
    END IF;
END//

DELIMITER ;

-- Trigger test (expected to fail with Error 1644).
-- Run separately when demonstrating the trigger.
-- INSERT INTO appointment
-- (Patient_ID, Clinician_ID, Clinic_ID,
--  Appointment_Date, Appointment_Time, Status)
-- VALUES
-- ('OP001', 1, 1, '2026-12-15', '10:00:00', ' Scheduled ');


-- Constraint tests (expected to fail).
-- Run separately if needed.
-- UPDATE appointment
-- SET Status = 'Unknown'
-- WHERE Appointment_ID = 1;

-- DELETE FROM clinic
-- WHERE Clinic_ID = 1;


-- 7. Security roles

-- Admin role
CREATE ROLE IF NOT EXISTS 'admin_role';

GRANT ALL PRIVILEGES
ON crownfield_eye_hospital.*
TO 'admin_role';

SHOW GRANTS FOR 'admin_role';


-- Doctor role
CREATE ROLE IF NOT EXISTS 'doctor_role';

GRANT SELECT
ON crownfield_eye_hospital.patient
TO 'doctor_role';

GRANT SELECT
ON crownfield_eye_hospital.clinician
TO 'doctor_role';

GRANT SELECT, UPDATE
ON crownfield_eye_hospital.appointment
TO 'doctor_role';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.diagnosis
TO 'doctor_role';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.prescription
TO 'doctor_role';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.prescription_item
TO 'doctor_role';

SHOW GRANTS FOR 'doctor_role';


-- Receptionist role
-- Manage patients and appointments, and view clinics.
CREATE ROLE IF NOT EXISTS 'hospital_receptionist';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.appointment
TO 'hospital_receptionist';

GRANT SELECT, INSERT, UPDATE
ON crownfield_eye_hospital.patient
TO 'hospital_receptionist';

GRANT SELECT
ON crownfield_eye_hospital.clinic
TO 'hospital_receptionist';

SHOW GRANTS FOR 'hospital_receptionist';


-- Patient role
-- Allow reading only three patient columns.
-- This does not restrict access to the patient's own row.
CREATE ROLE IF NOT EXISTS 'hospital_patient';

GRANT SELECT (Patient_ID, First_Name, Last_Name)
ON crownfield_eye_hospital.patient
TO 'hospital_patient';

SHOW GRANTS FOR 'hospital_patient';


-- 8. Hashing test
-- Demonstrate SHA2-256 using a fictional phone number.
SELECT '07123456789' AS Original_Phone,
       SHA2('07123456789', 256) AS Hashed_Phone;


-- 9. Transaction test: ROLLBACK
-- Reverse a temporary appointment status change.
START TRANSACTION;

UPDATE appointment
SET Status = 'Completed'
WHERE Appointment_ID = 1;

SELECT Appointment_ID, Status
FROM appointment
WHERE Appointment_ID = 1;

ROLLBACK;

SELECT Appointment_ID, Status
FROM appointment
WHERE Appointment_ID = 1;


-- 10. Transaction test: COMMIT
-- Save the Scheduled status for Appointment 1.
START TRANSACTION;

UPDATE appointment
SET Status = 'Scheduled'
WHERE Appointment_ID = 1;

COMMIT;

SELECT Appointment_ID, Status
FROM appointment
WHERE Appointment_ID = 1;
