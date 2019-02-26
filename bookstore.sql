CREATE DATABASE BookStore

use BookStore
go


create table NhaXuatBan
(
    IDNXB VARCHAR(20) PRIMARY key,
    TenNhaXuatBan NVARCHAR(250),
    DiaChiNXB NVARCHAR(250)
)
go

create table Sach
(
    MaSach VARCHAR(20) PRIMARY key,
    TenSach NVARCHAR(250),
    TacGia NVARCHAR(250),
    IDNXB VARCHAR(20) CONSTRAINT FK_NhaXuatBanVsSach foreign key (IDNXB) REFERENCES NhaXuatBan(IDNXB),
    NoiDungTomTat NVARCHAR(1000),
    GiaBan INT,
    SoLuong INT,
    LanXuatBan INT,
    NamXuatBan INT,
)
go

CREATE table LoaiSach
(
MaLoaiSach VARCHAR(20) PRIMARY key,
LoaiSach NVARCHAR(250)
)
go

create table SachVsLoaiSach
(
    MaSach VARCHAR(20) CONSTRAINT FK_SachVsSachVsLoaiSach FOREIGN KEY(MaSach) REFERENCES Sach(MaSach),
    MaLoaiSach VARCHAR(20) CONSTRAINT FK_LoaiSachVsSachVsLoaiSach FOREIGN KEY(MaLoaiSach) REFERENCES LoaiSach(MaLoaiSach),
)
go



INSERT INTO NhaXuatBan
VALUES ('NXB1',N'Tri Thức',N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội' )
go
INSERT INTO NhaXuatBan
VALUES ('NXB2',N'Kim Đồng',N'356 Thanh Xuân, Hà Đông, Hà Nội' )
go
INSERT INTO NhaXuatBan
VALUES ('NXB3',N'Tuổi Trẻ',N'262 Huỳnh Thúc Kháng,Đống Đa, Hà Nội' )
go


INSERT into Sach
VALUES('B001',
N'Trí tuệ Do Thái',
N'Eran Katz','NXB1',
N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốc trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ những bí ẩn về sự thông thái của người Do Thái, của một dân tộc thông tuệ với những phương pháp và kỹ thuật phát triển tầng lớp trí thức đã được giữ kín hàng nghìn năm như một bí ẩn mật mang tính văn hóa.',
 79000,
 100,
 1 ,
2010 )
go
INSERT into Sach
VALUES('B002',
N'Bí Quyết Thành Công Của Henry Ford',
N'Douglas Brinkley',
'NXB1',
N'Cuốn Bí Quyết Thành Công Của Henry Ford nói về hành trình đi đến sự thành công của Henry Ford,
 nhà sáng lập hãng ô tô hàng đầu thể giới có lịch sử hàng trăm năm.Nói đến lịch sử xe hơi là 
 phải nói về Henry Ford – người sáng lập Công ty Ford Motor. Henry Ford được mệnh danh là 
 “ông vua xe hơi” của nước Mỹ.Cuộc cách mạng xe hơi của Ford ảnh hưởng tới kinh tế và xã hội thế kỷ XX: 
 sản xuất theo dây chuyền, tăng lương, giảm giá thành ô tô tác động mạnh mẽ đến đời sống con người mà 
 lịch sử ghi nhận là “Chủ nghĩa Ford”.',
 120000,
 200,
 2 ,
2015 )
go
INSERT into Sach
VALUES('B003',
N'21 Nguyên Tắc Tự Do Tài Chính',
N'Eran Katz','NXB1',
N'Cuốn sách này sẽ cung cấp cho bạn 21 nguyên tắc về tài chính, để từ đó bạn có thể áp dụng chúng vào cuộc sống và trở nên không còn phụ thuốc vào tiền bạc. Ngược lại, chính tiền bạc sẽ phải làm việc cho bản thân bạn.',
 220000,
 100,
 1 ,
2012 )
go
INSERT into Sach
VALUES('B004',
N'Trăm Năm Cô Đơn',
N'Gabriel Garcia Márquez','NXB2',
N'Trăm Năm Cô Đơn vẫn luôn là cuốn tiểu thuyết lớn nhất của Gabriel Garcia Márquez, nhà văn Columbia, người được giải Nobel về văn học năm 1982. Trăm Năm Cô Đơn đã gây dư luận sôi nổi trên văn đàn Mỹ Latinh và lập tức được cả thế giới hâm mộ. Sau gần hai mươi năm, Trăm Năm Cô Đơn đã có mặt ở khắp nơi trên hành tinh chúng ta để đến với mọi người và mọi nhà. Trăm Năm Cô Đơn là lời kêu gọi mọi người hãy sống đúng bản chất người – tổng hòa các mối quan hệ xã hội – của mình, hãy vượt qua mọi định kiến, thành kiến cá nhân, hãy lấp bằng mọi hố ngăn cách cá nhân để cá nhân mình tự hòa đồng với gia đình, với cộng đồng xã hội.',
 189000,
 300,
 1 ,
2016 )
go
INSERT into Sach
VALUES('B005',
N'Sở Lưu Hương Truyền Kỳ',
N' Cổ Long','NXB3',
N'Sở Lưu Hương là người chấn danh thiên hạ, trong giang hồ đầy dẩy những lời đồn về nhân vật này. Mẫu hình nhân vật này là một người đàn ông trong mơ tưởng của các phụ nữ, anh ta là đạo soái, đẹp trai, có tánh phong lưu, thích mạo hiểm, thich hưởng thụ, thích cấp thời hành lạc, không bị danh lợi bó buộc, chỉ làm những gì mình thích và không ai có thể cưỡng bức anh ta. Có thể nói Sở Lưu Hương là một nhân vật vô tiền khoáng hậu ở điểm anh ta không bao giờ giết người. Sở Lưu Hương tuy thân tại giang hồ, nhưng lại có tín niệm vào sự trang nghiêm của luật pháp. Sở Lưu Hương cho rằng mạng người không thể do cá nhân tuỳ tiện quyết định sống chết mà buộc phải có một hệ thống nghiêm cẩn quyết định. Sở Lưu Hương cũng đại diện cho hình tượng hiệp đạo lịch lãm cao nhã. Anh ta cho rằng tôn trọng người khác trước hết phải tôn trọng bản thân mình. Vì vậy khác với những nhân vật giang hồ phong trần, Sở Lưu Hương rất coi trọng ăn mặc và phong thái.',
 89000,
 100,
 2 ,
2014 )
go
INSERT into Sach
VALUES('B006',
N'Code Dạo Ký Sự – Lập Trình Viên Đâu Phải Chỉ Biết Code',
N'Phạm Huy Hoàng','NXB3',
N'Hiện nay, ngành IT nói chung và lập trình nói riêng đang trở thành một ngành hot, được khá nhiều bạn học lựa chọn. Tuy nhiên, các bạn sinh viên Việt Nam chịu khá nhiều thiệt thòi vì thiếu những tấm gương và tài liệu để học hỏi. Thuở còn là sinh viên, mình từng có những thắc mắc, trăn trở về technical, về con đường nghề nghiệp, nhưng không có ai giải đáp. Lập trình viên cần học rất nhiều, không sách nào nói về cách tự học cho hiệu quả. Lập trình viên cần biết cách giao tiếp, làm việc nhóm, nhưng ít thầy cô nói cho các bạn biết điều này.  Lập trình viên cần giỏi tiếng Anh, nhưng hầu như đi làm rồi các bạn mới tự nhận ra.',
 99000,
 100,
 1 ,
2017 )
GO


INSERT into LoaiSach
VALUES('KHKT',N'Khoa học - Kỹ thuật')
go
INSERT into LoaiSach
VALUES('VH',N'Văn học')
go
INSERT into LoaiSach
VALUES('KTQL',N'Kinh tế - Quản lý')
go
INSERT into LoaiSach
VALUES('KHXH',N'Khoa học xã hội')
go
INSERT into LoaiSach
VALUES('TH',N'Toán Học')
go
INSERT into LoaiSach
VALUES('HH',N'Hoá Học')
go
INSERT into LoaiSach
VALUES('NN',N'Ngoại Ngữ')
go

INSERT into SachVsLoaiSach
VALUES('B001','KHXH')
GO
INSERT into SachVsLoaiSach
VALUES('B002','KTQL')
GO
INSERT into SachVsLoaiSach
VALUES('B003','KTQL')
GO
INSERT into SachVsLoaiSach
VALUES('B004','VH')
GO
INSERT into SachVsLoaiSach
VALUES('B005','VH')
GO
INSERT into SachVsLoaiSach
VALUES('B006','KHKT')
GO



--<==================================> query <================================================>
--3
SELECT * from Sach
WHERE NamXuatBan >= 2008 AND NamXuatBan <= 2019
--4
SELECT top 10 * FROM Sach
ORDER BY GiaBan desc;
--5
SELECT * FROM Sach
WHERE TenSach like'%tin học%'
--6
SELECT * from Sach
WHERE TenSach like 'T%'
order by TenSach DESC;
--7
SELECT * from Sach as s, NhaXuatBan as nxb
WHERE s.IDNXB = nxb.IDNXB AND nxb.TenNhaXuatBan = N'Tri Thức';
--8
SELECT nxb.IDNXB, nxb.TenNhaXuatBan, nxb.DiaChiNXB from Sach as s, NhaXuatBan as nxb
WHERE s.IDNXB = nxb.IDNXB and s.TenSach = N'Trí tuệ Do Thái';
--9
SELECT s.MaSach, s.TenSach, s.NamXuatBan, nxb.TenNhaXuatBan, ls.LoaiSach from Sach as s, NhaXuatBan as nxb, SachVsLoaiSach as sls, LoaiSach as ls
WHERE s.IDNXB = nxb.IDNXB and s.MaSach = sls.MaSach AND ls.MaLoaiSach = sls.MaLoaiSach
--10
SELECT top 1 * from Sach
ORDER BY GiaBan DESC;
--11
SELECT top 1 * FROM Sach
ORDER by SoLuong DESC;
--12
SELECT * FROM Sach
WHERE TacGia = N'Eran Katz';
--13
UPDATE Sach
set GiaBan = GiaBan - ((GiaBan*10)/100)
--14
SELECT sum(SoLuong) N'Số sách xuất bản' , Sach.IDNXB FROM Sach 
GROUP by Sach.IDNXB
--15
SELECT sum(s.SoLuong) N'số đầu sách', sls.MaLoaiSach FROM Sach as s, SachVsLoaiSach as sls
WHERE s.MaSach = sls.MaSach 
GROUP BY sls.MaLoaiSach
--16
CREATE INDEX index_TenSach
ON Sach (TenSach);
--17
create VIEW viewSach
as
    select s.MaSach, s.TenSach, nxb.TenNhaXuatBan, s.TacGia, s.GiaBan from Sach as s, NhaXuatBan as nxb
    WHERE s.IDNXB = nxb.IDNXB;
SELECT * FROM viewSach
--18.1
create PROC ThemSach 
    @MaSach VARCHAR(20),
    @TenSach NVARCHAR(250),
    @TacGia NVARCHAR(250),
    @IDNXB VARCHAR(20) ,
    @NoiDungTomTat NVARCHAR(1000),
    @GiaBan INT,
    @SoLuong INT,
    @LanXuatBan INT,
    @NamXuatBan INT
AS
BEGIN
    INSERT into Sach
    VALUEs(@MaSach, @TenSach, @TacGia, @IDNXB, @NoiDungTomTat, @GiaBan, @SoLuong, @LanXuatBan, @NamXuatBan)
END
GO

EXEC ThemSach 'B007',  N'Bảo Mật Nhập Môn', N'Phạm Huy Hoàng', 'NXB2', N'Bảo Mật Nhập Môn của chủ blog Tôi Đi Code Dạo – Phạm Huy Hoàng sẽ magn đến những kiến thức vô cùng cơ bản về bảo mật mà developer nào cũng cần phải biết để bảo vệ website.', 99000, 50 , 1, 2016;

--18.2
CREATE PROC TimSach 
@Key NVARCHAR(200)
as
    SELECT * FROM Sach
    WHERE TenSach like N'%@key%'

EXEC TimSach Tin;

--18.3


--19
CREATE trigger KhongXoa
on Sach
for DELETE
AS
    BEGIN 
        DECLARE @a INT
        select @a = SoLuong from Sach 

        if(@a > 0)
        BEGIN
        PRINT N'không xoá được sách khi số lượng > 0'
        ROLLBACK TRANSACTION
        END
    END;

DELETE from Sach WHERE TenSach = N'Bảo Mật Nhập Môn';

--20


