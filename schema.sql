-- schema.sql

-- Create the database
CREATE DATABASE IF NOT EXISTS hotel_booking;

-- Use the database
USE hotel_booking;

-- =========================
-- Hotels Table
-- =========================
CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    address VARCHAR(150),
    phone VARCHAR(20)
);

-- =========================
-- Rooms Table
-- =========================
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    hotel_id INT NOT NULL,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(30) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    status ENUM('Available','Occupied','Maintenance') DEFAULT 'Available',
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);

-- =========================
-- Guests Table
-- =========================
CREATE TABLE Guests (
    guest_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- =========================
-- Bookings Table
-- =========================
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    booking_status ENUM('Confirmed','Cancelled','Completed') DEFAULT 'Confirmed',
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);

-- =========================
-- Payments Table
-- =========================
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Cash','Card','Mpesa') NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);