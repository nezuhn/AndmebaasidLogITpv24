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
