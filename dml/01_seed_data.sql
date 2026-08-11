-- Booking records
INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date, booking_status) VALUES
    (1, 1, '2026-08-15', '2026-08-18', 'confirmed'),
    (2, 3, '2026-08-20', '2026-08-23', 'pending'),
    (3, 2, '2026-07-10', '2026-07-14', 'checked_out'),
    (4, 5, '2026-08-11', '2026-08-14', 'checked_in'),
    (5, 4, '2026-09-01', '2026-09-05', 'confirmed'),
    (1, 2, '2026-06-03', '2026-06-06', 'cancelled');
