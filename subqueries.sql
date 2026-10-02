-- =========================================================
--  Subqueries
-- =========================================================


------------------------------
-- ADR GREATER THAN AVG ADR 
------------------------------
select * from hotel_bookings 
          where adr>(select avg(adr) from hotel_bookings);

------------------------------
--  BOOKING WITH MAX ADR
------------------------------
select * from hotel_bookings 
	   where adr=(select max(adr) from hotel_bookings);

------------------------------
--  BOOKING WITH MIN ADR
------------------------------
select * from hotel_bookings 
        where adr=(select min(adr) from hotel_bookings);

------------------------------
-- CUSTOMER WHO HAVE BOOKINGS
------------------------------
select * from customers 
	    where customer_id in (select distinct customer_id from hotel_bookings);

---------------------------------------------
-- CUSTOMERS FROM INDIA WITH BOOKINGS
---------------------------------------------
select * from customers 
         where country='India' and customer_id in (select customer_id from customers);

---------------------------------------------
-- CUSTOMER WHO BOOKED CITY HOTEL 
---------------------------------------------
select * from customers 
          where customer_id in (select customer_id from hotel_bookings where hotel='City Hotel');