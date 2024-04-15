CREATE DATABASE BIBLIOTECA;

USE BIBLIOTECA;


CREATE TABLE Livro(
    id_livro INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_biblioteca INTEGER NOT NULL,
    nome_livro VARCHAR(200) NOT NULL,
    valor_locacao_unidade FLOAT(6,2) NOT NULL,
    data_publicacao DATE NOT NULL,
    quantidade_disponivel INTEGER NOT NULL
);

CREATE TABLE Lingua(
    id_lingua INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_livro INTEGER NOT NULL,
    nome_lingua VARCHAR(10) NOT NULL
);

CREATE TABLE LivroGenero(
    id_genero INTEGER NOT NULL,
    id_livro INTEGER NOT NULL
);

CREATE TABLE Genero(
    id_genero INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(100) NOT NULL
);

CREATE TABLE Edicao(
    id_edicao INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_livro INTEGER NOT NULL,
    id_editora INTEGER NOT NULL,
    nome_edicao VARCHAR(100) NOT NULL,
    numero_de_paginas INTEGER NOT NULL,
    data_edicao DATE,
    sumario VARCHAR(1000) NOT NULL
);

CREATE TABLE Editora(
    id_editora INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL
);

CREATE TABLE EdicaoImagemIlustrativa(
    id_edicao INTEGER NOT NULL,
    id_ii INTEGER NOT NULL
);

CREATE TABLE ImagemIlustrativa(
    id_ii INTEGER NOT NULL PRIMARY KEY,
    nome_imagem_ilustrativa VARCHAR(100),
    imagem BIT,
    capa BIT,
    contracapa BIT
);

CREATE TABLE Biblioteca(
    id_biblioteca INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_biblioteca VARCHAR(50) NOT NULL
);

CREATE TABLE LivroAutor(
    id_livro INTEGER NOT NULL,
    id_autor INTEGER NOT NULL
);

CREATE TABLE Autor(
    id_autor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL
);

CREATE TABLE LivroLocado(
    id_livro_locado INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_livro INTEGER NOT NULL,
    id_locacao INTEGER NOT NULL,
    condicao VARCHAR(9) NOT NULL
);

CREATE TABLE Locacao(
    id_locacao INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INTEGER NOT NULL,
    quantidade_livros_locados INTEGER NOT NULL,
    valor_total_locacao FLOAT(6,2) NOT NULL,
    data_locacao DATE NOT NULL,
    data_devolucao DATE NOT NULL
);

CREATE TABLE Cliente(
    id_cliente INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,   
    id_biblioteca INTEGER NOT NULL,
    nome_cliente VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    quantidade_locacoes INTEGER NOT NULL,
    quantidade_multas INTEGER NOT NULL
);

CREATE TABLE Multa(
    id_livro_locado INTEGER NOT NULL,
    perdido FLOAT(6,2),
    danificado FLOAT(6,2),
    atrasado FLOAT(6,2)
);