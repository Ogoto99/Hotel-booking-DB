-- =========================================================
-- HOTEL BOOKING DATABASE - VIEWS
-- =========================================================

-- =========================================================
-- VIEW 1: BOOKING SUMMARY
-- Shows useful booking information together with
-- guest and room details.
-- =========================================================

CREATE OR REPLACE VIEW booking_summary AS
SELECT
    b.booking_id,
    g.guest_id,
    CONCAT(g.first_name, ' ', g.last_name) AS guest_name,
    r.room_id,
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


-- Example query:
-- What are the current booking details?
SELECT *
FROM booking_summary;


-- =========================================================
-- VIEW 2: HOTEL REVENUE
-- Shows the total completed payment revenue generated
-- by each hotel.
-- =========================================================

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
    AND p.status = 'completed'
GROUP BY
    h.hotel_id,
    h.hotel_name,
    h.location;


-- Example query:
-- Which hotels generate the most revenue?
SELECT
    hotel_name,
    location,
    total_revenue
FROM hotel_revenue
ORDER BY total_revenue DESC;