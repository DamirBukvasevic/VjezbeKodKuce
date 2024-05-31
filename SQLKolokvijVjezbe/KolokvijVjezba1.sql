use master;
go
drop database if exists KolokvijVjezba1;
go
create database KolokvijVjezba1;
go

use KolokvijVjezba1;

create table sestra(
Sifra int not null primary key identity(1,1),
IntroVertno bit null,
Haljina varchar(31) not null,
Maraka decimal(16,6) null,
Hlace varchar(46) not null,
Narukvica int not null
);

create table Zena(
Sifra int not null primary key identity(1,1),
Trecuputa datetime null,
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