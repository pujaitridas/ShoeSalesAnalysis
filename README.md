# ShoeSalesAnalysis
This project is intended to analyse the shoe sales using SQL(Mysql).The visualisations are done using Ms Excel.The presentation is done on Ms PowerPoint.

Case study:
The project contains a dataset that includes information on brands, model type/number, type of shoe,gender,size,
color,material and price of shoes in US region.

Objective:
The main objective is to analyse the data to maximise the sales and get better insights to optimise shoe business brands in terms of sales.

* Source of dataset:Kaggle.com
* Tools Used: Mysql, Ms Excel, Ms powerpoint(presentation).

Dataset was imported to Mysql using Command line prompt method.

Data Cleaning/Prep: The data had ($) sign in price(USD) column. So, that had to be replaced for calculation purposes.
The data had columns like Color and Material that were seperated by (/). So, substring_index() was used for proper calculations.

Data Analysis is categorised in 3 segments:
1. Data Analysis : Analysing price, color, material in general. ( Visualised using graphs)
2. Data Analysis classified by Gender: Analysing the data like Size, Type by gender for better insights. (Also, Visualised using graphs).
3. Brand Tables: Analyising the Brands sales (by Models, Types , Gender) to make meaningful insights to optimise the shoes business brands.

Key Takeaways/ Insights :

From Data Analyis I:
1. $75 - $125 have maximum sales while $225 above had least number of sales.
2. Most sold out colors were Black, White, Grey, Blue, Pink while least sold colors were Brown,Charcoal, Collegiate Navy, Multi-color,True White.
3. Mesh, primeknit,Leather, Canvas were more sold out than Textile and flexweave in terms of Materials of shoes.

This shows brands should consider producing more in categories where they are having higher sales.

From Data Analyis II: (classified by Gender)
1. For Men's shoes : Running, casual, basketball, Lifestyle, fashion type shoes had more sales while Retro, Cross-training,racing had least.
2. For women's shoes : Running, casual, Lifestyle, fashion, skate type had more sales compared to slides, retro, trail running.
3. Men's Shoes of US Size 9.5,10,11,9 are most in demand and least is 7.
4. Women's Shoes of US Size 7.5,8.5,7,8 are most in demand and least is 10.

Brands should take notes on their higher selling shoe types and sizes based of gender.

From Brand Tables:
Analysis had been done using CTE's, window functions-dense rank and inner join. 
* The Highest Sold Model and Type of each brands is identified.
* Brands that made more sales on women’s shoes and men’s shoes are separately identified.

1. Nike AirForce 1 is the highest sold-out men’s shoes.
2. Adidas NMD_R1 is the highest sold-out women’s shoes.
3. Asics, Nike , New Balance, Puma Running type while Fila fashion type had more sales for men’s shoes. 
4. Asics, Nike , New Balance  Running type , Adidas lifestyle , Converse casual had most sales for women’s shoes.
5. Reebok, Puma should increase the price of men’s shoes as they’re making less sales than number of men’s shoes produced.
6. Converse, Vans, Skechers should increase the price of women’s shoes as they’re making less sales on number of women’s shoes produced.
5. Reebok, Nike, Puma, New Balance and Fila should launch more men’s shoes as they made more sales in men’s shoes.
8. Adidas, Asics, Converse , Skechers and Vans should launch more women’s shoes as they made more sales in women’s shoes.

Suggestions and feedbacks would be appreciated regarding this project.
Thankyou!

