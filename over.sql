DECLARE @tongsogiaovien int;
DECLARE @tongsophancong int;
SELECT @tongsogiaovien = COUNT(*) FROM GiangVien;
SELECT @tongsophancong = COUNT(distinct(MaGV)) from PhanCong;
IF @tongsogiaovien > @tongsophancong
    PRINT N'chưa phân công hết giáo viên';
ELSE
    print N'Phân công hết giáo viên '


DECLARE @flag INT;
SET @flag = 10;
WHILE (@flag <= 95)
    BEGIN
    IF @flag%2 = 0
    PRINT @flag 
    set @flag = @flag + 1;
    CONTINUE;
    END
GO


SELECT * from SinhVien;
SELECT ROW_NUMBER() over (ORDER by MaSV desc) as STT , * from SinhVien;
SELECT ROW_NUMBER() OVER (partition by GioiTinh 
order by MaSV desc) as STT , * from SinhVien;

SELECT ROW_NUMBER() OVER (partition by DiemThanhPhan.MaMH
ORDER by SinhVien.MaSV DESC) as STT, * from SinhVien join DiemThanhPhan on SinhVien.MaSV = DiemThanhPhan.MaSV 


select *, COUNT(MaSV) OVER (partition by GioiTinh) as TongSo from SinhVien;
SELECT GioiTinh, cout(MaSV) as TongSo from SinhVien GROUP by GioiTinh;

SELECT RANK() OVER (order by SinhVien.GioiTinh desc) as tongSo, * from SinhVien
join DiemThanhPhan on SinhVien.MaSV = DiemThanhPhan.MaSV;