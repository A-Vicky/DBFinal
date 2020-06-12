Create Database SistemaB;
Use SistemaB;

CREATE TABLE state(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE country(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE civilstatus(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE crimetype(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE jobposition(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Descript VARCHAR(150)
);

CREATE TABLE statusofcrime(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Descript VARCHAR(150)
);

CREATE TABLE municipio(
id INT NOT NULL IDENTITY(1,1) PRIMARY KEY ,
Name VARCHAR(50),
idstate INT,
FOREIGN KEY (idstate) REFERENCES state (id)
);

CREATE TABLE person(
cui VARCHAR(50) PRIMARY KEY,
Names VARCHAR(100),
Lnames VARCHAR(100),
Birthdate DATE,
Gender VARCHAR(1),
Address VARCHAR(100),
idcountry INT,
idmunicipio INT,
civilstatusid INT,
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id),
FOREIGN KEY (civilstatusid) REFERENCES civilstatus (id)
);

CREATE TABLE family(
idmom VARCHAR(50),
iddad VARCHAR(50),
cuiperson VARCHAR(50),
FOREIGN KEY (idmom) REFERENCES person (cui),
FOREIGN KEY (iddad) REFERENCES person (cui),
FOREIGN KEY (cuiperson) REFERENCES person (cui)
);

CREATE TABLE locations(
idlocation INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Name VARCHAR(50),
Descript VARCHAR(150),
Address VARCHAR(100),
idboss VARCHAR(50),
idcountry INT,
idmunicipio INT,
FOREIGN KEY (idboss) REFERENCES person (cui),
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id)
);

CREATE TABLE agent(
badgeid INT IDENTITY(1,1) PRIMARY KEY,
cel VARCHAR(20),
phone VARCHAR(20),
idperson VARCHAR(50),
FOREIGN KEY (idperson) REFERENCES person (cui),
idposition INT,
FOREIGN KEY (idposition) REFERENCES jobposition (id),
idlocations INT,
FOREIGN KEY (idlocations) REFERENCES locations (idlocation)
);

CREATE TABLE crime(
arrestdoc INT IDENTITY(100,1) PRIMARY KEY,
dateofcrime date,
dateaprehended date,
timeinpreventivo VARCHAR(50),
fine int,
idcriminal VARCHAR(50),
FOREIGN KEY (idcriminal) REFERENCES person (cui),
idcrimetype int,
FOREIGN KEY (idcrimetype) REFERENCES crimetype (id),
idagentarrest int,
FOREIGN KEY (idagentarrest) REFERENCES agent (badgeid),
idstatus int,
FOREIGN KEY (idstatus) REFERENCES statusofcrime (id),
);

