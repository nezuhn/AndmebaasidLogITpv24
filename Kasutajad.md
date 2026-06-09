## Navigeerimine
[Põhimõisted](README.md) | [Protseduurid](protseduurid.md) | [Kasutajad](Kasutajad.md) | [Trigerid](triger.md) |[Sales](Sales.md)

## SQL Server kasutajate authenticated 

Authemtimine 

1.Windows Authentication Selle puhul kasutatakse samu kasutajaadnmeid, millega logitakse sisse windows operatsioonisüsteemi

2.SQl Server authentication

Näide Kasutajast: DirectorArseni. Parool:1234Qwer

## Kasutaja loomine SQL Serveris

1.Serveritaseme kasutaja loomine Sammud Ava:
Security -> Logins Tee paremklikk ja vali: New Login

<img width="701" height="654" alt="{1A22848D-400B-4A75-B378-50CABB46E796}" src="https://github.com/user-attachments/assets/7defc9d4-197f-4755-a0b8-828b883c680b" />

Tavaliselt piisab rooli public
<img width="700" height="654" alt="{0BC64206-6D8E-482E-97A7-15C9DF81B785}" src="https://github.com/user-attachments/assets/43b10816-47fc-41de-97ee-64929a0da138" />

```SQL
--GRANT -õiguste määramine
--DENY -õiguste keelamine
--anname kasutajale õigus vaadata tabelit(SELECT), 
--lisada andmeid (INSERT)ning uuendada neid (update)
grant select on opilane to directorArseni2;
grant insert on opilane to directorArseni2;
grant update on opilane to directorArseni2;

deny delete on opilane to directorArseni2;
```
Kasutaja õiguste kontroll
1.tuleb sisselogida kasutajana directorArseni2 Connect -> Database Engine

<img width="470" height="506" alt="{1928574D-118F-481A-9583-72E30BACD3AA}" src="https://github.com/user-attachments/assets/995ac342-3589-4ff9-a290-8a51475a8e98" />

2.kontrollime  tegevus mis ei ole luubatud 
<img width="775" height="589" alt="{4CCDDCBD-5167-4070-8872-83677D0C9632}" src="https://github.com/user-attachments/assets/f46f899b-ef69-4198-9a74-fef34a3c9999" />
<img width="1067" height="655" alt="{9C84057A-23B1-4791-B169-BDC5FC3E64A4}" src="https://github.com/user-attachments/assets/49edfaac-8d99-40ec-985e-78f655b031b3" />
<img width="706" height="708" alt="{F1622FBB-C0FE-4216-8DA7-B2FF0A7EE1AF}" src="https://github.com/user-attachments/assets/e744d119-f484-45ab-8fea-efbbce62bf14" />

```SQL
--ülesanne 1
create database MovieBaseArs;
use MovieBaseArs;
--table movies
create table movies(
movieID int primary key identity(1,1),
movieName varchar(40) not null,
movieYear int not null,
movieDir varchar(25),
movieCost money)

insert into movies
values('Inception', 2010, 'Christopher Nolan', 10)

create table guest(
guestId int primary key identity(1,1),
guestName varchar(25))

insert into guest 
values ('Roman Feofilov')

grant select on movies to Producer;
grant select on movies to Producer;
grant insert on movies to Producer;
grant insert on movies to Producer;
grant insert on guest to Producer;
grant select on guest to Producer;
grant update on movies to Producer;
GRANT UPDATE (movieCost, movieDir) ON movies TO Producer;

select * from movies
select * from guest
```
<img width="547" height="638" alt="{927D045B-FEBD-4768-A914-E340E9181876}" src="https://github.com/user-attachments/assets/85aeaacf-c28c-440b-8c0c-1dfdc83f1eee" />
Kasutaja, Producer, saab muutis pileti hinda.

<img width="515" height="472" alt="{149DEEC9-E4C1-41B0-85DD-6656E57607C8}" src="https://github.com/user-attachments/assets/6661b571-c60b-4cc0-9bcc-f24ed2e8a983" />
Tootjakasutaja saab kasutajaid lisada ka *guest* tabelisse.




