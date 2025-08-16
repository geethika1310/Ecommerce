use ecommerce_db;


-- SALES ANALYSIS QUERIES

-- this query calculates the total number of sales of all the products
SELECT 
SUM(TotalAmount) AS TotalSales
FROM 
ORDERS;

select MONTHNAME(OrderDate) as MONTH, -- Alternatively can also use Date_Format(OrderDate,"%M")
SUM(TotalAmount) AS TotalSales
from orders
group by
MONTH;


-- ANALYZING CUSTOMER BEHAVIOUR

-- TOP CUSTOMERS
-- THIS QUERY WILL IDENTIFY THE TOP 5 CUSTOMES WHO SPENT THE MOST ON THE PLATFORM

SELECT 
users.UserName, users.Email, users.Address,SUM(orders.TotalAmount) as TotalSpent
from users
join
orders on
users.UserID=orders.UserID
group by
users.UserID
order by
TotalSpent DESC
LIMIT 5;

-- 2. CUSTOMER LIFETIME VALUE (CLV)
SELECT 
users.UserName as User, SUM(orders.TotalAmount) as LifeTimeValue
from users
join
orders on
users.UserID=orders.UserID
group by
users.UserID
order by
LifeTimeValue;


-- AVERAGE PRICE BY PRODUCT CATEGORY
SELECT Category,Round(Avg(Price),2) as "Average Product Price" FROM PRODUCTS
group by Category
order by "Average Product Price";

-- TOTAL INVENTORY BY EACH PRODUCT CATEGORY
SELECT Category,SUM(StockQuantity*Price) as Inventory from PRODUCTS
group by Category
order by Inventory;

