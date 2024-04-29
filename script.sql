create table tb_horarios(
	id_horario serial primary key,
	dia_semana varchar(20),
	horario time
);

create table tb_alunos(
	matricula_aluno serial primary key,
	nome_completo varchar(100),
	email varchar(100),
	valor_mensalidade decimal(10,2)
);

create table tb_disciplinas(
	id_disciplina int primary key, 
	nome_disciplina varchar(50)
);

create table tb_unidades_academicas (
	id_unidade serial primary key,
	nome_unidade varchar(20)
);

create table tb_professores(
	matricula_professor serial primary key,
	nome_completo varchar(100),
	email varchar(100) ,
	salario decimal(10,2),
	formacao varchar(30),
	data_inicio date,
	id_unidade int,
	constraint fk_id_unidade foreign key (id_unidade) references tb_unidades_academicas(id_unidade)
);

create table tb_funcionarios(
	matricula_funcionario serial primary key,
	nome_completo varchar(100),
	email varchar(100),
	salario decimal(10,2),
	funcao varchar(50),
	data_inicio date,
	id_unidade int,
	constraint fk_id_unidade foreign key (id_unidade) references tb_unidades_academicas(id_unidade)
);

create table tb_turmas(
	id_turma serial primary key,
	id_disciplina int,
	id_horario int,
	constraint fk_id_horario foreign key(id_horario) references tb_horarios,
	constraint fk_id_disciplina foreign key(id_disciplina) references tb_disciplinas
);

create table tb_alunos_turmas(
	id_turma int,
	matricula_aluno int,
	primary key(id_turma, matricula_aluno)
);

create table professores_turmas(
	id_professor int,							
	id_turma int, 
	primary key(id_professor,id_turma)					   
);