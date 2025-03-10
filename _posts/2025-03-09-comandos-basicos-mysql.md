---
title: Exemplos Básicos com SELECT no MySQL
description: Aprenda como utilizar o comando SELECT no MySQL, realizar operações básicas e manipular dados.
categories:
 - tutorial
 - sql
 - mysql
tags:
---

O comando `SELECT` é utilizado para recuperar dados armazenados em tabelas no MySQL. Ele
permite a realização de diversas operações, desde cálculos simples até consultas mais elaboradas
em bases de dados.
Nos primeiros exemplos, trabalharemos apenas com operações internas do MySQL, sem envolver
tabelas. Posteriormente, exploraremos comandos aplicados a tabelas, que exigem adaptação dos
nomes conforme o contexto do banco de dados utilizado.

## Operações Aritméticas Simples

Essas operações utilizam o MySQL como uma calculadora, permitindo somas, multiplicações e
outras funções matemáticas básicas.


```sql
-- Operação de adição
SELECT 2+2;

SELECT 2+2, 3+3;

-- Operação de subtração 
SELECT 2-1;

-- Operação de multiplicação
SELECT 2*2, 9*(2+3);

-- Operação de divisão
SELECT 10/2;
SELECT FORMAT(4/7,12);
SELECT 4*PI()/3;

-- Operação de potenciação
SELECT FORMAT(POWER(2,64),0);

-- Operação de raiz quadrada
SELECT SQRT(2);

```
A consulta `SELECT FORMAT(3/7,12)` faz a divisão de 3 por 7 e usa a função `FORMAT` para exibir o resultado com 12 casas decimais. 

Já na consulta `SELECT FORMAT(POWER(2,64),0)`, a função `POWER` calcula 2 elevado à potência 64.
Aqui, o `FORMAT` é usado para exibir o número sem nenhuma parte decimal, deixando o resultado mais organizado.

## Operadores Lógicos e Booleanos

Os operadores lógicos, como `AND` (conjunção), `OR` (disjunção) e `NOT` (negação), são usados para combinar ou modificar condições. 
Eles trabalham com valores booleanos, onde `1` representa verdadeiro e `0` representa falso. 

Por exemplo, o `AND` retorna verdadeiro somente se todas as condições forem verdadeiras, enquanto o `OR` retorna verdadeiro se pelo menos uma condição for verdadeira.
Já o `NOT` inverte o valor lógico, transformando verdadeiro em falso e vice-versa.



```sql
-- Operação de conjunção
SELECT 1 AND 1; -- Ambos são verdadeiros, retorna 1
SELECT 1 AND 0; -- Um dos valores é falso, retorna 0
SELECT FALSE && TRUE; -- `FALSE` equivale a 0 e `TRUE` a 1, então retorna 0

-- Operação de disjunção
SELECT FALSE OR TRUE; -- Como há um verdadeiro, retorna 1
SELECT FALSE || TRUE; -- Alternativa com `||`, também retorna 1

-- Operação de negação
SELECT NOT 1; -- Como 1 é verdadeiro, retorna 0 (falso)
SELECT NOT 0; -- Como 0 é falso, retorna 1 (verdadeiro)
```

O MySQL segue a precedência lógica onde `AND` é avaliado antes de `OR`, a menos que haja parênteses explicitando outra ordem.

## Operações Bit a Bit

As operações bit a bit permitem a manipulação direta dos bits de valores numéricos inteiros.
Diferente dos operadores lógicos (`AND`, `OR`), que trabalham com valores booleanos (`0` ou `1`), os operadores bit a bit atuam sobre cada bit individualmente nos números binários.  

###### Operação AND Bit a Bit
O **AND bit a bit** é uma operação binária que utiliza duas representações binárias de mesmo comprimento e realiza a operação lógica AND em cada par de bits correspondentes. 
Dessa forma, se ambos os bits na posição comparada forem `1`, o bit na representação binária resultante será `1` (1 × 1 = 1); caso contrário, o resultado será `0` (1 × 0 = 0 e 0 × 0 = 0).

```markdown
      0 1 0 1  (decimal 5)
  AND 0 0 1 1  (decimal 3)
  -------------
      0 0 0 1  (decimal 1)
 ```

O MySQL permite que façamos esse tipo de operação abstraindo o processo de conversão de decimal para binário. 
Abaixo o exemplo anterior feito no MySQL:
```sql
  SELECT 5 & 3, 3 & 5; -- Ambos retornam 1
```
###### Operação OR Bit a Bit

O **OR bit a bit** é uma operação binária que utiliza dois padrões de bits de mesmo comprimento e realiza a operação lógica **OR inclusivo** em cada par de bits correspondentes. 
O resultado em cada posição será `0` se ambos os bits forem `0`; caso contrário, o resultado será `1`.


```markdown
      0 1 0 1  (decimal 5)
  OR  0 0 1 1  (decimal 3)
  -------------
      0 1 1 1  (decimal 7)
 ```
Abaixo é mostrado como essa operação ocorre no MySQL:

```sql
  SELECT 5 | 3, 3 | 5; -- Ambos retornam 7 
```

## Selecinando Data e Hora

O MySQL oferece diversas funções para retornar informações sobre data e hora no sistema. 
Essas funções são úteis para capturar o horário atual, a data atual ou até mesmo *timestamps*. 
Abaixo estão alguns exemplos:

```sql
-- Retorna o horário atual
SELECT CURRENT_TIME();

-- Retorna a data atual
SELECT CURRENT_DATE();

-- Retorna a data e hora atuais
SELECT NOW();

-- Retorna o timestamp Unix (número de segundos desde 1º de janeiro de 1970)
SELECT UNIX_TIMESTAMP();
```

Além das funções básicas para obter data e hora, o MySQL oferece diversas funções para manipular e extrair informações específicas de datas.
Essas funções são úteis para análises temporais mais detalhadas.
Abaixo estão alguns exemplos:

```sql
-- Retorna a semana do ano da data atual
SELECT WEEK(CURRENT_DATE());

-- Retorna o dia da semana (0 = segunda-feira, 6 = domingo)
SELECT WEEKDAY(CURRENT_DATE());

-- Retorna o trimestre do ano da data atual
SELECT QUARTER(CURRENT_DATE());

-- Retorna o número do dia no ano da data atual
SELECT DAYOFYEAR(CURRENT_DATE());

-- Retorna o nome do mês da data atual
SELECT MONTHNAME(CURRENT_DATE());

-- Retorna a diferença em dias entre duas datas
SELECT DATEDIFF('2025-12-31', CURRENT_DATE());

```

## Funções Matemáticas 

O MySQL possui diversas funções matemáticas embutidas que podem ser usadas para realizar cálculos diretamente no banco de dados.
Essas funções são úteis para operações como arredondamento, cálculo de potências, trigonometria, entre outras. 
Abaixo estão vários exemplos:

```sql
-- Retorna o valor absoluto de um número
SELECT ABS(-15);

-- Arredonda um número para o inteiro mais próximo
SELECT ROUND(3.75);

-- Arredonda um número com precisão decimal especificada
SELECT ROUND(3.14159, 2); -- Resultado: 3.14

-- Retorna o maior valor inteiro menor ou igual ao número (arredondamento para baixo)
SELECT FLOOR(4.9);

-- Retorna o menor valor inteiro maior ou igual ao número (arredondamento para cima)
SELECT CEIL(4.1);

-- Calcula a raiz quadrada de um número
SELECT SQRT(16);

-- Retorna o valor de um número elevado à potência especificada
SELECT POW(2, 3); -- Equivalente a 2^3

-- Calcula o seno de um ângulo (em radianos)
SELECT SIN(PI()/2);

-- Calcula o cosseno de um ângulo (em radianos)
SELECT COS(PI());

-- Calcula a tangente de um ângulo (em radianos)
SELECT TAN(PI()/4);

-- Retorna o logaritmo natural de um número
SELECT LOG(10);

-- Retorna o logaritmo de base 10 de um número
SELECT LOG10(100);

-- Retorna o valor de Pi
SELECT PI();

-- Retorna o maior valor entre uma lista de números
SELECT GREATEST(10, 20, 30, 5);

-- Retorna o menor valor entre uma lista de números
SELECT LEAST(10, 20, 30, 5);

-- Retorna o resto da divisão de dois números
SELECT MOD(10, 3); -- Resultado: 1

-- Converte graus em radianos
SELECT RADIANS(180); -- Resultado: PI

-- Converte radianos em graus
SELECT DEGREES(PI()); -- Resultado: 180

-- Gera um número aleatório entre 0 e 1
SELECT RAND();

-- Gera um número aleatório multiplicado por um intervalo
SELECT RAND() * 100; -- Número entre 0 e 100
```

## Trabalhando com Variáveis de Usuário

No MySQL é possível utilizar variáveis de usuário para armazenar valores temporários durante a execução de consultas. Essas variáveis são úteis para manipular dados, realizar cálculos intermediários ou compartilhar valores entre diferentes comandos SQL dentro de uma mesma sessão.

As variáveis de usuário são identificadas pelo prefixo `@` e podem ser atribuídas e acessadas diretamente. Abaixo estão alguns exemplos de uso:

```sql
-- Define uma variável e atribui o valor 1
SELECT @x := 1;

-- Retorna o valor da variável definida anteriormente
SELECT @x;

-- Atribui o valor da constante PI() à variável
SELECT @x := PI();

-- Atribui o valor de PI() e exibe o resultado com um alias
SELECT @x := PI() AS pi;

-- Utiliza uma variável em um cálculo
SELECT @x := 10, @y := 20, @soma := @x + @y;

-- Define uma variável e utiliza em uma condição
SELECT @limite := 100;
SELECT * FROM produtos WHERE preco < @limite;

-- Reaproveita o valor de uma variável em múltiplas consultas
SELECT @contador := 0;
SELECT @contador := @contador + 1 AS incremento;

```
# Operações utilizando tabelas

Agora, passamos a trabalhar com tabelas. Lembre-se de substituir os nomes das tabelas e colunas
pelos correspondentes ao seu banco de dados.

Abaixo, explicamos os principais usos do comando `SELECT` com exemplos práticos:

## Consultando todos os registros de uma tabela

Para recuperar todos os registros de uma tabela, utilize o caractere `*`:

```sql
SELECT * FROM nome_da_tabela;
```

## Consultando colunas específicas


Se você deseja retornar apenas algumas colunas da tabela, especifique os nomes das colunas:

```sql
SELECT coluna1, coluna2 FROM nome_da_tabela;
```
Por exemplo, se quisermos obter o `id` e o `nome` da tabela `clientes`:

```sql
SELECT id, nome FROM clientes;
```

## Filtrando registros com WHERE

O `WHERE` é usado para filtrar registros com base em condições específicas:

```sql
SELECT * FROM nome_da_tabela WHERE coluna1 = 'valor';
```

Por exemplo, se quisermos selecionar o registro na tabela `clientes` de `id = 1`:


```sql
SELECT * FROM clientes WHERE id = '1';
```

## Utilizando operadores de comparação

Os operadores de comparação no MySQL são ferramentas poderosas que permitem realizar consultas mais detalhadas e precisas. 
Eles são utilizados para comparar valores em uma tabela, retornando apenas os registros que atendem às condições especificadas. 
Abaixo estão os principais operadores:


- **Igualdade (`=`)**: Retorna registros onde os valores de um campo são exatamente iguais a determinado valor.
```sql
-- Retorna todos os registros que atendem a condição coluna1 iqual a 10
SELECT * FROM nome_da_tabela WHERE coluna1 = 10;
```
- **Diferente (`!=` ou `<>`)**: Retorna registros onde os valores são diferentes de um valor determinado.
```sql
-- Retorna todos os registros que atendem a condição coluna1 diferente de 10
SELECT * FROM nome_da_tabela WHERE coluna1 != 10;
```
- **Maior que (`>`)**: Retorna registros onde os valores são maiores que determinado valor.
```sql
-- Retorna todos os registros que atendem a condição coluna1 maior que 10
SELECT * FROM nome_da_tabela WHERE coluna1 > 10;
```
- **Menor que (`<`)**: Retorna registros onde os valores são menores que determinado valor.
```sql
-- Retorna todos os registros que atendem a condição coluna1 menor que 50
SELECT * FROM nome_da_tabela WHERE coluna1 < 50;
```
- **Maior ou igual (`>=`)**: Retorna registros onde os valores são maiores ou iguais a determinado valor.
```sql
-- Retorna todos os registros que atendem a condição coluna1 maior ou igual a 20
SELECT * FROM nome_da_tabela WHERE coluna1 >= 20;
```
- **Menor ou igual (`<=`)**: Retorna registros onde os valores são menores ou iguais a determinado valor.
```sql
-- Retorna todos os registros que atendem a condição coluna1 menor ou igual a 30
SELECT * FROM nome_da_tabela WHERE coluna1 <= 30;
```

Esses operadores tornam as consultas mais flexíveis e permitem extrair informações específicas, são muito úteis quando estamos trabalhando com  de grandes volumes de dados.

## Ordenando consultas com ORDER BY

O comando `ORDER BY` é utilizado para ordenar os resultados de uma consulta com base em uma ou mais colunas. 
Ele permite organizar os dados em ordem crescente (padrão, usando `ASC`) ou em ordem decrescente (usando `DESC`). 
Isso é especialmente útil para visualizar os registros de forma estruturada e hierárquica.
```sql
-- Ordena os registros com base na coluna1 de forma ascendente
SELECT * FROM nome_da_tabela ORDER BY coluna1 ASC;

-- Ordena os registros com base na coluna1 de forma decrescente
SELECT * FROM nome_da_tabela ORDER BY coluna1 DESC;
```

## Limitando o número de registros
O comando `LIMIT` é usado para restringir a quantidade de registros retornados por uma consulta. 
Ele é especialmente útil quando você deseja visualizar apenas uma parte dos dados, como os primeiros resultados de uma tabela ou os registros mais relevantes.

Por exemplo, para limitar a quantidade de resultados a 10 registros, use o `LIMIT 10`:
```sql
    SELECT * FROM nome_da_tabela LIMIT 10;
```

Você também pode combinar o `LIMIT` com o `OFFSET` para especificar a partir de qual registro a consulta deve começar:

```sql
SELECT * FROM nome_da_tabela LIMIT 10 OFFSET 5;
```

Essa funcionalidade é muito utilizada em paginação de resultados e consultas optimizadas.

## Consultando registros únicos com DISTINCT

O comando `DISTINCT` é utilizado para eliminar valores duplicados nos resultados de uma consulta. 
Ele garante que apenas registros únicos sejam retornados, considerando os valores das colunas especificadas. 
Isso é útil quando você precisa identificar valores distintos em uma tabela, como categorias, nomes ou outros atributos.

```sql
SELECT DISTINCT coluna1 FROM nome_da_tabela;
```

## Usando LIKE para buscar por um padrão

O operador `LIKE` no MySQL é utilizado para realizar buscas por padrões em colunas de texto. 
Ele é especialmente útil quando você precisa localizar registros que contenham, comecem ou terminem com determinados caracteres. 
Para definir os padrões, utilizam-se os curingas `%` e `_`:

Por exemplo, para buscar todos os registros que contenham strings que comecem com "A":
```sql
SELECT * FROM nome_da_tabela WHERE coluna1 LIKE 'A%';
```
Agora se quisermos buscar todos os registros que contenham strings na coluna1 que terminem com "B":

```sql
SELECT * FROM nome_da_tabela WHERE coluna1 LIKE '%B';
```

Todos os registros que contenham strings na coluna1 que possuam "C":
```sql
SELECT * FROM nome_da_tabela WHERE coluna1 LIKE '%C%';
```
O caractere coringa `%` representa qualquer sequência de caracteres (incluindo nenhuma).


Outro exemplo, digamos que precisamos dos registros que comecem com "A" e contenham exatamente 2 caracteres na sequência. 
Para isso, será preciso utilizar o coringa `_`, que representa exatamente 1 caractere:

```sql
SELECT * FROM nome_da_tabela WHERE coluna1 LIKE 'A__';
```

Na instrução acima valores como `ANA`, `ABC` e `A23` atenderiam a condição. Mas valores como `ABCD` e `ANAS` não atenderiam, pois possuem mais do que 2 caracteres após o "A".

## Contando Registros com COUNT

O `COUNT` retorna o número total de registros na tabela ou em um subconjunto filtrado:
```sql
-- Retorna o número de registros na tabela
SELECT COUNT(*) FROM nome_da_tabela;
-- Retorna o número de registros que atendam a condição
SELECT COUNT(*) FROM nome_da_tabela WHERE coluna1 = 'valor';

```

## Realizando Cálculos com Funções Agregadas

Além do `COUNT`, outras funções agregadas podem ser usadas para cálculos:

- **Soma dos valores de uma coluna**:
```sql
SELECT SUM(coluna1) FROM nome_da_tabela;
```


- **Média dos valores de uma coluna**:
```sql
SELECT AVG(coluna1) FROM nome_da_tabela;
```

- **Valor máximo de uma coluna**:
```sql
SELECT MAX(coluna1) FROM nome_da_tabela;
```

- **Valor mínimo de uma coluna**:
```sql
SELECT MIN(coluna1) FROM nome_da_tabela;
```


## Agrupando Resultados com GROUP BY

 O GROUP BY é usado para agrupar registros com base em uma ou mais colunas:
```sql
SELECT coluna1, COUNT(*) FROM nome_da_tabela GROUP BY coluna1;
```

## Filtrando Grupos com HAVING

 O HAVING é utilizado para filtrar os resultados após o agrupamento:

```sql
SELECT coluna1, COUNT() FROM nome_da_tabela GROUP BY coluna1 HAVING COUNT() > 5
```

      
















Esse material foi criado a partir das fontes listadas abaixo:

- **MySQL 8.4 Reference Manual:** [https://dev.mysql.com/doc/refman/8.4/en/non-typed-operators.html](https://dev.mysql.com/doc/refman/8.4/en/non-typed-operators.html)
- **Bitwise operation:** [https://en.wikipedia.org/wiki/Bitwise_operation](https://en.wikipedia.org/wiki/Bitwise_operation)
