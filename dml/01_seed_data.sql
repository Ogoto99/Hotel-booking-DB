INSERT INTO hotels (hotel_name, location, address, phone, email, rating) VALUES
    ('Sarova Stanley', 'Nairobi', 'Corner of Kenyatta Avenue and Kimathi Street, Nairobi', '+254709111000', 'info@sarovastanley.com', 4.5),
    ('Villa Rosa Kempinski', 'Nairobi', 'Chiromo Road, Nairobi', '+254703049000', 'info@villakempinski.co.ke', 4.6),
    ('Ole Sereni Hotel', 'Nairobi', 'Mombasa Road, Nairobi', '+254709760000', 'info@olesereni.com', 4.4),
    ('Radisson Blu Hotel Nairobi', 'Nairobi', 'Elgon Road, Nairobi', '+254709810000', 'info.nairobi@radissonblu.com', 4.5),
    ('PrideInn Azure', 'Nairobi', 'Lantana Road, Westlands, Nairobi', '+254709760001', 'info@prideinn.co.ke', 4.3),
    ('Sarova Whitesands Beach Resort', 'Mombasa', 'Malindi Road, Mombasa', '+254709111111', 'whitesands@sarovahotels.com', 4.5),
    ('PrideInn Paradise Beach Resort', 'Mombasa', 'Shanzu Beach, Mombasa', '+254709760100', 'paradise@prideinn.co.ke', 4.4),
    ('Baobab Beach Resort', 'Mombasa', 'Diani Beach Road, Mombasa', '+254709760200', 'info@baobabresort.com', 4.6),
    ('Diani Reef Beach Resort', 'Diani', 'Diani Beach Road, Kwale', '+254709760300', 'info@dianireef.com', 4.3),
    ('English Point Marina', 'Mombasa', 'Cement Road, Nyali, Mombasa', '+254709760400', 'info@englishpointmarina.com', 4.2),
    ('Lake Naivasha Resort', 'Naivasha', 'Moi South Lake Road, Naivasha', '+254709760500', 'info@lakenaivasharesort.com', 4.1),
    ('Enashipai Resort and Spa', 'Naivasha', 'Moi South Lake Road, Naivasha', '+254709760600', 'info@enashipai.com', 4.5),
    ('Sarova Mara Game Camp', 'Maasai Mara', 'Maasai Mara National Reserve', '+254709760700', 'maracamp@sarovahotels.com', 4.6),
    ('Keekorok Lodge', 'Maasai Mara', 'Maasai Mara National Reserve', '+254709760800', 'info@keekorok.com', 4.4),
    ('Fairmont Mount Kenya Safari Club', 'Nanyuki', 'Mount Kenya Road, Nanyuki', '+254709760900', 'info@fairmont.com', 4.7);
-- Guest records
INSERT INTO guests (first_name, last_name, email, phone, address) VALUES
    ('Jane', 'Mwove', 'jane.mwove@gmail.com', '+254711234567', 'Nairobi, Kenya'),
    ('Brian', 'Otieno', 'brian.otieno@gmail.com', '+254722345678', 'Kisumu, Kenya'),
    ('Mercy', 'Wanjiku', 'mercy.wanjiku@gmail.com', '+254733456789', 'Nakuru, Kenya'),
    ('Kevin', 'Kiptoo', 'kevin.kiptoo@gmail.com', '+254744567890', 'Eldoret, Kenya'),
    ('Sharon', 'Achieng', 'sharon.achieng@gmail.com', '+254755678901', 'Mombasa, Kenya');
-- Booking records
INSERT INTO bookings (guest_id, room_id, check_in_date, check_out_date, booking_status) VALUES
    (1, 1, '2026-08-15', '2026-08-18', 'confirmed'),
    (2, 3, '2026-08-20', '2026-08-23', 'pending'),
    (3, 2, '2026-07-10', '2026-07-14', 'checked_out'),
    (4, 5, '2026-08-11', '2026-08-14', 'checked_in'),
    (5, 4, '2026-09-01', '2026-09-05', 'confirmed'),
    (1, 2, '2026-06-03', '2026-06-06', 'cancelled'),
    (2, 1, '2026-09-10', '2026-09-13', 'confirmed'),
    (3, 4, '2026-07-01', '2026-07-04', 'checked_out'),
    (4, 2, '2026-08-22', '2026-08-25', 'confirmed'),
    (5, 3, '2026-09-15', '2026-09-17', 'pending'),
    (1, 5, '2026-05-13', '2026-05-16', 'checked_out'),
    (2, 4, '2026-07-25', '2026-07-29', 'checked_out'),
    (3, 1, '2026-08-30', '2026-09-02', 'confirmed'),
    (4, 3, '2026-10-01', '2026-10-05', 'confirmed'),
    (5, 2, '2026-08-08', '2026-08-10', 'checked_out');

-- payment records
INSERT INTO payments (booking_id, amount, payment_date, payment_method, status) VALUES
    (1, 450.00, '2026-08-10', 'credit_card', 'completed'),
    (2, 300.00, '2026-08-15', 'paypal', 'completed'),
    (3, 400.00, '2026-07-05', 'bank_transfer', 'completed'),
    (4, 350.00, '2026-08-10', 'credit_card', 'completed'),
    (5, 500.00, '2026-08-25', 'paypal', 'completed'),
    (6, 200.00, '2026-06-01', 'bank_transfer', 'completed'),
    (7, 450.00, '2026-09-05', 'credit_card', 'completed'),
    (8, 300.00, '2026-07-02', 'paypal', 'completed'),
    (9, 400.00, '2026-08-20', 'bank_transfer', 'completed'),
    (10, 350.00, '2026-09-12', 'credit_card', 'completed'),
    (11, 500.00, '2026-05-10', 'paypal', 'completed'),
    (12, 200.00, '2026-07-20', 'bank_transfer', 'completed'),
    (13, 450.00, '2026-08-28', 'credit_card', 'completed'),
    (14, 300.00, '2026-10-01', 'paypal', 'completed'),
    (15, 400.00, '2026-08-05', 'bank_transfer', 'completed');
