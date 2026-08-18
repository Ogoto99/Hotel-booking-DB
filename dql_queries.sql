dql_queries.sql

USE hotel_booking;

-- =====================================================
-- BASIC DQL QUERIES
-- =====================================================

-- 1. COUNT: Total number of guests
SELECT COUNT(*) AS total_guests
FROM Guests;

-- 2. COUNT: Total number of bookings
SELECT COUNT(*) AS total_bookings
FROM Bookings;

-- 3. SUM: Total revenue from all bookings
SELECT SUM(total_amount) AS total_revenue
FROM Bookings;

-- 4. AVG: Average room price
SELECT AVG(price_per_night) AS average_room_price
FROM Rooms;

-- 5. MIN and MAX: Cheapest and most expensive room
SELECT MIN(price_per_night) AS cheapest_room,
MAX(price_per_night) AS most_expensive_room
FROM Rooms;

-- =====================================================
-- GROUP BY
-- =====================================================

-- 6. Number of rooms by room type
SELECT room_type,
COUNT(*) AS room_count
FROM Rooms
GROUP BY room_type;

-- 7. Total revenue by booking status
SELECT booking_status,
SUM(total_amount) AS revenue
FROM Bookings
GROUP BY booking_status;

-- =====================================================
-- ORDER BY
-- =====================================================

-- 8. Rooms ordered from highest price to lowest
SELECT room_number,
room_type,
price_per_night
FROM Rooms
ORDER BY price_per_night DESC;

-- 9. Bookings ordered by total amount
SELECT booking_id,
total_amount
FROM Bookings
ORDER BY total_amount DESC;

-- =====================================================
-- HAVING (Advanced)
-- =====================================================

-- 10. Room types whose average price is greater than 5000
SELECT room_type,
AVG(price_per_night) AS avg_price
FROM Rooms
GROUP BY room_type
HAVING AVG(price_per_night) > 5000;

-- 11. Hotels earning more than 15000
SELECT h.hotel_name,
SUM(b.total_amount) AS hotel_revenue
FROM Hotels h
JOIN Rooms r ON h.hotel_id = r.hotel_id
JOIN Bookings b ON r.room_id = b.room_id
GROUP BY h.hotel_name
HAVING SUM(b.total_amount) > 15000
ORDER BY hotel_revenue DESC;

-- =====================================================
-- SCALAR SUBQUERY
-- =====================================================

-- 12. Rooms that cost more than the average room price
SELECT room_number,
room_type,
price_per_night
FROM Rooms
WHERE price_per_night > (
SELECT AVG(price_per_night)
FROM Rooms
);

-- 13. Bookings with total amount greater than average booking amount
SELECT booking_id,
total_amount
FROM Bookings
WHERE total_amount > (
SELECT AVG(total_amount)
FROM Bookings
);

-- =====================================================
-- EXISTS / CORRELATED SUBQUERY
-- =====================================================

-- 14. Hotels that have at least one occupied room
SELECT h.hotel_name,
h.city
FROM Hotels h
WHERE EXISTS (
SELECT 1
FROM Rooms r
WHERE r.hotel_id = h.hotel_id
AND r.status = 'Occupied'
);

-- 15. Guests who have made at least one booking
SELECT g.first_name,
g.last_name
FROM Guests g
WHERE EXISTS (
SELECT 1
FROM Bookings b
WHERE b.guest_id = g.guest_id
);

-- 16. Rooms that have never been booked
SELECT r.room_number,
r.room_type
FROM Rooms r
WHERE NOT EXISTS (
SELECT 1
FROM Bookings b
WHERE b.room_id = r.room_id
);

-- =====================================================
-- CORRELATED SUBQUERY
-- =====================================================

-- 17. Guests whose booking amount is above the average booking amount
--     for that same guest
SELECT g.first_name,
g.last_name,
b.booking_id,
b.total_amount
FROM Guests g
JOIN Bookings b ON g.guest_id = b.guest_id
WHERE b.total_amount > (
SELECT AVG(b2.total_amount)
FROM Bookings b2
WHERE b2.guest_id = g.guest_id
);

-- =====================================================
-- QA / VALIDATION QUERIES
-- =====================================================

-- 18. Check bookings without payments
SELECT b.booking_id,
b.total_amount
FROM Bookings b
LEFT JOIN Payments p ON b.booking_id = p.booking_id
WHERE p.payment_id IS NULL;

-- 19. Check rooms linked to valid hotels
SELECT r.room_id,
r.room_number,
h.hotel_name
FROM Rooms r
JOIN Hotels h ON r.ho