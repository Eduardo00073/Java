Create table estado(
idestado serial primary key,
nomeestado varchar(100) not null,
siglaestado varchar(2) not null
);

insert into estado (nomeestado, siglaestado) 
values ('São paulo', 'SP');

create table cidade(
    idcidade serial primary key,
    nomecidade varchar(100) not null,
    situacao varchar(1) not null,
    idestado int not null,
    constraint fk_estado foreign key (idestado) references estado(idestado)

);

insert into cidade (nomecidade, situacao, idestado) values ('Fernandópolis','A', 1);
insert into cidade (nomecidade, situacao, idestado) values ('Jales','A', 1);

create table despesa(
    iddespesa serial primary key,
    descricao varchar(100) not null,
    datadocumento date not null,
    valordespesa numeric(15,2) not null,
    valorpago numeric(15,2),
    imagemdocumento text
);