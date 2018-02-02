-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

select c.CustomerId, c.FirstName || ' ' || c.LastName as FullName, c.Country
from Customer c
where c.Country != 'USA'
order by c.Country;
;