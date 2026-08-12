--Hotel Booking Database Queries
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


--Bookings queries
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
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id;

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
JOIN guests g ON b.guest_id = g.guest_id
JOIN rooms r ON b.room_id = r.room_id
WHERE b.booking_status IN ('confirmed', 'checked_in');

-- Find bookings for a selected guest
SELECT
    b.booking_id,
    r.room_number,
    b.check_in_date,
    b.check_out_date,
    b.booking_status
FROM bookings b
JOIN rooms r ON b.room_id = r.room_id
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
