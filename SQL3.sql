create table STAFF(
	ResPs nvarchar(50),
	ResPsId int primary key
)

create table Product(
	ProductId nvarchar(100),
	ProductPro date,
	ProductType ntext,
	ProductTypeId nvarchar(10),
	ResPsId int foreign key references STAFF(ResPsId)
)
insert into STAFF(ResPs,ResPsId)
values(N'Nguyen Van An','987688')



alter table Product
add unique (ProductId)

insert into Product(ProductId,ProductPro,ProductType,ProductTypeId,ResPsId)
values(N'Z37 111111','2009-12-12',N'Máy tính sách tay Z37',N'Z37E','987688')

alter table Product
alter column ProductType nvarchar(100)

select ProductType from Product
select ProductId from Product
select ResPs from STAFF
select ProductType from Product order by ProductType asc
select ResPs from STAFF order by ResPs asc

select ProductId from Product where ProductTypeId = 'Z37E'
select ProductId from Product where ResPsId in(select ResPsId from STAFF where ResPs = 'Nguyen Van An') order by ProductId asc

select avg(count(*)) from Product where ProductTypeId = 'Z37E'
select avg(ProductTypeId) from Product where ProductTypeId = 'Z37E'

select ProductTypeId, ProductType from Product

select * from Product
select ProductType, ProductId, ResPs 
from Product left join STAFF on Product.ResPsId = STAFF.ResPsId

alter table Product
add check(ProductPro <= GETDATE()) 

alter table Product
add Ver nvarchar(50)

create index ResPs_index on STAFF(ResPs)

create view View_SanPham as select Product.ProductId, Product.ProductPro,Product.ProductType from Product

create view View_SanPham_NCTN as select Product.ProductId,Product.ProductPro,STAFF.ResPs
from Product
left join STAFF on STAFF.ResPsId = Product.ResPsId

create view View_Top_SanPham as select top 5 Product.ProductId,Product.ProductPro,Product.ProductType
from Product order by ProductPro Desc