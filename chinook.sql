-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

select c.CustomerId, c.FirstName || ' ' || c.LastName as FullName, c.Country
from Customer c
where c.Country != 'USA'
order by c.Country;
;

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.

select c.*
from Customer c
where c.Country = 'Brazil'
order by c.CustomerId;
;

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

select i.InvoiceId, i.InvoiceDate, c.FirstName || ' ' || c.LastName as FullName, i.BillingCountry
from Invoice i, Customer c
where i.CustomerId = c.CustomerId
and c.Country = 'Brazil';


-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

select e.*
from Employee e
where e.Title = 'Sales Support Agent'
;

-- unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

select distinct i.BillingCountry
from Invoice i
;

-- sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

select e.FirstName || ' ' || e.LastName as AgentName, i.InvoiceId, i.InvoiceDate, i.BillingCountry, i.Total
from Invoice i, Customer c, Employee e
where i.CustomerId = c.CustomerId
and c.SupportRepId = e.EmployeeId
order by AgentName
;

-- invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

select i.InvoiceId, e.FirstName || ' ' || e.LastName as EmployeeName, c.FirstName || ' ' || c.LastName as CustomerName, i.BillingCountry, i.Total
from Invoice i, Customer c, Employee e
where i.CustomerId = c.CustomerId
and c.SupportRepId = e.EmployeeId
order by EmployeeName
;

-- total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

select count(i.InvoiceId) as InvoiceCount, strftime('%Y',i.InvoiceDate) as YearOfInvoice
from Invoice i
where YearOfInvoice = '2011'
or YearOfInvoice = '2009'
group by YearOfInvoice
;

-- total_sales_{year}.sql: What are the respective total sales for each of those years?

select sum(i.Total) as Total, strftime('%Y',i.InvoiceDate) as YearOfInvoice
from Invoice i
where YearOfInvoice = '2011'
or YearOfInvoice = '2009'
group by YearOfInvoice
;

-- invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

-- line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY

-- line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.

-- line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.

-- country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

-- playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?

-- Hint: Use the MAX function on a subquery.

-- top_agent.sql: Which sales agent made the most in sales over all?

-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- sales_per_country.sql: Provide a query that shows the total sales per country.

-- top_country.sql: Which country's customers spent the most?

-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.

-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased songs.

-- top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- top_media_type.sql: Provide a query that shows the most purchased Media Type.