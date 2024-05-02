
create table horarios(
	id_horario serial primary key,
	horario time,
	dia_semana varchar(20)
);

create table unidades_academicas (
	id_unidade serial primary key,
	nome_unidade varchar(20)
);

create table disciplinas(
	id_disciplina serial primary key, 
	nome_disciplina varchar(50)
);

create table funcoes(
	id_funcao serial primary key,
	nome_funcao varchar(20)
);


create table alunos(
	matricula_aluno serial primary key,
	nome_completo varchar(100),
	email varchar(100),
	mensalidade decimal(10,2)
);


create table contratados(
	id_contratado serial primary key,
	id_unidade int references unidades_academicas(id_unidade),
	data_inicio date,
	nome_completo varchar(100),
	email varchar(100) ,
	salario decimal(10,2)
);

create table dependentes (
	id_dependentes serial primary key,
	id_contratado int references contratados(id_contratado),
	nome_dependente varchar(100),
	parentesco varchar(20)
	
)


create table professores(
	matricula_professor serial primary key,
	id_contratado int references contratados(id_contratado),
	formacao varchar(30)
);

create table funcionarios(
	matricula_funcionario serial primary key,
	id_contratado int references contratados(id_contratado),
	id_funcao int references funcoes(id_funcao)
);


create table turmas(
	id_turma serial primary key,
	matricula_professor int references professores(matricula_professor),
	id_disciplina int references disciplinas(id_disciplina),
	id_horario int references horarios(id_horario)
);

create table alunos_turmas(
	id_turma int references turmas(id_turma),
	matricula_aluno int references alunos(matricula_aluno),
	primary key(id_turma, matricula_aluno)
);


