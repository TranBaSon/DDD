create DATABASE ChuongTrinhhoc
GO
use ChuongTrinhhoc
go
create TABLE LopVaChuongTrinhVaLichHoc
(
    TenLop NVARCHAR(20) NOT NULL,
    MaLop VARCHAR(20) NOT NULL CONSTRAINT PK_LopVaChuongTrinhVaLichHoc PRIMARY KEY ,
    TenCT NVARCHAR(30) NOT NULL,
    MaCT VARCHAR(20) NOT NULL,
    PhongHoc NVARCHAR(20) NOT NULL,
    BuoiHoc NVARCHAR(10) NOT NULL
)
go 
CREATE TABLE GiaoVien
(
    MaGV VARCHAR(20) CONSTRAINT PK_GiaoVien PRIMARY KEY ,
    TenGV NVARCHAR(50) NOT NULL,
    MaLop VARCHAR(20) NOT NULL CONSTRAINT FK_GiaoVienVSLopVaChuongTrinhVaLichHoc FOREIGN KEY (MaLop) REFERENCES LopVaChuongTrinhVaLichHoc(MaLop)
)
go

CREATE table SinhVien
(
    TenSV NVARCHAR(50) CONSTRAINT PK_SinhVien PRIMARY KEY ,
    MaSV VARCHAR(20) NOT NULL,
    MaLop VARCHAR(20) NOT NULL CONSTRAINT FK_SinhVienVSLopVaChuongTrinhVaLichHoc FOREIGN KEY(MaLop) REFERENCES LopVaChuongTrinhVaLichHoc(MaLop),
    GioiTinh NVARCHAR(30) NOT NULL CHECK (GioiTinh = "Nam" or GioiTinh = "Nu" or GioiTinh = "khong xac dinh" ),
    NgaySinh DATETIME NOT NULL CHECK (year(NgaySinh)< 2001)
)
go