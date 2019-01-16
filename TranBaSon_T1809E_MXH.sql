create database TranBaSon_T1809E_MXH
go
use TranBaSon_T1809E_MXH
GO
CREATE table USER1
(
    ID_USER VARCHAR(20) CONSTRAINT PK_USER PRIMARY KEY ,
    Avatar ntext,
    TrangThaiTK BIT,-- 1: TK mở / 0:TK đóng.
    MatKhau VARCHAR(10),
    Email VARCHAR(50),
    NgaySinh DATE
)
GO
CREATE TABLE Group1
( 
    CheDo BIT,-- 1:Nhóm kín / 0:Nhóm công khai.
    ID_Group VARCHAR(20) CONSTRAINT PK_Group PRIMARY KEY
)
GO
CREATE TABLE ThanhVien
(
    ID_USER VARCHAR(20) CONSTRAINT FK_ThanhVienVsUSER FOREIGN KEY (ID_USER) REFERENCES USER1(ID_USER) ,
    ID_Group VARCHAR(20) CONSTRAINT FK_ThanhVienVsGroup FOREIGN KEY (ID_Group) REFERENCES Group1(ID_Group) ,
    Leader BIT -- 1:là leader / 0:không phải leader.
)
GO
CREATE TABLE Post1
(
    NoiDung ntext,
    Share BIT,--1: share / 0:ko share.
    ID_Post NVARCHAR(20) CONSTRAINT PK_Post PRIMARY KEY ,
    ID_USER VARCHAR(20) CONSTRAINT FP_PostVsUSER FOREIGN KEY (ID_USER) REFERENCES USER1(ID_USER),
    tg_Post DATETIME
)
GO
CREATE TABLE Comment
(   ID_Post NVARCHAR(20) not NULL CONSTRAINT PK_CommentVSPost1 FOREIGN KEY (ID_Post) REFERENCES Post1(ID_Post),
    noiDungCM NVARCHAR(20) not null,
    ID_USER VARCHAR(20) not NULL CONSTRAINT FK_CommentVsUSER FOREIGN KEY (ID_USER) REFERENCES USER1(ID_USER),
    tg_Comment DATETIME
)
GO
CREATE TABLE Action1(
    ID_Post NVARCHAR(20) not null CONSTRAINT PK_Action1VsPost1 FOREIGN KEY (ID_Post) REFERENCES Post1(ID_Post),
    ID_USER VARCHAR(20) CONSTRAINT FK_Action1VsUSER1 FOREIGN KEY (ID_USER) REFERENCES USER1(ID_USER),
    Type_Action NVARCHAR(20),
)  
GO

------------------------------------------------------ Phần insert dữ liệu -----------------------------------------------

------------ insert dữ liệu vào bảng USER1 ---------

insert INTO USER1
VALUES('user1','abc1.png','1','abc123','abc@gmail.com','1996-03-10')
GO
insert INTO USER1
VALUES('user2','abc3.png','1','abc1234','abc@gmail2.com','1994-03-19')
GO
insert INTO USER1
VALUES('user3','','1','abc1235','abc@gmail3.com','1998-03-18')
GO
insert INTO USER1
VALUES('user4','abc4.png','1','abc1236','abc@gmail4.com','1999-06-18')
GO
insert INTO USER1
VALUES('user5','abc5.png','1','abc1237','abc@gmail5.com','1991-03-18')
GO
insert INTO USER1
VALUES('user6','abc.png9','1','abc1238','abc@gmail6.com','2000-03-18')
GO
insert INTO USER1
VALUES('user7','abc4.png','0','abc1239','abc@gmail7.com','2001-03-18')
GO
insert INTO USER1
VALUES('user8','abc.png10','1','abc12310','abc@gmail8.com','2000-03-18')
GO
insert INTO USER1
VALUES('user9','abc4.png','0','abc12311','abc@gmail9.com','1996-05-12')
GO
insert INTO USER1
VALUES('user10','abc.png7','1','abc12312','abc@gmail10.com','1996-07-18')
GO
insert INTO USER1
VALUES('user12','abc.png78','1','abc123','abc@gmail11.com','1996-03-18')
GO
insert INTO USER1
VALUES('user13','abc.png54','1','abc123','abc@gmail12.com','1996-04-18')
GO
insert INTO USER1
VALUES('user14','abc.png56','1','abc123','abc@gmail13.com','1996-11-10')
GO
insert INTO USER1
VALUES('user15','abc.png45','1','abc123','abc@gmail14.com','1998-03-23')
GO

---------- insert dữ liệu vào bảng group1 ----------

INSERT into Group1
VALUES('1','GR1')
GO
INSERT into Group1
VALUES('1','GR2')
GO
INSERT into Group1
VALUES('0','GR3')
GO
INSERT into Group1
VALUES('1','GR4')
GO
INSERT into Group1
VALUES('1','GR5')
GO
INSERT into Group1
VALUES('0','GR6')
GO
INSERT into Group1
VALUES('1','GR7')
GO
INSERT into Group1
VALUES('1','GR8')
GO
INSERT into Group1
VALUES('0','GR9')
GO
INSERT into Group1
VALUES('1','GR10')
GO
INSERT into Group1
VALUES('0','GR11')
GO
INSERT into Group1
VALUES('1','GR12')
GO

------ insert dữ liệu vào bảng ThanhVien -------

INSERT into ThanhVien
VALUES('user1','GR1','1')
go
INSERT into ThanhVien
VALUES('user3','GR1','0')
go
INSERT into ThanhVien
VALUES('user5','GR1','0')
go
INSERT into ThanhVien
VALUES('user6','GR1','0')
go
INSERT into ThanhVien
VALUES('user1','GR2','0')
go
INSERT into ThanhVien
VALUES('user3','GR2','1')
go
INSERT into ThanhVien
VALUES('user10','GR2','0')
go
INSERT into ThanhVien
VALUES('user5','GR2','0')
go
INSERT into ThanhVien
VALUES('user10','GR4','1')
go
INSERT into ThanhVien
VALUES('user1','GR4','0')
go
INSERT into ThanhVien
VALUES('user5','GR4','0')
go
INSERT into ThanhVien
VALUES('user1','GR5','1')
go
INSERT into ThanhVien
VALUES('user5','GR5','0')
go
INSERT into ThanhVien
VALUES('user6','GR5','0')
go
INSERT into ThanhVien
VALUES('user2','GR6','1')
go
INSERT into ThanhVien
VALUES('user13','GR6','0')
go
INSERT into ThanhVien
VALUES('user14','GR6','0')
go
INSERT into ThanhVien
VALUES('user15','GR6','0')
go
INSERT into ThanhVien
VALUES('user6','GR5','0')
go
INSERT into ThanhVien
VALUES('user6','GR5','0')
go
INSERT into ThanhVien
VALUES('user3','GR6','1')
go
INSERT into ThanhVien
VALUES('user13','GR6','0')
go
INSERT into ThanhVien
VALUES('user14','GR6','0')
go
INSERT into ThanhVien
VALUES('user15','GR6','0')
go
INSERT into ThanhVien
VALUES('user1','GR7','1')
go
INSERT into ThanhVien
VALUES('user3','GR7','0')
go
INSERT into ThanhVien
VALUES('user5','GR7','0')
go
INSERT into ThanhVien
VALUES('user6','GR7','0')
go
INSERT into ThanhVien
VALUES('user1','GR1','1')
go
INSERT into ThanhVien
VALUES('user3','GR8','0')
go
INSERT into ThanhVien
VALUES('user5','GR8','0')
go
INSERT into ThanhVien
VALUES('user6','GR8','0')
go
INSERT into ThanhVien
VALUES('user10','GR9','1')
go
INSERT into ThanhVien
VALUES('user1','GR9','0')
go
INSERT into ThanhVien
VALUES('user5','GR9','0')
go

------------ insert dữ kiệ vào bảng Post1 ------------------

insert into Post1
VALUEs
(N'chào mọi người','1','P1','user1','2018-01-01 12:02:00.000')
go
insert into Post1
VALUEs
(N'hello world','1','P2','user1','2018-01-01 12:02:00.000')
go
insert into Post1
VALUEs
(N'chào mọi người2','1','P3','user2','2018-01-01 12:02:00.000')
go
insert into Post1
VALUEs
(N'chào mọi người4','1','P4','user3','2018-01-01 12:02:00.000')
go
insert into Post1
VALUEs
(N'chào mọi người3','1','P5','user2','2018-01-01 12:02:00.000')
go

------- insert dữ liệu vào bảng Action1 ---------

insert into Action1
VALUEs('P1','USER1','like')
GO
insert into Action1
VALUEs('P1','USER2','love')
GO
insert into Action1
VALUEs('P1','USER3','like')
GO
insert into Action1
VALUEs('P1','USER4','like')
GO
insert into Action1
VALUEs('P1','USER5','like')
GO
insert into Action1
VALUEs('P1','USER6','love')
GO
insert into Action1
VALUEs('P1','USER10','like')
GO
insert into Action1
VALUEs('P1','USER8','like')
GO
insert into Action1
VALUEs('P2','USER1','ph?n n?')
GO
insert into Action1
VALUEs('P2','USER2','like')
GO
insert into Action1
VALUEs('P2','USER1','like')
GO
insert into Action1
VALUEs('P2','USER8','like')
GO
insert into Action1
VALUEs('P2','USER12','haha')
GO
insert into Action1
VALUEs('P2','USER13','like')
GO
insert into Action1
VALUEs('P3','USER1','like')
GO
insert into Action1
VALUEs('P3','USER13','like')
GO
insert into Action1
VALUEs('P3','USER4','like')
GO
insert into Action1
VALUEs('P3','USER15','like')
GO
insert into Action1
VALUEs('P4','USER1','like')
GO
insert into Action1
VALUEs('P4','USER15','like')
GO
insert into Action1
VALUEs('P5','USER14','like')
GO
insert into Action1
VALUEs('P4','USER12','like')
GO

---- insert dữ liệu vào bảng comment -------------------

INSERT into Comment
VALUES('P1','hello','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P1','hello1','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P1','hello2','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P1','hello3','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P1','hello4','user10','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P1','xin chào1','user14','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P2','xin  chào 2','user7','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P2','hi','user2','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P2','hi','user9','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P3','xin chào3','user5','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P3','xin chào 4','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P3','xin  chào 5','user5','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P3','xin chào 6','user3','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P3','hello  5','user3','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P3','hello6','user2','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P3','hello  7','user1','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P4','hello8','user6','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P4','xin  chào mọi người','user15','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P4','hello world','user4','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P4','xin chào10','user4','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P4','chào mọi người ','user9','2018-01-01 12:02:47.000')
go
INSERT into Comment
VALUES('P5','chào các bạn','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','hello world','user7','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','hello baby','user7','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','ohhhh','user5','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','haizzz','user1','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','hayza','user4','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','ahaha','user2','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5',':)','user6','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5',':(','user3','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','<:)','user6','2019-01-01 12:03:47.000')
go
INSERT into Comment
VALUES('P5','<_>','user1','2019-01-01 12:03:47.000')
go

------------------------------------------------------------- trả lời các câu hỏi --------------------------------------------------------------


-- use TranBaSon_T1809E_MXH
use TranBaSon_T1809E4
go

-- câu 3:Lược đồ ER trên đã đảm bảo chuẩn 3NF chưa? Tại sao?
-- lược đồ ER đã đảm bảo chuẩn 3NF rồi . vì các thuộc tính không khoá của các bạn trên lược đồ đều phụ thuộc trực tiếp vào khoá chính và không có hiện tượng 
-- các thuộc tính phụ thuộc bắc cầu trong một bảng.


-- câu 6: hiển thị danh sách người dụng mạng xh
select * from USER1

-- câu 7:hiển thị danh dách người dùng mạng xã hội kèm theo số lương bài viết của họ
SELECT u.ID_USER, COUNT(*) from USER1 as u , Post1 as p
WHERE u.ID_USER = p.ID_USER
GROUP by u.ID_USER

-- câu8:Hiện thị DS người dùng mạng xã hội kèm số lượng comment của họ.
select u.ID_USER, COUNT(*) from USER1 as u , Comment as cm
WHERE u.ID_USER = cm.ID_USER
GROUP BY u.ID_USER

-- câu9:Hiện thị DS người dùng mạng xã hội kèm số lượng action của họ.
select u.ID_USER,COUNT(*) FROM USER1 as u, Action1 as ac
WHERE u.ID_USER = ac.ID_USER
GROUP by u.ID_USER

-- câu10: Hiện thị danh sách nhóm và số lượng người dùng trong nhóm.
SELECT g.ID_Group,COUNT(*) FROM Group1 as g , ThanhVien as tv
WHERE tv.ID_Group = g.ID_Group
GROUP by g.ID_Group



-- câu11:Lấy bài viết có số comment cao nhất.
SELECT p.ID_Post from Post1 as p, Comment as cm
WHERE p.ID_Post = cm.ID_Post
GROUP by p.ID_Post
HAVING COUNT(*) = (select top 1 COUNT(*) as dem from Comment 
GROUP by Comment.ID_Post
order by dem desc
)

-- câu12:Lấy bài viết có số action cao nhất.
SELECT p.ID_Post from Post1 as p, Action1 as ac 
WHERE p.ID_Post = ac.ID_Post
GROUP BY p.ID_Post
having COUNT(*) = (select top 1 COUNT(*) as dem FROM Action1 
GROUP BY Action1.ID_Post 
ORDER by dem DESC
)


--câu13:Lấy group có số member cao nhất
SELECT g.ID_Group FROM ThanhVien AS tv , Group1 as g
WHERE tv.ID_Group = g.ID_Group
GROUP by g.ID_Group
having COUNT(*) =  (select top 1 COUNT(*) as DEM from ThanhVien 
group by ThanhVien.ID_Group order by DEM Desc  )

-- câu14:14.Hiển thị danh sách nhóm và người tạo ra nhóm.
select g.ID_Group,tv.ID_USER from Group1 as g, ThanhVien as tv 
WHERE g.ID_Group = tv.ID_Group and Leader = '1'


-- câu15:Hiển thị danh sách các tài khoản tạo ít nhất 1 nhóm.
SELECT ID_USER,COUNT(*) as SoGroupDaTao FROM ThanhVien
WHERE Leader = '1'
GROUP BY ID_USER


-- câu16:Hiển thị danh sách các tài khoản tham gia ít nhất 1 nhóm
SELECT ID_USER from ThanhVien --- bảng ThanhVien chỉ chứa thành viên có group thôi
GROUP by ID_USER

-- câu17:Viết view lấy danh sách toàn bộ comment trong hệ thống.
CREATE VIEW [danhsachcomment] as
select NoiDungCM from Comment


