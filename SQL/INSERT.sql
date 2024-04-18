USE BIBLIOTECA;

INSERT INTO Biblioteca(nome_biblioteca)
VALUES('Prateleira Digital');

INSERT INTO Livro(id_biblioteca, nome_livro, valor_locacao_unidade, data_publicacao, quantidade_disponivel)
VALUES(1, 'OS Lusíadas', 10.00, '1572.03.12', 3),

(1, 'O Senhor dos Anéis', 10.00, '1954.07.29', 2),

(1, 'Dom Casmurro', 10.00, '1899.06.16', 1),

(1, 'A Morte de Ivan Ilitch', 10.00, '1886.01.01', 2),

(1, 'Dom Quixote', 10.00, '1605.01.01', 3);

INSERT INTO Lingua(id_livro, nome_lingua) 
VALUES(2, 'pt'),
(2, 'en'),
(2, 'es');

INSERT INTO Genero(nome_genero) 
VALUES('fantasia'),
('Romance'),
('aventura');

INSERT INTO LivroGenero(id_genero, id_livro) 
VALUES(3, 1),
(1, 2),
(2, 3),
(2, 4),
(2, 5);

INSERT INTO Editora(nome_editora) 
VALUES('Clássicos Loucos'),
('Livros Daoras'),
('Editora 777');

INSERT INTO Edicao(id_livro, id_editora, nome_edicao, numero_de_paginas, sumario) -- data_edicao 
VALUES(1, 1, 'edição 1', 288, '"Os Lusíadas" é uma obra épica escrita por Luís de Camões, considerada uma das maiores obras da literatura portuguesa. O poema narra a viagem dos navegadores portugueses liderados por Vasco da Gama até a Índia, destacando os feitos heroicos dos portugueses e celebrando a grandiosidade de Portugal.'),
(2, 2, 'edição 1', 1228, '"O Senhor dos Anéis" é uma trilogia épica escrita por J.R.R. Tolkien, ambientada em um mundo fictício chamado Terra Média. A história narra a jornada de um grupo de personagens, liderados pelo hobbit Frodo Bolseiro, em uma missão para destruir um poderoso anel mágico, que ameaça mergulhar o mundo na escuridão.'),
(3, 1, 'edição 1', 346, '"Dom Casmurro" é um romance escrito por Machado de Assis, considerado um dos maiores clássicos da literatura brasileira. A história é narrada por Bento Santiago, também conhecido como Dom Casmurro, um homem idoso que relembra sua vida e seu relacionamento com Capitu, sua esposa, e seu amigo Escobar.'),
(4, 3, 'edição 1', 76, '"A Morte de Ivan Ilitch" é um romance escrito por Lev Tolstói. A história acompanha a vida de Ivan Ilitch, um juiz de carreira bem-sucedido, enquanto ele enfrenta uma doença terminal e reflete sobre sua existência e suas escolhas de vida. O romance aborda temas como mortalidade, alienação, busca por significado e a natureza da vida humana. Ao confrontar sua própria mortalidade, Ivan Ilitch é forçado a confrontar a superficialidade de sua vida anterior e a buscar uma compreensão mais profunda do que significa viver uma vida autêntica e significativa.'),
(5, 1, 'edição 1', 1033, '"Dom Quixote", uma obra-prima escrita por Miguel de Cervantes, que narra as aventuras de um nobre espanhol enlouquecido que se autoproclama cavaleiro andante. Juntamente com seu fiel escudeiro Sancho Pança, Dom Quixote embarca em uma série de aventuras absurdas, muitas vezes resultando em situações cômicas e desastrosas. O romance é uma sátira brilhante dos romances de cavalaria da época, enquanto também explora temas mais profundos como a loucura, a realidade versus fantasia, a busca pela glória e a natureza humana. "Dom Quixote" é uma obra rica em humor, ironia e profundidade filosófica, e é considerada uma das maiores obras da literatura mundial.');

-- INSERT INTO ImagemIlustrativa(imagem, capa, contracapa) 
-- VALUES(NULL, NULL, NULL),
-- (NULL, NULL, NULL),
-- (NULL, NULL, NULL),
-- (NULL, NULL, NULL),
-- (NULL, NULL, NULL);

-- INSERT INTO EdicaoImagemIlustrativa(id_edicao, id_ii) 
-- VALUES(1, 1),
-- (2, 2),
-- (3, 3),
-- (4, 4),
-- (5, 5);

INSERT INTO Autor(nome_autor) 
VALUES('Luís de Camões'),
('J. R. R. Tolkien'),
('Machado de Assis'),
('Liev Tolstói'),
('Miguel de Cervantes');

INSERT INTO LivroAutor(id_livro, id_autor) 
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO Cliente(id_biblioteca, nome_cliente, cpf, data_nascimento)
VALUES(1, 'Sócrates', '00000000000', '2001.01.01'),
(1, 'Platão', '00000000001', '2002.02.02'),
(1, 'Aristóteles', '00000000002', '2003.03.03');


INSERT INTO Locacao(id_cliente, quantidade_livros_locados, valor_total_locacao, data_locacao, data_devolucao) 
VALUES(1, 1, 10.00, '2024.03.25', '2024.04.05'),
(2, 1, 10.00, '2024.03.25', '2024.04.05'),
(3, 1, 10.00, '2024.03.25', '2024.04.05');

INSERT INTO LivroLocado(id_livro, id_locacao, condicao) 
VALUES(1, 1, 'devolvido'),
(2, 2, 'locado'),
(3, 3, 'perdido');

INSERT INTO Multa(id_livro_locado, perdido, danificado, atrasado)
VALUES(1, 00.00, 30.00, 00.00),
(2, 00.00, 00.00, 10.00),
(3, 80.00, 00.00, 00.00);