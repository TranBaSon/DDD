CREATE DATABASE mydb1
GO
use mydb1
go
create TABLE Batchs
(
    BatchID: char(6),
    Year1: int,
    Time1: varchar(20),
    ClassRoom: tinyint,
    LabRoom: tinyint 
)
go
CREATE TABLE Students
(
    StdID: char(6),
    FirstName: varchar(50),m
    LastName: varchar(50),
    BatchID: char(6),
    Birthday: datetime ,
    Address1: varchar(100) ,
    Email: varchar(50) 
)
go
CREATE TABLE Marks
(
    StdID: char(6),
    Subject1: varchar(30),
    Type1: char(1),
    Mark: decimal(4.2)
)
go