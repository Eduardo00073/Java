Create table estado (
	idestado serial primary key,
	nomeestado varchar(100) not null,
	siglaestado varchar(2) not null
);

insert into estado(nomeestado, siglaestado) values ('São paulo', 'SP');


create table cidade(
	idcidade serial primary key, 
        nomecidade varchar(255),
	situacao varchar(10),
	idestado int not null,
	constraint fk_estado foreign key (idestado) references estado(idestado)
);

INSERT INTO cidade (nomecidade, situacao, idestado) VALUES
    ('Rio de Janeiro', 'A', 1),
    ('Salvador', 'A', 1),
    ('Belo Horizonte', 'I', 1),
    ('Porto Alegre', 'I', 1);

create table despesa(
    iddespesa serial primary key,
    descricao varchar (100) not null,
    datadocumento date not null,
    valordespesa numeric(15,2) not null,
    valorpago numeric(15,2),
    imagemdocumento text
);

INSERT into despesa(descricao,datadocumento,valordespesa,valorpago)
values ('descricao','2021-08-23',20.5,10.5);
