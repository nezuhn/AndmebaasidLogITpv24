## ANDMEBAASID
andmebaaside haldusega seotud sql kood ja konspektid

## Põhimõisted
-Andmebaasihaldussüsteemid - tarkvara, millega abil saab luua andmebaas (MariaDB - XAMPP, SQL Server - SQL Server Managment studio sERVER NAME: (LocalDB)\MSSQLLocalDB)
-Andmebaas - struktureeritud  abdnete kogum
-Tabel - olem -сущности 
Veerg väli - поле
-Rida = kirje
-Primaarne võti - primary key -pk- veerg, unikaalse identifikatooriga (tavaliselt nimetakse id)
-Välisvõti (võõrvõti) foreign key -FK- - veerg, mis loob seose teise tabeli primaarne võtmega

## SQL - Structured query language - struktureeritud päringu keel
-Päring - Запрос
- <img width="345" height="267" alt="{37DC1E69-3B7B-4146-AAB2-5721C45CD024}" src="https://github.com/user-attachments/assets/e6dfa8cf-48a3-4d93-9477-cca054e6f674" />
1.DDL - Data Definition Language
2.DML - Data Manipulation Language

 ## Piirangud - ограничения - Constant(5)
 1.PRIMARY KEY
 2.NOT NULL
 3.CHECK - valik
 4.UNIQUE
 5.FOREIGN KEY
 
 ## Andmetüübid
 ```
 1.int, smallint, decimal(5,2) - numbrilised
 2.varchar(30), char(5), TEXT - tekst/sümboolised
 3.date, time, datetime - kuupäeva
 4.boolean, bit, bool - logilised
```
