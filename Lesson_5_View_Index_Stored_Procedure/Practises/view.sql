use classicmodels;

create view customer_views as
select customerNumber, customerName, phone
from customers;

select * 
from customer_views;

-- update view 
create or replace view customer_views as
select customerName, phone
from customers;

create or replace view customer_views as
select customerName, phone
from customers
where city='Nantes';

select * 
from customer_views;