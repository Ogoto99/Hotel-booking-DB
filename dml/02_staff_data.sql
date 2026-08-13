-- HOTEL BOOKING DATABASE
-- STAFF SEED DATA
-- File: dml/02_staff_data.sql

INSERT INTO staff
(first_name, last_name, gender, phone, email, position, department, date_hired, salary, employment_status, hotel_id)
VALUES
('Nancy', 'Michael', 'Female', '0739366889', 'nancy.michael@hotel.com', 'General Manager', 'Management', '2023-02-15', 149000.00, 'active', 1),

('Praise', 'Malekh', 'Male', '0752973830', 'praise.malekh@hotel.com', 'Assistant Manager', 'Management', '2020-07-07', 90000.00, 'active', 1),

('Stella', 'Nyaundi', 'Female', '0788933766', 'stella.nyaundi@hotel.com', 'Front Office Supervisor', 'Front Office', '2021-09-05', 70000.00, 'active', 1),

('Jane', 'Ndanu', 'Female', '0769016384', 'jane.ndanu@hotel.com', 'Receptionist', 'Front Office', '2024-09-12', 65000.00, 'active', 1),

('Josphat', 'Kimutai', 'Male', '0798931577', 'josphat.kimutai@hotel.com', 'Maintenance Officer', 'Maintenance', '2021-08-04', 80000.00, 'active', 1),

('Michael', 'Wahinya', 'Male', '0798355778', 'michael.wahinya@hotel.com', 'Head Chef', 'Food & Beverages', '2023-09-01', 80000.00, 'active', 1),

('Angelah', 'Maina', 'Female', '0755443228', 'angelah.maina@hotel.com', 'Sous Chef', 'Food & Beverages', '2024-07-03', 75000.00, 'active', 1),

('Michael', 'Nyutu', 'Male', '0799900955', 'michael.nyutu@hotel.com', 'Waiter', 'Food & Beverages', '2025-07-01', 70000.00, 'active', 1),

('Wendy', 'Njeri', 'Female', '0799533536', 'wendy.njeri@hotel.com', 'Waitress', 'Food & Beverages', '2020-02-20', 70000.00, 'active', 1),

('Vincent', 'Nicholas', 'Male', '0789943410', 'vincent.nicholas@hotel.com', 'Accountant', 'Finance', '2023-04-11', 80000.00, 'active', 1),

('Otieno', 'Brayan', 'Male', '0765909964', 'otieno.brayan@hotel.com', 'Security Officer', 'Security', '2024-03-11', 55000.00, 'active', 1),

('Ian', 'Momanyi', 'Male', '0788866540', 'ian.momanyi@hotel.com', 'Reservations Officer', 'Reservations', '2023-12-11', 80000.00, 'active', 1),

('Celestine', 'Mbithe', 'Female', '0793445566', 'celestine.mbithe@hotel.com', 'Human Resources Officer', 'Human Resources', '2025-10-05', 90000.00, 'active', 1),

('Pretty', 'Mbula', 'Female', '0765445566', 'pretty.mbula@hotel.com', 'Housekeeping Officer', 'Housekeeping', '2024-07-06', 70000.00, 'active', 1),

('John', 'Kiptoo', 'Male', '0765559720', 'john.kiptoo@hotel.com', 'Housekeeper', 'Housekeeping', '2023-10-09', 70000.00, 'active', 1),

('Candy', 'Wambui', 'Female', '0789936545', 'candy.wambui@hotel.com', 'Guest Relations Officer', 'Guest Relations', '2020-08-03', 70000.00, 'active', 1),

('Nickson', 'Njenga', 'Male', '0789944324', 'nickson.njenga@hotel.com', 'Concierge', 'Guest Relations', '2024-09-12', 75000.00, 'active', 1),

('Devina', 'Mutiso', 'Female', '0765437889', 'devina.mutiso@hotel.com', 'Laundry Attendant', 'Laundry', '2022-05-06', 60000.00, 'active', 1),

('David', 'Mutisya', 'Male', '0788997665', 'david.mutisya@hotel.com', 'IT Support Officer', 'IT', '2021-10-12', 75000.00, 'active', 1),

('Mercy', 'Mwikali', 'Female', '0754323467', 'mercy.mwikali@hotel.com', 'Sales Executive', 'Sales & Marketing', '2024-10-02', 80000.00, 'active', 1),

('David', 'Otieno', 'Male', '0711000001', 'david.otieno@hotel.com', 'General Manager', 'Management', '2022-01-15', 150000.00, 'active', 2),

('Mercy', 'Wanjiku', 'Female', '0711000002', 'mercy.wanjiku@hotel.com', 'General Manager', 'Management', '2022-03-20', 150000.00, 'active', 3),

('Brian', 'Kiptoo', 'Male', '0711000003', 'brian.kiptoo@hotel.com', 'General Manager', 'Management', '2021-06-10', 155000.00, 'active', 4),

('Lilian', 'Akinyi', 'Female', '0711000004', 'lilian.akinyi@hotel.com', 'General Manager', 'Management', '2023-02-01', 145000.00, 'active', 5),

('Samuel', 'Mwangi', 'Male', '0711000005', 'samuel.mwangi@hotel.com', 'General Manager', 'Management', '2020-09-15', 160000.00, 'active', 6),

('Faith', 'Njeri', 'Female', '0711000006', 'faith.njeri@hotel.com', 'General Manager', 'Management', '2022-11-05', 150000.00, 'active', 7),

('Kevin', 'Mutua', 'Male', '0711000007', 'kevin.mutua@hotel.com', 'General Manager', 'Management', '2023-04-12', 145000.00, 'active', 8),

('Ann', 'Chebet', 'Female', '0711000008', 'ann.chebet@hotel.com', 'General Manager', 'Management', '2021-08-18', 155000.00, 'active', 9),

('George', 'Kariuki', 'Male', '0711000009', 'george.kariuki@hotel.com', 'General Manager', 'Management', '2020-05-22', 160000.00, 'active', 10),

('Susan', 'Atieno', 'Female', '0711000010', 'susan.atieno@hotel.com', 'General Manager', 'Management', '2023-07-03', 145000.00, 'active', 11),

('Peter', 'Kamau', 'Male', '0711000011', 'peter.kamau@hotel.com', 'General Manager', 'Management', '2022-10-14', 150000.00, 'active', 12),

('Jane', 'Wambui', 'Female', '0711000012', 'jane.wambui@hotel.com', 'General Manager', 'Management', '2021-12-01', 155000.00, 'active', 13),

('Collins', 'Maina', 'Male', '0711000013', 'collins.maina@hotel.com', 'General Manager', 'Management', '2023-01-09', 145000.00, 'active', 14),

('Grace', 'Muthoni', 'Female', '0711000014', 'grace.muthoni@hotel.com', 'General Manager', 'Management', '2020-11-16', 160000.00, 'active', 15);
