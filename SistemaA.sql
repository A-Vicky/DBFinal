CCREATE TABLE state(
id INT NOT NULL,
Name VARCHAR(50),
CONSTRAINT state_pk PRIMARY KEY (id)
);


CREATE SEQUENCE state_seq START WITH 1;

CREATE OR REPLACE TRIGGER statein
BEFORE INSERT ON state
FOR EACH ROW

BEGIN
  SELECT state_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE country(
id INT NOT NULL,
Name VARCHAR(50),
CONSTRAINT country_pk PRIMARY KEY (id)
);

CREATE SEQUENCE country_seq START WITH 1;

CREATE OR REPLACE TRIGGER countryin
BEFORE INSERT ON country
FOR EACH ROW

BEGIN
  SELECT country_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE civilstatus(
id INT NOT NULL,
Name VARCHAR(50)
CONSTRAINT civilstatus_pk PRIMARY KEY (id)
);

CREATE SEQUENCE civilstatus_seq START WITH 1;

CREATE OR REPLACE TRIGGER civilstatusin
BEFORE INSERT ON civilstatus
FOR EACH ROW

BEGIN
  SELECT civilstatus_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE jobposition(
id INT NOT NULL,
Name VARCHAR(50),
Description VARCHAR(150)
CONSTRAINT jobposition_pk PRIMARY KEY (id)
);

CREATE SEQUENCE jobposition_seq START WITH 1;

CREATE OR REPLACE TRIGGER jobpositionin
BEFORE INSERT ON country
FOR EACH ROW

BEGIN
  SELECT jobposition_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE municipio(
id INT NOT NULL,
Name VARCHAR(50),
idstate INT,
FOREIGN KEY (idstate) REFERENCES state (id)
CONSTRAINT municipio_pk PRIMARY KEY (id)
);

CREATE SEQUENCE municipio_seq START WITH 1;

CREATE OR REPLACE TRIGGER municipioin
BEFORE INSERT ON municipio
FOR EACH ROW

BEGIN
  SELECT municipio_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE person(
cui VARCHAR(50) NOT NULL,
Names VARCHAR(100),
Lnames VARCHAR(100),
Birthdate DATE,
municipionac INT,
FOREIGN KEY (municipionac) REFERENCES municipio (id),
Gender VARCHAR(1),
Address VARCHAR(100),
idcountry INT,
idmunicipio INT,
civilstatusid INT,
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id),
FOREIGN KEY (civilstatusid) REFERENCES civilstatus (id)
CONSTRAINT person_pk PRIMARY KEY (cui)
);

CREATE SEQUENCE personnum_seq START WITH 1;

CREATE OR REPLACE TRIGGER personin
BEFORE INSERT ON person
FOR EACH ROW

BEGIN
  SELECT '0901'||to_char(personnum_seq.NEXTVAL,'FM00')
  INTO   :new.cui from dual;
END;
/

CREATE TABLE location(
idlocation INT NOT NULL,
Name VARCHAR(50),
Description VARCHAR(150),
Address VARCHAR(100),
idboss VARCHAR(50),
idcountry INT,
idmunicipio INT,
FOREIGN KEY (idboss) REFERENCES person (cui),
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id)
CONSTRAINT location_pk PRIMARY KEY (id)
);

CREATE SEQUENCE location_seq START WITH 1;

CREATE OR REPLACE TRIGGER locationin
BEFORE INSERT ON location
FOR EACH ROW

BEGIN
  SELECT location_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE employee(
empcod INT NOT NULL,
phone VARCHAR(20),
email VARCHAR(45),
Address VARCHAR(100),
idperson VARCHAR(50),
idmunicipio INT,
idposition INT,
FOREIGN KEY (idperson) REFERENCES person (cui),
FOREIGN KEY (idmunicipio) REFERENCES municipio(id),
FOREIGN KEY (idposition) REFERENCES jobposition (id)
CONSTRAINT employee_pk PRIMARY KEY (id)
);

CREATE SEQUENCE employee_seq START WITH 1;

CREATE OR REPLACE TRIGGER employeein
BEFORE INSERT ON employee
FOR EACH ROW

BEGIN
  SELECT employee_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE birthcert(
L_F_P INT NOT NULL,
idmom VARCHAR(50),
iddad VARCHAR(50),
cuiperson VARCHAR(50),
FOREIGN KEY (idmom) REFERENCES person (cui),
FOREIGN KEY (iddad) REFERENCES person (cui),
FOREIGN KEY (cuiperson) REFERENCES person (cui)
CONSTRAINT birthcert_pk PRIMARY KEY (id)
);

CREATE SEQUENCE birthcert_seq START WITH 111;

CREATE OR REPLACE TRIGGER birthcertin
BEFORE INSERT ON birthcert
FOR EACH ROW

BEGIN
  SELECT birthcert_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE certificate(
numdoc INT PRIMARY KEY,
empcod INT,
idbirthcert INT,
FOREIGN KEY (empcod) REFERENCES employee (empcod),
FOREIGN KEY (idbirthcert) REFERENCES birthcert(L_F_P)
CONSTRAINT certificate_pk PRIMARY KEY (id)
);

CREATE SEQUENCE certificate_seq START WITH 1;

CREATE OR REPLACE TRIGGER certificatein
BEFORE INSERT ON certificate
FOR EACH ROW

BEGIN
  SELECT certificate_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

CREATE TABLE login(
empcod int,
username VARCHAR(20),
password VARCHAR(50),
FOREIGN KEY (empcod) REFERENCES employee (empcod)
);
