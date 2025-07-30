CREATE TABLE oras (
   id INTEGER PRIMARY KEY,
   nume_oras VARCHAR(255)
);
INSERT INTO oras (id, nume_oras) VALUES (1, 'Craiova');
INSERT INTO oras (id, nume_oras) VALUES (2, 'Craiovita');
INSERT INTO oras (id, nume_oras) VALUES (3, 'Craiova Noua');

CREATE TABLE spital (
   id INTEGER PRIMARY KEY,
   nume_spital VARCHAR(255),
   id_oras INTEGER,
   FOREIGN KEY (id_oras) REFERENCES oras(id)
);
INSERT INTO spital (id, nume_spital, id_oras) VALUES (1, 'Filantropia', 1);
INSERT INTO spital (id, nume_spital, id_oras) VALUES (2, 'Spitalul nr unu',1);
INSERT INTO spital (id, nume_spital, id_oras) VALUES (3, 'Cai Ferate',1);

CREATE TABLE manager (
   id INTEGER PRIMARY KEY,
   nume_manager VARCHAR(255),
   profesie VARCHAR(255),
   id_spital INTEGER,
   FOREIGN KEY (id_spital) REFERENCES spital(id)
);
INSERT INTO manager (id, nume_manager, profesie, id_spital) VALUES (1, 'George Ion', 'ATI', 1);
INSERT INTO manager (id, nume_manager, profesie, id_spital) VALUES (2, 'Maricica Mirela', 'Asistenta', 2);
INSERT INTO manager (id, nume_manager, profesie, id_spital) VALUES (3, 'Popescu Radu', 'Pediatru', 3);


CREATE TABLE salon (
   id INTEGER PRIMARY KEY,
   nume_salon VARCHAR(255),
   id_spital INTEGER,
   FOREIGN KEY (id_spital) REFERENCES spital(id)
);
INSERT INTO salon (id, nume_salon, id_spital)VALUES (1, 'Salon 1', 1);
INSERT INTO salon (id, nume_salon, id_spital)VALUES (2, 'Salon 2', 1);
INSERT INTO salon (id, nume_salon, id_spital)VALUES (3, 'Salon 3', 1);


CREATE TABLE asistenta (
   id INTEGER PRIMARY KEY,
   nume_asistenta VARCHAR(255),
   id_salon INTEGER,
   FOREIGN KEY (id_salon) REFERENCES salon(id)
);
INSERT INTO asistenta (id, nume_asistenta, id_salon) VALUES (1, 'Alina', 1);
INSERT INTO asistenta (id, nume_asistenta, id_salon) VALUES (2, 'Stefan', 2);
INSERT INTO asistenta (id, nume_asistenta, id_salon) VALUES (3, 'Catalin', 1);
INSERT INTO asistenta (id, nume_asistenta, id_salon) VALUES (4, 'Evelina', 2);

CREATE TABLE supraveghere (
   id_asistenta INTEGER,
   id_salon INTEGER,
   FOREIGN KEY (id_asistenta) REFERENCES asistenta(id),
   FOREIGN KEY (id_salon) REFERENCES salon(id),
   PRIMARY KEY (id_asistenta, id_salon)
);
INSERT INTO supraveghere (id_asistenta, id_salon)values (1, 1);
INSERT INTO supraveghere (id_asistenta, id_salon)VALUES (2, 2);
INSERT INTO supraveghere (id_asistenta, id_salon)VALUES (3, 2);


CREATE TABLE internari (
  id_internare INT PRIMARY KEY,
  id_salon INT,
  nume_pacient VARCHAR(50),
  data_internare DATE,
constraint FK_salon foreign key(id_salon) references salon(id)
);
INSERT INTO internari VALUES (1, 1, 'Maria Petricica', to_date('2022-01-01','yyyy-mm-dd'));
INSERT INTO internari VALUES (2, 2, 'Iulian Dobre', to_date('2022-05-12','yyyy-mm-dd'));



CREATE TABLE externari (
  id_externare INT PRIMARY KEY,
  id_salon INT,
  nume_pacient VARCHAR(50),
  data_externare DATE,
  constraint FK_salon1 foreign key(id_salon) references salon(id)
);
INSERT INTO externari (id_externare, id_salon, nume_pacient, data_externare)VALUES (1, 1, 'Mama Mariei', to_date('2022-04-01','yyyy-mm-dd'));
INSERT INTO externari (id_externare, id_salon, nume_pacient, data_externare)VALUES (2, 2, 'Maria Petricica', to_date('2022-05-11','yyyy-mm-dd'));

CREATE TABLE sofer (
  id_sofer INT PRIMARY KEY,
  nume_sofer VARCHAR(50),
  tura INT
);
INSERT INTO sofer (id_sofer, nume_sofer, tura)VALUES (1, 'Mihai Marinescu', 1);
INSERT INTO sofer (id_sofer, nume_sofer, tura)VALUES (2, 'Ion Popescu', 2);
INSERT INTO sofer (id_sofer, nume_sofer, tura)VALUES (3, 'Vasile Popescu', 3);



CREATE TABLE ambulanta (
  id_ambulanta INT PRIMARY KEY,
  numar_ambulanta VARCHAR(10),
  id_sofer INT,
  FOREIGN KEY (id_sofer) REFERENCES sofer(id_sofer)
   
);
INSERT INTO ambulanta (id_ambulanta, numar_ambulanta, id_sofer)VALUES (1, '123', 1);
INSERT INTO ambulanta (id_ambulanta, numar_ambulanta, id_sofer)VALUES (2, '456', 2);
INSERT INTO ambulanta (id_ambulanta, numar_ambulanta, id_sofer)VALUES (3, '789', 3);




drop table sofer;
drop table ambulanta;
drop table externari;
drop table internari;
drop table supraveghere;
drop table asistenta;
drop table salon;
drop table spital;
drop table oras;
drop table manager;

select * from sofer;
select * from ambulanta;
select * from externari;
select * from internari;
select * from supraveghere;
select * from asistenta;
select * from salon;
select * from spital;
select * from oras;
select * from manager