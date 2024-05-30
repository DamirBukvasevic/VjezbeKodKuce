use master;
go
drop database if exists zupanijeiopcine;
go
create database zupanijeiopcine collate Croatian_CI_AS;
go

use zupanijeiopcine;


create table zupanija(
sifra int not null primary key identity(1,1),
naziv varchar(50) not null,
zupan int not null
);

create table opcina(
sifra int not null primary key identity(1,1),
zupanija int not null,
naziv varchar(50) not null
);

create table mjesto(
sifra int not null primary key identity(1,1),
opcina int not null,
naziv varchar(50) not null
);

create table zupan(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(50)not null
);

alter table opcina add foreign key (zupanija) references zupanija(sifra);
alter table mjesto add foreign key (opcina) references opcina(sifra);
alter table zupanija add foreign key (zupan) references zupan(sifra);


--select * from zupanija;
-- 1 - 3
insert into zupanija (naziv) values
('Osjecko-Baranjska'),
('Vukovarsko-Srijemska'),
('Primorsko-Goranska');


--select * from zupan;
-- 1 - 3
insert into zupan (ime, prezime) values
('Damir','Bukvasevic1'),
('Damir','Bukvasevic2'),
('Damir','Bukvasevic3');


--select * from opcina;
-- 1 - 3
insert into opcina (naziv) values
('Antunovac'),
('Bilje'),
('Bizovac');