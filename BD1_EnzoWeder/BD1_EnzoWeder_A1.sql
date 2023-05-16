DROP TABLE IF EXISTS fornecedores, produtos, vendas, vendas_produtos CASCADE;

CREATE TABLE fornecedores (
	cnpj int PRIMARY KEY,
	razaoSocial text NOT NULL,
	endereco text NOT NULL
);

CREATE TABLE produtos (
	cod int PRIMARY KEY,
	descricao text NOT NULL,
	qtde int NOT NULL,
	fornecedor int NOT NULL,
	CONSTRAINT fornecedor_fk FOREIGN KEY (fornecedor) REFERENCES fornecedores(cnpj)
);

CREATE TABLE vendas (
	cod int PRIMARY KEY,
	data_venda date NOT NULL
);

CREATE TABLE vendas_produtos (
	cod_venda int NOT NULL,
	cod_produto int NOT NULL,
	CONSTRAINT cod_pk PRIMARY KEY (cod_venda, cod_produto),
	CONSTRAINT cod_venda_fk FOREIGN KEY (cod_venda) REFERENCES vendas(cod),
	CONSTRAINT cod_produto_fk FOREIGN KEY (cod_produto) REFERENCES produtos(cod)
);


INSERT INTO fornecedores VALUES (10, 'A', 'A'),
(20, 'B', 'B'),
(30, 'C', 'C'),
(40, 'D', 'D'),
(50, 'E', 'E'),
(60, 'F', 'F'),
(70, 'G', 'G'),
(80, 'H', 'H'),
(90, 'I', 'I'),
(100, 'J', 'J');

INSERT INTO produtos VALUES (1, 'AA', 10, 10),
(2, 'BB', 10, 20),
(3, 'CC', 10, 30),
(4, 'DD', 10, 40),
(5, 'EE', 10, 50),
(6, 'FF', 10, 60),
(7, 'GG', 10, 70),
(8, 'HH', 10, 80),
(9, 'II', 10, 90),
(10, 'JJ', 10, 100);

INSERT INTO vendas VALUES (1000, '2023/05/16'),
(2000, '2023/05/16'),
(3000, '2023/05/16'),
(4000, '2023/05/16'),
(5000, '2023/05/16'),
(6000, '2023/05/16'),
(7000, '2023/05/16'),
(8000, '2023/05/16'),
(9000, '2023/05/16'),
(10000, '2023/05/16');

INSERT INTO vendas_produtos VALUES (1000, 5),
(2000, 5),
(3000, 5),
(4000, 5),
(5000, 5),
(6000, 5),
(7000, 5),
(8000, 5),
(9000, 5),
(10000, 5);

ALTER TABLE produtos DROP CONSTRAINT fornecedor_fk;
ALTER TABLE vendas_produtos DROP CONSTRAINT cod_venda_fk;
ALTER TABLE vendas_produtos DROP CONSTRAINT cod_produto_fk;
UPDATE produtos SET descricao = 'Fiat Uno 2008' WHERE fornecedor > 90;
UPDATE produtos SET descricao = 'Chevrolet Onix 2014' WHERE fornecedor = 90;
DELETE FROM produtos WHERE fornecedor = 80;

UPDATE fornecedores SET razaosocial = 'Fiat' WHERE razaosocial = 'J';
UPDATE fornecedores SET razaosocial = 'Chevrolet' WHERE razaosocial = 'I';
DELETE FROM fornecedores WHERE razaosocial = 'A';

UPDATE vendas SET data_venda = '2024/05/16' WHERE data_venda = '2023/05/16';
UPDATE vendas SET data_venda = '2023/05/16' WHERE cod = 1000;
DELETE FROM vendas WHERE cod = 2000;

UPDATE vendas_produtos SET cod_produto = 6 WHERE cod_venda = 2000;
UPDATE vendas_produtos SET cod_produto = 8 WHERE cod_venda > 2000;
DELETE FROM vendas_produtos WHERE cod_venda > 2000;