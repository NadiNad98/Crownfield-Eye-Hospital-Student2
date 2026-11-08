Crownfield Eye Hospital Database Project

Module: CPU4:103 Introduction to Databases
Project: Crownfield Eye Hospital Database
Group: Three students
Individual Role: Student 2 – Clinic and Appointment

Project Overview

This project was developed as part of the Introduction to Databases module. Working in a group of three students, we designed and implemented a relational database for Crownfield Eye Hospital using MySQL.

The database manages information about patients, clinicians, clinics, appointments, diagnoses, medicines, prescriptions and follow-up care.

The main database consists of 10 related tables. Two additional supporting tables are used to demonstrate appointment status auditing and data protection through hashing.

My Individual Contribution

As Student 2, I was responsible for the Clinic and Appointment tables.

My individual SQL work includes six required features:

GROUP BY and HAVING – counts appointments for each clinic and filters the results.

INNER JOIN – combines appointment, patient, clinician and clinic information.

LEFT JOIN – identifies appointments without follow-up records.

Subquery – identifies clinics with an above-average number of appointments.

Stored Procedure – retrieves appointments for a selected clinic using an input parameter.

Trigger – prevents appointments from being inserted without an appointment type.

I also demonstrated SQL transactions, validation tests, hashing and role-based database permissions.

Database Design

The database uses primary keys and foreign keys to connect related tables and maintain referential integrity.

The design includes constraints such as NOT NULL, UNIQUE, DEFAULT and CHECK, where appropriate.

The ER diagrams show the database tables, their attributes and relationships using Crow's Foot notation.

The project includes 10 main tables and 2 supporting tables:

appointment_status_audit – records appointment status changes.

demo_protected_token – demonstrates the storage of hashed values.

Repository Files

File

Description

Crownfield_Group_Database.sql

Shared database script containing the database structure, sample records and additional SQL demonstrations.

Student2_Individual_SQL.sql

My individual SQL queries, stored procedure, trigger and security demonstrations.

ER Diagram (JPG)

Image of the database structure and relationships.

ER Diagram (SVG)

Scalable version of the database diagram.

README.md

Project overview and instructions for running the database.

How to Run the Project

Requirements: MySQL Server and MySQL Workbench.

Download the SQL files from this repository.

Open MySQL Workbench and connect to a local MySQL server.

Open and execute Crownfield_Group_Database.sql first.

After the shared database script finishes, open and execute Student2_Individual_SQL.sql.

Review the query results and test the stored procedure and trigger.

Open either ER diagram to view the database structure.

Important: The shared SQL script recreates database tables and may overwrite existing data. Run it in a dedicated test environment.

Some negative validation tests are commented out because they are designed to produce errors when database rules are violated. These can be tested separately.

Creating database roles and granting permissions may require an account with administrative privileges.

Database Security and Testing

The project demonstrates several database security and reliability features:

Role-based permissions: Admin, Doctor, Receptionist and Patient roles with different levels of access.

Hashing: Use of MySQL's SHA2() function to demonstrate one-way hashing.

Transactions: Use of START TRANSACTION, COMMIT and ROLLBACK.

Validation: Constraints and trigger-based checks to prevent invalid data.

Controlled changes: SQL UPDATE and DELETE operations tested within transactions.

The security features are educational demonstrations rather than a complete production hospital security system.

Project Assumptions

All hospital and patient information is fictional and used only for educational purposes.

The database is designed for MySQL.

The shared SQL script must be executed before the individual SQL script.

The 10 main tables represent the core hospital database, while two supporting tables demonstrate additional features.

The database roles are used to demonstrate access permissions and are not assigned to real hospital users.

Both ER diagram files represent the same database design in different image formats.

Conclusion

This project helped me develop practical skills in relational database design, SQL queries, table relationships, data validation and database security.

Working on the Clinic and Appointment tables also helped me understand how different parts of a hospital database connect and how SQL can be used to retrieve and manage information.
