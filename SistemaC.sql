CREATE TABLE state(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE country(
id INT IDENTITY(1,1) PRIMARY KEY,
Name VARCHAR(50)
);

CREATE TABLE typepay(
id INT IDENTITY(1,1) PRIMARY KEY,
Type VARCHAR(50)
);

CREATE TABLE typeornato(
id INT IDENTITY(1,1) PRIMARY KEY,
Cost INT,
Salaryrange VARCHAR(50)
);

CREATE TABLE position(
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
Gender VARCHAR(1),
Address VARCHAR(100),
idcountry INT,
idmunicipio INT,
FOREIGN KEY (idcountry) REFERENCES country (id),
FOREIGN KEY (idmunicipio) REFERENCES municipio (id)
);

CREATE TABLE ornato(
idornato INT IDENTITY(1,1) PRIMARY KEY,
idperson VARCHAR(50),
idtypeornato INT,
FOREIGN KEY (idperson) REFERENCES person (cui),
FOREIGN KEY (idtypeornato) REFERENCES typeornato (id)
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
idemployee INT IDENTITY(1,1) PRIMARY KEY,
phone VARCHAR(20),
email VARCHAR(45),
Address VARCHAR(100),
idperson VARCHAR(50),
idlocation INT,
idposition INT,
FOREIGN KEY (idperson) REFERENCES person (cui),
FOREIGN KEY (idlocation) REFERENCES location (idlocation),
FOREIGN KEY (idposition) REFERENCES position (id)
);

CREATE TABLE payment(
idpayment INT IDENTITY(1,1) PRIMARY KEY,
idperson VARCHAR(50),
idtypepay INT,
FOREIGN KEY (idperson) REFERENCES person (cui),
FOREIGN KEY (idtypepay) REFERENCES typepay (id),
dateof DATE,
datemod DATE,
idemployee INT,
FOREIGN KEY (idemployee) REFERENCES employee (idemployee),
);

