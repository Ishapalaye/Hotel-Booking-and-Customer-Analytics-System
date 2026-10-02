-- =========================================================
--  Text Functions
-- =========================================================


------------------------------
-- UPPER
------------------------------
select upper(customer_name) as all_capital from customers ;

------------------------------
-- LOWER
------------------------------
select lower(country) as all_small from customers;

------------------------------
-- CONCAT
------------------------------
select concat(customer_name,'-',country) as joining from customers;

------------------------------
-- SUBSTRING
------------------------------
select substring(hotel,1,4) from hotel_bookings;

------------------------------
-- LENGTH
------------------------------
select length(customer_name) as count_name from customers;


------------------------------
-- REPLACE
------------------------------
SELECT
    customer_name,
    REPLACE(customer_name, ' ', '_') AS modified_name
FROM customers;

select * from customers;

