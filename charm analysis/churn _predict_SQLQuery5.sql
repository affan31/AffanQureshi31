--first view
CREATE VIEW vw_ChurnData AS
SELECT * 
FROM prod_Churn 
WHERE Customer_Status IN ('Churned', 'Stayed');
GO

-- Second view
CREATE VIEW vw_JoinData AS
SELECT * 
FROM prod_Churn 
WHERE Customer_Status = 'Joined';
GO
