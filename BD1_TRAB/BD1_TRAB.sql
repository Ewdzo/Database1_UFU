DROP TABLE IF EXISTS funcionario, funcionario_telefone, filial, dvd, dvd_alugueis, filme, filme_elenco, filme_produtora, cliente, cliente_telefone, cliente_alugueis, aluguel  CASCADE;

CREATE TABLE filme (
	id_filme int PRIMARY KEY,
	nome text NOT NULL,
	diretor text NOT NULL,
	data_lancamento TEXT NOT NULL,
	genero text NOT NULL,
	descricao text NOT NULL
);

CREATE TABLE cliente (
	cpf int PRIMARY KEY,
	endereco text NOT NULL,
	data_nasc text NOT NULL,
	data_cadastro text NOT NULL
);

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

CREATE TABLE dvd (
	id_dvd int PRIMARY KEY,
	disponivel boolean NOT NULL,
	filme int NOT NULL,
	data_criacao text NOT NULL,
	filial_possui int NOT NULL,
	alugado_por int NOT NULL
); 

CREATE TABLE aluguel (
	id_aluguel int PRIMARY KEY,
	data_inicial TEXT NOT NULL,
	data_entrega TEXT NOT NULL,
	filme int NOT NULL,
	cliente int NOT NULL
); 

CREATE TABLE filme_elenco (
    filme int NOT NULL,
	ator text NOT NULL
);

CREATE TABLE filme_produtora (
    filme int NOT NULL,
	produtora text NOT NULL
);

CREATE TABLE funcionario_telefone (
	cpf_func int NOT NULL,
	telefone int NOT NULL
);

CREATE TABLE dvd_alugueis (
	dvd int NOT NULL,
	aluguel int NOT NULL
); 

CREATE TABLE cliente_telefone (
    cpf_cliente int NOT NULL,
	telefone text NOT NULL
);

CREATE TABLE cliente_alugueis (
	cliente int NOT NULL,
	alugueis int NOT NULL
); 

ALTER TABLE dvd_alugueis ADD CONSTRAINT dvd_aluguel_pk PRIMARY KEY (dvd, aluguel);
ALTER TABLE filme_elenco ADD CONSTRAINT filme_ator_pk PRIMARY KEY (filme, ator);
ALTER TABLE filme_produtora ADD CONSTRAINT filme_produtora_pk PRIMARY KEY (filme, produtora);
ALTER TABLE cliente_telefone ADD CONSTRAINT cliente_telefone_pk PRIMARY KEY (cpf_cliente, telefone);
ALTER TABLE funcionario_telefone ADD CONSTRAINT func_telefone_pk PRIMARY KEY (cpf_func, telefone);

INSERT INTO filme VALUES (1, 'Duna', 'Denis Villeneuve', '21/10/2021', 'Ficção Científica', 'Paul Atreides é um jovem brilhante, dono de um destino além de sua compreensão. Ele deve viajar para o planeta mais perigoso do universo para garantir o futuro de seu povo.'),
(2, 'Duna 2', 'Denis Vileneuve', '02/11/2023', 'Ficção Científica', 'Paul Atreides se une a Chani e aos Fremen enquanto busca vingança contra os conspiradores que destruíram sua família. Enfrentando uma escolha entre o amor de sua vida e o destino do universo, ele deve evitar um futuro terrível que só ele pode prever.'),
(3, 'Blade Runner', 'Ridley Scott', '25/12/1982', 'Ficção Científica', 'No século 21, uma corporação desenvolve clones humanos para serem usados como escravos em colônias fora da Terra, identificados como replicantes. Em 2019, um ex-policial é acionado para caçar um grupo fugitivo vivendo disfarçado em Los Angeles.'),
(4, 'Blade Runner 2049', 'Denis Villeneuve', '05/10/2017', 'Ficção Científica', 'Após descobrir um segredo que ameaça o que resta da sociedade, um novo policial parte em busca de Rick Deckard, que está desaparecido há 30 anos.'),
(5, 'Interstellar', 'Christopher Nolan', '06/11/2014',  'Ficção Científica', 'As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.'),
(6, 'Oppenheimer', 'Christopher Nolan', '20/07/2023', 'Drama', 'O físico J. Robert Oppenheimer trabalha com uma equipe de cientistas durante o Projeto Manhattan, levando ao desenvolvimento da bomba atômica.'),
(7, 'Barbie', 'Greta Gerwig', '20/07/2023', 'Aventura', 'Depois de ser expulsa da Barbieland por ser uma boneca de aparência menos do que perfeita, Barbie parte para o mundo humano em busca da verdadeira felicidade.'),
(8, 'Gato de Botas 2', 'Joel Crawford', '05/01/2023', 'Aventura', 'O Gato de Botas descobre que sua paixão pela aventura cobrou seu preço: ele já gastou oito de suas nove vidas. Ele então parte em uma jornada épica para encontrar o mítico Último Desejo e restaurar suas nove vidas.'),
(9, 'O Fantástico Sr. Raposo', 'Wes Anderson', '04/12/2009', 'Aventura', 'Após 12 anos de felicidade bucólica, o Sr. Raposo descumpre a promessa que fez à esposa e invade as fazendas dos vizinhos Boggis, Bunce e Bean. Ceder aos seus instintos animais coloca em perigo não somente o seu casamento, mas também a vida de sua família e seus amigos. Quando os fazendeiros montam uma armadilha para o Sr. Raposo, ele tem que confiar na sua astúcia natural para vencer o oponente.'),
(10, 'Ilha dos Cachorros', 'Wes Anderson', '14/07/2018', 'Aventura', 'Atari Kobayashi é um garoto japonês de 12 anos de idade. Ele mora na cidade de Megasaki, sob tutela do corrupto prefeito Kobayashi. O político aprova uma nova lei que proíbe os cachorros de morarem no local, fazendo com que todos os animais sejam enviados a uma ilha vizinha repleta de lixo. Mas o pequeno Atari não aceita se separar do cachorro Spots. Ele convoca os amigos, rouba um jato em miniatura e parte em busca de seu fiel amigo. A aventura vai transformar completamente a vida da cidade.'),
(11, 'Pulp Fiction', 'Quentin Tortinho', '03/03/1995', 'Drama', 'Assassino que trabalha para a máfia se apaixona pela esposa de seu chefe quando é convidado a acompanhá-la, um boxeador descumpre sua promessa de perder uma luta e um casal tenta um assalto que rapidamente sai do controle.'),
(12, 'Django Livre', 'Quentin Tarantino', '18/01/2023', 'Faroeste', 'No sul dos Estados Unidos, o ex-escravo Django faz uma aliança inesperada com o caçador de recompensas Schultz para caçar os criminosos mais procurados do país e resgatar sua esposa de um fazendeiro que força seus escravos a participar de competições mortais.');

UPDATE filme SET diretor = 'Denis Villenueve' WHERE diretor = 'Denis Vilenueve';
UPDATE filme SET data_lancamento = '18/01/2013' WHERE data_lancamento = '18/01/2023';
UPDATE filme SET diretor = 'Quentin Tarantino' WHERE diretor = 'Quentin Tortinho';


ALTER TABLE funcionario ADD CONSTRAINT filial_trabalha_fk FOREIGN KEY (filial_trabalha) REFERENCES filial(id_filial);
ALTER TABLE funcionario_telefone ADD CONSTRAINT cpf_func_fk FOREIGN KEY (cpf_func) REFERENCES funcionario(cpf);
ALTER TABLE cliente_telefone ADD CONSTRAINT cpf_cliente_fk FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf);
ALTER TABLE filial ADD CONSTRAINT gerente_fk FOREIGN KEY (gerente) REFERENCES funcionario(cpf);
ALTER TABLE dvd ADD CONSTRAINT filme_fk FOREIGN KEY (filme) REFERENCES filme(id_filme);
ALTER TABLE dvd ADD CONSTRAINT alugado_por_fk FOREIGN KEY (alugado_por) REFERENCES cliente(cpf);
ALTER TABLE filme_elenco ADD CONSTRAINT filme_elenco_fk FOREIGN KEY (filme) REFERENCES filme(id_filme);

ALTER TABLE aluguel ADD CONSTRAINT aluguel_filme_fk FOREIGN KEY (filme) REFERENCES filme(id_filme);
ALTER TABLE aluguel ADD CONSTRAINT aluguel_cliente_fk FOREIGN KEY (cliente) REFERENCES cliente(cpf);