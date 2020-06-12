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

CREATE TABLE jobposition(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Description VARCHAR(150)
);

CREATE TABLE municipio(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
idstate INT,
FOREIGN KEY (idstate) REFERENCES state (id)
);

CREATE TABLE person(
cui VARCHAR(50) PRIMARY KEY,
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
);

CREATE TABLE location(
idlocation INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50),
Description VARCHAR(150),
Address VARCHAR(100),
idboss VARCHAR(50),
idcountry INT,
idmunicipio INT,
FOREIGN KEY (idboss) REFERENCES person (cui),
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id)
);

CREATE TABLE employee(
empcod INT IDENTITY(1,1) PRIMARY KEY,
phone VARCHAR(20),
email VARCHAR(45),
Address VARCHAR(100),
idperson VARCHAR(50),
idmunicipio INT,
idposition INT,
FOREIGN KEY (idperson) REFERENCES person (cui),
FOREIGN KEY (idmunicipio) REFERENCES municipio(id),
FOREIGN KEY (idposition) REFERENCES jobposition (id)
);

CREATE TABLE birthcert(
L_F_P INT PRIMARY KEY,
idmom VARCHAR(50),
iddad VARCHAR(50),
cuiperson VARCHAR(50),
FOREIGN KEY (idmom) REFERENCES person (cui),
FOREIGN KEY (iddad) REFERENCES person (cui),
FOREIGN KEY (cuiperson) REFERENCES person (cui)
);

CREATE TABLE certificate(
numdoc INT IDENTITY(10000,1) PRIMARY KEY,
empcod INT,
idbirthcert INT,
FOREIGN KEY (empcod) REFERENCES employee (empcod),
FOREIGN KEY (idbirthcert) REFERENCES birthcert(L_F_P)
);

CREATE TABLE login(
empcod int,
username VARCHAR(20),
password VARCHAR(50),
FOREIGN KEY (empcod) REFERENCES employee (empcod)
);
