DECLARE @number int;
SET @number = 10;
DECLARE @chuoi VARCHAR(50);
SET @chuoi = 'hello world';
DECLARE @kyTu CHAR;
SET @kyTu = 'S';
SELECT @number as kieuNumber, @chuoi as kieuChuoi, @kyTu as KieuKyTu;
--============================
DECLARE @a INT;
DECLARE @b INT;
set @a = 2;
set @b = 5;
select (@a + @b) as phepCong , (@a - @b) as phepTru, 
(@a * @b) as phepNhan, (@a % @b) as phepChiaLayDu;
--=============================
SELECT N'Hôm này là: ' + CONVERT([nvarchar](30),GETDATE(),103);
SELECT N'Hôm này là: ' + CONVERT([varchar](100),GETDATE(),106);
SELECT N'bây giờ là: ' + 
+ DATENAME(dw, GETDATE()) + ','
+ DATENAME(mm, GETDATE()) + ' '
+ DATENAME(d, GETDATE()) + 'th, '
+ DATENAME(yyyy, GETDATE()) + ','
;
--===================================
create DATABASE mydb
GO
USE mydb
go
create TABLE Categories
(
    CateID int,
    CateName varchar(40),
    Description1 nvarchar(100)
)
go
create TABLE Products
(
    ProID int,
    ProName nvarchar(200),
    CateID int,
    Detail ntext,
    Quantity smallint,
    Price money
)
go

INSERT INTO Categories
VALUES(1,'Laptop',N'Máy tính xách tay')
go
INSERT INTO Categories
VALUES(2,'Desktop',N'Máy tính để bàn')
go
INSERT INTO Categories
VALUES(3,'CPU',N'Bộ vi xử lý')
go
INSERT INTO Categories
VALUES(4,'Monitor',N'Màn hình')
go

INSERT into Products
VALUES(1,N'HP compaq nx
9040','1',N'Máy tính xách tay HP compaq
nx 9040','10','1500')
go
INSERT into Products
VALUES(2,N'HP compaq
NC 4540','1',N'Máy tính xách tay HP compaq
NC 4540','15','1800')
go
INSERT into Products
VALUES(3,N'Intel Pentium 4','3',N'Bộ vi xử lý Intel Pentium 4','30','120')
go
INSERT into Products
VALUES(4,N'LG LCD 17''','4',N'Màn hình LG – LCD 17 inch','10','140')
go

select * from Categories;
SELECT * FROM Products;

SELECT COUNT(CateID) FROM Products;
SELECT SUM(Price) FROM Products;
SELECT MAX(Price) from Products;
SELECT AVG(Price) from Products;