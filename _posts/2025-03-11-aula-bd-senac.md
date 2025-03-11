---
title: '[ADS][BD] Aula dia 11/03/2025'
description: 
categories:
 - aula
 - sql
 - mysql
 - bd
tags:
---

Prezados, 

Prezados, a aula do dia 11/03/2025 está disponível neste <a href="{{ site.url }}/assets/senac_bd_03.pdf" target="blank" class="btn">link</a>.


Exemplo utilizado na aula :

```sql

CREATE DATABASE BIBLIOTECADB;

USE BIBLIOTECADB;

CREATE TABLE LIVROS (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(200) NOT NULL,
    AUTOR VARCHAR(200) NOT NULL,
    ANO_PUBLICACAO INT,
    GENERO ENUM('Aventura', 'Ficção', 'Romance', 'Técnico')
);

INSERT INTO LIVROS (TITULO, AUTOR, GENERO, ANO_PUBLICACAO) 
VALUES 
	('A ilha do medo', 'Desconhecido', 'Ficção', 2025),
    ('O homem duplicado', 'José Saramago', 'Ficção', 1993),
    ('Dom casmurro', 'Machado de Assis', 'Romance', 1890),
    ('Introdução à Bancos de dados', 'C.J.Date', 'Técnico', 1980);
    
SELECT * FROM LIVROS;





```
