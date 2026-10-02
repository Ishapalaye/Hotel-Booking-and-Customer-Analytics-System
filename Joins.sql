-- =========================================================
--  Joins
-- =========================================================

select * from hotel_bookings;

select *from customers;



       
------------------------
-- RIGHT JOIN
------------------------
select c.customer_id,
       c.customer_name,
       c.country,
       h.booking_id,
       h.hotel from customers c 
       right join hotel_bookings h 
       on c.customer_id=h.customer_id;

-------------------------------
 -- BOOKING WITH CUSTOMER DETAILS
-------------------------------
select h.booking_id,
	   h.hotel,
       h.adr,
       c.customer_name,
       c.email,
       c.country from hotel_bookings h
       inner join customers c 
       on h.customer_id=c.customer_id;
       
-------------------------------
 -- CUSTOMER WISE BOOKING COUNT
-------------------------------

select c.customer_id,
       c.customer_name,
       count(h.booking_id) as total_booking
       from customers c
       left join hotel_bookings h 
       on c.customer_id=h.customer_id 
       group by c.customer_id,c.customer_name;


-------------------------------
 -- CUSTOMER WISE REVENUE
-------------------------------
select c.customer_id,
	   c.customer_name,
       sum(h.adr) as total_revenue
       from customers c 
       inner join hotel_bookings h
       on c.customer_id=h.customer_id
       group by c.customer_id,c.customer_name
       order by total_revenue desc;
       
-------------------------------
 -- COUNTRY WISE BOOKING ANALYSIS 
-------------------------------

select c.country,
       count(h.booking_id) as total_booking,
       round(sum(h.adr),2) as total_revenue 
       from customers c 
       inner join hotel_bookings h
       on c.customer_id=h.customer_id 
       group by c.country;
       
-------------------------------
 -- HOTEL + CUSTOMER ANALYSIS 
-------------------------------
select h.hotel,
       c.country,
       count(*) as total_booking
       from hotel_bookings h 
       inner join customers c 
       on h.customer_id=c.customer_id 
       group by h.hotel,c.country
       order by total_booking desc;
       
-------------------------------
 -- CUSTOMER +CANCELLATION
-------------------------------
select c.customer_name,
       count(h.booking_id) as total_bookings,
       sum(h.is_canceled) as total_cancellations
       from customers c
       inner join hotel_bookings h
       on c.customer_id=h.customer_id 
       group by c.customer_id,c.customer_name;


