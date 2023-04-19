# creating project
create database finalproject; 

use finalproject; # setting as default database; 

# creating table shoe
create table shoe
(Brand	varchar(100),
Model	varchar(100),
`Type`	varchar(100),
Gender	varchar(100),
Size	varchar(100),
Color	varchar(100),
Material	varchar(100),
`Price (USD)` varchar(100)
)

# checking values after importing using cmd/ command line prompt method
select * from shoe limit 10;

# adding new coloumn 
alter table shoe add column Newprice double;

set sql_safe_updates=0;

# updated new column with the price for calculation in future queries.
Update shoe
set Newprice = replace(`Price (USD)`,"$","") ;

# simple query to check newprice is fetching correct rows
select * from shoe 
where newprice between 20 and 40
limit 10;

# Project Queries
/* 1.Checking the Distribution of Price of shoes */
select Newprice,count(*) as Frequency
from shoe
group by 1
order by 2 desc;

/* 2.Top 10 COLORS used that have maximum sales*/
select SUBSTRING_INDEX(color, '/', 1) as Newcolor,Round(sum(Newprice),1) as MaxSales
from shoe
group by 1
order by 2 desc
limit 10;

/* 3.MATERIALS used that have maximum sales vs No.s of Shoes that sold out*/
select SUBSTRING_INDEX(material, '/', 1) as Newmaterial,count(*) as Count,Round(sum(Newprice),1) as MaxSales
from shoe
group by 1
order by 3 desc;

# Part 2
/*4.Ordering TYPES that have maximum sales based of Gender*/
/*men*/
select `Type`, gender ,sum(Newprice)
from shoe
where gender="men"
group by `Type`
order by 3 desc;

/* women*/
select `Type` , gender ,sum(Newprice)
from shoe
where gender="Women"
group by `Type`
order by 3 desc;

/* 5.Ordering SIZES that have maximum sales based of Gender*/
/*men*/
select `Size`, gender ,sum(Newprice)
from shoe
where gender="men"
group by `Size`
order by 3 desc;

/* women*/
select `Size` , gender ,sum(Newprice)
from shoe
where gender="Women"
group by `Size`
order by 3 desc;

/* 6.Brands having most sales by catgeory: Model*/
/* Men*/
with Mm as(
select brand , model, gender,sum(Newprice) as sales,
dense_rank() over ( partition by brand order by brand,sum(Newprice) desc ) as Rnk      #window function
from shoe
where gender="Men"
group by brand,model
order by 1,3 desc
)

select Brand,model, sales,gender
from mm 
where rnk=1
order by sales desc
;

/* women*/
with wm as(
select brand , model, gender,sum(Newprice) as sales,
dense_rank() over ( partition by brand order by brand,sum(Newprice) desc ) as Rnk     #window function
from shoe
where gender="Women"
group by brand,model
order by 1,3 desc
)

select Brand,model,sales,gender 
from wm 
where rnk=1
order by sales desc
;

/*7. Brands having most sales by catgeory: Type */
/* Men*/
with Mt as(
select brand , type, gender,sum(Newprice) as sales,
dense_rank() over ( partition by brand order by brand,sum(Newprice) desc ) as Rnk      #window function
from shoe
where gender="Men"
group by brand,type
order by 1,3 desc
)

select Brand,Type,gender, sales,Rnk
from mt 
where rnk=1
order by sales desc;

/*Women*/
with Wt as(
select brand , type, gender,sum(Newprice) as sales,
dense_rank() over ( partition by brand order by brand,sum(Newprice) desc ) as Rnk     #window function
from shoe
where gender="Women"
group by brand,type
order by 1,3 desc
)

select Brand,Type,gender ,sales,Rnk
from wt 
where rnk=1
order by sales desc;

/* 8. Comparison of Brands Shoe sales by Gender */

/* BRANDS maximum sales based of Gender*/
/*men : Bmsg*/
select brand , gender , sum(Newprice) as Sales ,count(*) as Frequency
from shoe
where gender="men"
group by brand
order by 3 desc;

/*women: Bgsg*/
select brand , gender ,sum(Newprice)  as Sales ,count(*) as Frequency 
from shoe
where gender="Women"
group by brand
order by 3 desc;


select * from bmsg;      # men
select * from bgsg;      # women

select w.brand,w.gender,w.sales as WSales,m.gender,m.sales as MSales
from bmsg as m inner join bgsg as w 
on w.brand=m.brand ;
