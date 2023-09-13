-- Create a new database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS RestaurantDatabase;

-- Use the newly created database
USE RestaurantDatabase;

-- Create a table for meals
CREATE TABLE IF NOT EXISTS Meals (
                                     MealID INT AUTO_INCREMENT PRIMARY KEY,
                                     Name VARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Calories INT NOT NULL
    );

-- Create a table for orders
CREATE TABLE IF NOT EXISTS Orders (
                                      OrderID INT AUTO_INCREMENT PRIMARY KEY,
                                      MealID INT NOT NULL,
                                      OrderDate TIMESTAMP NOT NULL,
                                      FOREIGN KEY (MealID) REFERENCES Meals(MealID)
    );

-- Insert sample data into the Meals table
INSERT INTO Meals (Name, Price, Calories) VALUES
                                              ('Spaghetti', 12.99, 450),
                                              ('Salad', 9.99, 250),
                                              ('Steak', 25.99, 800),
                                              ('Pizza', 14.99, 600),
                                              ('Sushi', 19.99, 500);

-- Insert sample data into the Orders table
INSERT INTO Orders (MealID, OrderDate) VALUES
                                           (1, '2023-09-13 12:30:00'),
                                           (2, '2023-09-13 13:45:00'),
                                           (3, '2023-09-13 18:15:00'),
                                           (4, '2023-09-13 19:30:00'),
                                           (5, '2023-09-13 14:00:00');

SELECT MAX(Price) AS MaxPrice
FROM Meals
WHERE Calories > 500;


SELECT AVG(Calories) AS AverageCalories
FROM Meals
WHERE Price > 15;


SELECT Name, Price
FROM Meals
HAVING Price = (SELECT MAX(Price) FROM Meals);

SELECT Name, Price
FROM Meals
GROUP BY Name, Price
HAVING Price < (SELECT AVG(Price) FROM Meals);

SELECT Name, Price, Calories
FROM Meals
WHERE Calories > 600
GROUP BY Name, Price, Calories
HAVING Price < (SELECT AVG(Price) FROM Meals);
