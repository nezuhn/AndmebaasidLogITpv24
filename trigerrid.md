create database laenatud_riistad;
use laenatud_riistad;

CREATE TABLE laenatud_riistad (
    id INT primary key identity (1,1),
    riista_nimi VARCHAR(100) not null,
    laenaja VARCHAR(100) not null,
    tagastamis_tahtaeg DATE not null
);

CREATE TABLE laenutuste_logi (
    id INT PRIMARY KEY identity (1,1),
    riista_nimi varchar(100) NOT NULL,
    tegevus VARCHAR(50) NOT NULL,
    aeg date not null
);

CREATE TRIGGER riistaLisamine
ON laenatud_riistad
FOR INSERT
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        inserted.riista_nimi,
        'lisatud',
        GETDATE()
    FROM inserted;
END;

CREATE TRIGGER riistaMuutmine
ON laenatud_riistad
FOR UPDATE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        inserted.riista_nimi,
        'uuendatud',
        GETDATE()
    FROM inserted;
END;

CREATE TRIGGER riistaKustutamine
ON laenatud_riistad
FOR DELETE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        deleted.riista_nimi,
        'kustutatud',
        GETDATE()
    FROM deleted;
END;

INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES('Akutrell Makita DDF484', 'Jaan Tamm', '2026-06-30');

SELECT * FROM laenutuste_logi;

UPDATE laenatud_riistad 
SET tagastamis_tahtaeg = '2026-07-15'
WHERE riista_nimi = 'Akutrell Makita DDF484';

SELECT * FROM laenutuste_logi;

DELETE FROM laenatud_riistad 
WHERE riista_nimi = 'Akutrell Makita DDF484';

SELECT * FROM laenutuste_logi;

select * from laenatud_riistad

INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES('Ketassaag Bosch GKS', 'Mari Maasikas', '2026-06-25');
SELECT * FROM laenatud_riistad;
SELECT * FROM laenutuste_logi;

INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES
('Akutrell Makita DDF484', 'Jaan Tamm', '2026-06-25'),
('Ketassaag Bosch GKS 190', 'Aleksei Petrov', '2026-06-20'),
('Keevitusinverter Resanta', 'Mari Maasikas', '2026-07-05'),
('Laserlood Bosch Cubix', 'Jaan Tamm', '2026-06-22'),
('Kuumaõhupuhur Dewalt', 'Vladimir Kott', '2026-06-18');



------------------------
-- ========================================================
-- 1. ANDMEBAASI JA TABELITE LOOMINE (UUS ANDMEBAAS: laenatud_riistad1)
-- ========================================================

-- Võtame uue andmebaasi kasutusele
USE laenatud_riistad1;
GO

-- Põhitabel uues andmebaasis
CREATE TABLE laenatud_riistad (
    id INT PRIMARY KEY IDENTITY (1,1),
    riista_nimi VARCHAR(100) NOT NULL,
    laenaja VARCHAR(100) NOT NULL,
    tagastamis_tahtaeg DATE NOT NULL
);

-- Logi tabel uues andmebaasis (DATETIME tüübiga minutite ja sekundite jaoks)
CREATE TABLE laenutuste_logi (
    id INT PRIMARY KEY IDENTITY (1,1),
    riista_nimi VARCHAR(100) NOT NULL,
    tegevus VARCHAR(50) NOT NULL,
    aeg DATETIME -- Salvestab kuupäeva, tunnid ja minutid
);

-- ========================================================
-- 2. TRIGGERITE LOOMINE (UUES ANDMEBAASIS)
-- ========================================================


-- Trigger andmete lisamisel (INSERT)
CREATE TRIGGER riistaLisamine
ON laenatud_riistad
FOR INSERT
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        inserted.riista_nimi,
        'lisatud',
        GETDATE() -- Võtab serveri täpse kellaaja minutitega
    FROM inserted;
END;

-- Trigger andmete muutmisel (UPDATE)
CREATE OR ALTER TRIGGER riistaMuutmine
ON laenatud_riistad
FOR UPDATE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        inserted.riista_nimi,
        'uuendatud',
        GETDATE()
    FROM inserted;
END;

-- Trigger andmete kustutamisel (DELETE)
CREATE TRIGGER riistaKustutamine
ON laenatud_riistad
FOR DELETE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg)
    SELECT
        deleted.riista_nimi,
        'kustutatud',
        GETDATE()
    FROM deleted;
END;

-- ========================================================
-- 3. ALGANDMETE SISESTAMINE (UUDE TABELISSE)
-- ========================================================


INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES
('Akutrell Makita DDF484', 'Jaan Tamm', '2026-06-25'),
('Ketassaag Bosch GKS 190', 'Aleksei Petrov', '2026-06-20'),
('Keevitusinverter Resanta', 'Mari Maasikas', '2026-07-05'),
('Laserlood Bosch Cubix', 'Jaan Tamm', '2026-06-22'),
('Kuumaõhupuhur Dewalt', 'Vladimir Kott', '2026-06-18');



-- ========================================================
-- 4. KONTROLL JA PÄRINGUD (UUE ANDMEBAASI SISU)
-- ========================================================


-- Vaatame uue põhitabeli sisu
SELECT * FROM laenatud_riistad;

-- Vaatame uut logi, kus on näha täpne aeg minutitega
SELECT * FROM laenutuste_logi;



-- Muudame tagastamise tähtaega
UPDATE laenatud_riistad 
SET tagastamis_tahtaeg = '2026-07-15'
WHERE riista_nimi = 'Survepesur Kärcher K5';

INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES('Survepesur Kärcher K5', 'Jaan Tamm', '2026-06-30');

-- Vaatame uuesti logi
SELECT * FROM laenutuste_logi WHERE riista_nimi = 'Survepesur Kärcher K5';
