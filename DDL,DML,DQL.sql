-- =========================================================
--  DDL,DML,DQL
-- =========================================================
-----------------------------------------------------------
-- DDL
-----------------------------------------------------------

-----------------------------------------------------------
-- 1. Create
-----------------------------------------------------------

create table test_table(
test_id int auto_increment primary key,
person_name varchar(20)
);

select * from test_table;

-----------------------------------------------------------
-- Alter Table
-----------------------------------------------------------
alter table test_table add column email varchar(20);
alter table test_table rename column email to email_id;


-----------------------------------------------------------
-- Drop 
-----------------------------------------------------------
alter table test_table drop column email_id;

truncate table test_table;

drop table test_table;

-----------------------------------------------------------
-- DML
-----------------------------------------------------------

---------------
-- Insert
---------------
insert into test_table(test_id,person_name,email_id)values
(101,"Siya Khetal","siya@gmail.com");

---------------
-- Update
---------------
set sql_safe_updates=0;
update test_table set person_name="Siya Patil" where test_id=1;

---------------
-- Delete
---------------
 delete  from test_table where test_id=101;
 
 
select * from test_table;

-----------------------------------------------------------
-- DQL
-----------------------------------------------------------

---------------
-- Select
---------------
select * from test_table;



