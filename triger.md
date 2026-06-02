## Trigger - päästik
### SQL triggerid on spetsiaalsed andmebaasi objektid, mis käivituvad automaatselt, kui toimub teatud sündmus (nt INSERT, UPDATE või DELETE).
```SQL
CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(aeg, kasutaja, toiming, andmed)
SELECT
GETDATE(),  --aeg
SYSTEM_USER, --kasutaja mis on sisse logitud serverisse
'on tehtud INSERT käsk',  --toiming
concat('linn: ', inserted.linnanimi, 'rahvaarv: ', inserted.rahvaarv)  --andmed tabelist linnad
FROM inserted;

```
<img width="594" height="363" alt="pilt" src="https://github.com/user-attachments/assets/29bd419f-88f5-4269-9c85-70f7ab759adc" />

```sql
--DELETE triger
CREATE TRIGGER linnakustutamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR DELETE
AS
INSERT INTO logi(aeg, kasutaja, toiming, andmed)
SELECT
GETDATE(),  --aeg
SYSTEM_USER, --kasutaja mis on sisse logitud serverisse
'on tehtud DELETE käsk',  --toiming
concat('linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv)  --andmed tabelist linnad
FROM deleted;

--drop trigger ..
disable trigger linnaKustutamine on linnad;
ENABLE trigger linnaKustutamine on linnad;

--delete trigeri kontroll
DELETE from linnad where linnID=3;
```
<img width="646" height="526" alt="{C0616DFA-BACE-4C68-8F47-01142CFCC28B}" src="https://github.com/user-attachments/assets/a295398c-60f9-41a5-8530-c023205b25c5" />


```SQL
--Update triger 
CREATE TRIGGER linnaUuendamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR update
AS
INSERT INTO logi(aeg, kasutaja, toiming, andmed)
SELECT
GETDATE(),  --aeg
SYSTEM_USER, --kasutaja mis on sisse logitud serverisse
'on tehtud UPDATE käsk',  --toiming
concat('vanad andmed - linn: ', deleted.linnanimi, ' rahvaarv: ', deleted.rahvaarv,
' uued andmed -linn:', inserted.linnanimi, ', rahvaarv -', inserted.rahvaarv)  --andmed tabelist linnad
FROM deleted inner join inserted
on deleted.linnID=inserted.linnID;

--update kontroll
update linnad SET linnanimi='Pärnu2', rahvaarv=0 where linnanimi='Pärnu';
```
<img width="883" height="706" alt="{B9D1E5E3-21E6-4606-9B5F-9CDF74FBC33B}" src="https://github.com/user-attachments/assets/5ce795b6-abb1-4fef-b78f-95b459497934" />


## Kasutaja 'SekretaarArseni' already added
```SQL
GRANT select, insert, delete on linnad TO sekretaarArseni;
DENY select, delete on logi to sekretaarArseni;
```
<img width="858" height="346" alt="{699F71B7-B298-4A3F-A732-0AEA20C96DE7}" src="https://github.com/user-attachments/assets/490bc69b-1e3b-4d2c-b599-00ec9183ecac" />
<img width="379" height="190" alt="{5077A523-6C30-4ECF-BB2B-3B4F03CF3855}" src="https://github.com/user-attachments/assets/393853bd-f6ef-4f2e-91e7-28c6b31a8dc6" />
