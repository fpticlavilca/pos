create table catalogStatus(
	idCatalogStatus int auto_increment,
	primary key(idCatalogStatus),
    name varchar(35)
);
create table catalogGenre(
	idCatalogGenre int auto_increment,
    primary key(idCatalogGenre),
    name varchar(2)
);

create table catalogSize(
	idCatalogSize int auto_increment,
    primary key(idCatalogSize),
    name varchar(35)
);

create table catalogColor(
	idCatalogColor int auto_increment,
    primary key(idCatalogColor),
    name varchar(6)
);

create table catalogTag(
	idCatalogTag int auto_increment,
    primary key(idCatalogTag),
    name varchar(35),
    idCatalogStatus int,
    foreign key (idCatalogStatus) references catalogStatus(idCatalogStatus)
    
);


