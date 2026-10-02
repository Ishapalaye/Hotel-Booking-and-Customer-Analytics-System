create database hotel_booking_system;
use hotel_booking_system;

select * from hotel_bookings;
select * from customers;


----------------------
-- count()
----------------------
select count(*) as total_bookings from hotel_bookings;
select count(*) as total_customers from customers;

----------------------
-- limit()
----------------------
select * from hotel_bookings limit 3;
select * from customers limit 10;


-- =========================================================
--  DATA QUALITY CHECK
-- =========================================================
select * from hotel_bookings where is_canceled  not in(1);

select * from hotel_bookings where is_repeated_guest;

select * from hotel_bookings where lead_time>101;

select * from hotel_bookings where adults>0 and children>0 and babies>0;

select * from hotel_bookings where adr>171;



