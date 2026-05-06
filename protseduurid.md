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
