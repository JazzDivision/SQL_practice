-- Exploring the data

SELECT *
FROM sale;

SELECT *
FROM SalesPerson;

SELECT *
FROM Customer;

-- INNER JOINs

-- Retrieve sales transaction data with aligned salespeople
SELECT s.Sale_ID,
    sp.SP_Name,
    s.Sale_Amount,
    s.Sale_Date
FROM Sale AS s
INNER JOIN SalesPerson AS sp
ON s.SP_ID = sp.SP_ID

-- Retrieve all customer details and their sales transactions
SELECT s.Sale_ID, c.Customer_Name, c.Customer_City, s.Sale_Amount, s.Sale_Date
FROM Customer as c
INNER JOIN Sale AS s
ON c.Customer_ID = s.Customer_ID;

-- LEFT JOINs

-- Retrieve all salespeople and their sales (including those with no sales)
SELECT sp.SP_Name,
    s.Sale_ID,
    s.Sale_Amount
FROM SalesPerson AS sp
LEFT JOIN Sale AS s
ON sp.SP_ID = s.SP_ID

-- Retrieve all sales transactions and corresponding customer details (including NULLs)
SELECT s.Sale_ID, c.Customer_Name, c.Customer_City, s.Sale_Amount, s.Sale_Date
FROM Sale as s 
LEFT JOIN Customer AS c
ON s.Customer_ID = c.Customer_ID;

-- Check that there really are no NULLs in above query
SELECT *
FROM Sale s
LEFT JOIN Customer c
  ON s.Customer_ID = c.Customer_ID
WHERE c.Customer_ID IS NULL;

-- Multiple JOINs

-- Retrieve all sales transactions, along with the salesperson’s name and customer details (no missing relationships)
SELECT s.Sale_ID,
    s.Sale_Amount,
    sp.SP_Name,
    c.Customer_Name,
    c.Customer_City
FROM Sale AS s
JOIN SalesPerson AS sp -- Same as INNER JOIN
ON s.SP_ID = sp.SP_ID
INNER JOIN Customer AS c
ON s.Customer_ID = c.Customer_ID

-- Retrieves all sales transactions along with salesperson details and customer type (no missing relationships)
SELECT s.Sale_ID,
    s.Sale_Amount,
    sp.SP_Name,
    c.Customer_Name,
    c.Customer_Type
FROM Sale AS s
JOIN SalesPerson AS sp -- Same as INNER JOIN
ON s.SP_ID = sp.SP_ID
INNER JOIN Customer AS c
ON s.Customer_ID = c.Customer_ID

-- Using WHERE with JOINs 

-- Retrieve all sales transactions along with salesperson details but only include sales above £10,000
SELECT s.Sale_ID, s.Sale_Amount, sp.SP_Name
FROM Sale AS s
INNER JOIN SalesPerson AS sp 
ON s.SP_ID = sp.SP_ID
WHERE sale_amount > 10000;

-- Retrieve all customers and their sales transactions but only includes sales above £10,000
SELECT s.Sale_ID, s.Sale_Amount, c.Customer_Name
FROM Customer AS c
INNER JOIN Sale AS s
ON c.Customer_ID = s.Customer_ID
WHERE s.sale_amount > 10000;

-- ORDER BY with JOINs

-- Retrieve sales transactions and salesperson details, sorted by Sale_Amount DESC
SELECT s.Sale_ID, s.Sale_Amount, sp.SP_Name
FROM sale AS s 
INNER JOIN SalesPerson AS sp 
ON s.SP_ID = sp.SP_ID
ORDER BY s.sale_amount DESC;

-- Retrieve all customers and their sales transactions, sorted by Customer_Name ASC
SELECT s.Sale_ID, s.Sale_Amount, c.Customer_Name
FROM Customer AS c 
INNER JOIN sale AS s 
ON c.Customer_ID = s.Customer_ID
ORDER BY c.Customer_Name ASC;

-- GROUP BY with a JOIN 

-- Retrieve the total sales amount for each salesperson
SELECT sp.SP_Name, SUM(s.Sale_Amount) AS total_sales
FROM SalesPerson AS sp 
INNER JOIN sale as s 
ON sp.SP_ID = s.SP_ID
GROUP BY sp.SP_Name;

-- Retrieves the total sales amount per customer
SELECT c.Customer_Name, SUM(s.Sale_Amount) AS total_spend
FROM Customer AS c
INNER JOIN sale as s 
ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_Name;

-- HAVING with a JOIN 

-- Retrieve salespeople who generated more than £50,000 in totalsales
SELECT sp.SP_Name, SUM(s.Sale_Amount) AS total_sales
FROM SalesPerson AS sp 
INNER JOIN sale as s 
ON sp.SP_ID = s.SP_ID
GROUP BY sp.SP_Name
HAVING SUM(s.sale_amount) > 50000;

-- Retrieve customers who have spent more than £50,000 in total
SELECT c.Customer_Name, SUM(s.Sale_Amount) AS total_spend
FROM Customer AS c
INNER JOIN sale as s 
ON c.Customer_ID = s.Customer_ID
GROUP BY c.Customer_Name
HAVING SUM(s.Sale_Amount) > 50000;

-- UNIONs

-- Retrieve all salespeople and customer names, removing duplicates
SELECT SP_Name AS salespeople_and_customers
FROM SalesPerson
UNION
SELECT Customer_Name
FROM Customer;

-- Retrieve all sales regions and customer regions, removing duplicates 
SELECT sp_region AS sales_and_customer_regions
FROM SalesPerson
UNION
SELECT customer_region
FROM Customer;

-- UNION ALL

-- Retrieve a list of all contacts (SalesPersons and Customers) along with their role in the business
SELECT SP_Name, 'SalesPerson' AS role_type
FROM SalesPerson
UNION ALL
SELECT Customer_Name, 'Customer' AS role_type -- Second alias specified for readability
FROM Customer;

-- Retrieves all sales transactions and all customer interactions, along with a label to indicate whether the entry is a "Sale" or a "Customer"
SELECT CAST(sale_amount AS nvarchar(50)) AS interactions_data, -- Convert numeric data into text as all items in a single column must share the same data type
FROM Sale
UNION ALL
SELECT Customer_Name, 'Customer' AS interaction_type
FROM Customer;

-- VIEWs

-- Create a view with all the ‘Corporate’ customers
CREATE VIEW corporate as
SELECT *
FROM customer
WHERE customer_type = 'Corporate'

-- Check that the view was created 
SELECT * FROM corporate;

-- Create a view of top billers (salespeople with total sales > £50,000)
CREATE VIEW top_billers AS
SELECT sp.SP_Name, SUM(s.Sale_Amount) AS total_sales
FROM SalesPerson AS sp 
INNER JOIN sale as s 
ON sp.SP_ID = s.SP_ID
GROUP BY sp.SP_Name
HAVING SUM(s.sale_amount) > 50000;

-- Check that the view was created
SELECT * FROM top_billers;
