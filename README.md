# Hotel Booking Database

## 1. Project Overview

This project is a relational database system designed to manage hotel booking and management operations.

The database models important hotel activities including:

- Hotels
- Room types
- Rooms
- Guests
- Bookings
- Payments
- Services
- Booking services
- Staff

The project demonstrates the three main stages of SQL database development:

- **DDL — Data Definition Language**
- **DML — Data Manipulation Language**
- **DQL — Data Query Language**

The database is designed using **MySQL** and demonstrates the use of:

- Primary keys
- Foreign keys
- Constraints
- Relationships
- Many-to-many relationships
- JOINs
- Aggregate functions
- GROUP BY
- ORDER BY
- HAVING
- Subqueries
- EXISTS
- Database views

---

# 2. Database Domain

**Domain:** Hotel Booking and Management

The system represents a realistic hotel environment where guests can:

1. Make room bookings.
2. Check in and check out.
3. Make payments.
4. Use additional hotel services.

Hotel management can use the database to manage:

- Hotels
- Room types
- Rooms
- Guests
- Bookings
- Payments
- Services
- Staff
- Revenue information

---

# 3. Main Database Tables

The database contains the following tables:

| Table | Description |
|---|---|
| `hotels` | Stores information about hotels. |
| `room_types` | Stores categories of hotel rooms. |
| `rooms` | Stores individual hotel rooms and their details. |
| `guests` | Stores information about hotel guests. |
| `bookings` | Stores guest room reservations, dates, and booking status. |
| `payments` | Stores payments made for bookings. |
| `services` | Stores additional hotel services offered to guests. |
| `booking_services` | Connects bookings with the services they use. |
| `staff` | Stores information about hotel employees. |

---

# 4. Main Database Relationships

The database contains the following relationships:

- One hotel can have many room types.
- One room type can have many rooms.
- One hotel can have many staff members.
- One guest can make many bookings.
- One room can have many bookings over time.
- A booking can have one or more payments.
- A booking can use many services.
- A service can be used by many bookings.
- The `booking_services` table provides the many-to-many relationship between bookings and services.

### Relationship Overview

```text
HOTELS
   │
   ├──────────────< ROOM_TYPES
   │                    │
   │                    └──────────────< ROOMS
   │                                      │
   │                                      │
   │                                      ▼
   │                                  BOOKINGS
   │                                  /      \
   │                                 /        \
   │                                ▼          ▼
   │                            PAYMENTS   BOOKING_SERVICES
   │                                             │
   │                                             ▼
   │                                          SERVICES
   │
   └──────────────< STAFF

GUESTS
   │
   └──────────────< BOOKINGS