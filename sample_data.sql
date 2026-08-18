USE hotel_booking;

INSERT INTO Hotels (hotel_name, city, address, phone) VALUES
('Safari View Hotel', 'Nairobi', 'Westlands', '0712345678'),
('Coastal Breeze Hotel', 'Mombasa', 'Nyali', '0723456789'),
('Mountain Peak Lodge', 'Nakuru', 'Milimani', '0734567890');

INSERT INTO Rooms (hotel_id, room_number, room_type, price_per_night, status) VALUES
(1, '101', 'Single', 3500, 'Available'),
(1, '102', 'Double', 5500, 'Occupied'),
(1, '201', 'Suite', 12000, 'Available'),
(2, '101', 'Single', 3000, 'Available'),
(2, '102', 'Double', 5000, 'Occupied'),
(3, '301', 'Suite', 10000, 'Maintenance');

INSERT INTO Guests (first_name, last_name, email, phone) VALUES
('John', 'Kamau', 'john@email.com', '0700000001'),
('Mary', 'Achieng', 'mary@email.com', '0700000002'),
('Peter', 'Mutiso', 'peter@email.com', '0700000003'),
('Grace', 'Njeri', 'grace@email.com', '0700000004');

INSERT INTO Bookings (guest_id, room_id, check_in, check_out, total_amount, booking_status) VALUES
(1, 2, '2026-08-01', '2026-08-03', 11000, 'Completed'),
(2, 3, '2026-08-05', '2026-08-07', 24000, 'Confirmed'),
(3, 5, '2026-08-10', '2026-08-12', 10000, 'Confirmed'),
(4, 1, '2026-08-15', '2026-08-16', 3500, 'Cancelled');

INSERT INTO Payments (booking_id, payment_date, amount, payment_method) VALUES
(1, '2026-08-01', 11000, 'Mpesa'),
(2, '2026-08-05', 24000, 'Card'),
(3, '2026-08-10', 10000, 'Cash');