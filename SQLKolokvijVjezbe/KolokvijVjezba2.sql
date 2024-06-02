use master;
go
drop database if exists KolokvijVjezba2;
go
create database KolokvijVjezba2;
go

use KolokvijVjezba2;

create table Decko(
Sifra int not null primary key identity(1,1),
Indiferentno bit null,
vesta varchar(34) null,
asocijalno bit not null
);

create table Decko_Zarucnica(
Sifra int not null primary key identity(1,1),
Decko int not null,
Zarucnica int not null
);

create table Zarucnica(
Sifra int not null primary key identity(1,1),
Narukvica int null,
Bojakose varchar(37) not null,
Novcica decimal(15,9) null,
Lipa decimal(15,8) not null,
Indiferentno bit not null
);

create table Cura(
Sifra int not null primary key identity(1,1),
Haljina varchar(33) not null,
Drugiputa datetime not null,
Suknja varchar(38) null,
Narukvica int null,
Introvertno bit null,
Majica varchar(40) not null,
Decko int null
);

create table Neprijatelj(
Sifra int not null primary key identity(1,1),
Majica varchar(32) null,
Haljina varchar(43) not null,
Lipa decimal(16,8) null,
Modelnaocala varchar(49) not null,
Kuna decimal(12,6) not null,
Jmbag char(11) null,
Cura int null
);

create table Brat(
Sifra int not null primary key identity(1,1),
Suknja varchar(47) null,
Ogrlica int not null,
Asocijalno bit not null,
Neprijatelj int not null
);

create table Prijatelj(
Sifra int not null primary key identity(1,1),
Modelnaocala varchar(37) null,
Treciputa datetime not null,
Ekstroventno bit not null,
Prviputa datetime null,
Svekar int null
);

create table Svekar(
Sifra int not null primary key identity(1,1),
Stilfrizure varchar(48) null,
Ogrlica int not null,
Asocijalno bit not null
);

alter table Decko_Zarucnica add foreign key (Decko) references Decko(Sifra);
alter table Decko_Zarucnica add foreign key (Zarucnica) references Zarucnica(Sifra);
alter table Cura add foreign key (Decko) references Decko(Sifra);
alter table Neprijatelj add foreign key (Cura) references Cura(Sifra);
alter table Brat add foreign key (Neprijatelj) references Neprijatelj(Sifra);
alter table Prijatelj add foreign key (Svekar) references Svekar(Sifra);