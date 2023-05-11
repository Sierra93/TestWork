CREATE TABLE dbo.Products
(
    Id     INT PRIMARY KEY,
    "Name" TEXT
);

INSERT INTO dbo.Products
VALUES (1, 'Beef'),
       (2, 'Milk'),
       (3, 'Tomato');

CREATE TABLE dbo.Categories
(
    Id     INT PRIMARY KEY,
    "Name" TEXT
);

INSERT INTO dbo.Categories
VALUES (1, 'Meet'),
       (2, 'Dairy_produce'),
       (3, 'Vegetables');

CREATE TABLE dbo.ProductCategories
(
    ProductId  INT,
    CategoryId INT,
    CONSTRAINT "PK_ProductCategories_ProductId_CategoryId" PRIMARY KEY (ProductId, CategoryId),
    CONSTRAINT "FK_Products_Id" FOREIGN KEY (ProductId) REFERENCES dbo.Products (Id),
    CONSTRAINT "FK_Categories_Id" FOREIGN KEY (ProductId) REFERENCES dbo.Categories (Id)
);

INSERT INTO dbo.ProductCategories
VALUES (1, 1),
       (2, 3),
       (3, 3);

SELECT p."Name", c."Name"
FROM dbo.Products p
LEFT JOIN dbo.ProductCategories pc ON p.Id = pc.ProductId
LEFT JOIN dbo.Categories c ON pc.CategoryId = c.Id;