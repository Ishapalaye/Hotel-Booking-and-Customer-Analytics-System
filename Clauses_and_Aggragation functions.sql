-- =========================================================
--  Clauses and Aggregation Function
-- =========================================================

---------------
-- WHERE
---------------

select * from hotel_bookings where hotel='Resort Hotel';

select * from hotel_bookings where  adr>100;

---------------
-- GROUP BY
---------------
select customer_id,
       sum(adr) as Average_Daily_Rate  
       from hotel_bookings 
       group by  customer_id;
       
---------------
-- ORDER BY
---------------
select * from hotel_bookings 
         order by lead_time desc;
         
---------------
-- HAVING
---------------
select hotel ,
       count(*) as total_booking 
       from hotel_bookings 
       group by hotel 
       having count(*)>14;

----------------------------
-- AND
----------------------------

select * from hotel_bookings 
         where adr>=240 and adr<300; 

---------------
-- OR
---------------
select * from hotel_bookings 
          where lead_time>250 or lead_time<200;

---------------
-- COUNT()
---------------
select count(*) from hotel_bookings where hotel='City Hotel';

---------------
-- MAX
---------------
select max(adr) as total_revenue from hotel_bookings;

---------------
-- MIN
---------------
select min(adr) as total_revenue from hotel_bookings;

---------------
-- AVG
---------------
select avg(lead_time)  from hotel_bookings;

---------------
-- SUM
---------------
select sum(babies) from hotel_bookings where hotel='Resort Hotel';

---------------
-- LIKE
---------------
select * from customers where customer_name like 'I%';

select * from customers where email like '%@gmail.com';

---------------
-- IN
---------------
select * from customers where country in ('India');

------------------------------
-- HOTEL - WISE AGGREGATION FUNCTION
------------------------------
select hotel,
       count(*) as total_booking, 
	   round(avg(adr),2) as AVG_revenue ,
       sum(adr) from hotel_bookings group by hotel;
       
------------------------------
-- ALL AGGREGATION FUNCTIONS
------------------------------

select count(*) as total_booking,
      sum(adr) as total_revenue,
      round(avg(adr),2) as avg_revenue,
      min(adr) as minimun_adr, 
      max(adr) as maximum_adr from hotel_bookings;



