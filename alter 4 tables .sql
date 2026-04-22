
USE LOGITPV24baas;
--category table
CREATE TABLE Category(
idCategory int PRIMARY KEY IDENTITY(1,1),
Category_name VARCHAR(15));
--4to budet v kategorii
INSERT INTO Category
values( 'piima');
ALTER TABLE category ADD CONSTRAINT Category_Name UNIQUE (Category_Name)

--product table
CREATE TABLE Product(
idProduct int PRIMARY KEY IDENTITY(1,1),
Name varchar(15) not null,
idCategory int, FOREIGN KEY (IdCategory) REFERENCES Category (idCategory),
Price money)
--vastavit nashi znacheniya v tablicu
INSERT INTO Product
values( 'vahukoor', 1, 2);
--tablica sale
CREATE TABLE sale(
idSale int PRIMARY KEY IDENTITY (1,1),
idProduct int not null,
idCustomer int not null,
FOREIGN KEY (idProduct) REFERENCES Product(idProduct),
Count int,
date_of_sale date,) 
--soderzhimoe 'sale' tablicq
CREATE TABLE customer(
idCustomer int PRIMARY KEY identity(1,1),
Name varchar(100) not null,
Contact varchar(100))
ALTER TABLE Sale ADD CONSTRAINT fk_sale
FOREIGN KEY (idCustomer) REFERENCES CUSTOMER(idCustomer);

INSERT INTO sale
values ('mööbel' );

INSERT INTO Customer
VALUES ('Katja', '5234 1239')

INSERT INTO Sale
VALUES (2, 1, 10, '2006-10-10')


select * from Category;
select * from Product;
select * from Sale;
select * from customer;
