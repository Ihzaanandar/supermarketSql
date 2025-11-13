select * from customer c ;

select * from product p ;

select * from sales;

select * from customer 
where city in ('Philadelhia', 'Seattle');

select * from customer 
where age between 20 and 30;

select * from customer 
where age not between 20 and 30;

select * from sales customer
where ship_date between '2015-04-01' and '2016-04-01';

select * from customer
where customer_name like 'J%';

select * from customer
where customer_name like '%Nelson%';

select * from customer
where customer_name like '____%';

select distinct city from customer
where city not like 'S%';

select * from customer;

select distinct city from customer
where region in('North', 'East');

select * from sales 
where sales between 100 and 500;

select * from customer
where customer_name like '%____';

select * from customer
where state = 'California' order by customer_name;

select * from customer
where state = 'California' order by customer_name desc;

select * from customer
order by city asc, customer_name desc;

select * from customer 
order by 2 asc; -- kolom 2

select * from customer 
order by age desc;

select * from customer 
where age  > 25
order by age desc 
limit 8;

select * from sales
where discount > 0
order by discount desc
limit 10;

select customer_id as "Seial Number", customer_name as Name, age as Customer_age
from customer;

select count(*) as  from sales;

select count(order_line) as "Number of Product Orders" , count(distinct order_id) as "Number of Orders" 
from sales
where customer_id ='CG-12520';

select sum(profit) as "Total Profit"
from sales;

select sum(quantity) as "Total Quantity"
from sales 
where product_id = 'FUR-TA-10000577';

select avg(age) as "Average Customer Age" 
from customer;

select avg(sales * 0.10) as "Average Comission Value"
from sales;

select min(sales) as "Minimum Sales Value June 15"
from sales
where order_date between '2015-06-01' and '2015-06-30';

select sales from sales 
where order_date between '2015-06-01' and '2015-06-30'
order by sales desc;

select max(sales) as "Maximum Sales Value June 15"
from sales
where order_date between '2015-06-01' and '2015-06-30';

select sum(sales) as "SUM of Sales" from sales;

select * from customer;

select count(*) as "Count Age from North" from customer
where age between 20 and 30;

select avg(age)  as "Average Age from East" from customer
where region = 'East';

select min(age), max(age) from customer 
where city = 'Philadelphia';

select region, count(customer_id) as customer_count from customer
group by region;

select product_id, sum(quantity) as quantity_sold from sales
group by product_id order by quantity_sold desc;

select customer_id, min(sales) as minimum_sales, max(sales) as maximum_sales, 
avg(sales) as average_sales, sum(sales) as total_sales
from sales
group by customer_id 
order by total_sales desc
limit 5;

select region, count(customer_id) as customer_count from customer 
group by region 
having count(customer_id) >= 200;

select region, count(customer_id) as customer_count from customer 
where customer_name like 'A%'
group by region
having count(customer_id) >= 10;

select * from sales;

select product_id, sum(sales) as Total_sales, sum(quantity) as Total_quantity, count(order_id) as Total_order, max(sales) as Mas_sales, min(sales) as Min_sales, avg(sales) as Avg_sales from sales
group by product_id 
order by total_sales desc
limit 5;

select product_id, sum(quantity) as Total_quantity from sales
group by product_id 
having sum(quantity) > 10;

select *, 
	case when age < 30 then 'Young'
	when age > 60 then 'Senior Citizen'
	else 'Middle Aged'
	end as Age_Category
from customer;

/*
left join tabel bagian kiri datanya semua bagian kanan bisa null begitu sebaliknya
*/

create table sales_2015 as select * from sales
where ship_date between '2015-01-01' and '2015-12-31';

select count(*) from sales_2015;

select count(distinct customer_id) from sales_2015;

create table customer_20_60 as select * from customer
where age between 20 and 60;

select count(*) from customer_20_60;

--Inner Join (kalau salah satu tabel null, ga ditulis)
select 
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
inner join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id;

--Left Join(fokus ke tabel awal yang mana tulis semua isi kalo tabel kedua dapat null kalo misal datanya gada)
select 
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id;

--Right Join(fokus ke tabel kedua yang mana tulis semua isi kalo tabel awal dapat null kalo misal datanya gada)
select 
	a.order_line,
	a.product_id,
	a.customer_id,
	a.sales,
	b.customer_name,
	b.age
from sales_2015 as a
right join customer_20_60 as b
on b.customer_id = a.customer_id
order by b.customer_id;

--Full Join(semua data masuk dari tabel awal dan kedua)
select 
	a.order_line,
	a.product_id,
	a.sales,
	b.customer_id,
	b.customer_name,
	b.age
from sales_2015 as a
full outer join customer_20_60 as b
on a.customer_id = b.customer_id
order by a.customer_id, b.customer_id;

--Cross Join(gabungin 2 kolom yg mana kolom awal akan mengikuti kolom 2)

create table month_values(MM integer);
create table year_values(YYYY integer);

insert into month_values values 
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);
insert into year_values values
(2011), (2012), (2013), (2014), (2015), (2016), (2017), (2018), (2019);

select * from year_values;

select a.YYYY, b.MM
from year_values a, month_values b
order by a.YYYY, b.MM;

--Intersect (ambil yg sama dari dua tabel)
select customer_id from sales_2015 
intersect
select customer_id from customer_20_60
order by customer_id;

--Except (ambil semua yg ga sama dari dua tabel)
select customer_id from sales_2015
except
select customer_id from customer_20_60 
order by customer_id;

--Union (ambil semua)
select customer_id from sales_2015
union 
select customer_id from customer_20_60 
order by customer_id;

--select Product from Orders
--where CustomerID =
--(select CustomerID from Customers
--where CustomerName ='John Doe')
--except
--select Product from Orders
--where CustomerID = 
--(select CustomerID from Customers
--where CustomerName = 'Jane Smith');

select
	b.state,
	sum(sales) as total_sales
from sales_2015 as a
left join customer_20_60 as b
on a.customer_id = b.customer_id
group by b.state;

select * from sales;

select * from product;

select 
	b.*,
	sum(a.sales) as "Total Sales",
	sum(a.quantity) as "Total Quantity Sold"
from sales a
left join product b
on a.product_id = b.product_id
group by b.product_id
order by b.product_id;

--Subquries

select * from sales
where customer_id in 
	(select customer_id from customer
	where age > 60);

select 
	a.product_id,
	a.product_name,
	a.category,
	b.quantity
from product as a
left join (	select product_id, sum(quantity) as quantity 
			from sales
			group by product_id) as b
on a.product_id = b.product_id
order by b.quantity desc;

select customer_id, order_line, 
	(	select customer_name from customer 
		where customer.customer_id = sales.customer_id)
from sales 
order by customer_id;

select * from sales;
select * from customer;
select * from product;

select customer_name, age,
	(select 
	 a.*,
	 b. product_name,
	 b.category
	 from sales a
	 left join product as b
	 on a.product_id = b.product_id ) as any_prduct
from customer;

select c.customer_name, c.age, sp.* from
customer as c
right join (select s.*, p.product_name, p.category
from sales as s
left join product as p
on s.product_id = p.product_id) as sp
on c.customer_id = sp.customer_id;

--View

create view logistics as
select
		a.order_line,
		a.order_id,
		b.customer_name,
		b.city, 
		b.state,
		b.country
from sales as a
left join customer as b
on a.customer_id = b.customer_id
order by a.order_line;

select * from logistics;

drop view logistics;

--Index

create index mon_idx
on month_values(MM);

drop index mon_idx

select * from sales;
select * from product;
select * from customer;

create view Daily_Billing as
select 
	s.order_line,
	s.product_id,
	s.sales,
	s.discount
from sales s
where order_date in 
	(select max(order_date) 
	from sales);

drop view Daily_Billing;

select * from Daily_Billing;

select * from customer;

--STRING 

select customer_name, length(customer_name) as character_num
from customer
where age > 30 and length(customer_name) > 12
order by customer_name asc;

select upper('Start Tech Academy'), lower('Start Tech Academy');

select customer_name,
	country,
	replace(lower(country), 'United States', 'US') as country_new
from customer;

select trim(leading ' ' from '   Start-Tech-Academy      ');
select trim(trailing ' ' from '   Start-Tech-Academy      ');
select trim(both ' ' from '   Start-Tech-Academy      ');
select trim('   Start-Tech-Academy      ');
select rtrim('   Start-Tech-Academy      ');
select ltrim('   Start-Tech-Academy      ');

-- Concatenate 
select customer_name, city||', '||state||', '||country 
as address
from customer;


--Substring 
--ambil char dari awal sebanyak 2
select customer_id, customer_name, 
substring(customer_id for 2) as cust_group
from customer
where substring(customer_id for 2) = 'AB';
--ambil char dari 4 sebanyak 5 char
select customer_id, customer_name,
substring(customer_id from 4 for 5) as customer_num
from customer 
where substring(customer_id for 2) = 'AB';
--kalo gabisa pakai from sama for
select substring(customer_id, 1, 2) as customer_initial
from customer
where substring(customer_id, 1, 2) = 'AB';


--String Aggregator (gabungkan banyak nilai)
select order_id, product_id from sales 
order by order_id;

select order_id, string_agg(product_id, ', ')
from sales
group by order_id
order by order_id;


--1. Maximum length of char in the product name
select product_name, length(product_name) as max_char
from product
order by length(product_name) desc
limit 1;
--or
select max(length(product_name))
from product;

--2. Take the product name, sub-category, and category from product tabel
--and combine them into one column
select product_name||', '||sub_category||', '||category as "Product Details"
from product;

--3. Choose some char from tabel product id
select product_id, 
substring(product_id for 3),
substring(product_id from 5 for 2),
substring(product_id from 8)
from product;

--4. 
select sub_category, string_agg(product_name, ', ')
from product 
where sub_category in ('Chairs', 'Tables')
group by sub_category 
order by sub_category;



-- Ceil(pembulatan ke atas) and floor(pembulatan ke bawah)
select * from sales;

select sales, ceil(sales), floor(sales)
from sales;

--random = nomor random 0 sampai 1 
select random(), random()+40+10, floor(random()+40+10);

--Setseed buat biar setelah pakai fungsi random terus pakai random lagi
-- angaknya ga berubah
select random();
select random();
select setseed(0.5);
select random();
select random();

-- Round untuk membulatkan nilai
select sales, round(sales) from sales;

-- Power(m,  n) untuk mengakarkan nilai n
select power(age, 2), age from customer;

--1. Choose 5 lucky customer
select * from customer
order by random()
limit 5;

--2. 
select sum(sales), 
sum(ceil(sales)) as higher_int_sales, 
sum(floor(sales)) as lower_int_sales, 
sum(round(sales)) as round_int_sales
from sales;

-- current_date (yyyy-mm-dd)
select current_date;

-- current_time(hh:mm:ss.gmt+tz)
select current_time;

-- current_timestamp (yyyy-mm-dd hh:mm:ss.gmt+tz)
select current_timestamp;

-- age buat cari perbedaan antara tanggal
select age('2018-12-27', '2017-06-03');

select * from sales;

select order_line,
	ship_date,
	order_date,
	age(ship_date, order_date) as time_taken
from sales
order by time_taken desc;








