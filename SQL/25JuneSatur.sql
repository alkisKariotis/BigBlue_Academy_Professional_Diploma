--Retrieve all information from 'dataset' table
select
	*
from
	dataset
	
--Retrieve the title, imprint, rating, number of ratings, and language.(continue using these columns for the rest of the exercises
select
	title,
	imprint,
	rating_avg ,
	rating_count,
	lang
from
	dataset;
	
--How many distinct languages are there?
select
	count(distinct lang)
from
	dataset;

--Find the books published by "MIT Press"
select
	imprint,
	title
from
	dataset
where
	imprint = 'MIT Press'
order by
	title asc ;

--Find the books with rating below 2
select
	rating_avg,
	title
from
	dataset
where
	rating_avg < 2
order by
	rating_avg asc,
	title asc ;


--Find the books with rating at least 4 as well as at least 5000 ratings.
select
	title,
	rating_avg,
	rating_count
from
	dataset
where
	rating_avg >= 4
	and rating_count >= 5000
order by
	title asc;

--Find the books with rating at most 2 or ratings more than 100000
select
	title,
	rating_avg,
	rating_count
from
	dataset
where
	rating_avg <= 2
	or rating_count > 10000
order by
	title asc;

--Find the books with rating from 4.6 to 4.9
select
	title,
	rating_avg
from
	dataset
where
	rating_avg between 4.6 and 4.9
order by
	title asc;

--Find the books that have the word 'history' anywhere in their title.
select
	title
from
	dataset
where
	title like '% history %'--giati fernei kolita alla apotelesmata alla petaei eksw auta poy einai teleutaia stin protasi
order by
	title asc;

--Find the books in Spanish('hi)', Italian('it') and Greek('el')
select
	title,
	lang
from
	dataset
where
	lang = 'hi'
	or lang = 'it'   --where lang in('hi','it', 'el')
	or lang = 'el'
order by
	title asc;

--Find the books printed in formats 15,16,17.
select
	title,
	format
from
	dataset
where
	format = 15     --antinstoixa me in kai not in apo katw 
	or format = 16
	or format = 17
order by
	title asc;

--Can you explore the rest of the tables and find which are these formats?
select
	format,
	count(title)
from
	dataset
where
	format <> 15
	and format <> 16
	and format <> 17
group by
	format;