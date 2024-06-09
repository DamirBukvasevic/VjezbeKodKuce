use master;
go
drop database if exists KolokvijVjezba3;
go
create database KolokvijVjezba3;
go

use KolokvijVjezba3;

create table Ostavljena(
Sifra int not null primary key identity(1,1),
Kuna decimal(17,5) null,
Lipa decimal(15,6) null,
Majica varchar(36) null,
Modelnaocala varchar(31) not null,
Prijatelj int null
);

create table Prijatelj(
Sifra int not null primary key identity(1,1),
Kuna decimal(16,10) null,
Haljina varchar(37) null,
Lipa decimal(13,10) null,
Dukserica varchar(31) null,
Indiferentno bit not null
);

create table Prijatelj_Brat(
Sifra int not null primary key identity(1,1),
Prijatelj int not null,
Brat int not null
);

create table Brat(
Sifra int not null primary key identity(1,1),
Jmbag char(11) null,
Ogrlica int not null,
Ekstroventno bit not null
);

create table Snasa(
Sifra int not null primary key identity(1,1),
Introventno bit null,
Kuna decimal(15,6) not null,
Eura decimal(12,9) not null,
Trecuputa datetime null,
Ostavljena int not null
);

create table Punica(
Sifra int not null primary key identity(1,1),
Asocijalno bit null,
Kratkamajica varchar(44) null,
Kuna decimal(13,8) not null,
Vesta varchar(32) not null,
Snasa int null
);

create table Svekar(
Sifra int not null primary key identity(1,1),
Novcica decimal(16,8) not null,
Suknja varchar(44) not null,
Bojakose varchar(36) null,
Prstena int null,
Narukvica int not null,
Cura int not null
);

create table Cura(
Sifra int not null primary key identity(1,1),
Dukserica varchar(49) null,
Maraka decimal(13,7) null,
Drugiputa datetime null,
Majica varchar(49) null,
Novcica decimal(15,8) null,
Ogrlica int not null
);

alter table Ostavljena add foreign key (Prijatelj) references Prijatelj(Sifra);
alter table Prijatelj_Brat add foreign key (Prijatelj) references Prijatelj(Sifra);
alter table Prijatelj_Brat add foreign key (Brat) references Brat(Sifra);
alter table Snasa add foreign key (Ostavljena) references Ostavljena(Sifra);
alter table Punica add foreign key (Snasa) references Snasa(Sifra);
alter table Svekar add foreign key (Cura) references Cura(Sifra);