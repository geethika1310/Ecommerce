-- QUERY TO INCREASE THE EFFICIENCY RATE OF THE DATA RETRIEVAL PROCESS

-- UNDERSTANDING THE ORIGINAL TIME TO ACCESS THE DATA
EXPLAIN Select ProductName,Price 
from products 
where Category='Electronics';

-- USING INDEX
Create index category_idx on Products(Category);

-- USING THE SAME QUERY AGAIN

EXPLAIN Select ProductName,Price 
from products 
where Category='Electronics';