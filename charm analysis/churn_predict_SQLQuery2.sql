
SELECT 
    Gender, 
    COUNT(Gender) AS TotalCount,
    COUNT(Gender) * 1.0 / (SELECT COUNT(*) FROM Customer_Data) AS Percentage
FROM 
    Customer_Data
GROUP BY 
    Gender;



SELECT 
    Contract, 
    COUNT(Contract) AS TotalCount,
    COUNT(Contract) * 1.0 / (SELECT COUNT(*) FROM Customer_Data) AS Percentage
FROM 
    Customer_Data
GROUP BY 
    Contract;


SELECT Customer_Status, Count(Customer_Status) as TotalCount, Sum(Total_Revenue) as TotalRev,
Sum(Total_Revenue) / (Select sum(Total_Revenue) from Customer_Data) * 100  as RevPercentage
from Customer_Data
Group by Customer_Status;

SELECT 
    State, 
    COUNT(State) AS TotalCount,
    COUNT(State) * 1.0 / (SELECT COUNT(*) FROM Customer_Data) AS Percentage
FROM 
    Customer_Data
GROUP BY 
    State
ORDER BY 
    Percentage DESC;
