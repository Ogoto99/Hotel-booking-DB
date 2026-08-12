-- View 1: Booking Summary
CREATE VIEW booking_summary AS
SELECT
    booking_id,
    guest_id,
    room_id,
    check_in_date,
    check_out_date,
    booking_status
FROM bookings;

-- Example query
SELECT * FROM booking_summary;


-- View 2: Hotel Revenue
CREATE VIEW hotel_revenue AS
SELECT
    b.booking_id,
    SUM(p.amount) AS total_revenue
FROM bookings b
JOIN payments p
    ON b.booking_id = p.booking_id
WHERE p.status = 'completed'
GROUP BY b.booking_id;

-- Example query
SELECT * FROM hotel_revenue;
