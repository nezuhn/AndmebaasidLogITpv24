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
