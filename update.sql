-- UPDATE SYNTAX --

UPDATE [table]
SET [column1] = [value1], [column2] = [value2]
WHERE [condition];

UPDATE athletes SET sport = 'pie-eating' WHERE sport = 'poo-eating';

-- 1. Find all customers with fax numbers and set those numbers to null. --

UPDATE customer
SET fax = NULL
WHERE fax IS NOT NULL;

-- 2. Find all customers with no company (null) and set their company to "Self". --

UPDATE customer
SET company = 'Self'
WHERE company IS NULL;

-- 3. Find the customer Julia Barnett and change her last name to Thompson. --

UPDATE customer
SET last_name = 'Thompson'
WHERE first_name='Julia' AND last_name='Barnett';

-- 4. Find the customer with this email luisrojas@yahoo.cl and change his support rep to 4. --

UPDATE customer
SET support_rep_id = 4
WHERE email='luisrojas@yahoo.cl';

-- 5. Find all tracks that are the genre Metal and have no composer. Set the composer to "The darkness around us". --

UPDATE track
SET composer 'The light is us'
WHERE genre_id IN (
	SELECT genre_id FROM genre
	WHERE name = 'Metal'
) AND composer IS NULL;

