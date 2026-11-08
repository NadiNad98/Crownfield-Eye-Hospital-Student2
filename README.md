Crownfield Eye Hospital Database Project

Course: CPU4:103 Introduction to Databases

Assignment: Crownfield Eye Hospital Database Project

Student Name: Natalia Anna Winiarska

Student ID: G1422923

Group Role: Student 2

About the Project

This project is a MySQL database for Crownfield Eye Hospital. I worked in a group of three students to create a database with 10 main related tables and sample data.

The database stores information about patients, clinicians, clinics, appointments, diagnoses, prescriptions, medicines and follow-up care.

The updated database also includes two supporting tables for appointment status auditing and a hashing demonstration.

My Individual Work

As Student 2, I was responsible for the Clinic and Appointment tables.

I created and tested six SQL features:

GROUP BY and HAVING

INNER JOIN

LEFT JOIN

Subquery

Stored procedure

Trigger

I also worked on the Receptionist and Patient roles and tested database validation, hashing and transactions. The project includes Admin and Doctor roles as part of the database security demonstration.

Project Files

Crownfield_Group_Database.sql – the updated shared database containing 10 main related tables, sample data and additional supporting SQL features.

Student2_Individual_SQL.sql – my six individual SQL features, stored procedure, trigger, security roles, hashing demonstration and transaction tests.

05_ERD_Ready_For_GitHub.drawio – an earlier editable ER diagram showing the 10 main tables and their relationships.

Updated ER diagram image – shows the latest database structure, including 10 main tables, 2 additional supporting tables and the new fields added to the database.

How to Use

Open MySQL Workbench.

Run Crownfield_Group_Database.sql first to create the database and insert the sample data.

Run Student2_Individual_SQL.sql to execute my individual SQL queries, stored procedure, trigger and tests.

View the updated ER diagram image to see the latest database structure.

The earlier .drawio diagram can be opened and edited using diagrams.net. The updated ER diagram image represents the latest database structure.

Some SQL tests are commented out because they are expected to produce errors. They can be run separately to check that the database rules work correctly.

The role commands may require an account with permission to create roles and grant access.

Important: The shared SQL script recreates database tables. It should be run in a dedicated test database because existing data may be overwritten.

Assumptions

All patient and hospital records are fictional and used for educational purposes.

The database is designed for MySQL and was tested using MySQL Workbench.

The group database file must be run before the individual SQL file.

The database contains 10 main tables and 2 additional supporting tables.

The security roles demonstrate different access permissions but are not assigned to real hospital users.

Some validation tests are commented out because they are expected to produce errors.

The updated ER diagram image reflects the latest database structure, while the .drawio file is an earlier editable version.

Conclusion

This project helped me understand how relational databases work and how SQL can be used to manage hospital information. I also learned more about database relationships, validation, user permissions and transactions.
