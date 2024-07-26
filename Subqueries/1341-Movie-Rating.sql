# Write your MySQL query statement below
WITH userNames AS(
    SELECT MovieRating.user_id, COUNT(MovieRating.user_id) AS user_count, name
    FROM MovieRating JOIN Users
    ON MovieRating.user_id = Users.user_id
    GROUP BY MovieRating.user_id
    ORDER BY user_count DESC, name ASC
    LIMIT 1
),
movieNames AS(
    SELECT AVG(rating) as average_rating, title
    FROM MovieRating JOIN Movies 
    ON MovieRating.movie_id = Movies.movie_id
    WHERE MONTH(created_at) = '02'AND YEAR(created_at) = '2020'
    GROUP BY MovieRating.movie_id 
    ORDER BY average_rating DESC, Movies.title ASC
    LIMIT 1 
)
SELECT name AS results
FROM userNames 
UNION ALL
SELECT title AS results
FROM movieNames 