Create database trigerArs;
USE trigerArs;

Create table linnad(
linnID int PRIMARY KEY IDENTITY (1,1),
linnanimi varchar(15) NOT NULL,
rahvaarv int);

insert into linnad
values('Tapa', '5500')

delete from linnad where linnId='5'
select * from linnad
select * from logi
 
Create table logi(
id int PRIMARY KEY IDENTITY (1,1),
aeg DATETIME,
toiming  varchar(100),
andmed TEXT)

CREATE TRIGGER linnaLisamine
ON linnad --tabelinimi, mis on vaja jälgida
FOR INSERT
AS
INSERT INTO logi(aeg, toiming, andmed)
SELECT
GETDATE(),  --aeg
'on tehtud INSERT käsk',  --toiming
inserted.linnanimi  --andmed
FROM inserted;

INSERT INTO linnad(linnanimi, rahvaarv)
VALUES ('Jõhvi', 11000);
SELECT * FROM linnad;
SELECT * FROM logi;
