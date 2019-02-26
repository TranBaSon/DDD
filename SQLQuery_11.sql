use QLHV;
GO
CREATE table Batchs
(
    BatchID char(6) CONSTRAINT PK_BatchID PRIMARY KEY,
    Year1 int ,
    Time1 varchar(20) ,
    ClassRoom tinyint ,
    LabRoom tinyint 
);
GO
create TABLE Students
(
    StdID int CONSTRAINT PK_StdID PRIMARY KEY ,
    FirstName varchar(50) ,
    LastName varchar(50) ,
    BatchID char(6) CONSTRAINT FK_StudentsVsBatchs FOREIGN KEY (BatchID) REFERENCES Batchs(BatchID),
    Birthday Datetime ,
    Address1 varchar(100) ,
    Email varchar(50) CHECK(Email like '%@%')
);
GO
create TABLE Marks
(
    StdID int CONSTRAINT FK_MarksVsStudents FOREIGN KEY(StdID) REFERENCES Students(StdID),
    Subject1 varchar(30) ,
    Type1 char(1) ,
    Mark decimal(4,2)
);
GO

INSERT into Batchs 
VALUEs ('C0809I',2008,'13h30 - 17h30',1,1)
go
INSERT into Batchs 
VALUEs ('C0812I',2008,'13h30 - 17h30',2,2)
go
INSERT into Batchs 
VALUEs ('C0909L',2009,'17h30 - 19h30',2,2)
go
INSERT into Batchs 
VALUEs ('T0906G',2009,'7h30 - 11h30',1,1)
go
INSERT into Batchs 
VALUEs ('T0908I',2009,'13h30 - 17h30',3,3)
go
INSERT into Batchs 
VALUEs ('T0909G',2009,'7h30 - 11h30',2,2)
go

INSERT into Students
VALUES(1,'Nguyen van','A','C0909L','1987-12-03 12:00:00','Ha Noi','anv@yahoo.com')
GO
INSERT into Students
VALUES(2,'Tran Thi','B','T0909G','1988-8-13 12:00:00','Hai Phong','btt@yahoo.com')
GO
INSERT into Students
VALUES(3,'Nguyen van','C','T0909G','1984-11-25 12:00:00','Nam Dinh','cnv@yahoo.com')
GO
INSERT into Students
VALUES(4,'Le Thi','D','T0908I','1987-06-27 12:00:00','Hoa Binh','dlt@yahoo.com')
GO
INSERT into Students
VALUES(5,'Tran van','E','T0906G','1987-11-21 12:00:00','Ha Noi','etv@yahoo.com')
GO

INSERT into Marks
VALUES(1,'CF','W',12.50)
go
INSERT into Marks
VALUES(1,'C','W',15.25)
go
INSERT into Marks
VALUES(1,'C','P',14.00)
go
INSERT into Marks
VALUES(2,'CF','W',14.50)
go
INSERT into Marks
VALUES(2,'C','P',16.50)
go
INSERT into Marks
VALUES(3,'C','W',18.00)
go
INSERT into Marks
VALUES(3,'C','P',17.00)
go
INSERT into Marks
VALUES(4,'CF','W',13.50)
go
INSERT into Marks
VALUES(4,'C','P',15.50)
go
INSERT into Marks
VALUES(5,'C','W',12.50)
go
INSERT into Marks
VALUES(5,'C','P',17.50)
go


