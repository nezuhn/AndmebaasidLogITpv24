## Navigeerimine
[Põhimõisted](README.md) | [Protseduurid](protseduurid.md) | [Kasutajad](kasutajad.md) | [Trigerid](triger.md)
## SQL protseduur -
store procedure - salvestatud protseduurid - sama miis on funktsioonid programmeerimises, mingi tegevus, mis 
on salvestatud andmebaasi, ja mida saab automaatsel teha(INSERT, UPDATE, SELECT, UPDATE).
```SQL
CREATE Procedure lisaKategooria
--parameetrid @...
@uusKategooria varchar(30)
AS
BEGIN
--kirjeldus
	INSERT INTO categories(category_name)
	VALUES(@uusKategooria);
	SELECT * FROM categories;
END;
```
<img width="262" height="164" alt="{F99617AF-CA90-4961-83EE-F7C1220F25C1}" src="https://github.com/user-attachments/assets/ef0a302e-6900-4d9f-96c0-8a0d065d3e04" />

```SQL

--kutse
EXEC lisaKategooria 'Tablet';

-- protseduur, mis kustutab kategooria id järgi
CREATE procedure kustutaKategooria
@kustutaId int
AS
BEGIN
	SELECT * FROM categories;
	DELETE FROM categories WHERE category_id=@kustutaId
	SELECT * FROM categories;
END
--kutse
EXEC kustutaKategooria 1
```
<img width="234" height="241" alt="{209F0FD4-3C48-4499-BFDD-C67CCACDAD19}" src="https://github.com/user-attachments/assets/8d04e4e6-3efe-47e6-92ff-aa69a8b8010b" />

```SQL
--protseduur mis kuvab kategooriad sisestatud esimese tähte järgi
CREATE PROCEDURE otsing1taht
@taht char(1)
AS
BEGIN
	SELECT * FROM categories
	WHERE category_name LIKE @taht + '%'; --% - teised sümboolid  
END

--kutse
EXEC otsing1taht 't';
```
<img width="244" height="203" alt="{E6BBD33B-FB0F-416E-B787-73E613B698E7}" src="https://github.com/user-attachments/assets/99b73fed-5156-4432-b666-a9a8de564fc9" />


```SQL
--brandid
create table brands(
brandId int Primary Key identity(1,1),
brand_name varchar(15) UNIQUE);
Insert into brands(brand_name)
values('Apple')
select * from brands;

--3. products
Create table products(
productId int primary key identity(1,1),
product_Name varchar(50) not null,
brandId int, 
foreign key (brandId) references brands (brandId),
category_Id int,
foreign key (category_Id) references categories(category_Id),
model_year int,
list_prices money);


INSERT INTO products
values ('Samsung S23', 1, 3, 2025, 720);
select * from products

--protseduur, mis kuvab tooded, kus on hind suurem kui sisestatud
create procedure suuremHind
@hind int
AS
BEGIN
	SELECT * FROM  products
	WHERE list_prices > @hind;
END;

--kutse
EXEC suuremHind 700;
```
<img width="454" height="390" alt="{7E3E5FA4-B896-4EEF-8ABB-F205C26741EB}" src="https://github.com/user-attachments/assets/0eb00737-647c-4ded-8431-04e7faa63c0a" />

```SQL
--OUTPUT parameetr
CREATE PROCEDURE minmaxHind
	@minHind MONEY OUTPUT,
	@maxHind MONEY OUTPUT
AS
BEGIN
	SELECT
		@minHind = MIN(list_prices),
		@maxHind = MAX(list_prices)
	FROM products;
END;

--kutse
DECLARE @minHind MONEY, @maxHind MONEY;

EXEC minmaxHind @minHind OUTPUT, @maxHind OUTPUT;

PRINT 'Min hind = ' + CONVERT(varchar, @minHind);
PRINT 'Max hind = ' + CONVERT(varchar, @maxHind);

--6. universaalne protseduur, mis töötab üks kõik millise tabeliga
-- muudab struktuuri(veeru lisamine -ADD, veeru kustutamine -DROP)

CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;

EXEC muudatus 'add', 'categories', 'testVeerg', 'int' 

SELECT * FROM categories;

EXEC muudatus 'drop', 'categories', 'testVeerg'
```
<img width="537" height="326" alt="{195BFD02-55EF-4B0F-85E8-2E3AA80D316D}" src="https://github.com/user-attachments/assets/f633bcdf-4820-437f-8136-a0dd510ff691" />

