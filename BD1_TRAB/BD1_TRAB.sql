DROP TABLE IF EXISTS funcionario, funcionario_telefone, filial, dvd, dvd_alugueis, filme, filme_elenco, filme_produtora, cliente, cliente_telefone, cliente_alugueis, aluguel  CASCADE;

CREATE TABLE filial (
	id_filial int PRIMARY KEY,
	endereco text NOT NULL,
	gerente int NOT NULL
);

CREATE TABLE funcionario (
	cpf int PRIMARY KEY,
	endereco text NOT NULL,
	data_nasc text NOT NULL,
	data_admissao text NOT NULL,
	filial_trabalha int NOT NULL
);

CREATE TABLE funcionario_telefone (
	cpf_func int NOT NULL,
	telefone int NOT NULL
);

CREATE TABLE dvd (
	id_dvd int PRIMARY KEY,
	disponivel boolean NOT NULL,
	filme int NOT NULL,
	data_criacao text NOT NULL,
	filial_possui int NOT NULL,
	alugado_por int NOT NULL
); 

CREATE TABLE dvd_alugueis (
	dvd int NOT NULL,
	aluguel int NOT NULL
); 

CREATE TABLE filme (
	id_filme int PRIMARY KEY,
	diretor text NOT NULL,
	data_lancamento TEXT NOT NULL,
	genero text NOT NULL,
	descricao text NOT NULL
);

CREATE TABLE filme_elenco (
    filme int NOT NULL,
	ator text NOT NULL
);

CREATE TABLE filme_produtora (
    filme int NOT NULL,
	produtora text NOT NULL
);

CREATE TABLE cliente (
	cpf int PRIMARY KEY,
	endereco text NOT NULL,
	data_nasc text NOT NULL,
	data_cadastro text NOT NULL
);

CREATE TABLE cliente_telefone (
    cpf_cliente int NOT NULL,
	telefone text NOT NULL
);

CREATE TABLE cliente_alugueis (
	cliente int NOT NULL,
	alugueis int NOT NULL
); 

CREATE TABLE aluguel (
	id_aluguel int PRIMARY KEY,
	data_inicial TEXT NOT NULL,
	data_entrega TEXT NOT NULL,
	filme int NOT NULL,
	cliente int NOT NULL
); 

ALTER TABLE dvd_alugueis ADD CONSTRAINT dvd_aluguel_pk PRIMARY KEY (dvd, aluguel);
ALTER TABLE filme_elenco ADD CONSTRAINT filme_ator_pk PRIMARY KEY (filme, ator);
ALTER TABLE filme_produtora ADD CONSTRAINT filme_produtora_pk PRIMARY KEY (filme, produtora);
ALTER TABLE cliente_telefone ADD CONSTRAINT cliente_telefone_pk PRIMARY KEY (cpf_cliente, telefone);
ALTER TABLE funcionario_telefone ADD CONSTRAINT func_telefone_pk PRIMARY KEY (cpf_func, telefone);

ALTER TABLE funcionario ADD CONSTRAINT filial_trabalha_fk FOREIGN KEY (filial_trabalha) REFERENCES filial(id_filial);
ALTER TABLE funcionario_telefone ADD CONSTRAINT cpf_func_fk FOREIGN KEY (cpf_func) REFERENCES funcionario(cpf);
ALTER TABLE cliente_telefone ADD CONSTRAINT cpf_cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf);
ALTER TABLE filial ADD CONSTRAINT gerente_fk FOREIGN KEY (gerente) REFERENCES funcionario(cpf);
ALTER TABLE dvd ADD CONSTRAINT filme_fk FOREIGN KEY (filme) REFERENCES filme(id_filme);
ALTER TABLE dvd ADD CONSTRAINT alugado_por_fk FOREIGN KEY (alugado_por) REFERENCES cliente(cpf);

ALTER TABLE aluguel ADD CONSTRAINT aluguel_filme_fk FOREIGN KEY (filme) REFERENCES filme(id_filme);
ALTER TABLE aluguel ADD CONSTRAINT aluguel_cliente_fk FOREIGN KEY (cliente) REFERENCES cliente(cpf);



