-- Bookings table
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    booking_status VARCHAR(20) NOT NULL DEFAULT 'confirmed',
    CONSTRAINT fk_bookings_guest
        FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    CONSTRAINT fk_bookings_room
        FOREIGN KEY (room_id) REFERENCES rooms(room_id),
    CONSTRAINT chk_booking_dates
        CHECK (check_out_date > check_in_date),
    CONSTRAINT chk_booking_status
        CHECK (booking_status IN ('pending', 'confirmed', 'checked_in', 'checked_out', 'cancelled'))
);
