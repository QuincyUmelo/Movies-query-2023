SELECT * FROM movie_data.movies;
Update movies
set Distributor="Data Not Available"
where Distributor="'-";

-- No of released films per month
select count(Title) as Movie_count, monthname(Release_Date)
from movies
Group by monthname(Release_Date)
Order by monthname(Release_Date);

-- Released movie for July
with M1 as (
select *, extract(Month from Release_Date) as Month_
from movie_data.movies)

select Rank_, Title, Theaters, Total_Gross, Release_Date, Distributor
from M1
WHERE Month_="7"
order by Release_Date desc;
-- Or
select *
from movies
where Release_Date LIKE '____-07%' 
ORDER BY Release_Date desc;
-- or
select *
from movies
where monthname(Release_Date) LIKE 'July' 
ORDER BY Release_Date desc;

-- Top 10 revenue generated from a film and the distributors
select Title, Total_Gross, Distributor
from movies 
Order by Total_Gross desc
limit 10;

-- sum of gross per month
select sum(Total_Gross), monthname(Release_Date)
from movies
Group by monthname(Release_Date);

-- Highest total gross per month
select max(Total_Gross), monthname(Release_Date)
from movies
Group by monthname(Release_Date);

-- Total revenue from a distributor
select distinct Distributor, sum(Total_Gross) as Total_Gross
from movies
Group by Distributor
order by sum(Total_Gross) desc;

-- Finding the total revenue from a distributor
with T1 as (
select distinct Distributor, sum(Total_Gross) as Total_Gross
from movies
Group by Distributor
order by sum(Total_Gross) desc)

Select Total_Gross, Distributor
from T1
where Distributor Like "%Walt%";

-- List of total revenue for each distributor per month
select distinct(monthname(Release_Date)), sum(Total_Gross), Distributor
from movies
Group by  monthname(Release_Date), Distributor
order by  monthname(Release_Date)asc, sum(Total_Gross) desc;

-- Finding the total revenue for each distributor per month
select distinct(monthname(Release_Date)), sum(Total_Gross), Distributor
from movies
where monthname(Release_Date)="May"
Group by  monthname(Release_Date), Distributor
order by  monthname(Release_Date)asc, sum(Total_Gross) desc;

-- Most released film per month
select max(Theaters), monthname(Release_Date)
from movies
Group by  monthname(Release_Date)
;

-- Max and min released films
select max(Theaters), min(Theaters), monthname(Release_Date)
from movies
Group by  monthname(Release_Date)
;

-- Number of distributors
select count(distinct Distributor)
from movies;

select Title
from movies
where Distributor like "%Disney%"
Group by Title;

-- Finding the total revenue for each distributor per month
select sum(Total_Gross), monthname(Release_Date), Distributor
from movies
where Distributor Like "%Neon%"
Group by monthname(Release_Date), Distributor
order by monthname(Release_Date) asc, sum(Total_Gross) desc;
