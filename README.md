# MiniJava
Lexer Minijava - Exercicio da cadeira Compiladores.

Este exerc�cio tem o objetivo de exercitar os conceitos de an�lise l�xica vistos em sala de aula. A ideia � implementar um analisador l�xico para a linguagem MiniJava, que consiste em um subconjunto de Java, cujos elementos l�xicos s�o descritos abaixo. 

Utilize a linguagem de sua prefer�ncia para implementar o analisador, sendo permitido o uso de geradores de analisadores l�xicos, como os listados nos links da postagem de algumas aulas atr�s. Alguns programas v�lidos em MiniJava est�o em anexo nesta postagem. 

O c�digo do seu analisador l�xico deve estar em um reposit�rio acess�vel online, como GitHub ou BitBucket. Responda esta tarefa colocando o link para o reposit�rio com a sua resposta. 

***************************************
** Elementos L�xicos de MiniJava **
***************************************

- Whitespace: espa�os em branco, quebra de linha, tabula��o e carriage return;

- Coment�rios: qualquer texto entre /* e */;

- Palavras-chave e operadores: class, public, extends, static, void, int, boolean, while, if, else, return, ||, &&, ==, !=, <, <=, >, >=, +, -, *, /, %, !, false, true, this, new;

- Delimitadores: ; . , = ( ) { } [ ]

- Identificadores: um identificador come�a com uma letra ou underline e � seguido por qualquer quantidade de letras, underline e d�gitos. Apenas letras entre A/a e Z/z s�o permitidos, h� diferen�a entre mai�scula e min�scula. Palavras-chave n�o s�o identificadores;

- Literais Inteiros: uma sequ�ncia de d�gitos iniciada com qualquer um dos d�gitos entre 1 e 9 e seguida por qualquer n�mero de d�gitos entre 0 e 9. O d�gito 0 tamb�m � um inteiro. 

- Literais ponto flutuante: Uma parte inteira seguida de uma parte fracion�ria, separada por ponto. Na parte fracion�ria, podemos incluir um expoente, seguindo os exemplos dos slides de an�lise l�xica.

Coment�rios e whitespace n�o tem significado algum, exceto para separar os tokens.

--
Para testar, passar como parametro o <arquivo.java> de entrada no main Lexer.java