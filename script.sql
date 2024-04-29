create table horarios(
	id_horario serial primary key,
	dia_semana varchar(20),
	horario time
);

create table unidades_academicas (
	id_unidade serial primary key,
	nome_unidade varchar(20)
);

create table disciplinas(
	id_disciplina serial primary key, 
	nome_disciplina varchar(50)
);

create table alunos(
	matricula_aluno serial primary key,
	nome_completo varchar(100),
	email varchar(100),
	valor_mensalidade decimal(10,2),
	id_unidade int,
	constraint fk_id_unidade foreign key (id_unidade) references unidades_academicas(id_unidade)
);



create table professores(
	matricula_professor serial primary key,
	nome_completo varchar(100),
	email varchar(100) ,
	salario decimal(10,2),
	formacao varchar(30),
	data_inicio date,
	id_unidade int,
	constraint fk_id_unidade foreign key (id_unidade) references unidades_academicas(id_unidade)
);

create table funcionarios(
	matricula_funcionario serial primary key,
	nome_completo varchar(100),
	email varchar(100),
	salario decimal(10,2),
	funcao varchar(50),
	data_inicio date,
	id_unidade int,
	constraint fk_id_unidade foreign key (id_unidade) references unidades_academicas(id_unidade)
);

create table turmas(
	id_turma serial primary key,
	id_disciplina int,
	id_horario int,
	matricula_professor int,
	constraint fk_matricula_professor foreign key(matricula_professor) references professores,
	constraint fk_id_horario foreign key(id_horario) references horarios,
	constraint fk_id_disciplina foreign key(id_disciplina) references disciplinas
);

create table alunos_turmas(
	id_turma int,
	matricula_aluno int,
	primary key(id_turma, matricula_aluno)
);


