-- Create the Books table
CREATE TABLE Books (
    Book_ID 		INT PRIMARY KEY IDENTITY(1,1),  -- Unique identifier for each book
    Book_Title 		NVARCHAR(255) NOT NULL,     	-- Title of the book
    Author 		NVARCHAR(100) NOT NULL,         -- Author of the book
    Genre 		NVARCHAR(50) NOT NULL,          -- Genre of the book
    Publication_Year 	INT NOT NULL,         		-- Year of publication
    Pages 		INT NOT NULL,                   -- Number of pages in the book
    Price 		DECIMAL(10,2) NOT NULL,         -- Price of the book in GBP
    Rating 		DECIMAL(3,2),                   -- Average rating of the book (1-5 scale)
    Total_Sales 	INT                        	-- Total number of copies sold
);

-- Insert data into the Books table
INSERT INTO Books (Book_Title, Author, Genre, Publication_Year, Pages, Price, Rating, Total_Sales)
VALUES
    ('The Great Journey', 'John Smith', 'Fiction', 2015, 320, 15.99, 4.2, 2500),
    ('Moonlight Sonata', 'Jane Doe', 'Romance', 2018, 270, 12.99, 3.8, 3500),
    ('The Mysterious Island', 'Mary Johnson', 'Adventure', 2010, 450, 19.99, 4.6, 5000),
    ('Eternal Love', 'Michael Brown', 'Romance', 2021, 300, 14.99, 4.4, 1200),
    ('Lost in Time', 'Emily Davis', 'Sci-Fi', 2017, 380, 16.99, 4.1, 3200),
    ('The Forgotten Ones', 'Laura Wilson', 'Mystery', 2016, 360, 18.99, 4.8, 4200),
    ('Night Whispers', 'David Moore', 'Thriller', 2019, 280, 13.99, 3.7, 2900),
    ('Guardians of the Realm', 'Oliver Scott', 'Fantasy', 2020, 550, 24.99, 4.9, 4800),
    ('The Last Battle', 'Susan White', 'War', 2013, 400, 21.99, 4.3, 2700),
    ('The Secret Garden', 'Carol Anderson', 'Children', 2012, 180, 9.99, 3.9, 4500),
    ('Emerald Skies', 'James Lewis', 'Sci-Fi', 2011, 390, 17.99, 4.0, 2300),
    ('The Heart of Darkness', 'Alex Thompson', 'Mystery', 2014, 350, 20.99, 4.7, 3100),
    ('Dance with Destiny', 'Linda Evans', 'Romance', 2009, 290, 11.99, 3.6, 2100),
    ('Into the Abyss', 'Karen Parker', 'Thriller', 2008, 260, 12.99, 3.5, 2800),
    ('Warriors Call', 'Paul Bailey', 'Fantasy', 2017, 500, 22.99, 4.5, 4400),
    ('The Enchanted Forest', 'Deborah Russell', 'Children', 2020, 160, 8.99, 3.4, 4100),
    ('The Timekeepers Daughter', 'Margaret Collins', 'Sci-Fi', 2019, 375, 18.99, 4.3, 1800),
    ('Crimson Night', 'Barbara Cook', 'Mystery', 2015, 330, 19.99, 4.6, 2600),
    ('Silent Whispers', 'Christopher Stewart', 'Thriller', 2016, 295, 14.99, 3.9, 2400),
    ('The Starborn', 'Michelle Turner', 'Fantasy', 2014, 480, 23.99, 4.8, 4000),
    ('The Courage Within', 'Stephanie Watson', 'War', 2018, 410, 20.99, 4.1, 2200),
    ('The Butterflys Dream', 'Elizabeth Jenkins', 'Children', 2011, 190, 10.99, 3.7, 4300),
    ('Rifts in Time', 'Howard Ross', 'Sci-Fi', 2010, 420, 19.99, 4.2, 1500),
    ('Echoes of the Past', 'Patricia Kelly', 'Mystery', 2009, 335, 21.99, 4.5, 3000),
    ('Fading Stars', 'Nancy Simmons', 'Romance', 2013, 255, 13.99, 3.8, 2000),
    ('Chasing Shadows', 'Joseph Murphy', 'Thriller', 2012, 275, 13.99, 3.5, 2300),
    ('The Silver Crown', 'Rebecca Ward', 'Fantasy', 2011, 490, 24.99, 4.7, 3900),
    ('The Oceans Embrace', 'Julia Gray', 'Romance', 2015, 285, 14.99, 3.9, 1900),
    ('Invisible Chains', 'Thomas Lane', 'Thriller', 2018, 290, 14.99, 3.7, 2500),
    ('The Sorcerers Oath', 'Samantha Jackson', 'Fantasy', 2016, 530, 23.99, 4.6, 3800);