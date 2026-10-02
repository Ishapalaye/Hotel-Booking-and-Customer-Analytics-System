-- =========================================================
-- Business Analysis 
-- =========================================================

 -------------------------------
 -- CANCELLATION ANALYSIS
 -------------------------------
 select is_canceled, 
       count(*) as total_bookings 
       from hotel_bookings 
       group by is_canceled;
       

-------------------------------
 -- BOOKING BY YEAR
 -------------------------------
select arrival_date_year,
       count(*) as total_bookings 
       from hotel_bookings
       group by arrival_date_year 
       order by arrival_date_year;


-------------------------------
 -- BOOKING BY MONTH
 -------------------------------
select arrival_date_month,
	   arrival_date_year,
       count(*) as total_booking
       from hotel_bookings
       group by arrival_date_month,arrival_date_year 
       order by arrival_date_year,total_booking;
       
-------------------------------
 -- CUSTOMER TYPE ANALYSIS 
 -------------------------------
select  customer_type,
		count(*) as total_bookings 
        from hotel_bookings 
        group by customer_type 
        order by total_bookings desc;

select * from hotel_bookings;


-------------------------------
 -- ROOM TYPE ANALYSIS 
 -------------------------------
select reserved_room_type,
       count(*) as total_bookings 
       from hotel_bookings 
       group by reserved_room_type;
       

select assigned_room_type,
       count(*) as total_bookings 
       from hotel_bookings 
       group by assigned_room_type;
       
       
-------------------------------
 -- DEPOSIT TYPE ANALYSIS
 -------------------------------
select deposit_type,
       count(*) as total_bookings 
       from hotel_bookings
       group by deposit_type;
       
-------------------------------
 -- RESERVATION ANALYSIS 
 -------------------------------
select reservation_status,
       count(*) as total_bookings
       from hotel_bookings
       group by reservation_status;
       
       
-------------------------------
 -- TOTAL REVENUE 
 -------------------------------
select hotel,
       round(sum(adr),2) as total_revenue
       from hotel_bookings
       group by hotel;

-------------------------------
 -- MEAL ANALYSIS 
 -------------------------------
select meal,
      count(*)  as total_booking 
      from hotel_bookings
      group by meal;

-------------------------------
 -- TOTAL ADULTS, CHILDREN AND BABIES
-------------------------------
select sum(adults) as total_adults,
       sum(babies) as total_babies,
       sum(children) as total_children 
       from hotel_bookings;
       
-------------------------------
 -- FAMILY BOOKINGS
-------------------------------
select count(*) as family_booking
	   from hotel_bookings 
       where children>0 or babies>0;
       
-------------------------------
 -- COUPLE BOOKINGS 
-------------------------------
select count(*) as single_guest_bookings 
       from hotel_bookings 
       where adults=1 and babies=0 and children=0;
       


-------------------------------
 -- CUSTOMER WISE BOOKING COUNT
-------------------------------
select c.customer_id,
	   c.customer_name,
       c.country,
       count(h.booking_id) as total_bookings 
       from  customers c 
       left join hotel_bookings h 
       on h.customer_id=c.customer_id 
       group by c.customer_id,c.customer_name,c.country;

-------------------------------
 -- CUSTOMER WISE BOOKING
-------------------------------
select c.country,
       count(h.booking_id) as total_bookings
       from customers c 
       inner join hotel_bookings h 
       on c.customer_id=h.customer_id
       group by c.country;
       
-------------------------------
 -- COUNTRY WISE REVENUE
-------------------------------
select c.country,
       count(h.booking_id) as total_bookings,
       round(sum(h.adr),2) as total_revenue 
       from customers c
       inner join hotel_bookings h
       on c.customer_id=h.customer_id
       group by c.country;
       
-------------------------------
 -- TOP 10 CUSTOMERS BY BOOKINGS 
-------------------------------
select c.customer_id,
       c.customer_name,
       count(h.booking_id) as total_bookings
       from customers c 
       inner join hotel_bookings h 
       on c.customer_id=h.customer_id
       group by c.customer_id,c.customer_name 
       limit 10;
       
-------------------------------
 -- HOTEL + COUTRY ANALYSIS
-------------------------------
select h.hotel,
       c.country,
       count(*) as total_bookings 
       from hotel_bookings h 
       inner join customers c
       on h.customer_id=h.customer_id
       group by h.hotel,c.country;
