create table Person(
	FullName nvarchar(150),
	Adr ntext,
	BirthD date,
	PersonId int identity(1,1) primary key
)

create table Tel(
	PhoneNumber char(20) unique,
	PersonId int foreign key references Person(PersonId)
)

insert into Person(FullName,Adr,BirthD)
values(N'Nguyen Van An',N'111 Nguyen Trai, Thanh Xuan, Ha Noi','1987-11-18'),
(N'Nguyen Tuan Linh',N'102 Nguyen Trai, Thanh Xuan, Ha Noi','1995-11-12'),
(N'Nguyen Tuan Anh',N'12 Dong Da, Ha Noi','1982-11-20'),
(N'Tran Nhat Khue',N'111 Nguyen Trai, Lang Thuong, Ha Noi','1987-05-28'),
(N'Hoang Xuan Quynh',N'111 Hoang Dieu, Dong Da, Ha Noi','1995-03-28'),
(N'Le nguyen Khanh',N'111 Lang Ha, Ba Dinh, Ha Noi','1987-09-15'),
(N'Dinh Van Quy',N'111 Nguyen Trai, Dong Da, Ha Noi','1995-09-15'),
(N'Vo Xuan Anh',N'111 Nguyen Trai, Thanh Xuan, Ha Noi','1987-01-03'),
(N'Nguyen Kim Dung',N'111 Nguyen Trai, Dong Da, Ha Noi','1996-01-03')
select * from Person

insert into Tel(PhoneNumber,PersonId)
values('09833454','2'),
('098343653','2'),
('987654329','3'),
('09434348','4'),
('09434342','4'),
('09424348','5'),
('09434328','6'),
('09454348','7'),
('09436348','8'),
('09431348','9')



select * from Tel

select * from Person order by FullName asc

select * from Tel where PersonId in(select PersonId from Person where FullName = 'Nguyen Van An')

select Tel.PhoneNumber, Person.FullName
from Tel
inner join Person on Person.PersonId = Tel.PersonId

select * from Person where BirthD ='2009-12-12'

alter table Tel
add cnt int

select count(*) from Tel where PersonId = '1'
select count(*) from Tel where PersonId = '2'
select count(*) from Tel where PersonId = '3'
select count(*) from Tel where PersonId = '4'
select count(*) from Tel where PersonId = '5'
select count(*) from Tel where PersonId = '6'
select count(*) from Tel where PersonId = '7'
select count(*) from Tel where PersonId = '8'
select count(*) from Tel where PersonId = '9'

select count(*) from Person where BirthD like '%-12-%'

select * from Person 
left join Tel on Tel.PersonId = Person.PersonId

select * from Person 
where PersonId in (select PersonId from Tel where PhoneNumber = '123456789')

alter table Person
add check(BirthD<GETDATE())

alter table Tel
add BeginDate date

create index IX_HoTen on Person(FullName)
create clustered index IX_SoDienThoai on Tel(PhoneNumber)

create view View_SoDienThoai as
select Person.FullName, Tel.PhoneNumber
from Person 
left join
Tel on Person.PersonId = Tel.PersonId

create view View_SinhNhat as
select Person.FullName,Person.BirthD, Tel.PhoneNumber
from Person
left join
Tel on Person.PersonId = Tel.PersonId


create procedure SP_Them_DanhBa @ten nvarchar(150),@dc ntext, @ns date
as
insert into Person(FullName,Adr,BirthD)
values(@ten,@dc,@ns)
select * from Person

exec SP_Them_DanhBa @ten = N'Nguyen Tuan Linh',@dc=N'Phao Dai Lang', @ns = '1995-12-28'


create procedure SP_Tim_DanhBa @name varchar(150)
as