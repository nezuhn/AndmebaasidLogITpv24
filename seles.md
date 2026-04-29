## Andmebaas sales
```sql
create database salesRumjantsev;
use salesRumjantsev;
--1.categories
create table categories(
categoryId int primary key identity(1,1),
category_name varchar(25) UNIQUE);

Insert into categories(category_name)
values('Arvuti');
select * from categories;
````
<img width="180" height="76" alt="{44886D60-CAD9-4224-8CE5-F1241AC58BC3}" src="https://github.com/user-attachments/assets/2e248831-8a11-4c3d-8f7a-51470ae1aaeb" />


2. Brands
```
create table brands(
brandId int Primary Key identity(1,1),
brand_name varchar(15) UNIQUE);
Insert into brands(brand_name)
values('Samsung')
select * from brands;
```
<img width="153" height="69" alt="{F64056A2-C4F4-4521-9834-D7682122BEDE}" src="https://github.com/user-attachments/assets/ee569387-b51c-40bf-ba16-c00a0fc02494" />


3.Products
```
Create table products(
productId int primary key identity(1,1),
product_Name varchar(50) not null,
brandId int, 
foreign key (brandId) references brands (brandId),
categoryId int,
foreign key (categoryId) references categories(categoryId),
model_year int,
list_prices money);

INSERT INTO products
values ('Samsung S23', 3, 3, 2025, 720);
select * from products
```
<img width="425" height="73" alt="{42028B24-E519-4AEF-A9F8-78F89D767AB8}" src="https://github.com/user-attachments/assets/e453b50a-0285-413e-a9e2-57ac567ebb2d" />


4.Stores
```
create table stores(
StoreId int primary key identity(1,1),
Store_Name varchar(20) not null,
phone varchar(13),
email varchar(35),
street varchar(35),
city varchar(15),
State_ varchar(10),
zip_code char(5))

insert into stores
values ('apple', '+3725395273', 'apple@support.ee', 'appleStreet5', 'Tallinn', 'harjumaa', '83510')

select * from stores;
```
<img width="601" height="76" alt="{614A1B7F-7BC4-4968-899A-B5E3D7B0DBA4}" src="https://github.com/user-attachments/assets/7fe3960a-99ea-4509-a12d-a08f587e7273" />


5.Stocks
```
create table stocks(
storeId int,
ProductId int,
PRIMARY KEY (storeId, ProductId),
FOREIGN KEY (storeId) references stores(StoreId),
FOREIGN KEY (productId) references products(productId),
quantity int)

insert into stocks
values(3, 3, 2);
select * from stocks;
```
<img width="192" height="76" alt="{93F69D95-6602-4F18-9C77-8A12AF4F1116}" src="https://github.com/user-attachments/assets/4921131b-638b-477a-9412-5d2701a07420" />


6.Customers
```
create table customers(
customerId int primary key identity(1,1),
first_name varchar(10),
last_name varchar(10),
phone varchar(15),
email varchar(20),
street varchar(15),
city varchar(10) check (city='Tallinn' or city='Narva'),
state varchar(15),
zip_code char(5));

select * from customers;

insert into customers
values('Artjom', 'Davunov', '+3725739812', 'd.artjom@gmail.com', 'Taamsare 15', 'Tallinn', 'Harjumaa', '83932') 
```
<img width="690" height="92" alt="{D7E7E6BE-20E3-4C5D-97A6-A56CDD44165A}" src="https://github.com/user-attachments/assets/4f07f5c6-95e9-4db3-b94a-55ee12e79f48" />


7.Staffs
```
create table staff(
staffId int primary key identity(1,1),
first_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(25),
phone varchar(15),
active bit,
storeId int,
foreign key (storeId) references stores(storeId),
manager bit,
);
select * from staff

insert into staff
values('Viktor', 'Verben', 'v.viktor@gmail.com', '+3725999925', 1, 3, 3)
```
<img width="561" height="72" alt="{0AB572FA-AFAC-4092-89C8-8F50E1C1FBA5}" src="https://github.com/user-attachments/assets/16ab2054-c5d9-41ed-b942-85c38329606e" />


8.Orders
```
Create table orders(
orderId int primary key identity(1,1),
customerId int,
order_status varchar(15) check(order_status = 'complete' or order_status ='incomplete'),
order_date date,
required_date date,
shipped_date date, 
storeId int,
staffId int,
foreign key (customerId) references customers(customerId),
foreign key (storeId) references stores(storeId),
foreign key (staffId) references staff(staffId)
);
insert into orders
values(1, 'complete', '2025-01-29', '2025-05-01','2025-06-07', 1, 1);

select * from orders;
```
<img width="547" height="96" alt="{6F4645BA-99DA-4FF9-8699-31250A1F4C64}" src="https://github.com/user-attachments/assets/1c96db94-4827-4dd1-aab2-c3a6bdeba5fe" />


9.Order Items

```
create table order_items(
orderId int,
itemId int, 
primary key (orderId, itemId),
ProductId int,
quantity int,
list_price money,
discount int,
foreign key(orderId) references orders(orderId),
foreign key(productId) references products(productId)
)
select * from order_items
insert into order_items
values(6, 3, 3, 8, 720, 100)
```

<img width="349" height="76" alt="{A741D152-A1CC-4BB7-9A5A-8A6928C0F7F8}" src="https://github.com/user-attachments/assets/f31d9354-d7fe-4589-9827-3d15c89f6e7c" />




<img width="687" height="819" alt="{2E55F0F6-E877-4A72-89CB-54FE76B1B3B3}" src="https://github.com/user-attachments/assets/c51c7b38-5ccf-4b10-89bc-afaa5a9f312c" />
