## Primary Key 

### Definitsioon
Primary key - see on veerg (või veergude komplekt), mis identifitseerib tabeli iga rea ​​unikaalselt. Väärtused peavad olema unikaalsed ja ei tohi olla NULL.

### Kasutus
- Iga rea ​​unikaalse identifikaatorina
- Seoste jaoks teiste tabelitega (sellele viitab võõrvõti)
- Kiireks otsinguks indeksi automaatseks loomiseks

### Erinevus
- Ei tohi sisaldada NULL - väärtusi
- Igal tabelil saab olla ainult ÜKS primaarvõti
- Väärtused peavad olema unikaalsed

### Näide
<img width="393" height="292" alt="{2F5F2D08-BE3B-4E00-A501-7B768D617066}" src="https://github.com/user-attachments/assets/b3ce0bf1-b7bc-46f7-9def-b6714b3ceefd" />

## Foreign Key 

### Definitsioon
Foreign key - see on ühe tabeli väli või väljade rühm, mis viitab teise tabeli primaarvõtmele.

### Kasutus
- Andmete terviklikkuse tagamiseks
- Tabelite vaheliste seoste loomiseks (1:M, M:M seosed)
- Orbkirjete vältimiseks

### Erinevus
- Võib sisaldada NULL-väärtusi
- Saab viidata ainult teises tabelis olemasolevatele väärtustele
- Ühel tabelil võib olla mitu võõrvõtit

### Näide

<img width="525" height="329" alt="{9C6071D1-37DB-47B6-8754-3F6D9F77A630}" src="https://github.com/user-attachments/assets/f0cc3852-125e-4bb4-9cd0-b56deb1e8c55" />
<img width="649" height="324" alt="{5BFB38AA-1A18-434C-BC8A-1E7D94DC637C}" src="https://github.com/user-attachments/assets/8515c69c-8766-43f1-bc4a-4901772d3db9" />

## Unique Key

### Definitsioon
Unique key - see on andmebaasides piirang, mis tagab, et kõik konkreetse veeru (või veergude kombinatsiooni) väärtused on kogu tabelis unikaalsed.

### Kasutus
- Alternatiivse unikaalse identifikaatorina
- Duplikaatide vältimiseks (nt email)
- Andmete kvaliteedi tagamiseks

### Erinevus
- Võib lubada ÜHE NULL väärtuse
- Tabelis võib olla mitu unique key'd
- Unikaalsus on ainus nõue\

### Näide
<img width="319" height="256" alt="{E95952F6-F1AF-4C11-90C1-DA49CF5C01AB}" src="https://github.com/user-attachments/assets/8fbda2f7-f9f3-4355-a12e-60421e83308b" />
<img width="791" height="278" alt="{9018A5AD-6575-45B1-A190-C6F01D4BD2E0}" src="https://github.com/user-attachments/assets/f80e03b5-dd01-49e6-b490-bd57dd67ca05" />

## Simple Key

### Definitsioon
Simple key - see on võti, mis koosneb ainult ühest veerust, mis identifitseerib unikaalselt iga kirje (rea) tabelis.

### Kasutus
- Lihtsate tabelite puhul, kus üks väli on piisav
- Enamiku tabelite puhul vaikimisi lahendus
- Kiirem indekseerimine

### Erinevus
- Üksikväli: Täpselt ühes veerus (näiteks õpilase_id või e-posti aadress).
- Unikaalne: Igal real on oma väärtus, duplikaadid pole lubatud.
- Not Null: Väärtus ei tohi olla tühi.
  
<img width="335" height="217" alt="{05F94072-9928-457A-B20E-A71E27E067C9}" src="https://github.com/user-attachments/assets/a025d713-9101-4859-97ea-698e86aa5330" />
<img width="838" height="214" alt="{3ADA9CBC-8CBC-45E4-BF61-85D71F709751}" src="https://github.com/user-attachments/assets/25896d44-6166-4e3f-a8ac-f10020434ffd" />

## Composite Key

### Definitsioon
Composite Key - see on kahe või enama veeru kombinatsioon, mida kasutatakse tabeli iga rea ​​unikaalseks identifitseerimiseks. Erinevalt tavalisest primaarvõtmest, kus üks väli tagab unikaalsuse, on liitvõtmes unikaalne ainult väljade kombinatsioon.

### Kasutus
- Vahetabelites (many-to-many seostes)
- Kui üks veerg ei ole piisav unikaalsuse tagamiseks
- Naturaalsete võtmete loomiseks

### Erinevus
- Koosneb mitmest veerust
- Kõik veerud koos moodustavad unikaalse kombinatsiooni
- Üksikud veerud ei pea olema unikaalsed

### Näide
<img width="351" height="327" alt="{75E9941F-D959-44E5-ADA5-0AB565355462}" src="https://github.com/user-attachments/assets/2800fddd-21aa-44db-823b-5db046490226" />
<img width="801" height="217" alt="{687C6E7D-C398-4626-9D88-10E55AB1054C}" src="https://github.com/user-attachments/assets/f1b19bc1-9f93-4360-b68e-baa324906cab" />

## Compound Key

### Definitsioon
Compound Key - see on primaar- ehk unikaalne võti on võti, mis koosneb kahest või enamast veerust. Kombineerituna identifitseerivad need veerud unikaalselt iga tabeli rea, kuigi individuaalselt võivad nende väärtused dubleeruda.

### Kasutus
- Välisvõtmete loomiseks, mis viitavad composite primaarvõtmele
- Keerukate andmebaaside sidumisel
- Tabelite vaheliste seoste loomiseks

### Erinevus
- Tavaliselt kasutatakse kui välisvõtit (FOREIGN KEY)
- Võib koosneda mitmest välisvõtmest
- Viitab teise tabeli liitvõtmele

### Näide
<img width="397" height="287" alt="{DE5D715A-214C-4C72-989A-D4DC9A3B27AD}" src="https://github.com/user-attachments/assets/97e94766-05d0-4b54-9f7a-2bf7339e9ee7" />
<img width="662" height="343" alt="{D2787807-03D4-475F-B09E-2391572DE7AE}" src="https://github.com/user-attachments/assets/e45a3d69-e6a9-4665-aaec-8fc3d078ffbe" />
<img width="812" height="280" alt="{A83B1CCD-E7E7-458B-A0BD-392493D48A83}" src="https://github.com/user-attachments/assets/88a74f58-8b77-417e-9d26-e69dd871347a" />


## Superkey

### Definitsioon
Superkey - see on üks või mitu veergu, mille kombinatsioon identifitseerib unikaalselt mis tahes tabeli kirje. Supervõtme põhiomadus on see, et see võib sisaldada mis tahes "lisa"veergusid, mis ei mõjuta unikaalsust ennast.

### Kasutus
- Teoreetiline alus teistele võtmetele
- Andmebaasi normeerimisel
- Kõigi võimalike unikaalsete kombinatsioonide leidmiseks

### Erinevus
- Võib sisaldada "ülearuseid" veerge
- Kõik candidate key'd on superkey'd
- Kõige laiem võtmete tüüp

### Näide
<img width="799" height="283" alt="{E99375BA-005B-4F43-B747-C8FF9021566B}" src="https://github.com/user-attachments/assets/814e15f5-6974-4fdb-a244-5c39f374eb05" />
<img width="588" height="506" alt="{F52FD183-585B-4E87-BE31-7331AD724F8B}" src="https://github.com/user-attachments/assets/548724c1-bb27-4fca-85cd-53df6e444966" />


