create table customers(
	id int primary key identity(1,1),
	name varchar(30) not null,
	id_card_number varchar(20) not null unique,
	address varchar(100) not null 
	);
create table tel_info(
	number varchar(20) primary key,
	type varchar(30) not null,
	regis_date datetime not null check (regis_date <= getdate()),
	customer_id int foreign key references customers(id)
	);

select * from customers;
select * from tel_info;

insert into customers(name, id_card_number, address)
	values 
		('NGUYEN NGUYET NGA', '012345678', 'THANH XUAN, HA NOI'),
		('TRAN VAN AN', '113485165', 'HOAN KIEM, HA NOI'),
		('NGUYEN VAN NAM', '017092012', 'CAU GIAY, HA NOI')
	;
insert into tel_info(number, type, regis_date, customer_id)
	values
		('0985821764', 'TRA TRUOC', '2012-12-02', 1),
		('0888999123', 'TRA TRUOC', '2017-02-02', 1),
		('0988888888', 'TRA SAU', '2018-08-08', 2),
		('0987456446', 'TRA TRUOC', '2015-08-30', 3),
		('0555065066', 'TRA SAU', '2011-10-09', 3)
	;

--CAU 4
--Hiển thị toàn bộ thông tin của các khách hàng của công ty.
select * from customers
--Hiển thị toàn bộ thông tin của các số thuê bao của công ty.select * from tel_info--CAU 5--Hiển thị toàn bộ thông tin của thuê bao có số: 0988888888
select * from tel_info where number = '0988888888';
--Hiển thị thông tin về khách hàng có số CMTND: 123456789
select * from customers where id_card_number = '012345678';
--Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
select number from tel_info where customer_id in(
	select id from customers where id_card_number = '012345678');
--Liệt kê các thuê bao đăng ký vào ngày 12/12/09
select * from tel_info where regis_date = '2012-12-02';
--Liệt kê các thuê bao có địa chỉ tại Hà Nội
select * from tel_info where customer_id in(
	select id from customers where address = 'THANH XUAN, HA NOI');
--CAU 6
--Tổng số khách hàng của công ty.
--Tổng số thuê bao của công ty.
--Tổng số thuê bào đăng ký ngày 12/12/09.
--Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.

--CAU 7
--Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
--Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.
--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
--Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.--CAU 8--Viết các View sau:
--View_KhachHang: Hiển thị các thông tin Mã khách hàng, Tên khách hàng, địa chỉ
create view view_customers as
	select id, name, address from customers;
select * from view_customers;
--View_KhachHang_ThueBao: Hiển thị thông tin Mã khách hàng, Tên khách hàng, Số thuê baocreate view view_customer_tel as	select A.customer_id, B.name as customer_name, A.number from tel_info A 		inner join customers B on A.customer_id = B.id;select * from view_customer_tel order by customer_id asc;