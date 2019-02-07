-- GROUP BY SYNTAX --

SELECT [column1], [column2]
FROM [table] [abbr]
GROUP BY [column];

-- 1. Find a count of how many tracks there are per genre. Display the genre name with the count. --

SELECT COUNT(*), genre.name FROM track
JOIN genre ON track.genre_id = genre.genre_id
GROUP BY genre.name;

-- 2. Find a count of how many tracks are the "Pop" genre and how many tracks are the "Rock" genre.

SELECT COUNT(*), genre.name FROM track
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Pop' OR genre.name = 'Rock'
GROUP BY genre.name;

-- 3. Find a list of all artists and how many albums they have. --

SELECT COUNT(*), artist.name FROM album
JOIN artist ON album.artist_id = artist.artist_id
GROUP BY artist.name;