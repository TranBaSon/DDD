create DATABASE  Assignment_03
USE Assignment_03
GO

create TABLE ThongTinKhachHang
(   
    IDKhachHang VARCHAR(20) PRIMARY KEY,
    TenKhachHang NVARCHAR(250),
    SoCMT int,
    DiaChi NVARCHAR(350)
)
GO

CREATE TABLE thongTinThueBao
(
    IDKhachHang VARCHAR(20) CONSTRAINT FK_KhachHangVsThueBao FOREIGN KEY (IDKhachHang) REFERENCES ThongTinKhachHang(IDKhachHang), 
    SoThueBao INT primary KEY,
    LoaiThueBao NVARCHAR(20),
    NgayDangKy DATE
)
GO


insert into ThongTinKhachHang
VALUES('KH1',N'Nguyễn Nguyệt Nga',123456789,N'Hà Nội')
go
insert into ThongTinKhachHang
VALUES('KH2',N'Nguyễn Thị A',123456788,N'Hải Phòng')
go
insert into ThongTinKhachHang
VALUES('KH3',N'Nguyễn Thị B',123456787,N'Nghệ An')
go
insert into ThongTinKhachHang
VALUES('KH4',N'Trần Văn B',123456786,N'Hà Tĩnh')
go
insert into ThongTinKhachHang
VALUES('KH5',N'Hoàng Thị C',123456785,N'Hà Nội')
go
insert into ThongTinKhachHang
VALUES('KH6',N'Đặng Ngọc D',123456784,N'Nghệ An')
go
insert into ThongTinKhachHang
VALUES('KH7',N'Trần văn E',123456783,N'Hà Nội')
go
insert into ThongTinKhachHang
VALUES('KH8',N'Trần văn F',123499783,N'Hà Nội')
go

INSERT into thongTinThueBao
VALUES('KH1',123456789 ,N'Trả trước','2012-12-02')
GO
INSERT into thongTinThueBao
VALUES('KH1',123456788 ,N'Trả trước','2012-09-02')
GO
INSERT into thongTinThueBao
VALUES('KH1',123456757 ,N'Trả sau','2015-12-02')
GO
INSERT into thongTinThueBao
VALUES('KH2',123454589 ,N'Trả trước','2012-12-02')
GO
INSERT into thongTinThueBao
VALUES('KH2',123456769 ,N'Trả trước','2017-03-02')
GO
INSERT into thongTinThueBao
VALUES('KH3',123456799 ,N'Trả trước','2014-10-02')
GO
INSERT into thongTinThueBao
VALUES('KH4',123456762 ,N'Trả trước','2017-06-02')
GO
INSERT into thongTinThueBao
VALUES('KH5',123432789 ,N'Trả trước','2012-02-05')
GO
INSERT into thongTinThueBao
VALUES('KH6',134456789 ,N'Trả trước','2013-12-02')
GO
INSERT into thongTinThueBao
VALUES('KH7',123456889 ,N'Trả trước','2012-12-12')
GO
INSERT into thongTinThueBao
VALUES('KH8',173456889 ,N'Trả trước','2012-12-09')
GO


--<==================================================> QUERY <============================================>
--4a
SELECT * from ThongTinKhachHang
--4b
select * from thongTinThueBao

--5a
SELECT * from thongTinThueBao
WHERE SoThueBao = 0123456789
--5b
SELECT * from ThongTinKhachHang
WHERE SoCMT = 123456789
--5c
SELECT tttb.SoThueBao from thongTinThueBao as tttb, ThongTinKhachHang as ttkh
WHERE ttkh.IDKhachHang = tttb.IDKhachHang AND ttkh.SoCMT = 123456789
--5d
SELECT * FROM thongTinThueBao
WHERE NgayDangKy = '2012/12/09'
--5e
SELECT * FROM thongTinThueBao as tttb, ThongTinKhachHang as ttkh
WHERE tttb.IDKhachHang = ttkh.IDKhachHang AND ttkh.DiaChi = N'Hà Nội'

--6a
SELECT COUNT(*) N'tổng số khách hàng của công ty' from ThongTinKhachHang
--6b
SELECT COUNT(*) N'tổng số thuê bao của công ty' FROM thongTinThueBao
--6c
SELECT COUNT(*) FROM thongTinThueBao
WHERE NgayDangKy = '2012/12/09'
--6d
SELECT * FROM thongTinThueBao as tttb, ThongTinKhachHang as ttkh
WHERE tttb.IDKhachHang = ttkh.IDKhachHang

--7a
alter table thongTinThueBao 
alter column NgayDangKy date not null
go
--7b
alter table thongTinThueBao 
add CONSTRAINT checkNgayDangKy 
CHECK(NgayDangKy <= GETDATE())
GO
--7c
alter table thongTinThueBao 
add CONSTRAINT checkSoThueBao
CHECK(SoThueBao like ('09%'))
GO

UPDATE thongTinThueBao
SET SoThueBao  like('09%')
go

--7d
ALTER TABLE thongTinThueBao
add SoDiemThuong INT
go

--8a
CREATE INDEX index_tenKhachHang
ON ThongTinKhachHang(TenKhachHang)
go
--8b.1
create VIEW KhachHang
AS
SELECT IDKhachHang, TenKhachHang, DiaChi from ThongTinKhachHang
SELECT * from KhachHang
--8b.2
create VIEW KhachHangThueBao
as
SELECT ttkh.IDKhachHang, ttkh.TenKhachHang, tttb.SoThueBao FROM ThongTinKhachHang as ttkh, thongTinThueBao as tttb
WHERE ttkh.IDKhachHang = tttb.IDKhachHang
SELECT * FROM KhachHangThueBao
--8c.1
CREATE PROC timQuaSoThueBao
@SoThuebao INT
AS
    BEGIN
        SELECT ttkh.IDKhachHang, ttkh.TenKhachHang, ttkh.SoCMT, ttkh.DiaChi FROM thongTinThueBao as tttb, ThongTinKhachHang as ttkh
        WHERE tttb.IDKhachHang = ttkh.IDKhachHang AND tttb.SoThueBao = @SoThuebao
    END
GO

EXEC timQuaSoThueBao 123456757
--8c.2
CREATE PROC timSoTheoTen
@TenKhachHang NVARCHAR(250)
AS
    BEGIN
        SELECT tttb.SoThueBao FROM thongTinThueBao as tttb, ThongTinKhachHang as ttkh
        WHERE tttb.IDKhachHang = ttkh.IDKhachHang AND ttkh.TenKhachHang = @TenKhachHang
    END
GO

EXEC timSoTheoTen N'Nguyễn Nguyệt Nga'
--8c.3
create PROC ThemMoiSoThueBao
    @IDKhachHang VARCHAR(20),
    @SoThueBao INT,
    @LoaiThueBao NVARCHAR(20),
    @NgayDangKy DATE,
    @SoDiemThuong INT
AS 
    BEGIN
        INSERT into thongTinThueBao
        VALUES( @IDKhachHang, @SoThueBao , @LoaiThueBao, @NgayDangKy, @SoDiemThuong);
    END
GO

EXEC ThemMoiSoThueBao 'KH3', 0984328923, N'Trả sau', '2018-09-03', 2

--8c.4
create PROC ThemMoiSoThueBao
    @IDKhachHang VARCHAR(20)
AS 
    BEGIN
        DELETE from thongTinThueBao 
        WHERE IDKhachHang = @IDKhachHang
    END
GO
