# Hotel Booking Database

## 1. Project Overview

This project is a relational database system designed to manage hotel booking operations.

The database models important hotel activities including hotels, rooms, guests, bookings, payments, services, and staff.

The project demonstrates the three main stages of SQL database development:

* DDL — Data Definition Language
* DML — Data Manipulation Language
* DQL — Data Query Language

## 2. Database Domain

**Domain:** Hotel Booking and Management

The system is designed to represent a realistic hotel environment where guests can make room bookings, make payments, and use additional hotel services.

## 3. Main Database Tables

The database contains the following tables:

1. `hotels` — Stores information about hotels.
2. `room_types` — Stores different types of rooms and their pricing.
3. `rooms` — Stores individual hotel rooms.
4. `guests` — Stores hotel guest information.
5. `bookings` — Stores guest room reservations.
6. `payments` — Stores payments made for bookings.
7. `services` — Stores additional hotel services.
8. `booking_services` — Connects bookings with hotel services.
9. `staff` — Stores hotel staff information.

## 4. Main Relationships

The database contains the following relationships:

* One hotel can have many rooms.
* One room type can be assigned to many rooms.
* One guest can make many bookings.
* One room can have many bookings over time.
* A booking can have one or more payments.
* A booking can use many services.
* A service can be used by many bookings.
* One hotel can have many staff members.

The `booking_services` table provides the many-to-many relationship between bookings and services.

## 5. Repository Structure

```text
hotel-booking-database/
│
├── README.md
│
├── ddl/
│   └── 01_schema.sql
│
├── dml/
│   └── 01_seed_data.sql
│
├── dql/
│   └── 01_queries.sql
│
└── docs/
    └── erd.png
```

## 6. SQL Phases

### DDL

The DDL script creates the database tables, primary keys, foreign keys, and other constraints.

File:

`ddl/01_schema.sql`

### DML

The DML script inserts realistic sample data into the database.

File:

`dml/01_seed_data.sql`

### DQL

The DQL script contains queries that answer realistic questions about the hotel business.

File:

`dql/01_queries.sql`

## 7. How to Run the Project

Create or select a MySQL database and run the scripts in the following order:

1. `ddl/01_schema.sql`
2. `dml/01_seed_data.sql`
3. `dql/01_queries.sql`

The DDL must be successfully executed before running the DML, and the DML must be successfully executed before running the DQL.

## 8. Testing

The database will be tested using a fresh MySQL database to ensure that:

* Tables are created without errors.
* Primary and foreign keys work correctly.
* Constraints work as expected.
* Sample data is internally consistent.
* Foreign-key references point to existing records.
* Dates and amounts are realistic.
* All required DQL queries execute successfully.

## 9. Team Collaboration

The project is developed collaboratively using GitHub.

Each group member is expected to contribute using their own GitHub account and make meaningful commits to the repository.

The project follows the workflow:

**Design → DDL → DML → DQL → Testing → Documentation → Submission**

## 10. Database Technology

**Database:** MySQL

**Version:** To be confirmed based on the team's MySQL environment.
