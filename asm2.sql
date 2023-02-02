create table brands(
	id int primary key identity(1,1),
	name varchar(50) not null unique,
	address varchar(255) not null,
	phone_number varchar(20) not null unique
	);

create table products(
	id int primary key identity(1,1),
	name varchar(50) not null,
	description text,
	unit varchar(20) not null,
	price decimal(12,2) not null check (price >= 0) default 0
	);

create table statistic(
	brand_id int not null foreign key references brands(id),
	product_id int not null foreign key references products(id),
	quantity int not null check (quantity >= 0) default 0
	);

select * from brands;
select * from products;
select * from statistic;

insert into brands(name, address, phone_number)
	values
		('ASUS', 'USA', '983232'),
		('DELL', 'USA', '19001570'),
		('APPLE', 'USA', '985212')
	;

insert into products(name, description, unit, price)
	values
		('MAY TINH T450', 'MAY NHAP CU', 'CHIEC', 1000),
		('DIEN THOAI NOKIA 5670', 'DIEN THOAI DANG HOT', 'CHIEC', 200),
		('MAY IN SAMSUNG 450', 'MAY IN DANG LOAI BINH', 'CHIEC', 100),
		('LAPTOP INSPIRON 5558', 'LAPTOP BAN CHAY', 'CHIEC', 1200),
		('MAN HINH FHD 24IN', 'MAN HINH MOI RA MAT', 'CHIEC', 400),
		('IPHONE 14 PROMAX', 'BEST SALE', 'CHIEC', 1500),
		('AIRPOD PRO', 'HANG MOI VE', 'CHIEC', 250)
	;

insert into statistic(brand_id, product_id, quantity)
	values
		(1, 1, 10),
		(1, 2, 200),
		(1, 3, 10),
		(2, 4, 30),
		(2, 5, 40),
		(3, 6, 100),
		(3, 7, 300)
	;

--cau 4
--Hiển thị tất cả các hãng sản xuất.
select * from brands;
--Hiển thị tất cả các sản phẩm.
select * from products;

--cau 5
--Liệt kê danh sách hãng theo thứ thự ngược với alphabet của tên.
select * from brands order by name desc;
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
select * from products order by price desc;
--Hiển thị thông tin của hãng Asus.
select * from brands where name = 'ASUS';
--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
select * from products where id in(
	select product_id from statistic where quantity < 11
	);
--Liệt kê danh sách sản phẩm của hãng Asus
select * from products where id in (
	select product_id from statistic where brand_id in (
		select id from brands where name = 'ASUS'
		)
	);

--cau 6
--Số hãng sản phẩm mà cửa hàng có.
select count(*) as number_of_brands from brands;
--Số mặt hàng mà cửa hàng bán.
select count(*) as number_of_products from products;
--Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
select brand_id, count(*) as number_product_of_brand from statistic  group by brand_id;
--Tổng số đầu sản phẩm của toàn cửa hàng