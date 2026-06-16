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
