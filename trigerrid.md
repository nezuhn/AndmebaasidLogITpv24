create database laenatud_riistad2;
USE laenatud_riistad2;


CREATE TABLE laenatud_riistad (
    id INT PRIMARY KEY IDENTITY (1,1),
    riista_nimi VARCHAR(100) NOT NULL,
    laenaja VARCHAR(100) NOT NULL,
    tagastamis_tahtaeg DATE NOT NULL
);
CREATE TABLE laenutuste_logi (
    id INT PRIMARY KEY IDENTITY (1,1),
    riista_nimi VARCHAR(100) NOT NULL,
    tegevus VARCHAR(50) NOT NULL,
    aeg DATEtime,
	kasutaja varchar(100)
);

-- INSERT
CREATE TRIGGER riistaLisamine
ON laenatud_riistad
FOR INSERT
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg, kasutaja)
    SELECT
        inserted.riista_nimi,
        'lisatud',
        GETDATE(), 
		SYSTEM_USER
    FROM inserted;
END;

-- UPDATE
CREATE TRIGGER riistaMuutmine
ON laenatud_riistad
FOR UPDATE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg, kasutaja)
    SELECT
        inserted.riista_nimi,
        'uuendatud',
        GETDATE(),
		SYSTEM_USER
    FROM inserted;
END;

--DELETE
CREATE TRIGGER riistaKustutamine
ON laenatud_riistad
FOR DELETE
AS
BEGIN
    INSERT INTO laenutuste_logi(riista_nimi, tegevus, aeg, kasutaja)
    SELECT
        deleted.riista_nimi,
        'kustutatud',
        GETDATE(),
		SYSTEM_USER
    FROM deleted;
END;


INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES
('Akutrell Makita DDF484', 'Jaan Tamm', '2026-06-25'),
('Ketassaag Bosch GKS 190', 'Aleksei Petrov', '2026-06-20'),
('Keevitusinverter Resanta', 'Mari Maasikas', '2026-07-05'),
('Laserlood Bosch Cubix', 'Jaan Tamm', '2026-06-22');


SELECT * FROM laenatud_riistad;
SELECT * FROM laenutuste_logi;

UPDATE laenatud_riistad 
SET tagastamis_tahtaeg = '2026-07-15'
WHERE riista_nimi = 'Keevitusinverter Resanta';

INSERT INTO laenatud_riistad(riista_nimi, laenaja, tagastamis_tahtaeg)
VALUES('Survepesur Kärcher K5', 'Jaan Tamm', '2026-06-30');


DELETE FROM laenatud_riistad WHERE id = 1;
SELECT * FROM laenutuste_logi;

-- sekretaarArs
GRANT SELECT, INSERT, DELETE ON laenatud_riistad TO sekretaarArss;
DENY SELECT, INSERT, UPDATE, DELETE ON laenutuste_logi TO sekretaarArss;


