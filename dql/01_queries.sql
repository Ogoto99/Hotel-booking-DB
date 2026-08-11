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
