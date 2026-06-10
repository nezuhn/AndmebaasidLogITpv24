## Andmebaaside Arseni Rumjantsev Konspekt

[Põhimõisted](README.md) | [Protseduurid](protseduurid.md) | [Kasutajad](Kasutajad.md) | [Trigerid](triger.md) |[keys.md](keys.md)

create database keys;
use keys;

create table kasutaja(
kasutaja_id int primary key identity(1,1),
kasutaja_nimi varchar(30),
vanus int)

insert into kasutaja 
values('Masha', 17)

select * from kasutaja

create table toit(
id int primary key identity(1,1),
toidu_nimi varchar(30),
kasutaja_id int,
foreign key (kasutaja_id) references kasutaja(kasutaja_id))

insert into toit
values('Kurk', 1), ('Õun', 2), ('Banana', 3)

select * from toit


create table sonaraamat(
id int primary key identity (1,1),
sona varchar(30) unique)

insert into sonaraamat
values('Toit')

select * from sonaraamat


create table loomad(
looma_id int primary key,
looma_nimi varchar(30))

insert into loomad 
values(1, 'Kass'), (2, 'Koer')

insert into loomad
values (2, 'bebe')



create table tellimus(
tellimuse_id int,
toote_id int,
kogus int,
primary key (tellimuse_id, toote_id))

insert into tellimus
values(1, 1, 2), (1, 2, 1), (2, 1, 3);

select * from tellimus



create table opilane_kursus(
opilane_id int,
kursus_id int,
primary key(opilane_id, kursus_id))

insert into opilane_kursus(opilane_id, kursus_id)
values(1, 1), (2, 2)

select * from opilane_kursus

create table hinne(
hinne_id int primary key identity(1,1),
opilane_id int,
kursus_id int,
hinne int,
foreign key(opilane_id, kursus_id) references opilane_kursus(opilane_id, kursus_id))

insert into hinne
values(1, 1, 5), (2, 2, 4)

select * from hinne

insert into hinne
values(1, 2, 5)


create table inimene(
id int primary key identity(1,1),
nimi varchar(30),
email varchar(50))

insert into inimene
values('Arseni', 'arseni@gmail.com'), ('Alex', 'alex@gmail.com'), ('Andrei', 'andrei@gmail.com')

select * from inimene



create table telefon(
tel_id int primary key identity(1,1),
mudel varchar(50),
kogus int,
pood varchar(30))

insert into telefon
values('Iphone 15 pro', 5, 'Kristiine Keskus'), ('Samsung Galaxy S25', 10, 'T1'), ('Iphone 17', 20, 'Ülemiste Keskus')

select * from telefon

