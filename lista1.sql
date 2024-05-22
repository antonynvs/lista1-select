use avaliacao_222b;

--  Inserir um Novo Livro: Insira um livro chamado "As Crônicas de Nárnia", de C.S. Lewis, publicado em 1950, disponível, na categoria "Fantasia", com ISBN '978-0064471190', editora "HarperCollins", 768 páginas, idioma "Inglês".

insert into livros(titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma) values
("As Crônicas de Nárnia", "C.S. Lewis", 1950, true, "Fantasia", "978-0064471190", "HarperCollins", 768, "Inglês");

-- Inserir Múltiplos Livros: Insira três livros de uma vez:

insert into livros(titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma) values
("Cem Anos de Solidão", "Gabriel Garcia Marquez", 1967, true, "Ficção", '978-0241968581', "Penguin Books", 422, "Espanhol"),
("Harry Potter e a Pedra Filosofal", "J.K. Rowling", 1997, true, "Fantasia", '978-0439708180', "Bloomsbury", 309, "Inglês"),
("O Senhor dos Anéis: A Sociedade do Anel", "J.R.R. Tolkien", 1954, true, "Fantasia", '978-0618640157', "HarperCollins", 423, "Inglês");

-- Inserir Livro com Categoria Específica: Adicione um livro na categoria "História" com detalhes fictícios.

INSERT INTO livros (titulo, autor, ano_publicacao, disponivel, categoria, isbn, editora, quantidade_paginas, idioma)
VALUES ('A Fascinante História das Civilizações', 'Antony', 2024, true, 'História', '978-0616540157', 'Bloomsbury', 654, 'Português');


-- Atualizar Disponibilidade: Altere o status de disponibilidade de todos os livros publicados antes de 2000 para FALSE.

UPDATE livros
SET disponivel = false
WHERE ano_publicacao < 2000;

-- Atualizar Editora: Atualize a editora do livro "1984" para "Plume Books".

update livros
set editora = 'Plume Books'
where titulo = '1984';

-- Atualizar Idioma: Mude o idioma de todos os livros da editora "Penguin Books" para "Inglês".

update livros
set idioma = 'Inglês'
where editora = 'Penguin Books';

-- Atualizar Título: Altere o título do livro com ISBN '978-0439708180' para "Harry Potter e a Pedra Filosofal (Edição Especial)".

update livros
set titulo = 'Harry Potter e a Pedra Filosofal (Edição Especial)'
where isbn = '978-0439708180';

--  Deletar por Categoria: Delete todos os livros da categoria "Terror".

delete 
from livros
where categoria = 'Terror';

--  Deletar por Idioma e Ano: Delete todos os livros em "Francês" que foram publicados antes de 1970.

delete 
from livros
where idioma = 'Francês' and ano_publicacao < 1970;

--  Deletar Livro Específico: Remova o livro com título "As Crônicas de Nárnia".

delete 
from livros
where titulo = "As Crônicas de Nárnia";

--  Deletar por Editora: Apague todos os livros publicados pela editora "Penguin Books".

delete 
from livros
where editora = "Penguin Books";

--  Selecionar com WHERE: Encontre todos os livros cujo número de páginas é superior a 500.

select *
from livros
where quantidade_paginas > 500;

--  Selecionar com GROUP BY: Agrupe os livros por categoria e conte quantos livros existem em cada categoria.

SELECT categoria, count(categoria)
FROM livros
GROUP BY categoria;

--  Selecionar com LIMIT: Liste os 5 primeiros livros adicionados à tabela.

select titulo
from livros
order by titulo asc
limit 5;

--  Selecionar com SUM e COUNT: Calcule o total e a média de páginas dos livros na categoria "Drama".

SELECT SUM(quantidade_paginas) AS total_paginas, AVG(quantidade_paginas) AS media_paginas
FROM livros
WHERE categoria = 'Drama';


-- Selecionar com AVG: Encontre a média de ano de publicação dos livros disponíveis.

SELECT AVG(ano_publicacao)
FROM livros;

 -- Selecionar com MAX e MIN: Determine o livro mais recente e o mais antigo na tabela.
 
select titulo, ano_publicacao
from livros
where ano_publicacao = (select max(ano_publicacao) from livros);

select titulo, ano_publicacao
from livros
where ano_publicacao = (select min(ano_publicacao) from livros);

-- Selecionar com ORDER BY: Ordene todos os livros pelo ano de publicação em ordem decrescente.

select *
from livros
order by ano_publicacao desc;

--  Selecionar com UNION: Combine uma lista de todos os títulos de livros em "Inglês" com todos os títulos em "Português".

SELECT titulo
FROM livros
WHERE idioma = 'Inglês'

UNION ALL

SELECT titulo
FROM livros
WHERE idioma = 'Português';

--  Selecionar Livros de um Autor Específico: Liste todos os livros do autor "George Orwell".

select *
from livros
where autor = "George Orwell"




