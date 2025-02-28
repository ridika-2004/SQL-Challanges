CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(15),
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UserType ENUM('Customer', 'Admin') NOT NULL
);

CREATE TABLE Admin (
    AdminID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

CREATE TABLE Seller (
    SellerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(255)
);

CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) UNIQUE,
    CategoryDescription TEXT
);

CREATE TABLE Product (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    SellerID INT,
    Price DECIMAL(10,2),
    Stock INT,
    ImageURL VARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL,
    FOREIGN KEY (SellerID) REFERENCES Seller(SellerID) ON DELETE CASCADE
);

CREATE TABLE Cart (
    CartID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT UNIQUE,
    TotalAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

CREATE TABLE CartItem (
    CartItemID INT AUTO_INCREMENT PRIMARY KEY,
    CartID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

CREATE TABLE OrderTable (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    TotalAmount DECIMAL(10,2),
    OrderStatus ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT UNIQUE,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'PayPal', 'Cash on Delivery'),
    PaymentStatus ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID) ON DELETE CASCADE
);

CREATE TABLE Review (
    ReviewID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment TEXT,
    ReviewDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES User(UserID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE
);

-- Insert Sample Users
INSERT INTO User (Name, Email, Password, ContactNumber, UserType)
VALUES ('John Doe', 'john@example.com', 'hashedpassword123', '1234567890', 'Customer'),
       ('Admin User', 'admin@example.com', 'securepassword', '0987654321', 'Admin');

-- Insert Sample Admin
INSERT INTO Admin (UserID) VALUES (2);

-- Insert Sample Sellers
INSERT INTO Seller (Name, ContactInfo)
VALUES ('Tech Store', 'techstore@example.com'),
       ('Fashion Hub', 'fashionhub@example.com');

-- Insert Sample Categories
INSERT INTO Category (CategoryName, CategoryDescription)
VALUES ('Electronics', 'Devices and gadgets'),
       ('Clothing', 'Apparel and fashion');

-- Insert Sample Products
INSERT INTO Product (ProductName, CategoryID, SellerID, Price, Stock, ImageURL)
VALUES ('Smartphone', 1, 1, 699.99, 50, 'phone.jpg'),
       ('T-Shirt', 2, 2, 19.99, 100, 'tshirt.jpg');

SELECT * FROM Product;

SELECT Product.ProductName, CartItem.Quantity
FROM CartItem
JOIN Cart ON CartItem.CartID = Cart.CartID
JOIN Product ON CartItem.ProductID = Product.ProductID
WHERE Cart.UserID = 1;

SELECT * FROM OrderTable WHERE UserID = 1;

SELECT * FROM Payment;

