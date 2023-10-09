CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    UserID INT,
    ProductID INT,
    TransactionID INT,
    WarehouseID INT,
    SupplierName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

CREATE TABLE Warehouses (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(255),
    LocationID INT,
    SupplierID INT,
    RentalRate DECIMAL(10, 2),
    ProductID INT,
    Description TEXT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Quantity INT,
    SupplierID INT,
    WarehouseID INT,
    Description TEXT
);

CREATE TABLE LocationTable (
    LocationID INT PRIMARY KEY,
    WarehouseID INT,
    Name VARCHAR(255),
    City VARCHAR(255),
    Description TEXT
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Username VARCHAR(50),
    Password VARCHAR(255),
    Email VARCHAR(255),
    RoleID INT
);

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    RoleName VARCHAR(50),
    Description TEXT
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    TransactionDate DATE,
    SupplierID INT,
    Amount DECIMAL(10, 2),
    ProductID INT,
    UserID INT,
    WarehouseID INT
);

CREATE TABLE Dummy (
    TransactionID INT PRIMARY KEY,
    TransactionDate DATE,
    SupplierID INT,
    Amount DECIMAL(10, 2),
    ProductID INT,
    UserID INT,
    WarehouseID INT
);

ALTER TABLE Suppliers
ADD COLUMN NewColumn VARCHAR(50);

DROP TABLE IF EXISTS Dummy;
