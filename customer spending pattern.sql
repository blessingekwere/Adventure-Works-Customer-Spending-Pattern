


--1.	What is the total revenue generated by each customer in the Adventure Works database?
Select CustomerID, SUM(TotalDue) AS "Total Revenue"
From Sales.SalesOrderHeader
Group By CustomerID
Order By "Total Revenue" Desc

--Creating View
Create View Total_Revenue_generated_by_each_Customer AS
Select CustomerID, SUM(TotalDue) AS "Total Revenue"
From Sales.SalesOrderHeader
Group By CustomerID
Order By "Total Revenue" Desc


CREATE VIEW Total_Revenue_generated_by_each_Customer AS 
SELECT CustomerID, SUM(TotalDue) AS "Total Revenue" 
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID 
--ORDER BY "Total Revenue" DESC

--2. What is the average order value (AOV) for each customer in the Adventure Works database?
Select  Sum(TotalDue)/Count(Distinct CustomerID) AS "Average Revenue"
From Sales.SalesOrderHeader
Group By CustomerID
--Order By "Average Revenue" Desc

CREATE VIEW Average_Order_Value_for_each_Customer_ AS 
Select CustomerID, Sum(TotalDue)/Count(Distinct CustomerID) AS "Average Revenue"
From Sales.SalesOrderHeader
Group By CustomerID

--3 What is the minimum order Value for each customer in the Adventure Works database?
Select Min(TotalDue) AS "Minimum Revenue"
From Sales.SalesOrderHeader

CREATE VIEW Minimum_Order_Value_for_each_Customer AS 
Select Min(TotalDue) AS "Minimum Revenue"
From Sales.SalesOrderHeader


--4 What is the maximum order value (AOV) for each customer in the Adventure Works database?
Select Max(TotalDue) AS "Maximum Revenue"
From Sales.SalesOrderHeader

CREATE VIEW Maximum_Order_Value AS 
Select Max(TotalDue) AS "Maximum Revenue"
From Sales.SalesOrderHeader

--5	How often do customers in the Adventure Works database make purchases?
Select CustomerID, Count(Distinct OrderDate) AS "Purchase Frequency"
From Sales.SalesOrderHeader
Group By CustomerID
Order By "Purchase Frequency" Desc


CREATE VIEW Purchase_Frequency AS 
Select CustomerID, Count(Distinct OrderDate) AS "Purchase Frequency"
From Sales.SalesOrderHeader
Group By CustomerID

--6	What is the customer lifetime value (CLV) for each customer in the Adventure Works database? CLV can be calculated using the following formula: CLV = (Total Revenue / Purchase Count) * (365 / Days Between First and Last Purchase)
SELECT a.CustomerID, SUM(TotalDue) / NULLIF(COUNT(SalesOrderID) * (365 / NULLIF(DATEDIFF(day, MIN(OrderDate), MAX(OrderDate)),0)),0) AS CLV
FROM Sales.SalesOrderHeader a
GROUP BY CustomerID
ORDER BY CLV DESC;

CREATE VIEW Customer_Lifetime_Value AS 
SELECT a.CustomerID, SUM(TotalDue) / NULLIF(COUNT(SalesOrderID) * (365 / NULLIF(DATEDIFF(day, MIN(OrderDate), MAX(OrderDate)),0)),0) AS CLV
FROM Sales.SalesOrderHeader a
GROUP BY CustomerID

--7. How do customer demographics affect spending patterns in the Adventure Works database?
SELECT SM.CountryRegionCode, COUNT(*) AS CustomerCount, 
       AVG(TotalDue) AS AvgOrderValue,
       SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
JOIN Sales.SalesTerritory AS SM
ON SM.TerritoryID = Sc.TerritoryID
GROUP BY SM.CountryRegionCode
ORDER BY TotalRevenue DESC

CREATE VIEW Customer_Demographics AS 
SELECT SM.CountryRegionCode, COUNT(*) AS CustomerCount, 
       AVG(TotalDue) AS AvgOrderValue,
       SUM(TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
JOIN Sales.SalesTerritory AS SM
ON SM.TerritoryID = Sc.TerritoryID
GROUP BY SM.CountryRegionCode



--8 What is the total revenue generated by each product category?
Select PC.Name,  Sum(LineTotal) AS TotalProductRevenue
From Sales.SalesOrderDetail AS SOD
Join Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
Join Production.Product AS PP
ON SOD.ProductID = PP.ProductID
Join Production.ProductSubcategory  AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
Join Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
Group By PC.Name
Order By TotalProductRevenue DESC


CREATE VIEW TotalRevenue_By_Product AS 
Select PC.Name,  Sum(LineTotal) AS TotalProductRevenue
From Sales.SalesOrderDetail AS SOD
Join Sales.SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
Join Production.Product AS PP
ON SOD.ProductID = PP.ProductID
Join Production.ProductSubcategory  AS PS
ON PP.ProductSubcategoryID = PS.ProductSubcategoryID
Join Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
Group By PC.Name


-- 9 What is the average order value of each customer?
SELECT Sc.CustomerID, AVG(TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
GROUP BY Sc.CustomerID
Order By AvgOrderValue Desc;

CREATE VIEW AverageOrderValue_By_Customer AS 
SELECT Sc.CustomerID, AVG(TotalDue) AS AvgOrderValue
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
GROUP BY Sc.CustomerID

--10. How many orders are made by each customer each year?
SELECT Sc.CustomerID, Year(OrderDate) AS OrderYear, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
GROUP BY Sc.CustomerID, Year(OrderDate)
Order By OrderCount Desc

CREATE VIEW TotalOrders_By_Customer_and_Year AS 
SELECT Sc.CustomerID, Year(OrderDate) AS OrderYear, COUNT(*) AS OrderCount
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
GROUP BY Sc.CustomerID, Year(OrderDate)


--11. What is the average order processing time for each product category?
SELECT PC.Name, AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgProcessingTime
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN Production.Product AS P
ON SOD.ProductID = P.ProductID
JOIN Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name

CREATE VIEW Average_Order_Processing_Time_By_ProductCategory AS 
SELECT PC.Name, AVG(DATEDIFF(day, OrderDate, ShipDate)) AS AvgProcessingTime
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN Production.Product AS P
ON SOD.ProductID = P.ProductID
JOIN Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
JOIN Production.ProductCategory AS PC
ON PS.ProductCategoryID = PC.ProductCategoryID
GROUP BY PC.Name

--12. What are the top-selling products in each region?
SELECT  ST.Name AS Region, P.Name AS ProductName, SUM(SOD.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN Production.Product AS P
ON SOD.ProductID = P.ProductID
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
JOIN Sales.SalesTerritory AS ST
ON Sc.TerritoryID = ST.TerritoryID
GROUP BY ST.Name, P.Name, ST.TerritoryID
ORDER BY TotalQuantity DESC

CREATE VIEW TopSellingProducts_By_region AS 
SELECT  ST.Name AS Region, P.Name AS ProductName, SUM(SOD.OrderQty) AS TotalQuantity
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.SalesOrderDetail AS SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
JOIN Production.Product AS P
ON SOD.ProductID = P.ProductID
JOIN Sales.Customer AS Sc
ON SOH.CustomerID = Sc.CustomerID
JOIN Sales.SalesTerritory AS ST
ON Sc.TerritoryID = ST.TerritoryID
GROUP BY ST.Name, P.Name, ST.TerritoryID



-- 13 What is the total revenue generated by Adventure Works per Month?
Select MONTH(OrderDate) AS OrderMonth, Sum(TotalDue) AS TotalRevenue
from sales.SalesOrderHeader
Group By MONTH(OrderDate)
Order By TotalRevenue Desc

CREATE VIEW TotalRevenue_By_Month AS 
Select MONTH(OrderDate) AS OrderMonth, Sum(TotalDue) AS TotalRevenue
from sales.SalesOrderHeader
Group By MONTH(OrderDate)

-- 14 What are the top 5 selling product for Adventure Works?
SELECT TOP 5 PP.Name, SUM(SD.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail AS SD
JOIN Production.Product AS PP
ON SD.ProductID = PP.ProductID
JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY PP.Name
ORDER BY TotalQuantitySold DESC;




CREATE VIEW Top_5_Selling_Product AS 
SELECT TOP 5 PP.Name, SUM(SD.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail AS SD
JOIN Production.Product AS PP
ON SD.ProductID = PP.ProductID
JOIN Sales.SalesOrderHeader AS SH
ON SD.SalesOrderID = SH.SalesOrderID
GROUP BY PP.Name


--15 What is the total revenue generated by Adventure Works from each region?
SELECT SR.Name AS Region, SUM(SH.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS SH
JOIN Sales.SalesTerritory AS SR
ON SH.TerritoryID = SR.TerritoryID
GROUP BY SR.Name;

CREATE VIEW Total_Revenue_By_Region AS 
SELECT SR.Name AS Region, SUM(SH.TotalDue) AS TotalRevenue
FROM Sales.SalesOrderHeader AS SH
JOIN Sales.SalesTerritory AS SR
ON SH.TerritoryID = SR.TerritoryID
GROUP BY SR.Name;

-- 13 What is the total revenue generated by Adventure Works per Month?
Select Year(OrderDate) AS OrderYear, Sum(TotalDue) AS TotalRevenue
from sales.SalesOrderHeader
Group By Year(OrderDate)
Order By TotalRevenue Desc

CREATE VIEW TotalRevenue_By_Year AS 
Select Year(OrderDate) AS OrderYear, Sum(TotalDue) AS TotalRevenue
from sales.SalesOrderHeader
Group By Year(OrderDate)


Select count(Distinct Name)
From Production.Product

CREATE VIEW Total_Products AS 
Select count (Name) As ProductCount
From Production.Product

CREATE VIEW Total_Revenue AS 
Select Sum(TotalDue) AS TotalRevenue
From Sales.SalesOrderHeader


CREATE VIEW Average_Revenue AS 
Select AVG(TotalDue) AS AverageRevenue
From Sales.SalesOrderHeader

CREATE VIEW Number_of_Customers AS 
Select Count(Distinct CustomerID) AS CUSTOMERS
From Sales.Customer


CREATE VIEW Country AS 
SELECT COUNT(DISTINCT CountryRegionCode) AS CountryCount
FROM Sales.SalesTerritory;

