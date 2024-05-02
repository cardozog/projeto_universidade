
create table cursos(
id_curso serial primary key,
nome_curso varchar(80)
);

create table horarios(
	id_horario serial primary key,
	horario time,
	dia_semana varchar(20)
);

create table unidades_academicas (
	id_unidade serial primary key,
	nome_unidade varchar(80)
);


create table disciplinas(
	id_disciplina serial primary key, 
	nome_disciplina varchar(50)
);

create table funcoes(
	id_funcao serial primary key,
	nome_funcao varchar(80)
);


create table alunos(
	matricula_aluno serial primary key,
	id_curso int references cursos(id_curso),
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
	
);


create table professores(
	matricula_professor serial primary key,
	id_contratado int references contratados(id_contratado),
	formacao varchar(80)
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
	id_horario int references horarios(id_horario),
	id_unidade int references unidades_academicas(id_unidade)
);

create table cursos_disciplinas(
id_curso int references cursos(id_curso),
id_disciplina int references disciplinas(id_disciplina),
primary key(id_curso,id_disciplina))

create table alunos_turmas(
	id_turma int references turmas(id_turma),
	matricula_aluno int references alunos(matricula_aluno),
	primary key(id_turma, matricula_aluno)
);

--populando todas as tabelas
	insert into cursos (nome_curso) values
	('Ciência da Computação'),
	('Engenharia Civil'),
	('Letras'),
	('Medicina'),
	('Ciências Sociais');

insert into horarios (horario, dia_semana) values
('08:00:00', 'Segunda-feira'),
('10:00:00', 'Terça-feira'),
('13:00:00', 'Quarta-feira'),
('15:00:00', 'Quinta-feira'),
('17:00:00', 'Sexta-feira');

insert into unidades_academicas (nome_unidade) values
('Instituto de Ciências da Computação'),
('Faculdade de Engenharia'),
('Instituto de Letras'),
('Escola de Medicina'),
('Centro de Ciências Sociais');

insert into disciplinas (nome_disciplina) values
('Algoritmos e Estruturas de Dados'),
('Cálculo I'),
('Literatura Brasileira'),
('Anatomia Humana'),
('Economia');

insert into funcoes (nome_funcao) values
('Limpeza'),
('Administrativo'),
('Técnico'),
('Coordenador'),
('Secretário');

insert into alunos (id_curso,nome_completo, email, mensalidade) values
(1,'João Silva', 'joao.silva@example.com', 500.00),
(2,'Maria Santos', 'maria.santos@example.com', 550.00),
(3,'Pedro Oliveira', 'pedro.oliveira@example.com', 520.00),
(4,'Ana Souza', 'ana.souza@example.com', 530.00),
(5,'Carlos Pereira', 'carlos.pereira@example.com', 540.00);

insert into contratados (id_unidade, data_inicio, nome_completo, email, salario) values
(1, '2023-01-15', 'José Costa', 'jose.costa@example.com', 3000.00),
(2, '2022-08-20', 'Fernanda Lima', 'fernanda.lima@example.com', 3200.00),
(3, '2023-03-10', 'Roberto Almeida', 'roberto.almeida@example.com', 2800.00),
(4, '2023-05-05', 'Aline Oliveira', 'aline.oliveira@example.com', 3500.00),
(5, '2022-11-30', 'Paulo Santos', 'paulo.santos@example.com', 3300.00),
(1, '2023-02-10', 'Mariana Oliveira', 'mariana.oliveira@example.com', 2900.00),
(3, '2022-09-25', 'Lucas Martins', 'lucas.martins@example.com', 3100.00),
(2, '2023-04-15', 'Fernando Pereira', 'fernando.pereira@example.com', 3300.00),
(4, '2022-12-20', 'Juliana Costa', 'juliana.costa@example.com', 2800.00),
(5, '2023-06-05', 'Gabriel Alves', 'gabriel.alves@example.com', 3200.00);



insert into dependentes (id_contratado, nome_dependente, parentesco) values
(1, 'Filipe Costa', 'Filho'),
(4, 'Lúcia Oliveira', 'Esposa'),
(5, 'Rafael Santos', 'Filho'),
(3, 'Marcos Almeida', 'Filho'),
(2, 'Laura Lima', 'Filha');

insert into professores (id_contratado, formacao) values
(1, 'Doutor em Ciência da Computação'),
(2, 'Mestrado em Engenharia Civil'),
(3, 'Doutorado em Letras'),
(4, 'Mestrado em Medicina'),
(5, 'Doutorado em Economia');


INSERT INTO funcionarios (id_contratado, id_funcao) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 2),
(10, 4);

insert into turmas (matricula_professor, id_disciplina, id_horario,id_unidade) values
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

insert into alunos_turmas (id_turma, matricula_aluno) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

insert into cursos_disciplinas (id_curso,id_disciplina) values
(1,1),
(1,2),
(2,2),
(3,3),
(4,4),
(5,5);

select * from disciplinas d;
select * from cursos;

insert into alunos_turmas (id_turma, matricula_aluno) values (2,1);
-- criando views para os comandos select


--exibir quadro de horários geral para todas as unidades  
select 
	t.id_turma,
	d.nome_disciplina as disciplina,
	u.nome_unidade,
	c.nome_completo as professor, 
	h.dia_semana,
	h.horario 
from turmas t
	inner join disciplinas d on t.id_disciplina = d.id_disciplina
	inner join professores p on t.matricula_professor = p.matricula_professor 
	inner join contratados c on p.id_contratado = c.id_contratado 
	inner join unidades_academicas u on c.id_unidade = u.id_unidade 
	inner join horarios h on t.id_horario = h.id_horario ;



--exibir grade de matérias dos alunos
create or replace view grade_materias_alunos as 
select 
	a.matricula_aluno, 
	d.nome_disciplina, 
	u.nome_unidade,
	concat (h.dia_semana, ' - ' ,h.horario ) as "Horário"
from turmas t
	inner join alunos_turmas on alunos_turmas.id_turma = t.id_turma
	inner join alunos a on a.matricula_aluno = alunos_turmas.matricula_aluno
	inner join unidades_academicas u on u.id_unidade = t.id_unidade
	inner join horarios h on h.id_horario = t.id_horario
	inner join disciplinas d on d.id_disciplina = t.id_disciplina
	order by matricula_aluno;

--exibir lista de professores da universidade
create or replace view lista_professores as
select 
	p.matricula_professor as "Matrícula",
	c.nome_completo as "Nome",
	formacao as "Formação",
	u.nome_unidade as "Unidade" 
	from professores p 
inner join contratados c on p.id_contratado = c.id_contratado 
inner join unidades_academicas u on c.id_unidade = u.id_unidade;


-- exibir lista de funcionarios da universidade
create or replace view lista_funcionarios as
select 
	f.matricula_funcionario as "Matrícula",
	c.nome_completo as "Nome", 
	funcoes.nome_funcao as "Função",
	u.nome_unidade as "Unidade" 
from funcionarios f 
	inner join contratados c on f.id_contratado =c.id_contratado 
	inner join funcoes on funcoes.id_funcao = f.id_funcao
	inner join unidades_academicas u on c.id_unidade = u.id_unidade ;


-- exibir lista de alunos da universidade
create or replace view lista_alunos as
select 
	a.matricula_aluno,
	c.nome_curso,
	a.nome_completo, 
	a.email,
	a.mensalidade
	from alunos a
	inner join cursos c on a.id_curso = c.id_curso;
drop view lista_alunos ;

-- listar disciplinas com base no curso
create or replace view disciplinas_por_curso as 
select 
	c.id_curso,
	c.nome_curso,
	d.nome_disciplina
from cursos_disciplinas cd 
inner join cursos c on c.id_curso =cd.id_curso 
inner join disciplinas d on d.id_disciplina = cd.id_disciplina ;

select  * from grade_materias_alunos;
select  * from grade_materias_alunos where matricula_aluno =1;

select * from lista_alunos;
select * from lista_funcionarios;
select * from lista_professores;
select * from disciplinas_por_curso;


