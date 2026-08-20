-- =========================================================
-- HOTEL BOOKING DATABASE QUERIES
-- =========================================================


-- =========================================================
-- HOTEL QUERIES
-- =========================================================

-- What hotels are available in the database?
SELECT
    hotel_id,
    hotel_name,
    location,
    rating
FROM hotels;


-- Which hotels have the highest ratings?
SELECT
    hotel_name,
    location,
    rating
FROM hotels
ORDER BY rating DESC;


-- How many hotels are available in each location?
SELECT
    location,
    COUNT(*) AS total_hotels
FROM hotels
GROUP BY location
ORDER BY total_hotels DESC;


-- Which locations have hotels with an average rating of at least 4.4?
SELECT
    location,
    AVG(rating) AS average_rating
FROM hotels
GROUP BY location
HAVING AVG(rating) >= 4.4
ORDER BY average_rating DESC;


-- What are the lowest and highest hotel ratings?
SELECT
    MIN(rating) AS lowest_rating,
    MAX(rating) AS highest_rating
FROM hotels;


-- Which hotels are located in Nairobi?
SELECT
    hotel_name,
    address,
    phone,
    rating
FROM hotels
WHERE location = 'Nairobi'
ORDER BY rating DESC;


-- Which hotels have a rating of 4.5 or higher?
SELECT
    hotel_name,
    location,
    rating
FROM hotels
WHERE rating >= 4.5
ORDER BY rating DESC, hotel_name ASC;


-- Which hotels have a rating higher than the average hotel rating?
-- Demonstrates: SCALAR SUBQUERY
SELECT
    hotel_name,
    location,
    rating
FROM hotels
WHERE rating > (
    SELECT AVG(rating)
    FROM hotels
)
ORDER BY rating DESC;


-- =========================================================
-- GUEST QUERIES
-- =========================================================

-- View all guests
SELECT
    guest_id,
    first_name,
    last_name,
    email,
    phone,
    address
FROM guests;


-- Count the total number of guests
SELECT
    COUNT(*) AS total_guests
FROM guests;


-- Find guests from Nairobi
SELECT
    first_name,
    last_name,
    email,
    phone
FROM guests
WHERE address = 'Nairobi, Kenya';


-- View guests alphabetically by last name
SELECT
    first_name,
    last_name,
    email
FROM guests
ORDER BY last_name ASC;


-- View guests together with their bookings
SELECT
    g.guest_id,
    g.first_name,
    g.last_name,
    b.booking_id,
    b.check_in_date,
    b.check_out_date,
    b.booking_status
FROM guests g
JOIN bookings b
    ON g.guest_id = b.guest_id;


-- Which guests have made at least one booking?
-- Demonstrates: EXISTS / CORRELATED SUBQUERY
SELECT
    g.guest_id,
    g.first_name,
    g.last_name,
    g.email
FROM guests g
WHERE EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.guest_id = g.guest_id
);


-- =========================================================
-- BOOKINGS QUERIES
-- =========================================================

-- View all bookings with their guest and room details
SELECT
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    b.booking_status
FROM bookings b
JOIN guests g
    ON b.guest_id = g.guest_id
JOIN rooms r
    ON b.room_id = r.room_id;


-- View confirmed and active stays
SELECT
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    DATEDIFF(b.check_out_date, b.check_in_date) AS number_of_nights,
    b.booking_status
FROM bookings b
JOIN guests g
    ON b.guest_id = g.guest_id
JOIN rooms r
    ON b.room_id = r.room_id
WHERE b.booking_status IN ('confirmed', 'checked_in');


-- Find bookings for a selected guest
SELECT
    b.booking_id,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    b.booking_status
FROM bookings b
JOIN rooms r
    ON b.room_id = r.room_id
WHERE b.guest_id = 1;


-- Count bookings for each status
SELECT
    booking_status,
    COUNT(*) AS number_of_bookings
FROM bookings
GROUP BY booking_status;


-- View bookings ordered by check-in date
SELECT
    booking_id,
    guest_id,
    room_id,
    check_in_date,
    check_out_date,
    booking_status
FROM bookings
ORDER BY check_in_date ASC;


-- =========================================================
-- PAYMENTS QUERIES
-- =========================================================

-- View all payments with their booking details
SELECT
    p.payment_id,
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    p.amount,
    p.payment_date,
    p.payment_method,
    p.status
FROM payments p
JOIN bookings b
    ON p.booking_id = b.booking_id
JOIN guests g
    ON b.guest_id = g.guest_id
JOIN rooms r
    ON b.room_id = r.room_id;


-- View payments for a specific booking
SELECT
    p.payment_id,
    p.amount,
    p.payment_date,
    p.payment_method,
    p.status
FROM payments p
WHERE p.booking_id = 1;


-- Total revenue from completed payments
SELECT
    SUM(p.amount) AS total_revenue
FROM payments p
WHERE p.status = 'completed';


-- Revenue summary by payment method
SELECT
    p.payment_method,
    AVG(p.amount) AS avg_payment_amount,
    MIN(p.amount) AS smallest_payment,
    MAX(p.amount) AS largest_payment,
    SUM(p.amount) AS total_revenue
FROM payments p
GROUP BY p.payment_method
ORDER BY total_revenue DESC;


-- Revenue summary by booking status
SELECT
    b.booking_status,
    SUM(p.amount) AS total_revenue,
    AVG(p.amount) AS avg_payment_amount,
    MIN(p.amount) AS min_payment_amount,
    MAX(p.amount) AS max_payment_amount,
    COUNT(*) AS payment_count
FROM payments p
JOIN bookings b
    ON p.booking_id = b.booking_id
GROUP BY b.booking_status
ORDER BY total_revenue DESC;


-- Which payment methods generated more than KSh 50,000?
-- Demonstrates: HAVING
SELECT
    p.payment_method,
    SUM(p.amount) AS total_revenue
FROM payments p
GROUP BY p.payment_method
HAVING SUM(p.amount) > 50000
ORDER BY total_revenue DESC;


-- Highest and lowest payment amounts
SELECT
    MIN(amount) AS lowest_payment,
    MAX(amount) AS highest_payment
FROM payments;


-- =========================================================
-- STAFF QUERIES
-- =========================================================

-- View all staff members
SELECT
    staff_id,
    first_name,
    last_name,
    position,
    department,
    phone,
    email,
    date_hired
FROM staff;


-- View staff names and their positions
SELECT
    first_name,
    last_name,
    position
FROM staff
ORDER BY position ASC;


-- Find all General Managers
SELECT
    staff_id,
    first_name,
    last_name,
    phone,
    email
FROM staff
WHERE position = 'General Manager';


-- Count the number of staff in each position
SELECT
    position,
    COUNT(*) AS total_staff
FROM staff
GROUP BY position
ORDER BY total_staff DESC;


-- View staff ordered by hire date
SELECT
    first_name,
    last_name,
    position,
    date_hired
FROM staff
ORDER BY date_hired ASC;


-- Find staff hired after January 1, 2023
SELECT
    first_name,
    last_name,
    position,
    date_hired
FROM staff
WHERE date_hired > '2023-01-01'
ORDER BY date_hired ASC;


-- Count the total number of staff members
SELECT
    COUNT(*) AS total_staff_members
FROM staff;


-- View staff contact information
SELECT
    first_name,
    last_name,
    phone,
    email
FROM staff
ORDER BY last_name ASC;


-- =========================================================
-- SERVICES QUERIES
-- =========================================================

-- Display all hotel services
SELECT *
FROM services;


-- Display services from most expensive to cheapest
SELECT
    service_name,
    price
FROM services
ORDER BY price DESC;


-- Count how many times each service has been used
SELECT
    s.service_name,
    COUNT(bs.service_id) AS times_used
FROM services s
LEFT JOIN booking_services bs
    ON s.service_id = bs.service_id
GROUP BY s.service_id, s.service_name
ORDER BY times_used DESC;


-- Find the most popular services
SELECT
    s.service_name,
    COUNT(bs.service_id) AS times_used
FROM services s
JOIN booking_services bs
    ON s.service_id = bs.service_id
GROUP BY s.service_id, s.service_name
ORDER BY times_used DESC;


-- Calculate revenue generated by each service
SELECT
    s.service_name,
    SUM(s.price * bs.quantity) AS total_revenue
FROM services s
JOIN booking_services bs
    ON s.service_id = bs.service_id
GROUP BY s.service_id, s.service_name
ORDER BY total_revenue DESC;


-- =========================================================
-- REQUIRED VIEWS
-- =========================================================

-- View 1:
-- Create a useful summary of all bookings
CREATE OR REPLACE VIEW booking_summary AS
SELECT
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    DATEDIFF(b.check_out_date, b.check_in_date) AS number_of_nights,
    b.booking_status
FROM bookings b
JOIN guests g
    ON b.guest_id = g.guest_id
JOIN rooms r
    ON b.room_id = r.room_id;


-- Example query using booking_summary
SELECT *
FROM booking_summary
ORDER BY check_in_date ASC;


-- View 2:
-- Create a useful revenue summary for each hotel
CREATE OR REPLACE VIEW hotel_revenue AS
SELECT
    h.hotel_id,
    h.hotel_name,
    h.location,
    COALESCE(SUM(p.amount), 0) AS total_revenue
FROM hotels h
LEFT JOIN rooms r
    ON h.hotel_id = r.hotel_id
LEFT JOIN bookings b
    ON r.room_id = b.room_id
LEFT JOIN payments p
    ON b.booking_id = p.booking_id
GROUP BY
    h.hotel_id,
    h.hotel_name,
    h.location;


-- Example query using hotel_revenue
SELECT
    hotel_id,
    hotel_name,
    location,
    total_revenue
FROM hotel_revenue
ORDER BY total_revenue DESC;
