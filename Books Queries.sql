-- Books Practice Time 

-- Q1: Retrieve all columns & rows
SELECT * FROM books;

SELECT genre, total_sales FROM books;

-- Q2: Select specific columns
SELECT
    book_title,
    author,
    genre
FROM books;

-- Q3: Assigning aliases
SELECT
    book_title AS "Title",
    author AS "Writer",
    total_sales AS "Copies Sold"
FROM books;

-- Q4: Using WHERE to retrieve books in the romance genre
SELECT * FROM books
WHERE genre = 'Romance';

-- Q5: Using WHERE to retrieve books published after 2015
SELECT * FROM books
WHERE publication_year > 2015;

-- Q6: Retrieving all books in the fantasy genre with ratings higher than 4.5
SELECT * FROM books
WHERE genre = 'Fantasy'
AND rating > 4.5;

-- Q7: Retrieving all books and ordering them by price (ascending)
SELECT * FROM books
ORDER BY price ASC;

-- Q8: Retrieving all books, ordering by genre (ascending) and rating (descending)
SELECT * FROM Books
ORDER BY
    genre ASC,
    rating DESC;

-- Q9: Retrieving the book with the highest price, using MAX, and assigning an alias
SELECT MAX(price) AS "Highest Book Price" 
FROM books;

-- Q10: Calculating the average rating of books
SELECT AVG(rating) AS "Average Rating"
FROM books;

-- Q11: Counting the number of books within the table
SELECT COUNT(book_id)
FROM books;

-- Q12: Grouping books by genre and calculating the total sales per genre
SELECT
    genre,
    SUM(total_sales) AS 'Total Sales'
 FROM books
 GROUP BY genre;
 
 -- Q13: Displaying genres with total sales above £10,000
 SELECT
    genre,
    SUM(total_sales) AS 'Total Sales'
 FROM books
 GROUP BY genre
 HAVING SUM(total_sales) > 10000;
 
 -- Q14
SELECT * FROM Books
WHERE book_title LIKE '%The%'; -- Retrieves books with 'The' somewhere in the title

SELECT * FROM Books
WHERE book_title LIKE 'The%'; -- Retrieves books with 'The' at the start of the title

SELECT * FROM Books
WHERE book_title LIKE '%Star%'; -- Retrieves books with 'Star' in the title

SELECT * FROM Books
WHERE book_title LIKE 'Chas_%'; -- Retrieves books with 'Chas_' at the start of the title e.g. 'Chase'

-- Stretch Questions

-- Stretch Q1: Retrieving genres with sales > £10,000 AND average rating > 4.0
SELECT
    genre,
    AVG(rating) AS 'Average Rating',
    SUM(total_sales) AS 'Total Sales'
FROM Books
GROUP BY genre
HAVING AVG(rating) > 4.0
AND SUM(total_sales) > 10000;

-- Stretch Q2: Retrieves genres with an average book price > £15 plus total copies sold
SELECT Genre AS "Book Genre",
    SUM(Total_Sales) AS "Total Copies Sold",
    AVG(Price) AS "Avg Price"
FROM Books
GROUP BY Genre
HAVING AVG(Price) > 15

-- Stretch Q3: Retrieving titles, authors & total sales (descending) for books that have sold > 2,000 copies
SELECT
    book_title,
    author,
    total_sales
FROM Books
WHERE total_sales > 2000
ORDER BY total_sales DESC;

-- Stretch Q4: Return number of books per genre (descending) where total sales exceed £1,000
SELECT
    genre,
    COUNT(book_id) AS total_books
FROM books
GROUP BY genre
HAVING SUM(total_sales) > 1000
ORDER BY total_books DESC;

-- Stretch Q5: Retrieving genres ordered by their total revenue (descending), only including books published after 2010
SELECT genre,
    SUM(Price * Total_Sales) AS "Total Revenue"
FROM Books
WHERE Publication_Year > 2010
GROUP BY Genre
ORDER BY SUM(Price * Total_Sales) DESC;

-- Stretch Q6: Retrieving authors that wrote books with 'Magic' in the title, plus their total sales (descending)
SELECT author,
    SUM(total_sales) AS total_sales
FROM books
WHERE book_title LIKE '%Magic%'
GROUP BY author
ORDER BY total_sales DESC;

-- Stretch Q7: Retrieving ordered publication years where total_sales > 10,000
SELECT publication_year,
    SUM(total_sales) AS total_sales
FROM books 
GROUP BY publication_year
HAVING SUM(total_sales) > 10000
ORDER BY SUM(total_sales) DESC;

-- Stretch Q8: Retrieve titles, authors and ratings of books rated above 4.5 and priced between £10-20
SELECT book_title,
    author,
    rating
FROM books 
WHERE rating > 4.5 
AND total_sales > 3000
AND price BETWEEN 10 AND 20
ORDER BY rating DESC;

-- Stretch Q9: Calculate total revenue and average price per genre, for genres with total revenue > £50,000, ordered by average price (ascending)
SELECT genre,
    SUM(price * total_sales) AS total_revenue,
    AVG(price) AS avg_price
FROM books
GROUP BY genre
HAVING SUM(price * total_sales) > 50000
ORDER BY avg_price;

-- Consolidation Qs 

-- Which genre generates the most revenue? A: Fantasy
SELECT TOP 1
    genre,
    SUM(price * total_sales) AS total_revenue
FROM books
GROUP BY genre
ORDER BY total_revenue DESC;

-- Who is the top-selling author? A: Mary Johnson
SELECT TOP 1
    author,
    SUM(total_sales) AS total_sales 
FROM books
GROUP BY author
ORDER BY total_sales DESC;

-- What's the price range of fantasy books? A: £22.99 - £24.99
SELECT MIN(price) AS lowest_price,
    MAX(price) AS highest_price
FROM books
WHERE genre = 'Fantasy';

-- Identifying genres with highest and lowest average ratings A: Fantasy is highest, thriller is lowest
SELECT Genre,
    AVG(Rating) AS "Average Rating"
FROM Books
GROUP BY Genre
ORDER BY AVG(Rating) DESC;