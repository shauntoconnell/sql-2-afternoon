-- JOIN SYNTAX --

SELECT [column(s)] FROM [table_main] [abbv_main]
JOIN [table_ref] [abbv_ref] ON abbv_main.column = abbv_ref.column
WHERE [condition(s)]
(JOIN...)

SELECT a.name, b.name FROM some_table a
JOIN another_table b ON a.some_id = b.some_id;

SELECT a.name, b.name FROM some_table a
JOIN another_table b ON a.some_id = b.some_id
WHERE b.email = '3@gmail.com';

-- 1. Get all invoices where the unit_price on the invoice_line is greater than $0.99. --

SELECT * FROM invoice
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE unit_price > 0.99;

-- 2. Get the invoice_date, customer first_name and last_name, and total from all invoices. --

SELECT invoice_date, customer.first_name, customer.last_name, total FROM invoice
JOIN customer ON invoice.customer_id = customer.customer_id;

-- 3. Get the customer first_name and last_name and the support rep's first_name and last_name from all customers. --

SELECT customer.first_name, customer.last_name, employee.first_name, employee.last_name FROM customer
JOIN employee ON customer.support_rep_id = employee.employee_id;

-- 4. Get the album title and the artist name from all albums. --

SELECT album.title, artist.name FROM album
JOIN artist ON album.album_id = artist.artist_id;

-- 5. Get all playlist_track track_ids where the playlist name is Music. --

SELECT track_id FROM playlist
JOIN playlist_track ON playlist.playlist_id = playlist_track.playlist_id
WHERE playlist.name = 'Music';

-- 6. Get all track names for playlist_id 5. --

SELECT name FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
WHERE playlist_id=5;

-- 7. Get all track names and the playlist name that they're on ( 2 joins ). --

SELECT track.name, playlist.name FROM track
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id;

-- 8. Get all track names and album titles that are the genre Alternative & Punk ( 2 joins ). --

SELECT track.name, album.title FROM album
JOIN track ON album.album_id = track.album_id
JOIN genre ON track.genre_id = genre.genre_id
WHERE genre.name = 'Alternative & Punk';

-- BD. Get all tracks on the playlist(s) called Music and show their name, genre name, album name, and artist name. --

SELECT track.name, genre.name, album.title, artist.name FROM track
JOIN genre ON track.genre_id = genre.genre_id
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
JOIN playlist_track ON track.track_id = playlist_track.track_id
JOIN playlist ON playlist_track.playlist_id = playlist.playlist_id
WHERE playlist.name = 'Music';
