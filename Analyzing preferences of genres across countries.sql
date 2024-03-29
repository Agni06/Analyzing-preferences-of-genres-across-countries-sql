--Augment the renting records with information about movies and customers.
--Calculate the average ratings and the number of ratings for each country and each genre. 
--Include the columns country and genre in the SELECT clause.
--Finally, calculate the average ratings and the number of ratings for each country and genre, as well as an aggregation over 
--all genres for each country and the overall average and total number.






-- Group by each county and genre with OLAP extension
SELECT 
	c.country, 
	m.genre, 
	AVG(r.rating) AS avg_rating, 
	COUNT(*) AS num_rating
FROM renting AS r
LEFT JOIN movies AS m
ON m.movie_id = r.movie_id
LEFT JOIN customers AS c
ON r.customer_id = c.customer_id
GROUP BY rollup(c.country, m.genre)
ORDER BY c.country, m.genre;
