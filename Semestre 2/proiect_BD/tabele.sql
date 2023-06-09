CREATE TABLE CONTRACT (
    NUMAR INT PRIMARY KEY,
    DATA_EMITERE DATE,
    DURATA INT,
    TIP VARCHAR(255),
    id_magazin INT,
    id_farmacie INT,
    id_clinica INT,
    FOREIGN KEY (id_magazin) REFERENCES MAGAZIN (id_magazin),
    FOREIGN KEY (id_farmacie) REFERENCES FARMACIE (id_farmacie),
    FOREIGN KEY (id_clinica) REFERENCES CLINICA_VETERINARA (ID_CLINICA)
);

CREATE TABLE ANGAJAT (
    ID_ANGAJAT INT PRIMARY KEY,
    NUME VARCHAR(255),
    PRENUME VARCHAR(255),
    CNP VARCHAR(13),
    ADRESA VARCHAR(255),
    TELEFON VARCHAR(255),
    EMAIL VARCHAR(255),
    ID_CONTRACT INT,
    FOREIGN KEY (ID_CONTRACT) REFERENCES CONTRACT (NUMAR)
);

CREATE TABLE DIRECTOR (
    ID_DIRECTOR INT PRIMARY KEY,
    ID_CONTRACT INT,
    ID_ANGAJAT INT,
    FOREIGN KEY (ID_CONTRACT) REFERENCES CONTRACT (NUMAR),
    FOREIGN KEY (ID_ANGAJAT) REFERENCES ANGAJAT (ID_ANGAJAT)
);

CREATE TABLE SECTOR (
    ID_SECTOR INT PRIMARY KEY,
    TIP_NEVOIE VARCHAR(255),
    NUMAR_LOCURI INT
);

CREATE TABLE SECTIE_SECTOR (
    ID_SECTIE INT,
    ID_SECTOR INT,
    PRIMARY KEY (ID_SECTIE, ID_SECTOR),
    FOREIGN KEY (ID_SECTIE) REFERENCES SECTIE (ID_SECTIE),
    FOREIGN KEY (ID_SECTOR) REFERENCES SECTOR (ID_SECTOR)
);

CREATE TABLE SECTIE (
    ID_SECTIE INT PRIMARY KEY,
    NUME VARCHAR(255),
    ID_CUSCA INT,
    FOREIGN KEY (ID_CUSCA) REFERENCES CUSCA (ID_CUSCA)
);

CREATE TABLE FARMACIE (
    ID_FARMACIE INT PRIMARY KEY,
    NUME VARCHAR(255),
    TELEFON VARCHAR(255),
    PROGRAM VARCHAR(255),
    NUMAR INT,
    FOREIGN KEY (NUMAR) REFERENCES MEDICAMENT (NUMAR)
);

CREATE TABLE MEDICAMENT (
    NUMAR INT PRIMARY KEY,
    DENUMIRE_PRODUS VARCHAR(255),
    CANTITATE INT
);

CREATE TABLE VIZITATOR (
    CNP VARCHAR(13) PRIMARY KEY,
    NUME VARCHAR(255),
    PRENUME VARCHAR(255),
    TELEFON VARCHAR(255),
    EMAIL VARCHAR(255)
);

CREATE TABLE CERERE_ADOPTIE (
    SERIE VARCHAR(255),
    ID_ANIMAL INT,
    ID_VIZITATOR VARCHAR(13),
    DATA DATE,
    --APROBATA_DE_DIRECTOR BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (SERIE, ID_ANIMAL, ID_VIZITATOR),
    FOREIGN KEY (ID_ANIMAL) REFERENCES ANIMAL (ID_ANIMAL),
    FOREIGN KEY (ID_VIZITATOR) REFERENCES VIZITATOR (CNP)
);


CREATE TABLE ANIMAL (
    ID_ANIMAL INT PRIMARY KEY,
    NUME VARCHAR(255),
    RASA VARCHAR(255),
    VARSTA INT,
    SEX VARCHAR(255),
    DATA_SOSIRE DATE,
    ID_CUSCA INT,
    ID_VETERINAR VARCHAR(13),
    FOREIGN KEY (ID_CUSCA) REFERENCES CUSCA (ID_CUSCA),
    FOREIGN KEY (ID_VETERINAR) REFERENCES VETERINAR (CNP)
);

CREATE TABLE CUSCA (
    ID_CUSCA INT PRIMARY KEY,
    NUMAR_LOCURI INT
);


CREATE TABLE VETERINAR (
    CNP VARCHAR(13) PRIMARY KEY,
    NUME VARCHAR(255),
    PRENUME VARCHAR(255),
    ID_ANIMAL INT,
    ID_CONSULTATIE,
    FOREIGN KEY (ID_ANIMAL) REFERENCES ANIMAL (ID_ANIMAL),
    FOREIGN KEY (ID_CONSLTATIE) REFERENCES CONSULTATIE (ID_CONSULTATIE)
);


CREATE TABLE MAGAZIN (
    ID_MAGAZIN INT PRIMARY KEY,
    ID_CONTRACT INT,
    NUME VARCHAR(255),
    TELEFON VARCHAR(255),
    PROGRAM VARCHAR(255),
    FOREIGN KEY (ID_MAGAZIN) REFERENCES MAGAZIN (ID_MAGAZIN)
);

CREATE TABLE HRANA (
    NUMAR INT PRIMARY KEY,
    DENUMIRE_PRODUS VARCHAR(255),
    CANTITATE INT,
    ID_MAGAZIN INT,
    FOREIGN KEY (ID_MAGAZIN) REFERENCES MAGAZIN (ID_MAGAZIN)
);

CREATE TABLE CARTE_DE_SANATATE (
    ID_ANIMAL INT PRIMARY KEY,
    VACCINURI VARCHAR(255),
    DATA_NASTERE DATE,
    ANTECEDENTE_MEDICALE VARCHAR(255),
    ID_VETERINAR VARCHAR(13),
    FOREIGN KEY (ID_VETERINAR) REFERENCES VETERINAR (CNP)
);

CREATE TABLE CONSULTATIE (
    ID_CONSULTATIE INT PRIMARY KEY,
    ID_ANIMAL INT,
    DATA DATE,
    ID_VETERINAR VARCHAR(13),
    FOREIGN KEY (ID_VETERINAR) REFERENCES VETERINAR (CNP)
);


CREATE TABLE CLINICA_VETERINARA (
    ID_CLINICA INT PRIMARY KEY,
    DENUMIRE VARCHAR(255),
    ADRESA VARCHAR(255),
    TELEFON VARCHAR(255),
    EMAIL VARCHAR(255),
    ID_VETERINAR VARCHAR(13),
    FOREIGN KEY (ID_VETERINAR) REFERENCES VETERINAR (CNP)
);

-- Tabela CONTRACT
INSERT INTO CONTRACT (NUMAR, DATA_EMITERE, DURATA, TIP, id_magazin, id_farmacie, id_clinica)
VALUES (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 12, 'Standard', 1, 1, 1),
VALUES (2, TO_DATE('2023-02-01', 'YYYY-MM-DD'), 6, 'Premium', 2, 2, 2),
VALUES (3, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 3, 'Standard', 3, 3, 3),
VALUES (4, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 10, 'Premium', 4, 4, 4),
VALUES (5, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 12, 'Standard', 5, 5, 5);


-- Tabela ANGAJAT
INSERT INTO ANGAJAT (ID_ANGAJAT, NUME, PRENUME, CNP, ADRESA, TELEFON, EMAIL, ID_CONTRACT)
VALUES (1, 'Popescu', 'Ion', '1234567890123', 'Str. Muncii, Nr. 1', '123456789', 'popescu.ion@example.com', 1),
       (2, 'Ionescu', 'Maria', '9876543210987', 'Str. Victoriei, Nr. 2', '987654321', 'ionescu.maria@example.com', 2),
       (3, 'Dumitrescu', 'Ana', '4567890123456', 'Str. Libert??ii, Nr. 3', '456789012', 'dumitrescu.ana@example.com', 3),
       (4, 'Constantinescu', 'Mihai', '7890123456789', 'Str. Independen?ei, Nr. 4', '789012345', 'constantinescu.mihai@example.com', 4),
       (5, 'Georgescu', 'Elena', '2345678901234', 'Str. Revolu?iei, Nr. 5', '234567890', 'georgescu.elena@example.com', 5);


-- Tabela DIRECTOR
INSERT INTO DIRECTOR (ID_DIRECTOR, ID_CONTRACT, ID_ANGAJAT)
VALUES (1, 1, 1),
VALUES (2, 2, 2),
VALUES (3, 3, 3),
VALUES (4, 4, 4),
VALUES (5, 5, 5);

-- Tabela SECTOR --
INSERT INTO SECTOR (ID_SECTOR, TIP_NEVOIE, NUMAR_LOCURI)
VALUES (1, 'Tip 1', 10),
VALUES (2, 'Tip 2', 5),
VALUES (3, 'Tip 3', 8),
VALUES (4, 'Tip 4', 11),
VALUES (5, 'Tip 5', 15);


-- Tabela SECTIE_SECTOR --
INSERT INTO SECTIE_SECTOR (ID_SECTIE, ID_SECTOR)
VALUES (1, 1),
VALUES (2, 2),
VALUES (3, 3),
VALUES (4, 4),
VALUES (5, 5);

-- Tabela SECTIE --
INSERT INTO SECTIE (ID_SECTIE, NUME, ID_CUSCA)
VALUES (1, 'Sectie 1', 1),
VALUES (2, 'Sectie 2', 2),
VALUES (3, 'Sectie 3', 3),
VALUES (4, 'Sectie 4', 4),
VALUES (5, 'Sectie 5', 5);

-- Tabela FARMACIE --

INSERT INTO FARMACIE (ID_FARMACIE, NUME, TELEFON, PROGRAM, NUMAR)
VALUES (1, 'Pharmacy 1', '123-456-7890', '9 AM - 6 PM', 1);

INSERT INTO FARMACIE (ID_FARMACIE, NUME, TELEFON, PROGRAM, NUMAR)
VALUES (2, 'Pharmacy 2', '123-456-7899', '9 AM - 6 PM', 1);

INSERT INTO FARMACIE (ID_FARMACIE, NUME, TELEFON, PROGRAM, NUMAR)
VALUES (3, 'Pharmacy 3', '123-456-3451', '9 AM - 10 PM', 1),
VALUES (4, 'Pharmacy 4', '123-456-2469', '7 AM - 3 PM', 1),
VALUES (5, 'Pharmacy 5', '123-456-9452', '9 AM - 6 PM', 1);


-- Tabela MEDICAMENT  -- 
INSERT INTO MEDICAMENT (NUMAR, DENUMIRE_PRODUS, CANTITATE)
VALUES (1, 'Medicament 1', 50),
VALUES (2, 'Medicament 2', 100),
VALUES (3, 'Medicament 3', 20),
VALUES (4, 'Medicament 4', 80),
VALUES (5, 'Medicament 5', 150);

-- Tabela VIZITATOR -- 

INSERT INTO VIZITATOR (CNP, NUME, PRENUME, TELEFON, EMAIL)
VALUES ('1234567890123', 'Jane', 'Doe', '987-654-3210', 'jane@example.com');

INSERT INTO VIZITATOR (CNP, NUME, PRENUME, TELEFON, EMAIL)
VALUES ('1234678390124', 'Jany', 'Denice', '947-967-3215', 'jany@gmail.com'),
VALUES ('5434564573465', 'Dan', 'Brice', '987-654-4662', 'brice@gmail.com'),
VALUES ('1234903767384', 'Jacob', 'Marian', '246-654-3215', 'marian@gmail.com'),
VALUES ('6542952096781', 'Ghica', 'Suditu', '375-654-0697', 'suditu@gmail.com');

--Tabela CUSCA --

INSERT INTO CUSCA (ID_CUSCA, NUMAR_LOCURI)
VALUES (1, 5),
VALUES (2, 1),
VALUES (3, 4),
VALUES (4, 10),
VALUES (5, 2);


-- Tabela CERERE_ADOPTIE --

INSERT INTO CERERE_ADOPTIE (SERIE, ID_ANIMAL, ID_VIZITATOR, DATA)
VALUES ('ABC123', 1, '1', TO_DATE('2023-01-01', 'YYYY-MM-DD')),
VALUES ('C354', 2, '2', TO_DATE('2023-01-01', 'YYYY-MM-DD')),
VALUES ('Z782', 3, '3', TO_DATE('2023-01-01', 'YYYY-MM-DD')),
VALUES ('A32', 4, '4', TO_DATE('2023-01-01', 'YYYY-MM-DD')),
VALUES ('Q70', 5, '5', TO_DATE('2023-01-01', 'YYYY-MM-DD'));

-- Tabela ANIMAL 

INSERT INTO ANIMAL (ID_ANIMAL, NUME, RASA, VARSTA, SEX, DATA_SOSIRE, ID_CUSCA, ID_VETERINAR)
VALUES (1, 'Caine', 'bulldog', 3, 'Male', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 1, 1),
VALUES (2, 'Caine', 'pechinez', 13, 'Male', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 2, 2),
VALUES (3, 'Caine', 'shit-zu', 4, 'Male', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 3, 3),
VALUES (4, 'Caine', 'bichon', 9, 'Female', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 4, 4),
VALUES (5, 'Caine', 'labrador', 1, 'Female', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 5, 5);


--CERINTA 12
-- Cereri SQL complexe
-- Cererea 1: Subcereri sincronizate în care intervin cel putin 3 tabele

SELECT a.NUME, a.PRENUME, v.NUME AS NUME_VETERINAR
FROM ANIMAL a
JOIN ANIMAL_VETERINAR av ON a.ID_ANIMAL = av.ID_ANIMAL
JOIN VETERINAR v ON av.ID_VETERINAR = v.CNP
WHERE a.RASA = 'Caine';


-- Cererea 2: Subcereri nesincronizate în clauza FROM
SELECT AVG(cantitate) AS CANTITATE_MEDIE
FROM (SELECT CANTITATE FROM HRANA WHERE DENUMIRE_PRODUS = 'Royal' UNION ALL
SELECT CANTITATE
FROM HRANA
WHERE DENUMIRE_PRODUS = 'Conserva') AS sub;

-- Cererea 3: Grupari de date cu subcereri nesincronizate în care intervin cel putin 3 tabele.
SELECT s.NUME AS NUME_SECTIE, COUNT(a.ID_ANIMAL) AS NUMAR_ANIMALE
FROM SECTIE_SECTOR ss
JOIN SECTIE s ON ss.ID_SECTIE = s.ID_SECTIE
JOIN ANGAJAT a ON ss.ID_ANGAJAT = a.ID_ANGAJAT
GROUP BY s.NUME
HAVING COUNT(a.ID_ANIMAL) > 2;

-- Cererea 4: Ordonare si utilizarea functiilor NVL si DECODE (în cadrul aceleiasi cereri)
SELECT NUME, PRENUME, NVL(TELEFON, 'Num?r de telefon necunoscut') AS TELEFON,
DECODE(SEX, 'M', 'Masculin', 'F', 'Feminin', 'Necunoscut') AS SEX
FROM VETERINAR
ORDER BY NUME ASC;

-- Cererea 5: Utilizarea a cel putin 2 functii pe siruri de caractere, 2 functii pe date calendaristice, a cel putin unei expresii CASE
SELECT 
    CONCAT(NUME, ' ', PRENUME) AS NUME_COMPLET, 
    UPPER(RASA) AS RASA_UPPER, 
    DATE_DIFF(CURRENT_DATE(), DATA_SOSIRE) AS VARSTA_ZILE,
    CASE 
        WHEN VARSTA > 5 THEN 'Matur'
        WHEN VARSTA <= 5 THEN 'Tanar'
        ELSE 'Necunoscut'
    END AS CATEGORIE_VARSTA
FROM ANIMAL;


-- 13. Implementarea a 3 operatii de actualizare si de suprimare a datelor utilizând subcereri.

--Actualizarea unui angajat:
UPDATE ANGAJAT
SET NUME = 'Popescu', PRENUME = 'Ion'
WHERE ID_ANGAJAT = (
    SELECT ID_ANGAJAT
    FROM ANGAJAT
    WHERE NUME = 'Ionescu' AND PRENUME = 'Maria'
    LIMIT 1
);

--stergerea unui animal si a legaturilor sale:
DELETE FROM ANIMAL
WHERE ID_ANIMAL = (
    SELECT ID_ANIMAL
    FROM ANIMAL
    WHERE NUME = 'Rex'
    LIMIT 1
);

DELETE FROM ANIMAL_VETERINAR
WHERE ID_ANIMAL = (
    SELECT ID_ANIMAL
    FROM ANIMAL
    WHERE NUME = 'Rex'
    LIMIT 1
);

DELETE FROM CARTE_DE_SANATATE
WHERE ID_ANIMAL = (
    SELECT ID_ANIMAL
    FROM ANIMAL
    WHERE NUME = 'Rex'
    LIMIT 1
);

--Actualizarea datelor unui contract:
UPDATE CONTRACT
SET DURATA = 24
WHERE NUMAR = (
    SELECT NUMAR
    FROM CONTRACT
    WHERE TIP = 'Standard'
    LIMIT 1
);


-- Cererea 14: Crearea unei vizualizari complexe  ? 
CREATE VIEW v_angajati_sectii AS
SELECT an.NUME, an.PRENUME, an.ADRESA, s.NUME AS NUME_SECTIE
FROM ANGAJAT an
LEFT JOIN CONTRACT c ON an.ID_CONTRACT = c.NUMAR
LEFT JOIN DIRECTOR d ON d.ID_CONTRACT = c.NUMAR
LEFT JOIN SECTIE_SECTOR ss ON an.ID_ANGAJAT = ss.ID_ANGAJAT
LEFT JOIN SECTIE s ON ss.ID_SECTIE = s.ID_SECTIE;

-- Cererea 15: Cerere cu outer-join pe minim 4 tabele, cerere cu operatia de division si cerere cu analiza top-n
-- Exemplu de cerere cu outer-join pe minim 4 tabele
SELECT a.NUME, c.DENUMIRE_PRODUS, h.CANTITATE
FROM ANIMAL a
LEFT JOIN CARTE_DE_SANATATE cs ON a.ID_ANIMAL = cs.ID_ANIMAL
LEFT JOIN CONSULTATIE co ON a.ID_ANIMAL = co.ID_ANIMAL
LEFT JOIN HRANA h ON co.DATA = h.DATA
LEFT JOIN CUSCA c ON a.ID_CUSCA = c.ID_CUSCA;

-- Exemplu de cerere cu operatia de division
SELECT a.NUME, a.RASA
FROM ANIMAL a
WHERE NOT EXISTS (
    SELECT *
    FROM CARTE_DE_SANATATE cs
    WHERE a.ID_ANIMAL = cs.ID_ANIMAL
    AND cs.VACCINURI != 'Rabie'
);

-- Exemplu de cerere cu analiza top-n
SELECT NUME, VARSTA
FROM ANIMAL
ORDER BY VARSTA DESC
FETCH FIRST 5 ROWS ONLY;


-- Cererea 16: Optimizarea unei cereri
-- Cererea înainte de optimizare
SELECT a.NUME, a.PRENUME, s.NUME AS NUME_SECTIE
FROM ANGAJAT a, SECTIE s, CONTRACT c
WHERE a.ID_CONTRACT = c.NUMAR
AND c.ID_CONTRACT = d.ID_CONTRACT
AND a.ID_ANGAJAT = ss.ID_ANGAJAT
AND ss.ID_SECTIE = s.ID_SECTIE
AND a.PRENUME = 'John';

-- Cererea dupa optimizare
SELECT a.NUME, a.PRENUME, s.NUME AS NUME_SECTIE
FROM ANGAJAT a
JOIN CONTRACT c ON a.ID_CONTRACT = c.NUMAR
JOIN DIRECTOR d ON c.ID_CONTRACT = d.ID_CONTRACT
JOIN SECTIE_SECTOR ss ON a.ID_ANGAJAT = ss.ID_ANGAJAT
JOIN SECTIE s ON ss.ID_SECTIE = s.ID_SECTIE
WHERE a.PRENUME = 'John';

-- Cererea 17a: Realizarea normalizarii BCNF, FN4, FN5


-- Cererea 17b: Aplicarea denormaliz?rii, justificând necesitatea acesteia
-- Exemplu de denormalizare prin ad?ugarea unei coloane redundante în tabelul ANIMAL
ALTER TABLE ANIMAL ADD COLUMN NUME_VETERINAR VARCHAR(255);
UPDATE ANIMAL a
SET NUME_VETERINAR = (
    SELECT v.NUME
    FROM VETERINAR v
    WHERE v.CNP = a.ID_VETERINAR
);
