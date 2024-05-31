use master;
go
drop database if exists KolokvijVjezba1;
go
create database KolokvijVjezba1;
go

use KolokvijVjezba1;

create table Sestra(
Sifra int not null primary key identity(1,1),
IntroVertno bit null,
Haljina varchar(31) not null,
Maraka decimal(16,6) null,
Hlace varchar(46) not null,
Narukvica int not null
);

create table Zena(
Sifra int not null primary key identity(1,1),
Treciputa datetime null,
Hlace varchar(46) null,
Kratkamajica varchar(31) not null,
Jmbag char(11) not null,
Bojaociju varchar(39) not null,
Haljina varchar(44) null,
Sestra int not null
);

create table Muskarac(
Sifra int not null primary key identity(1,1),
Bojaociju varchar(50) not null,
Hlace varchar(30) null,
Modelnaocala varchar(43) null,
Maraka decimal(14,5) not null,
Zena int not null
);

create table Mladic(
Sifra int not null primary key identity(1,1),
Suknja varchar(50) not null,
Kuna decimal(16,8) not null,
Drugiputa datetime null,
Asocijalno bit null,
Ekstroventno bit not null,
Dukserica varchar(48) not null,
Muskarac int null
);

create table Punac(
Sifra int not null primary key identity(1,1),
Ogrlica int null,
Gustoca decimal(14,9) null,
Hlace varchar(41) not null
);

create table Cura(
Sifra int not null primary key identity(1,1),
Novcica decimal(16,5) not null,
Gustoca decimal(18,6) not null,
Lipa decimal(13,10) null,
Ogrlica int not null,
Bojakose varchar(38) null,
Suknja varchar(36) null,
Punac int null
);

create table Sestra_Svekar(
Sifra int not null primary key identity(1,1),
Sestra int not null,
Svekar int not null
);

create table Svekar(
Sifra int not null primary key identity(1,1),
Bojaociju varchar(50) not null,
Prstena int null,
Dukserica varchar(41) null,
Lipa decimal(13,8) null,
Eura decimal(12,7) null,
Majica varchar(35) null
);

alter table Zena add foreign key (Sestra) references Sestra(Sifra);
alter table Muskarac add foreign key (Zena) references Zena(Sifra);
alter table Mladic add foreign key (Muskarac) references Muskarac(Sifra);
alter table Sestra_Svekar add foreign key (Sestra) references Sestra(Sifra);
alter table Sestra_Svekar add foreign key (Svekar) references Svekar(Sifra);
alter table Cura add foreign key (Punac) references Punac(Sifra);

-- INSERT NAREDBE
--select * from Sestra;
insert into Sestra (IntroVertno, Haljina, Maraka, Hlace, Narukvica)values
('1','Smeda',99.12,'Levisice',1),
('1','Crna',91.12,'Levisice',2),
('1','Plava',89.12,'Levisice',3);

--select * from Svekar;
insert into Svekar (Bojaociju, Prstena, Dukserica, Lipa, Eura, Majica)values
('Crna1',1,'Husky1',00.45,25.67,'Polo1'),
('Crna2',2,'Husky2',00.37,27.67,'Polo2'),
('Crna3',3,'Husky3',00.51,23.67,'Polo3');

--select * from Sestra_Svekar;
insert into Sestra_Svekar (Sestra, Svekar)values
(1,1),(2,2),(3,3);

--select * from Zena;
insert into Zena (Treciputa, Hlace, Kratkamajica, Jmbag, Bojaociju, Haljina, Sestra)values
('2024-01-12','Traperice1','Top1',12345678911,'Smeda1','MaxiHaljina1',1),
('2024-02-12','Traperice2','Top2',22345678912,'Smeda2','MaxiHaljina2',2),
('2024-03-12','Traperice3','Top3',32345678913,'Smeda3','MaxiHaljina3',3);

--select * from Muskarac;
insert into Muskarac (Bojaociju, Hlace, Modelnaocala, Maraka, Zena)values
('Crna1','Levisice1','Valentino1',120.15,1),
('Crna2','Levisice2','Valentino2',111.15,2),
('Crna3','Levisice3','Valentino3',109.15,3);

--select * from Mladic;
insert into Mladic (Suknja, Kuna, Drugiputa, Asocijalno, Ekstroventno, Dukserica, Muskarac)values
('SuknjaCrna1','27.65','2024-01-09','1','0','Pinoklo1',1),
('SuknjaCrna2','28.75','2024-02-09','1','0','Pinoklo2',2),
('SuknjaCrna3','29.85','2024-03-09','1','0','Pinoklo3',3);