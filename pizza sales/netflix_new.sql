--netflix project


-- SCHEMAS of Netflix

DROP TABLE IF EXISTS netflix;
CREATE TABLE netflix
(
	show_id	VARCHAR(5),
	type    VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);

SELECT count(*) as total_content
FROM netflix;


select distinct type
from netflix

select * from netflix



-- 15 Business Problems & Solutions

--1. Count the number of Movies vs TV Shows

			select type,
			count(*),
			rank() over(pARTITION BY type order by count(*)desc)
			
			from netflix
			group by 1 
			
			select * from netflix
			
--2. Find the most common rating for movies and TV shows
		select type,
		rating 
		from
		(select type,
		rating,
		count(*),
		 rank() over(partition by type order by count(*) desc) as ranks
		 
		from netflix
		group by type,rating) 
		where ranks = 1


select* from netflix

--3. List all movies released in a specific year (e.g., 2020)

		select * from netflix
		where type= 'Movie' and release_year = 2020




4. Find the top 5 countries with the most content on Netflix


		select 
		unnest (STRING_TO_ARRAY(country,',') )as new_country,
		count(show_id) as total_content
		from netflix
		group by 1
		order by total_content desc
		limit 5


5. Identify the longest movie

		select *
		from netflix
		where type = 'Movie'
		and 
		duration = (select max (duration) from netflix)


6. Find content added in the last 5 years

select *,
TO_DATE (date_added,'MONTH DD,yyyy')>= current_date - interval '5'

from netflix




7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

		SELECT * FROM NETFLIX
		
		select type,title
		from netflix
		where director = 'Rajiv Chilaka'
		

8. List all TV shows with more than 5 seasons

		select * from netflix
		
		select type,title,duration
		from netflix
		where type = 'TV Show' and duration > '5 Seasons'


9. Count the number of content items in each genre

		select * from netflix
		select 
		unnest(STRING_TO_ARRAY(LISTED_IN,',')) AS genre,
		 count(show_id) as final_count
		
		from netflix
		group by 1
		order by final_count desc




10.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!

select * from netflix

select
EXTRACT
(YEAR FROM (TO_DATE(date_added,'MONTH DD,YYYY'))),
count(*),
ROUND(
count(*)::numeric /(select count (*) from netflix where country ='India')::numeric*100 ,2)as avg_rate
from netflix
where country = 'India'
group by 1
order by avg_rate desc
limit 5




11. List all movies that are documentaries 
select * from netflix


			select type,title,
			unnest(string_to_array(listed_in,',')) 
			from netflix
			where type ='Movie' and listed_in = 'Documentaries'

			
-- for only finding documentaries by separating them from the list from the column,
--method 2 for finding documentaries with movies and all other categeries

select * from netflix
where listed_in ilike '%Documentaries%'




12,find all content without a director
select * from netflix

		select * from netflix 
			where director is null


13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
select * from netflix

			select title,casts,release_year,
			extract(year from ( TO_DATE ('date_added',',' )))
			from netflix
			where casts  like '%Salman Khan%' and release_year >'2015'
			group by 1,2,3
			order by  release_year 
			
--basicALLLY WE HAVE A EASY SOLUTION FOR THE SAME THING WITH ADVANCE FUNCTIONS

--METHOD 2
				 select* from netflix
				 where casts ILIKE '%Salman Khan%'
				 and 
				 release_year > extract(year from current_date) - 10

14. Find the top 10 actors who have appeared in the highest
number of movies produced in India.

select * from netflix

		select
		unnest (string_to_array(casts,',')),
		count(*) as total_count
		from netflix
				where country like '%India%'

		group by 1
		order by 2 desc
		limit 10


		
		
15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.

with category_table as
(
select
* ,
case
when  description ilike '%kill%' 
or 
description ilike '%violence%' then 'bad content'
else 'good content'
end as category
 from netflix
)
select category ,
count (*)
from category_table
group by 1


