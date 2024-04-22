-- Código feito por Gabriel de Lima Andrade

USE BIBLIOTECA;

select nome_cliente, data_nascimento from Cliente where nome_cliente like "%te%";

select atrasado, id_livro_locado from Multa where atrasado > 0;

select nome_cliente, data_nascimento from Cliente order by nome_cliente desc;

select id_livro, count(*) from livrolocado group by id_livro; -- having count(*) > 2

select max(quantidade_disponivel), min(quantidade_disponivel), avg(quantidade_disponivel) from Livro;

select Livro.nome_livro, Autor.nome_autor 
from Livro 
inner join LivroAutor on Livro.id_livro = LivroAutor.id_livro
join Autor on LivroAutor.id_autor = Autor.id_autor;


-- Datas de inserção das tabelas principais
SELECT 'Livro' AS tabela, MAX(created_at) AS data_criacao
FROM Livro

UNION ALL

SELECT 'Genero' AS tabela, MAX(created_at) AS data_criacao
FROM Genero

UNION ALL

SELECT 'Editora' AS tabela, MAX(created_at) AS data_criacao
FROM Editora

UNION ALL

SELECT 'Biblioteca' AS tabela, MAX(created_at) AS data_criacao
FROM Biblioteca

UNION ALL

SELECT 'Autor' AS tabela, MAX(created_at) AS data_criacao
FROM Autor

UNION ALL

SELECT 'Cliente' AS tabela, MAX(created_at) AS data_criacao
FROM Cliente

UNION ALL

SELECT 'Endereco' AS tabela, MAX(created_at) AS data_criacao
FROM Endereco;

-- Mostrar todos os registros que foram inseridos nas últimas 24 horas
SELECT tabela, data_criacao
FROM (
    SELECT 'Livro' AS tabela, MAX(created_at) AS data_criacao
    FROM Livro

    UNION ALL

    SELECT 'Genero' AS tabela, MAX(created_at) AS data_criacao
    FROM Genero

    UNION ALL

    SELECT 'Editora' AS tabela, MAX(created_at) AS data_criacao
    FROM Editora

    UNION ALL

    SELECT 'Biblioteca' AS tabela, MAX(created_at) AS data_criacao
    FROM Biblioteca

    UNION ALL

    SELECT 'Autor' AS tabela, MAX(created_at) AS data_criacao
    FROM Autor

    UNION ALL

    SELECT 'Cliente' AS tabela, MAX(created_at) AS data_criacao
    FROM Cliente

    UNION ALL

    SELECT 'Endereco' AS tabela, MAX(created_at) AS data_criacao
    FROM Endereco
) AS subconsulta
WHERE data_criacao >= NOW() - INTERVAL 1 DAY;

SELECT c.nome_cliente, e.id_endereco, c.telefone_cliente, c.email_cliente
FROM Cliente c
JOIN Endereco e ON c.id_endereco = e.id_endereco;

-- Trazer clientes sem empréstimos

SELECT c.nome_cliente, e.id_endereco, c.telefone_cliente, c.email_cliente
FROM Cliente c
JOIN Endereco e ON c.id_endereco = e.id_endereco
LEFT JOIN Locacao ll ON c.id_cliente = ll.id_cliente
WHERE ll.id_cliente IS NULL;
    
-- Clientes com sufixo

select nome_cliente from Cliente
where  nome_cliente like "% de %" 
or nome_cliente like "% da %" 
or nome_cliente like "% do %" 
or nome_cliente like "% dos %" 
order by nome_cliente;

-- Estado e cidade

SELECT cidade, estado, COUNT(*) AS total_enderecos
FROM Endereco
GROUP BY cidade, estado
ORDER BY cidade, estado;

-- Mostrar os nomes, por bairro, dos 3 principais clientes.

SELECT 
    c.nome_cliente,
    e.bairro,
    COUNT(l.id_locacao) AS total_locacoes
FROM 
    Cliente c
JOIN 
    Endereco e ON c.id_endereco = e.id_endereco
JOIN 
    Locacao l ON c.id_cliente = l.id_cliente
GROUP BY 
    c.nome_cliente,
    e.bairro
ORDER BY 
    total_locacoes DESC
LIMIT 3;

-- Soma de todas as locações

SELECT SUM(valor_total_locacao) AS total_locacoes
FROM Locacao;

-- Média do valor devido

SELECT 
    id_cliente,
    AVG(total_locacao) AS media_valores_devidos
FROM (
    SELECT 
        id_cliente,
        SUM(valor_total_locacao) AS total_locacao
    FROM 
        Locacao
    GROUP BY 
        id_cliente
) AS valores_por_cliente
GROUP BY 
    id_cliente;
    
-- Listar 10 maiores valores

SELECT 
    'Locacao' AS tipo_transacao,
    id_locacao AS id_transacao,
    valor_total_locacao AS valor
FROM 
    Locacao
UNION ALL
SELECT 
    'Multa' AS tipo_transacao,
    id_livro_locado AS id_transacao,
    perdido + danificado + atrasado AS valor
FROM 
    Multa
ORDER BY 
    valor DESC
LIMIT 10;