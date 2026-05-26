create database RetseptiRaamatArs;
Use RetseptiRaamatArs;

--Loo tabel kasutaja
Create table kasutaja(
kasutajaId int primary key identity(1,1),
eesnimi varchar (30),
perenimi varchar (25),
email varchar(35));
select * from kasutaja

--Loo tabel kategooria
Create table kategooria(
kategooriaId int primary key identity(1,1),
kategooriaNimi varchar(50));
select * from kategooria

--Loo tabel toiduaine
create table toiduaine(
toiduaineId int primary key identity(1,1),
toiduaineNimi varchar(100));
select * from toiduaine

--Loo tabel yhik
create table yhik(
yhikId int primary key identity(1,1),
yhikNimi varchar(100));
select * from yhik

--Loo tabel retsept
create table retsept(
retseptId int primary key identity(1,1),
retseptiNimi varchar(100),
kirjeldus varchar(200),
juhend varchar(500),
sisestatudKp date,
kasutajaId int,
kategooriaId int,
foreign key (kasutajaId) references kasutaja (kasutajaId),
foreign key (kategooriaId) references kategooria (kategooriaId));
select * from retsept

--Loo tabel koostis
create table koostis(
koostisId int primary key identity(1,1),
kogus int, 
retseptId int,
toiduaineId int,
yhikId int,
foreign key (retseptId) references retsept(retseptId),
foreign key (toiduaineId) references toiduaine(toiduaineId));

select * from koostis

--Loo tabel tehtud
create table tehtud( 
tehtudId int primary key identity(1,1),
tehtudKp date,
retseptId int,
foreign key (retseptId) references retsept(retseptId));

 select * from tehtud

 --sisesta väärtused kategories
 insert into kasutaja
 values ('Robert', 'Morev', 'Robert.Morev@gmail.com' )

 --sisesta väärtused kategooria
 insert into kategooria
 values ('magustoit')

 --sisesta väärtused toiduaine
 insert into toiduaine
 values('kala')

 --sisesta väärtused yhik
 insert into yhik
 values('tk')


 --sisesta väärtused retsept
 insert into retsept
 values('sealiha', 'maitsev hautatud sealiha', 'hautatud 60min', '2026-05-26', 1, 1)
  insert into retsept
 values('kartul', 'praetud soolane kartul', 'praadima 25 min', '2026-05-27', 2, 2)
   insert into retsept
 values('riis', 'keedetud riis', 'kokk 25 min', '2026-05-28', 3, 3)
 insert into retsept
 values('liha', ' minon liha', 'prae 20 min', '2026-05-29', 4, 4)
  insert into retsept
 values('kala', ' küpsetatud kala', 'küpsetama 30 min', '2026-05-30', 5, 5)
 select * from retsept


 --sisesta väärtused koostis
 insert into koostis
values(3, 2, 1, 2)
 insert into koostis
values(4, 3, 2, 2)
 insert into koostis
values(3, 4, 3, 2)
 insert into koostis
values(4, 5, 4, 1)
 insert into koostis
values(4, 11, 5, 1)

--sisesta väärtused tehtud
insert into tehtud
values('2026-05-30', 11 )


select * from koostis
 select * from retsept
select * from tehtud
select * from toiduaine


--Protseduurid
create procedure lisatoiduaine
@uustoideaine varchar(50)
AS
BEGIN
	insert into toiduaine(toiduaineNimi)
	values(@uustoideaine)
	select  * from toiduaine
END;
exec lisatoiduaine mayo

create Procedure lisakasutaja
@uuseesnimi varchar(50),
@uusperenimi varchar(50),
@uusemail varchar(150)
AS
BEGIN
	insert into kasutaja(eesnimi, perenimi, email)
	values(@uuseesnimi, @uusperenimi, @uusemail)
	select * from kasutaja
END;
exec lisakasutaja 'Marko', 'Nagiev', 'm.nagiev@gmail.com'

create procedure muudatabel
@tegevus varchar(50),
@tabelinimi varchar(50),
@veerunmi varchar(50),
@tyyp varchar(50)=null
AS
BEGIN
	DECLARE @sqltegevus varchar(max);

	SET @sqltegevus = CASE
		WHEN @tegevus = 'add' THEN
			CONCAT('ALTER TABLE', @tabelinimi, 'ADD', @veerunimi, ' ', @tyyp)
		WHEN @tegevus = 'drop' THEN
			CONCAT('ALTER TABLE', @tabelinimi, 'DROP COLUMN', @veerunimi)
		WHEN @tegevus = 'change' THEN
			CONCAT('ALTER TABLE', @tabelinimi, 'ALTER COLUMN', @veerunmi, ' ', @tyyp)
	END;
	PRINT @sqltegevus;
	EXEC (@sqltegevus);
END;

EXEC muudatabel 'drop', 'toiduaine', 'toiduaine_kogus'
select * from


--users policies (staff)
GRANT SELECT ON toiduaine TO staff;
GRANT SELECT ON kategooria TO staff;
GRANT SELECT ON kasutaja TO staff;

GRANT INSERT ON toiduaine TO staff;
GRANT INSERT ON kategooria TO staff;

DENY DELETE ON toiduaine TO staff;
DENY DELETE ON kategooria TO staff;

DENY UPDATE ON toiduaine TO staff;
DENY UPDATE ON kategooria TO staff;



