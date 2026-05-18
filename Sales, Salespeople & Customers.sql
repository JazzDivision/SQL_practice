-- Create the SalesPerson table with all required fields

CREATE TABLE SalesPerson 
(
    SP_ID 	INT PRIMARY KEY IDENTITY(1,1),  -- Unique identifier for each salesperson
    SP_Name 	NVARCHAR(100) NOT NULL,       	-- Name of the salesperson
    SP_City 	NVARCHAR(100),                	-- City where the salesperson is located
    SP_Region 	NVARCHAR(100),              	-- Region assigned to the salesperson
    SP_Salary 	DECIMAL(18,2),              	-- Salary of the salesperson
    SP_JoinDate DATE,                     	-- Joining date of the salesperson
    SP_Target 	DECIMAL(18,2),              	-- Sales target for the salesperson
    SP_Achieved DECIMAL(18,2)             	-- Sales achieved by the salesperson
);

-- Insert sample data into the SalesPerson table with all required fields

INSERT INTO SalesPerson (SP_Name, SP_City, SP_Region, SP_Salary, SP_JoinDate, SP_Target, SP_Achieved)
VALUES 
    ('John Doe', 'London', 'South East', 75000.00, '2020-01-15', 100000.00, 95000.00),
    ('Jane Smith', 'Birmingham', 'West Midlands', 80000.00, '2019-03-20', 120000.00, 115000.00),
    ('Michael Brown', 'Manchester', 'North West', 65000.00, '2021-07-10', 90000.00, 87000.00),
    ('Emily Davis', 'Leeds', 'Yorkshire', 72000.00, '2018-11-05', 95000.00, 94000.00),
    ('Daniel Wilson', 'Bristol', 'South West', 55000.00, '2022-05-22', 80000.00, 78000.00),
    ('Sarah Johnson', 'Liverpool', 'North West', 62000.00, '2020-08-11', 85000.00, 83000.00),
    ('Matthew Taylor', 'Sheffield', 'Yorkshire', 70000.00, '2021-04-09', 97000.00, 98000.00),
    ('Charlotte Lewis', 'Nottingham', 'East Midlands', 67000.00, '2019-12-13', 88000.00, 88000.00),
    ('James Walker', 'Glasgow', 'Scotland', 68000.00, '2020-06-21', 92000.00, 91000.00),
    ('Olivia White', 'Edinburgh', 'Scotland', 64000.00, '2021-03-15', 89000.00, 87000.00),
    ('William Hall', 'Newcastle', 'North East', 71000.00, '2019-01-25', 95000.00, 94000.00),
    ('Isla Green', 'Cardiff', 'Wales', 76000.00, '2020-09-18', 100000.00, 98000.00),
    ('Benjamin King', 'Swansea', 'Wales', 69000.00, '2022-01-30', 87000.00, 86000.00),
    ('Jessica Wright', 'Oxford', 'South East', 74000.00, '2018-07-27', 98000.00, 97000.00),
    ('George Harris', 'Cambridge', 'East of England', 72000.00, '2021-11-03', 95000.00, 94000.00),
    ('Sophia Martin', 'Brighton', 'South East', 65000.00, '2019-05-12', 89000.00, 87000.00),
    ('Thomas Clark', 'Hull', 'Yorkshire', 63000.00, '2020-02-17', 87000.00, 85000.00),
    ('Amelia Allen', 'Plymouth', 'South West', 58000.00, '2022-04-29', 85000.00, 83000.00),
    ('Harry Scott', 'Aberdeen', 'Scotland', 64000.00, '2021-06-20', 88000.00, 86000.00),
    ('Mia Adams', 'Leicester', 'East Midlands', 67000.00, '2019-08-16', 90000.00, 89000.00);
    
-- Creating the Customers table (relating to SalesPerson via Sales table)

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY IDENTITY(1,1),
    Customer_Name NVARCHAR(100) NOT NULL,
    Customer_City NVARCHAR(100),
    Customer_Region NVARCHAR(100),
    Customer_Type NVARCHAR(50) -- e.g., "Retail", "Corporate"
);

-- Inserting Customer

INSERT INTO Customer (Customer_Name, Customer_City, Customer_Region, Customer_Type)
VALUES 
    ('TechCorp', 'London', 'South East', 'Corporate'),
    ('Book Haven', 'Manchester', 'North West', 'Retail'),
    ('GreenFields Ltd', 'Birmingham', 'West Midlands', 'Corporate'),
    ('Smiths Groceries', 'Leeds', 'Yorkshire', 'Retail'),
    ('Kids Clothes', 'London', 'South East', 'Retail'),
    ('Nova Retail', 'Glasgow', 'Scotland', 'Retail'),
    ('Digital Solutions', 'Glasgow', 'Scotland', 'Corporate');
    
-- Creating the Sale table (connecting SalesPerson and Customers)

CREATE TABLE Sale (
    Sale_ID INT PRIMARY KEY IDENTITY(1,1),
    SP_ID INT NOT NULL, -- Links to SalesPerson
    Customer_ID INT NOT NULL, -- Links to Customers
    Sale_Amount DECIMAL(18,2) NOT NULL,
    Sale_Date DATE NOT NULL,
    Product_Type NVARCHAR(50),
    FOREIGN KEY (SP_ID) REFERENCES SalesPerson(SP_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Inserting Sale Transactions

INSERT INTO Sale (SP_ID, Customer_ID, Sale_Amount, Sale_Date, Product_Type)
VALUES
    -- TechCorp (Corporate, London, South East)
    (3, 1, 12000.00, '2023-06-10', 'Software'),
    (3, 1, 18000.00, '2023-07-05', 'Hardware'),
    (3, 1, 9500.00, '2023-08-12', 'Consulting'),
    (8, 1, 14000.00, '2023-09-20', 'Electronics'),
    (3, 1, 11000.00, '2023-10-30', 'Software'),
    (2, 1, 8000.00, '2023-11-30', 'Software'),
    
    -- Book Haven (Retail, Manchester, North West)
    (2, 2, 4500.00, '2023-07-15', 'Book'),
    (6, 2, 3200.00, '2023-08-10', 'Book'),
    (9, 2, 2900.00, '2023-09-05', 'Book'),
    (12, 2, 4100.00, '2023-10-12', 'Book'),
    (15, 2, 5000.00, '2023-11-25', 'Book'),

    -- GreenFields Ltd (Corporate, Birmingham, West Midlands)
    (4, 3, 9800.00, '2023-08-22', 'Hardware'),
    (7, 3, 11000.00, '2023-09-15', 'Consulting'),
    (10, 3, 15000.00, '2023-10-05', 'Software'),
    (8, 3, 12500.00, '2023-11-18', 'Electronics'),
    (16, 3, 8600.00, '2023-12-02', 'Hardware'),

    -- Smiths Groceries (Retail, Leeds, Yorkshire)
    (7, 4, 1500.00, '2023-09-30', 'Groceries'),
    (11, 4, 2200.00, '2023-10-08', 'Groceries'),
    (13, 4, 1800.00, '2023-11-10', 'Groceries'),
    (17, 4, 2600.00, '2023-12-05', 'Groceries'),
    (19, 4, 3100.00, '2024-01-10', 'Groceries'),
    (18, 4, 2100.00, '2024-04-10', 'Groceries'),

    --Nova Retail (Retail, Glasgow, Scotland)
    (17, 6, 3100.00, '2024-08-18', 'Groceries'),
    
    -- Digital Solutions (Corporate, Glasgow, Scotland)
    (10, 7, 7500.00, '2023-10-05', 'Consulting'),
    (12, 7, 9400.00, '2023-11-15', 'Software'),
    (14, 7, 10200.00, '2023-12-12', 'Hardware'),
    (8, 7, 8900.00, '2024-01-08', 'Electronics'),
    (20, 7, 12000.00, '2024-02-01', 'Software');