insert into location (Name,Description,Address,
idboss, idcountry, idmunicipio) values
('La Esperanza','Centro', 'Direccion esp', 
CONCAT('9010',Cast((floor(rand()*(100000-1+1))+1) as char)),
1,285),
('Olintepeque','barrios', 'Direccion oli', 
CONCAT('9010',Cast((floor(rand()*(100000-1+1))+1) as char)),
1,14),
('HUEHUETENANGO','Centro', 'Direccion h', 
CONCAT('9010',Cast((floor(rand()*(100000-1+1))+1) as char)),
1,143),
('Cayala','Centro', 'Direccion guate', 
CONCAT('9010',Cast((floor(rand()*(100000-1+1))+1) as char)),
1,319),
('Oakland','Centro', 'Direccion guate', 
CONCAT('9010',Cast((floor(rand()*(100000-1+1))+1) as char)),
1,180);

