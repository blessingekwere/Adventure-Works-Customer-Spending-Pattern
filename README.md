# Adventure-Works-Customer-Spending-Pattern

### Introduction
![](https://github.com/blessingekwere/Adventure-Works-Customer-Spending-Pattern/blob/main/4440.jpeg)

### About Adventure Works
The Adventure Works database is a fictitious company that sells bicycles, bicycle components, and accessories to consumers, retailers, and wholesalers. It contains tables for sales orders, customers, products, employees, and other business entities.

### About the Project
Customer spending pattern analysis is the process of analyzing and understanding how customers spend their money on products and services offered by a business. This analysis can provide valuable insights into consumer behavior, preferences, and purchasing habits, which can help businesses optimize their marketing strategies, improve customer engagement, and increase revenue.

### Problem Statement
Adventure Works is a fictional company that sells bicycles, bicycle components, and accessories to consumers, retailers, and wholesalers. The company is looking to analyze customer spending patterns to better understand customer behavior, preferences, and purchasing habits, in order to improve customer engagement and increase revenue. The company has a vast customer base, and it is becoming increasingly challenging to understand customer behavior and preferences using traditional methods. Adventure Works has a point-of-sale system and an e-commerce platform that captures transactional data on customer purchases.
The company would like to leverage this data to analyze customer spending patterns and identify trends and patterns in customer behavior. Adventure Works would like to understand the following:

* What products and services are most popular among customers?
* What are the typical spending patterns of customers?
* What factors influence customer spending behavior?
* Can customer spending behavior be used to predict future purchases?
* How can Adventure Works improve customer engagement and increase revenue based on customer spending patterns?

To address these questions, Adventure Works needs to conduct a comprehensive analysis of customer spending patterns using data analytics techniques. The analysis will involve collecting and analyzing data on customer transactions, including the products or services purchased, the frequency of purchases, the amount spent, and the payment method used. The data will be used to segment customers based on their spending habits, identify high-value customers, predict future purchasing behavior, and develop targeted marketing campaigns to improve customer engagement and loyalty.

### Data Sourcing
The data for this project was gotten from the Adventure works 2019 database. First and foremost, I downloaded the Adventure Works 2019 backup file [here](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbTVtbGl1UkFUTHVlaEx2cE1mNmhxa2xTXy1fQXxBQ3Jtc0trUkM3OWNUQ19WcS1Tc1I1QzByV20xeWhuWWxoMnZLZHlQMkVjRkRaSno4cGtudF9iVGl3Z1RMTEk2VmxMVHRqLWlYa25qMjJ3QWtuQkhWV25RZ19Md1lxT2JvRm1kMnI5UDRiRTBDNEh6MUlPOGJUNA&q=https%3A%2F%2Fgithub.com%2Fmicrosoft%2Fsql-server-samples%2Freleases%2Fdownload%2Fadventureworks%2FAdventureWorks2019.bak&v=VpY0Q_kwtIw) . After that I restored database into my Microsoft SQL server, the database is made up of 71 tables so I had to study the database schema diagram and database dictionary to know which tables I needed to use for my analysis. You can download the database dictionary [here](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbGxlcHpOY1ZhMEZSdDV5Q3ZIekdoR0tfR3lkQXxBQ3Jtc0tuVWlPc1pQU2JvUnhMdl9NdVhIWVZRYnRiZHZMb0FiN3BFZnczZk03U2tIa0xod2dxSTRIRTl3Vm9zdkJaQTctSVJJRHJXLThOdFZsc19CZ2dCS18yZkQyTDJfN1J2M3hjM2hBWkp4ZzBXUkF3dDA0WQ&q=https%3A%2F%2F1drv.ms%2Fb%2Fs%21AvIjHUSDuSKA-k7NrVlgzRQbynuu&v=AnfWWapSncY) and also download the schema diagram [here](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbHRQUDdUTTIwWXZXSW1jUXdaQUtoNldvOVBCUXxBQ3Jtc0ttVWNVYkdCcWMwWGYxQXllM1pGVlNxNm5SVHQ0Ui1IRzdXZWhIVzRaMllTMWtfd0t4ckVFZzZKbEhRQWdxaERNRDMxV2NkX01NRUkwVTc2S294bjNCOTZxYWMzaHc0bXBzWldSdWc4NFZ1RUhia0NBZw&q=https%3A%2F%2F1drv.ms%2Fu%2Fs%21AvIjHUSDuSKA-k2UHQDDxbxvI5io&v=AnfWWapSncY).

### Skills Demonstrated
I demonstrated a few skills in the execution of this project and they are:
* Data Retrieval and Extraction.
* Data Querying, Cleaning and Transformation
* DAX
* Data Visualization:
* Business Intelligence

### Tools Used
The tools used for this project are **Microsoft SQL Server** and **Power BI**

### Data Transformation/Modelling
After restoring the Adventure Works database into Microsoft SQL Server, it was time for me to write queries which will help answer the questions for my analysis. Out of the 71 tables in the database, I used only 7 tables for my analysis and they are
1. Sales.SalesOrderHeader
2. Sales.Customer
3. Sales.SalesTerriitory
4. Sales.SalesorderDetails
5. Production.Product
6. Production.SubCategory
7. Production.ProductCategory
After writing the queries on Microsoft SQL server, I created views for all the queries I written.
Then I launched my Power BI, clicked on the get data button and clicked on SQL database, then I connected my SQL server to Power BI by imputing my Microsoft SQL server name and the database I needed to extract information from and connected.
After the connection was established, I selected the views which I had earlier created in Microsoft SQL server.
After importing the views and previewing them, I loaded it into Power query editor and performed some cleaning on the data like renaming, dropping unwanted columns, replacing values, checking for duplicates and null values.
After cleaning all the views which I imported as tables into Power BI using the power query editor, I loaded the tables into Power BI and closed Power Query editor. I Then proceeded to the modelling tab to ensure that ensure that the data was modelled properly and if not model it properly to create connection between tables. The schema for this project is a Snow-flake schema.

### Analysis
The analysis was done based on the views that were created in Microsoft SQL server and imported to Power BI.

### Insight and Visualization

* In the product category, sales of bike generated the highest revenue of $94.65M followed by sales of components which generated $11.48M

* The average processing time for all products is 7 days

* Within the four years covered in this analysis, 2013 was the year that recorded the highest number of orders of 14200, followed by 2014 which recorded 11800 orders.

* France had the highest Average order value and Australia recorded the highest customer count.

* The number of orders definitely affected the revenue, hence, 2013 generated the highest revenue of $49M.

* USA is the country that generated the highest revenue.

* The customer with the ID 29818 generated the highest revenue of $989,180.00

* The customer with the ID 29818 had the highest purchase frequency of 28

### Recommendation
* Adventure works should identify the most profitable customers and offer them personalized deals or loyalty programs to encourage repeat purchases.
* Measures should be put in place to ensure that the products that are most popular among customers and are in high demand are always well-stocked and easily accessible.
* Discounts should be applied to products that have low sales volumes.
* Seasonal spending patterns should be monitored to ensure that inventory levels are aligned with demand during peak seasons.
* Consider upselling or cross-selling opportunities to customers who have purchased a particular product or service.
* Better ways to reduce costs should be considered without sacrificing quality, such as negotiating better prices with suppliers or optimizing inventory management.
* Customer spending patterns should continuously be monitored and analyzed to identify new opportunities for growth or improvement.









