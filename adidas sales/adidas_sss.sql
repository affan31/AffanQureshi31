/* describe info */
SELECT * FROM adidas_ss;
/* sales by regions */ 
SELECT 
  "State", 
  SUM(REPLACE(TRIM("Total_Sales"), ',', '')::NUMERIC) AS Total__Sales
FROM adidas_ss
GROUP BY "State" order by "State" asc;
/* sales by method */
SELECT 
  "Sales_Method", 
  SUM(REPLACE(TRIM("Total_Sales"), ',', '')::NUMERIC) AS Total__Sales
FROM adidas_ss
GROUP BY "Sales_Method" order by "Sales_Method" asc;

/* retailers */
SELECT 
  "Retailer", 
  SUM(REPLACE(TRIM("Total_Sales"), ',', '')::NUMERIC) AS Total__Sales
FROM adidas_ss
GROUP BY "Retailer" order by "Retailer" asc;

/* sales by trends */

SELECT 
  TO_CHAR("Invoice_Date"::DATE, 'YYYY-MM') AS month,
  SUM(REPLACE(TRIM("Total_Sales"), ',', '')::NUMERIC) AS Total__Sales
FROM adidas_ss 
GROUP BY month
ORDER BY month ASC;

