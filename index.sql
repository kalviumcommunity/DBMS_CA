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

CREATE TABLE WarehouseInfo (
    WarehouseID INT PRIMARY KEY,
    WarehouseName VARCHAR(255),
    LocationID INT,
    SupplierID INT,
    RentalRate DECIMAL(10, 2),
    Description TEXT,
    FOREIGN KEY (LocationID) REFERENCES LocationTable(LocationID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE WarehouseProducts (
    WarehouseID INT,
    ProductID INT,
    PRIMARY KEY (WarehouseID, ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES WarehouseInfo(WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Quantity INT,
    SupplierID INT,
    WarehouseID INT,
    Description TEXT
);

CREATE TABLE ProductInfo (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Quantity INT,
    Description TEXT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (WarehouseID) REFERENCES WarehouseInfo(WarehouseID)
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

INSERT INTO Suppliers (SupplierID, UserID, ProductID, TransactionID, WarehouseID, SupplierName, Email, PhoneNumber, Address)
VALUES (1, 1, 1, 1, 1, 'Supplier 1', 'supplier1@email.com', '9087654321', '123 Address St.');

INSERT INTO Suppliers (SupplierID, UserID, ProductID, TransactionID, WarehouseID, SupplierName, Email, PhoneNumber, Address)
VALUES (2, 2, 2, 2, 2, 'Supplier 2', 'supplier2@email.com', '1230987456', '456 Address St.');


INSERT INTO Warehouses (WarehouseID, WarehouseName, LocationID, SupplierID, RentalRate, ProductID, Description)
VALUES (1, 'Warehouse A', 1, 1, 100.00, 1, 'Description for Warehouse A');


UPDATE Suppliers
SET Email = 'saksham.agarwal@gmail.com', PhoneNumber = '1234567890', Address = 'Lovely Professional University'
WHERE SupplierID = 1;

DELETE FROM Suppliers
WHERE SupplierID = 2;

CREATE TABLE RentalHistory (
    RentalID INT PRIMARY KEY,
    StartDate DATE,
    EndDate DATE,
    ProductID INT,
    WarehouseID INT,
    SupplierID INT
);

ALTER TABLE Warehouses
ADD COLUMN IsAvailable BOOLEAN;

UPDATE Warehouses
SET IsAvailable = TRUE;

SELECT w.WarehouseName, s.SupplierName
FROM Warehouses w
JOIN RentalHistory rh ON w.WarehouseID = rh.WarehouseID
JOIN Suppliers s ON rh.SupplierID = s.SupplierID

SELECT WarehouseName
FROM Warehouses
WHERE RentalRate = (SELECT MAX(RentalRate) FROM Warehouses);
