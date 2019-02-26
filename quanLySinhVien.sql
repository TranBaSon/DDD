USE QuanLySinhVien
go

CREATE table Khoa (
    MaKhoa VARCHAR(4) PRIMARY key,
    khoa NVARCHAR(250)
)
GO
create table Lop (
    MaLop VARCHAR(10) PRIMARY key,
    TenLop NVARCHAR(250),
    MaKhoa VARCHAR(4) CONSTRAINT FK_KhoaVsLop FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
)
GO
CREATE table GiangVien (
    MaGV VARCHAR(20) PRIMARY key,
    HoTen NVARCHAR(250),
    ChuyenNganh NVARCHAR(250),
    MaKhoa VARCHAR(4) CONSTRAINT FK_KhoaVsGiangVien FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
)
go 
CREATE table SinhVien (
    MaSV VARCHAR(20) PRIMARY KEY,
    HoTen NVARCHAR(250),
    GioiTinh VARCHAR(5),
    NgaySinh DATE,
    MaLop VARCHAR(10) CONSTRAINT FK_LopVsSinhVien FOREIGN KEY (MaLop) REFERENCES Lop(MaLop)
)
go
CREATE TABLE MonHoc (
    MaMH VARCHAR(20) PRIMARY KEY,
    TenMH NVARCHAR(250),
    SoGio INT
)
go
create table DiemThanhPhan (
    MaSV VARCHAR(20) CONSTRAINT FK_SinhVienVsDiemThanhPhan FOREIGN KEY (MaSV) REFERENCES SinhVien(MaSV),
    MaMH VARCHAR(20) CONSTRAINT Fk_MonHocVsDiemThanhPhan FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH),
    LanThi INT,
    DiemThi FLOAT
)
go
CREATE TABLE PhanCong (
    MaLop VARCHAR(10) CONSTRAINT FK_LopVsPhanCong FOREIGN key (MaLop) REFERENCES Lop(MaLop),
    MaMH VARCHAR(20) CONSTRAINT FK_MonHocVSPhanCong FOREIGN KEY (MaMH) REFERENCES MonHoc(MaMH),
    MaGV VARCHAR(20) CONSTRAINT FK_GiangVienVsPhanCong FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV)
)
go


--<=========================================> insert <==========================================>
INSERT into Khoa
VALUES ('ANM','An Ninh Mạng')
GO
INSERT into Khoa
VALUES ('KTPM','Kỹ Thuật Phần Mềm ')
go
INSERT into Khoa
VALUES ('MTT','Mạng Máy Tính')
go
INSERT into Khoa
VALUES ('TCKT','Tài Chính Kế Toán')
GO


INSERT into Lop
VALUES ('25CCDH02',' Cao đẳng KT Đồ Hoạ khoá 25','KTPM')
go
INSERT into Lop
VALUES ('25CCLM01','Cao Đẳng LT khoá 25','KTPM')
go
INSERT into Lop
VALUES ('25CCHT02','Cao đẳng QTM khoá 25','MTT')
go


insert into GiangVien
VALUEs ('DatDT','Dương Tích Đạt','Công nghệ thông tin','KTPM')
go
insert into GiangVien
VALUEs ('TrungDM','Dương Minh Trung','Công nghệ thông tin','MTT')
go
insert into GiangVien
VALUEs ('MaiHTD','Huỳnh Thị Diễm Mai','Công nghệ thông tin','KTPM')
go


INSERT into SinhVien 
VALUES ('91110010003','Phan Tuấn Cường','Nam','1993-03-03','25CCHT02')
go
INSERT into SinhVien 
VALUES ('91110010004','Huỳnh Chí Tâm','Nam','1993-03-08','25CCHT02')
go
INSERT into SinhVien 
VALUES ('91110010005','Vương Chí Dũng','Nam','1991-04-14','25CCHT02')
go
INSERT into SinhVien 
VALUES ('93510010005','Phạm Đức Nguyên','Nam','1993-07-27','25CCHT02')
go
INSERT into SinhVien 
VALUES ('93510010008','Trương Mỹ Yến Nhi','Nu','1993-10-03','25CCHT02')
go
INSERT into SinhVien 
VALUES ('93510010009','Hồ Võ Thanh Tùng','Nam','1990-09-06','25CCHT02')
go
INSERT into SinhVien 
VALUES ('93510010010','Trần Quang Minh','Nam','1989-12-18','25CCHT02')
go
INSERT into SinhVien 
VALUES ('99510170307','Phạm Văn Đình','Nam','1991-06-05','25CCHT02')
go
INSERT into SinhVien 
VALUES ('99510180112','Trần Thùy Dương','Nam','1992-12-07','25CCHT02')
go
INSERT into SinhVien 
VALUES ('99510180150','Lê Hoàng Khiêm','Nam','1993-03-22','25CCHT02')
go


insert into MonHoc
VALUES ('CSDL','Cơ sở dữ liệu',30)
GO
insert into MonHoc
VALUES ('MCB','Mạng căn bản',30)
GO
insert into MonHoc
VALUES ('THDC','Tin học đại cương',45)
GO
insert into MonHoc
VALUES ('THVP','Tin học văn phòng',45)
GO
insert into MonHoc
VALUES ('XLA','Xử lý ảnh',45)
GO

INSERT into PhanCong
VALUES('25CCLM01','CSDL','DatDT')
go


INSERT into DiemThanhPhan
VALUES ('91110010003','MCB',1,7)
go
INSERT into DiemThanhPhan
VALUES ('91110010003','THDC',1,8)
go
INSERT into DiemThanhPhan
VALUES ('91110010003','THVP',1,9.5)
go
INSERT into DiemThanhPhan
VALUES ('91110010004','MCB',1,4.5)
go
INSERT into DiemThanhPhan
VALUES ('91110010004','THDC',1,5.5)
go
INSERT into DiemThanhPhan
VALUES ('91110010004','THVP',1,10)
go

--<====================================>query<===============================>
-- 4.1
UPDATE SinhVien
SET GioiTinh = 'Nu'
where MaSV = 99510180112;
GO
-- 4.2
UPDATE DiemThanhPhan
SET DiemThi = 9
WHERE MaSV = 91110010003 and MaMH = 'MCB';
GO
--4.3
UPDATE SinhVien
set NgaySinh = '1993-07-17'
WHERE MaSV = 93510010005;
go


-- 5.1
SELECT MaSV,MaMH,DiemThi from DiemThanhPhan
where MaMH = 'MCB'
-- 5.2
SELECT MaSV,MaMH,DiemThi from DiemThanhPhan
where DiemThi >= 8
--5.3
SELECT MaSV,MaMH,DiemThi from DiemThanhPhan
where DiemThi >= 5 AND MaMH = 'THVP'
--5.4
SELECT * from SinhVien as SV , Lop 
where sv.MaLop = Lop.MaLop
--5.5
SELECT * from SinhVien
WHERE HoTen like 'Trần%'
--5.6
SELECT SV.HoTen, SV.MaSV, AVG(DiemThi) FROM SinhVien as SV , DiemThanhPhan as dtp
WHERE SV.MaSV = dtp.MaSV
GROUP by SV.HoTen , SV.MaSV
--5.7
SELECT COUNT(*) N'số lượng sinh viên nam' FROM SinhVien 
where gioiTinh = 'Nam'
--5.8
SELECT DiemThi from DiemThanhPhan
WHERE MaMH = 'MCB'
ORDER BY DiemThi DESC
--5.9
SELECT MaLop, TenLop, COUNT(*) N'sĩ số' from Lop
GROUP BY MaLop, TenLop
--5.10
SELECT Lop.MaLop, Lop.TenLop FROM SinhVien as sv , Lop
WHERE  Lop.MaLop != sv.MaLop
GROUP BY Lop.MaLop, Lop.TenLop
--5.11
SELECT GV.MaGV, GV.MaKhoa, GV.HoTen, GV.ChuyenNganh from GiangVien as GV , PhanCong as PC
WHERE GV.MaGV != PC.MaGV
GROUP BY GV.MaGV, GV.MaKhoa, GV.HoTen, GV.ChuyenNganh
--5.12
SELECT COUNT(*) 'số sinh viên thi lại lần 2' FROM DiemThanhPhan
WHERE LanThi = 2
5.13
select * FROM SinhVien
WHERE YEAR(NgaySinh) = 1993
--5.14
select SV.HoTen, SV.MaSV, MH.TenMH, L.TenLop, K.khoa, DTP.DiemThi FROM SinhVien as SV, Lop as L, MonHoc as MH, Khoa as K, DiemThanhPhan as DTP
WHERE SV.MaLop = L.MaLop AND L.MaKhoa = K.MaKhoa AND SV.MaSV = DTP.MaSV AND DTP.MaMH = MH.MaMH AND SV.MaSV = '91110010004'
GROUP BY SV.HoTen, SV.MaSV, MH.TenMH, L.TenLop, K.khoa, DTP.DiemThi 

--6.1
create view thongTinSV
AS
SELECT sv.MaSV, sv.HoTen, sv.GioiTinh, sv.NgaySinh, l.TenLop from SinhVien as sv JOIN Lop as L
on sv.MaLop = L.MaLop

SELECT * from thongTinSV
--6.2
create view thongTinKhoa
as 
SELECT K.MaKhoa, K.khoa, COUNT(*) soGVTrongKhoa from GiangVien as GV join Khoa as K
on K.MaKhoa = GV.MaKhoa
GROUP by K.khoa, K.MaKhoa

SELECT * from thongTinKhoa

--7.1
--a
CREATE PROC demSVTheoGT
@GioiTinh VARCHAR(5)
AS 
SELECT COUNT(*) soSV from SinhVien
where GioiTinh = @GioiTinh
GO

--b
exec demSVTheoGT 'nu'

--7.2
create PROC svCoDiemTBCaoNhat;
AS

SELECT sv.MaSV, sv.HoTen, sv.GioiTinh, sv.NgaySinh, sv.MaLop FROM SinhVien as sv , DiemThanhPhan as DTP
WHERE sv.MaSV = DTP.MaSV
GROUP BY sv.MaSV, sv.HoTen, sv.GioiTinh, sv.NgaySinh, sv.MaLop
HAVING AVG(DiemThi)  = (select top 1 AVG(DiemThi) diemTB from DiemThanhPhan as dtp, SinhVien as SV
WHERE dtp.MaSV = sv.MaSV
GROUP BY sv.MaSV, sv.HoTen, sv.GioiTinh, sv.NgaySinh, sv.MaLop
ORDER by  diemTB desc
);
EXEC svCoDiemTBCaoNhat














create view vwThongTinSv;
as 
select * FROM SinhVien
WHERE MaSV like '911%'

SELECT * from vwThongTinSv

-- xem cau lenh tao view neu quen
exec sp_helptext vwThongTinSv


-- procedure
create proc tinhTong;
@soThuNhat int, @soThuHai int, @tong int OUTPUT
as 
    SELECT @tong = @soThuNhat + @soThuHai;

go
DECLARE @a INT;

EXEC tinhTong 3, 6, @a output;
SELECT @a;
go

-- dem so sv cua lop khi nhap ma lop
create proc demsv
@MaLop VARCHAR(10)
as
SELECT COUNT(*) from SinhVien
WHERE MaLop = @MaLop
go

EXEC demsv '25CCHT02';



--<=============================>trigeer<=========>

CREATE TRIGGER kiemTraSV;
on SinhVien
for INSERT
AS
    BEGIN
        print  'thanh cong';
    end;


insert SinhVien 
VALUES('81110010002', N'Phạm Tuấn Cường', 'Nam', '1990-10-10', N'25CCHT02');

SELECT * FROM SinhVien



CREATE TRIGGER kiemTraSV1;
on SinhVien
for INSERT
AS
    BEGIN
    IF(select ngaySinh from inserted ) > GETDATE()
        begin
        print  N'Không thể nhập  ngày sinh lớn hơn ngày hiện tại.';
        ROLLBACK TRANSACTION;
        END
        PRINT N'kết thúc';
    end;



create trigger updatemaSV
on SinhVien
FOR UPDATE
as 
    BEGIN
        IF UPDATE(maSV)
            BEGIN
                print N'không thể update mã sinh viên';
                ROLLBACK TRANSACTION;
            end;
        PRINT N'kết thúc';
    END;

UPDATE SinhVien SET maSV = '123456786' where maSV = '81110010005';