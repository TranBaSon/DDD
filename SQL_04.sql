CREATE DATABASE Assignment_04
GO

USE Assignment_04
GO


create TABLE LoaiSanPham 
(
    TenLoaiSP NVARCHAR(250),
    MaLoaiSP VARCHAR(20) PRIMARY KEY
)
GO


create TABLE SanPham
(
    MaLoaiSP VARCHAR(20) CONSTRAINT FK_LoaiSanPhamVsSanPham FOREIGN key (MaLoaiSP) REFERENCES LoaiSanPham(MaLoaiSP) ,
    MaSP VARCHAR(20) primary key,
    NgaySanXuat DATE
)
GO

CREATE TABLE NguoiChiuTrachNhiem
(
    MaSP VARCHAR(20) CONSTRAINT FK_sanPhamVsNguoiChiuTrachNhiem FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP),
    TenNCTN NVARCHAR(250),
    MaNCTN VARCHAR(20) 
)
GO


INSERT into LoaiSanPham 
VALUES(N'Máy tính sách tay Z37','Z37E')
go
INSERT into LoaiSanPham 
VALUES(N'Máy ảnh M24','M24D')
go
INSERT into LoaiSanPham 
VALUES(N'Điện thoại di động X21','X21C')
go

INSERT into SanPham
VALUES('Z37E','Z37 01','2016-02-01')
go
INSERT into SanPham
VALUES('Z37E','Z37 02','2016-07-01')
go
INSERT into SanPham
VALUES('Z37E','Z37 03','2016-04-01')
go
INSERT into SanPham
VALUES('Z37E','Z37 04','2015-02-01')
go
INSERT into SanPham
VALUES('M24D','M24 01','2017-08-02')
go
INSERT into SanPham
VALUES('M24D','M24 02','2017-08-02')
go
INSERT into SanPham
VALUES('M24D','M24 03','2016-08-02')
go
INSERT into SanPham
VALUES('X21C','X21 01','2018-05-01')
go
INSERT into SanPham
VALUES('X21C','X21 02','2017-05-01')
go
INSERT into SanPham
VALUES('X21C','X21 03','2018-05-01')
go

INSERT into NguoiChiuTrachNhiem
VALUES('Z37 01',N'Nguyễn Văn An','987688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('Z37 02',N'Nguyễn Văn An','987688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('M24 01',N'Nguyễn Văn An','987688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('X21 01',N'Nguyễn Văn An','987688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('X21 02',N'Trần Văn Hậu','687688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('Z37 03',N'Trần Văn Hậu','687688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('M24 02',N'Trần Văn Hậu','687688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('X21 03',N'Hoàng Thị Xuân','887688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('M24 03',N'Hoàng Thị Xuân','887688')
GO
INSERT into NguoiChiuTrachNhiem
VALUES('Z37 04',N'Hoàng Thị Xuân','887688')
GO


--<=========================================> query <==========================================>
--4A
select * FROM LoaiSanPham
--4B
select * FROM SanPham
--4C
select TenNCTN, MaNCTN FROM NguoiChiuTrachNhiem
GROUP by TenNCTN, MaNCTN 

--5A
select * FROM LoaiSanPham
order by TenLoaiSP 
--5B
select TenNCTN, MaNCTN FROM NguoiChiuTrachNhiem
GROUP by TenNCTN, MaNCTN 
order by TenNCTN 
--5C
SELECT SP.MaSP, SP.NgaySanXuat FROM SanPham as SP, LoaiSanPham as LSP
WHERE SP.MaLoaiSP = LSP.MaLoaiSP and LSP.MaLoaiSP = 'Z37E'
--5D
SELECT SP.MaLoaiSP, SP.MaLoaiSP, SP.NgaySanXuat  from SanPham as SP, NguoiChiuTrachNhiem as NCTN
WHERE SP.MaSP = NCTN.MaSP and NCTN.TenNCTN = N'Nguyễn Văn An'
ORDER by SP.MaSP DESC
--6A
select LSP.MaLoaiSP, LSP.TenLoaiSP, COUNT(*) N'Số lượng' from SanPham as SP, LoaiSanPham as LSP
WHERE SP.MaLoaiSP = LSP.MaLoaiSP
GROUP BY  LSP.MaLoaiSP, LSP.TenLoaiSP
--6B
SELECT COUNT(*)a FROM SanPham 
SELECT COUNT(*) b from LoaiSanPham

--6C
select sp.MaLoaiSP, sp.MaSP, sp.NgaySanXuat, lsp.TenLoaiSP from SanPham as sp, LoaiSanPham as lsp
WHERE sp.MaLoaiSP = lsp.MaLoaiSP
--6D
SELECT sp.MaLoaiSP, sp.MaSP, sp.NgaySanXuat, lsp.TenLoaiSP, nctn.MaNCTN, nctn.TenNCTN from SanPham as sp, LoaiSanPham as lsp, NguoiChiuTrachNhiem as nctn
WHERE sp.MaLoaiSP = lsp.MaLoaiSP AND nctn.MaSP = sp.MaSP
--7A
UPDATE SanPham
SET NgaySanXuat = GETDATE()
GO
--7b
SHOW KEYS FROM SanPham WHERE Key_name = 'PRIMARY'

--7c
ALTER TABLE SanPham
add PhienBan VARCHAR(20)
GO
--8a
CREATE INDEX INDEX_TenNguoiChiuTrachNhiem
on NguoiChiuTrachNhiem(TenNCTN)
go
--8b.1 
CREATE VIEW View_SanPham
AS
SELECT sp.MaSP, sp.NgaySanXuat, lsp.TenLoaiSP FROM SanPham as sp, LoaiSanPham as lsp
WHERE sp.MaLoaiSP = lsp.MaLoaiSP
GO

SELECT * from View_SanPham
--8b.2 
CREATE VIEW View_SanPham_NCTN                 
AS
SELECT sp.MaSP, sp.NgaySanXuat, nctn.TenNCTN FROM SanPham as sp, NguoiChiuTrachNhiem as nctn 
WHERE sp.MaSP = nctn.MaSP

select * from View_SanPham_NCTN
--8b.3  
CREATE VIEW View_Top_SanPham
AS
select top 5 sp.MaSP, lsp.TenLoaiSP, sp.NgaySanXuat FROM SanPham as sp, LoaiSanPham as lsp
WHERE sp.MaLoaiSP = lsp.MaLoaiSP
ORDER BY sp.NgaySanXuat DESC
go

select * FROM View_Top_SanPham

--8c.1
CREATE PROC SP_Them_LoaiSP
@TenLoaiSP NVARCHAR(250),
@MaLoaiSP VARCHAR(20) 
AS
    BEGIN
        INSERT into LoaiSanPham 
        VALUES(@TenLoaiSP,@MaLoaiSP)
    END
go

--8c.2
CREATE PROC SP_Them_NCTN
    @MaSP VARCHAR(20) ,
    @TenNCTN NVARCHAR(250),
    @MaNCTN VARCHAR(20)
AS
    BEGIN
        INSERT into NguoiChiuTrachNhiem
        VALUES(@MaSP,@TenNCTN,@MaNCTN)
    END
GO

--8c.3
CREATE PROC SP_Them_SanPham
    @MaLoaiSP VARCHAR(20) ,
    @MaSP VARCHAR(20) ,
    @NgaySanXuat DATE,
    @PhienBan VARCHAR(20)
AS
    BEGIN
        INSERT into SanPham
        VALUES(@MaLoaiSP, @MaSP, @NgaySanXuat, @PhienBan)
    END
go
--8c.4
create PROC SP_Xoa_SanPham
@MaSP VARCHAR(20)
as
    BEGIN
        delete from SanPham
        WHERE MaSP = @MaSP
    END
GO
--8c.5
CREATE PROC SP_Xoa_SanPham_TheoLoai
@MaLoaiSP VARCHAR(20)
as
    BEGIN
        delete from SanPham
        WHERE MaLoaiSP = @MaLoaiSP
    END
GO