-- 1. Вивести імена замовників в лексикографічному порядку(без повторів).
--                   *** Your code here ***
SELECT DISTINCT first_name 
	FROM customer 
ORDER BY first_name ASC;

-- 2. Вивести імена замовників(first_name), які повторюються(ті, що зустрічаються в тадлиці більше 1 разу)та відповідні кількості повторів(repeat).
--                   *** Your code here ***
SELECT first_name, COUNT(*) 
	FROM customer 
GROUP BY first_name HAVING COUNT(*) > 1;

-- 3. Вивести назви(city_name) 5-ти міст та кількості магазинів в цих містах(num_stores), впорядковані за спаданням кількісті магазинів.
-- 	  (Якщо кількість магазинів в містах однакова, то ці міста мають бути в оберненому до лексикографічного порядку). 
-- 	  (Вважайте що поле city унікально визначає рядочок в таблиці)
-- 	  Чи вийде отримати 5 міст? 

SELECT c.city, COUNT(store_id) AS num_stores
FROM city c
INNER JOIN address a
    ON a.city_id = c.city_id
LEFT JOIN store s
    ON a.address_id = s.address_id
GROUP BY c.city, store_id 
ORDER BY num_stores DESC, c.city DESC
LIMIT 5;

-- 4. Вивести 10 найнепопулярніших назв категорій фільмів(name), та кількості фільмів(num_films), знятих в цих категоріях в порядку зростання кількості фільмів(num_films).
--    (якщо є дві категорії з однаковою тількістю фільмів, то вони мають бути впорядковані за лексикографічним порядком)
--	  (Важайте що назва категорії name є унікальною)
--                   *** Your code here ***

SELECT DISTINCT c.name, COUNT(f.film_id) AS num_films
FROM film f
INNER JOIN film_category fc
     ON fc.film_id = fc.film_id
 LEFT JOIN category c
     ON fc.category_id = c.category_id
GROUP BY c.name, f.film_id
ORDER BY num_films ASC, c.name ASC
LIMIT 10;

-- 5. Знайти 3 мови(name), такі, що фільми, озвучені цими мовами, орендуються найчастіше.
--   (Вважайте що назва мови name є унікальною)
--    Чи вийде отримати 3 мови? 
--    *** Your code here ***

SELECT name
    FROM language
LEFT JOIN film
    ON language.language_id = film.language_id
Group BY name
ORDER BY  Count(film_id) DESC
LIMIT 3;


-- 6. Створити представлення(actor_num_film) яке містить наступні колонки: 
--    * actor_id - унікальний ідентифікатор актора, 
--    * num_films - кількість фільмів у яких він знявся.
--   (представлення = view)
--                   *** Your code here ***

CREATE VIEW actor_num_film AS
SELECT  DISTINCT actor_id, Count(film_id) AS num_films
    FROM film_actor
GROUP BY (actor_id)
ORDER BY actor_id;


-- 7. Вивести інформацію(full_name) про 10 найбільш популярних акторів(ті, хто знялися в найбільшій кількості фільмів) 
--    та відповідні кількості фільмів(num_films) використовуючи представлення actor_num_film.
--	  (full_name = first_name + ' ' + last_name).
--                   *** Your code here ***
SELECT 
   first_name || ' ' || last_name AS full_name, actor_num_film.num_films
FROM actor_num_film
INNER JOIN  actor a
    ON a.actor_id = actor_num_film.actor_id 
ORDER BY num_films DESC
LIMIT 10; 

-- 8. Створіть представлення(film_num_rental), яке міститиме наступні колонки:
-- 	* film_id - унікальний ідентифікатор фільму,
-- 	* num_rental - кількість оренд відповідного фільму.
--                   *** Your code here ***

CREATE VIEW film_num_rental AS 
SELECT f.film_id, Count(rental_id) AS num_rental
    FROM film f
INNER JOIN inventory i
    ON f.film_id = i.film_id
INNER JOIN rental r
    ON i.inventory_id = r.inventory_id 
GROUP BY f.film_id
ORDER BY f.film_id;

-- 9. Вивести інформацію про 15 фільмів(title), які орендують найчастіше і опис(description) яких містить слово "amazing", та відповідні кількості оренд(num_rental).
--    (якщо фільми мають однакову кількість оренд, впорядкуйте їх лексикографіно за назвою). Використовуйте представлення film_num_rental.
--                   *** Your code here ***

SELECT film.title, film.description, num_rental
    FROM film_num_rental
INNER JOIN film
    ON film.film_id = film_num_rental.film_id
WHERE LOWER(film.description) LIKE '%amazing%'
ORDER BY num_rental DESC, film.title ASC
LIMIT 15;