create table suppliers(
	id varchar(10) primary key,
	name varchar(255) not null unique,
	address varchar(255) not null,
	phone_number varchar(20) not null unique,
	tax_code varchar(30) not null unique
);
create table services(
	id varchar(10) primary key,
	name varchar(255) not null
);
create table charges(
	id varchar(10) primary key,
	price decimal(12,4) not null check (price >= 0) default 0,
	description varchar(255) not null
);
create table vehicles(
	name varchar(30) primary key,
	brand varchar(30) not null,
	seat int not null
);
create table requests(
	id varchar(10) primary key,
	suppier_id varchar(10) not null foreign key references suppliers(id),
	service_id varchar (10) not null foreign key references services(id),
	vehicle_type varchar(30) not null foreign key references vehicles(name),
	charge_id varchar(10) not null foreign key references charges(id),
	start_date datetime not null,
	end_date datetime not null,
	quantity int not null check(quantity > 0)
);

insert into suppliers(id, name, address, phone_number, tax_code)
values 
	('NCC001', 'CTY TNHH TOAN PHAT', 'HAI CHAU', '05113999888', '568941'),
	('NCC002', 'CTY CO PHAN DONG DU', 'LIEN CHIEU', '05113999889', '456789'),
	('NCC003', 'ONG NGUYEN VAN A', 'HOA THUAN', '05113999890', '321456'),
	('NCC004', 'CTY CO PHAN TOAN CAU XANH', 'HAI CHAU', '05113658945', '513364'),
	('NCC005', 'CTY TNHH AMA', 'THANH KHE', '05113875466', '546546'),
	('NCC006', 'BA TRAN THI BICH VAN', 'LIEN CHIEU', '05113587469', '524545'),
	('NCC007', 'CTY TNHH PHAN THANH', 'THANH KHE', '05113987456', '113021'),
	('NCC008', 'ONG PHAN DINH NAM', 'HOA THUAN', '05113532456', '121230'),
	('NCC009', 'TAP DOAN DONG NAM A', 'LIEN CHIEU', '05113987121', '533654'),
	('NCC010', 'CTY CP PHAN RANG DONG', 'LIEN CHIEU', '05113569654', '187864')
	;
select * from suppliers

insert into services(id, name)
values
	('DV01', 'DICH VU XE TAXI'),
	('DV02', 'DICH VU XE BUS CONG CONG THEO TUYEN CO DINH'),
	('DV03', 'DICH VU CHO THUE XE THEO HOP DONG')
	;
select * from services

insert into vehicles(name, brand, seat)
values
	('HIACE', 'TOYOTA', 16),
	('VIOS', 'TOYOTA', 5),
	('ESCAPE', 'FORD', 5),
	('CERATO', 'KIA', 7),
	('FORTE', 'KIA', 5),
	('STAREX', 'HYUNDAI', 7),
	('GRAND-I10', 'HYUNDAI', 7)
	;
select * from vehicles

insert into charges(id, price, description)
values
	('MP01', 10000, 'AP DUNG TU 1/2015'),
	('MP02', 15000, 'AP DUNG TU 2/2015'),
	('MP03', 20000, 'AP DUNG TU 1/2010'),
	('MP04', 25000, 'AP DUNG TU 2/2011')
	;
select * from charges

insert into requests(id, suppier_id, service_id, vehicle_type, charge_id, start_date, end_date, quantity)
values
	('DK001', 'NCC001', 'DV01', 'HIACE', 'MP01', '2015-11-20', '2016-11-20', 4),
	('DK002', 'NCC002', 'DV02', 'VIOS', 'MP02', '2015-11-20', '2017-11-20', 3),
	('DK003', 'NCC003', 'DV03', 'ESCAPE', 'MP03', '2017-11-20', '2018-11-20', 5),
	('DK004', 'NCC005', 'DV01', 'CERATO', 'MP04', '2015-11-20', '2019-11-20', 7),
	('DK005', 'NCC002', 'DV02', 'FORTE', 'MP03', '2019-11-20', '2020-11-20', 1),
	('DK006', 'NCC004', 'DV03', 'STAREX', 'MP04', '2016-11-10', '2021-11-20', 2),
	('DK007', 'NCC005', 'DV01', 'CERATO', 'MP03', '2015-11-30', '2016-01-25', 8),
	('DK008', 'NCC006', 'DV01', 'VIOS', 'MP02', '2016-02-28', '2016-08-15', 9),
	('DK009', 'NCC005', 'DV03', 'GRAND-I10', 'MP02', '2016-04-27', '2017-04-30', 10),
	('DK010', 'NCC006', 'DV01', 'FORTE', 'MP02', '2015-11-21', '2016-02-22', 4),
	('DK011', 'NCC007', 'DV01', 'FORTE', 'MP01', '2016-12-25', '2017-02-20', 5),
	('DK012', 'NCC007', 'DV03', 'CERATO', 'MP01', '2016-04-14', '2017-12-20', 6),
	('DK013', 'NCC003', 'DV02', 'CERATO', 'MP01', '2015-12-21', '2016-12-21', 8),
	('DK014', 'NCC008', 'DV02', 'CERATO', 'MP01', '2016-05-20', '2016-12-30', 1),
	('DK015', 'NCC003', 'DV01', 'HIACE', 'MP02', '2018-04-24', '2019-11-20', 6),
	('DK016', 'NCC001', 'DV03', 'GRAND-I10', 'MP02', '2016-06-22', '2016-12-21', 8),
	('DK017', 'NCC002', 'DV03', 'CERATO', 'MP03', '2016-09-30', '2019-09-30', 4),
	('DK018', 'NCC008', 'DV03', 'ESCAPE', 'MP04', '2017-12-13', '2018-09-30', 2),
	('DK019', 'NCC003', 'DV03', 'ESCAPE', 'MP03', '2016-01-24', '2016-12-30', 8),
	('DK020', 'NCC002', 'DV03', 'CERATO', 'MP04', '2016-05-03', '2017-10-21', 7),
	('DK021', 'NCC006', 'DV01', 'FORTE', 'MP02', '2015-01-30', '2016-12-30', 9),
	('DK022', 'NCC002', 'DV02', 'CERATO', 'MP04', '2016-07-25', '2017-12-30', 6),
	('DK023', 'NCC002', 'DV01', 'FORTE', 'MP03', '2017-11-30', '2018-05-20', 5),
	('DK024', 'NCC003', 'DV03', 'FORTE', 'MP04', '2017-12-23', '2019-11-30', 8),
	('DK025', 'NCC003', 'DV03', 'HIACE', 'MP02', '2016-08-24', '2017-10-25', 1)
	;
select * from requests

-- cau 3: nhung dong xe co hon 5 cho ngoi
select * from vehicles where seat > 5;

--cau 4: Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp những dòng xe
--thuộc hãng xe “Toyota” với mức phí có đơn giá là 15.000 VNĐ/km 
--hoặc những dòng xe thuộc hãng xe “KIA” với mức phí có đơn giá là 20.000 VNĐ/km
select * from suppliers where id in (
	select suppier_id from requests where 
		vehicle_type in (select name from vehicles where brand = 'TOYOTA')
		and charge_id in 
			(select id from charges where price = 15000)
	)
	or id in(
	select suppier_id from requests where 
		vehicle_type in (select name from vehicles where brand = 'KIA')
		and charge_id in 
			(select id from charges where price = 20000)
	);

-- cau 5: 
--Liệt kê thông tin toàn bộ nhà cung cấp được sắp xếp tăng dần theo tên nhà cung cấp và giảm dần theo mã số thuế

select * from suppliers order by name asc; 
select * from suppliers order by tax_code desc; 

-- cau 6:
--Đếm số lần đăng ký cung cấp phương tiện tương ứng cho từng nhà cung cấp với yêu cầu chỉ đếm cho những nhà cung cấp thực 
--hiện đăng ký cung cấp có ngày bắt đầu cung cấp là “20/11/2015”
select suppier_id, count(*) as request_time from requests where start_date = '2015-11-20'
	group by suppier_id;

--cau 7:
--Liệt kê tên của toàn bộ các hãng xe có trong cơ sở dữ liệu với yêu cầu mỗi hãng xe chỉ được liệt kê một lần
select brand from vehicles group by brand;

-- cau 8:
--Liệt kê MaDKCC, MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia, HangXe, NgayBatDauCC, NgayKetThucCC của tất cả các lần đăng ký cung cấp phương
--tiện với yêu cầu những nhà cung cấp nào chưa từng thực hiện đăng ký cung cấp phương tiện thì cũng liệt kê thông tin những nhà cung cấp đó ra


--cau 9:
-- Liệt kê thông tin của các nhà cung cấp đã từng đăng ký cung cấp phương tiện thuộc dòng xe “Hiace” hoặc từng đăng ký cung cấp phương tiện thuộc dòng xe “Cerato”
select * from suppliers where id in(
	select suppier_id from requests where vehicle_type in 
		('HIACE', 'CERATO')
	);

--cau 10:
--Liệt kê thông tin của các nhà cung cấp chưa từng thực hiện đăng ký cung cấp phương tiện lần nào cả
select * from suppliers where id not in(
	select suppier_id from requests
	);