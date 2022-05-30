# Enunciados_De_SQL
Um repositório com alguns enunciados de SQL e scripts feitos por mim
Este repositório foi criado para fins de estudos, mas resolvi deixar como público.

<h2>Os enunciados são os seguintes: </h2>

<h3>1.</h3> Uma partida é considerada como vitória quando a pontuação é maior ou igual a 50 e considerada derrota
quando a pontuação é menor que 50. Faça uma consulta que exiba o login do usuário, o número de vitórias
e o número de derrotas de 
todas as partidas realizadas por perfis de jogadores criados por aquele usuário

<h3>2.</h3> Um novo jogo será adicionado ao game de matemática. Foi decidido que a categoria desse novo jogo deve ser
a categoria mais escolhida entre os jogadores e que a dificuldade deve ser a dificuldade mais escolhida entre
os jogadores. Faça uma consulta no banco de dados que exiba, na primeira coluna, a categoria mais escolhida e, na segunda coluna, a dificuldade mais escolhida entre os jogadores.
Caso houver empate entre duas categorias ou duas dificuldades, exibir o resultado que vier primeiro em ordem alfabética

<h3>3.</h3> O dia 6 de maio é o dia nacional da matemática.
Para comemorar este dia, decidiu-se premiar o jogador que obtivesse a maior somatória das pontuações de suas partidas 
realizadas naquele dia. 
Deseja-se obter o id do perfil, o apelido e a soma das pontuações das partidas realizadas naquele dia por aquele jogador e, 
caso haja empate entre dois ou mais jogadores, exibir os dados de todos esses jogadores. 

<h3>4.</h3> Uma forma de avaliar a dificuldade de um jogo é obtendo a pontuação média de todas as partidas realizadas nesse jogo.
Faça uma consulta no banco de dados que exiba o id do jogo, o nome do jogo, a dificuldade do jogo(que está na tabela de jogo), a pontuação média de todas as partidas realizadas naquele jogo e 
a dificuldade estimada(que será calculada a partir da pontuação média).
Se a pontuação média for menor que 40, a dificuldade estimada deverá exibir 'Difícil', se a média estiver entre 40 e 70, exibir 'Médio' e se a média for maior que 70, exibir 'Fácil'.
Exiba apenas os resultados em que a dificuldade é diferente da dificuldade estimada

<h3>5.</h3> Deseja-se fazer um levantamento das idades dos perfis de jogadores. Faça uma consulta que exiba, na primeira coluna,
o valor da idade e, na segunda coluna, a quantidade de perfis que possuem aquela idade para todas as
idades cadastradas no banco de dados. Os resultados devem estar ordenados pela idade. 
Nenhuma idade deverá ser exibida duas vezes

<h3>6.</h3> Desenvolvedores adoram esconder segredos em seus games.
Dessa vez, resolveu-se fazer algo diferente, escondendo o nome de um matemático famoso no banco de dados.
O segredo pode ser obtido através da descrição de uma dica cujo id é igual a 1707.
O valor ASCII de cada caractere dessa dica corresponde a um id de partida da tabela de partidas.
Obtenha a primeira letra do apelido dos perfis de jogadores que jogaram esssas partidas e concatene-as ao resultado
e em seguida exiba o resultado.
Você conseguiu descobrir o nome do matemático?

<h3>7.</h3> Faça uma consulta que exiba o id do perfil, o nome do perfil e a data da última partida realizada por aquele perfil para todos
os perfis cadastrados no banco de dados.


<h3>8.</h3> Deseja-se fazer um levantamento de qual período do dia os usuários mais gostam de jogar. Para isso, é necessário obter a hora de todas as partidas realizadas por aquele usuário (incluindo todos os seus perfis de jogadores), verificar a qual período essa hora corresponde ('Manhã', 'Tarde', 'Noite' ou 'Madrugada'), contar quantas partidas aquele usuário jogou em cada período (por exemplo: o usuário X jogou 2 partidas de Manhã, 3 partidas à Tarde e 1 partida à Noite e obter o período em que aquele usuário jogou mais partidas (nesse exemplo, é operíodo da Tarde). Caso haja empate entre dois períodos, dê prioridade para o período da Manhã, seguido pelo período da Tarde. Faça isso para todos os usuários cadastrados no banco de dados.

<h3>9.</h3> Nos games, é muito comum a presença de placares. Você foi solicitado(a) a exibir
o placar dos top 5 perfis de jogadores. Para isso, você deve realizar uma consulta que exiba a colocação,
o apelido e o somatório das pontuações de todas as partidas realizadas por aquele perfil.
Apenas os 5 perfis com a maior somatória deverão ser exibidos e os resultados devem estar ordenados em ordem
descenente de pontuação.

<h3>10.</h3> Deseja-se saber como anda o desempenho dos jogadores. Para isso, você precisará fazer uma consulta no banco de dados
que exiba, na primeira coluna, o login do usuário e , na segunda coluna, a pontuação média de todas as 
partidas realizadas pelos perfis de jogadores que estão associados àquele login de usuário.

<h3>11.</h3> Faça uma consulta no banco de dados que exiba, 
na primeira coluna, o login do usuário e, 
na segunda coluna, a quantidade de perfis de jogadores que aquele login de usuário possui.

<h3>12.</h3> Obtenha a lista de todas as cores distintas dos perfis de jogadores para a cor do cabelo, cor da camisa, cor dos olhos e cor da pele, uma em cada coluna. Para que todas as colunas tenham o mesmo número de linhas, preenha os espaços que faltem com NULL

<h3>13.</h3> Deseja-se saber o número médio de partidas realizadas por cada sexo. A média pode ser obtida calculando
o número total de partidas realizadas por perfis desse sexo e dividindo pelo número de perfis com aquele sexo.

As respostas desses e outros enunciados se encontram no código deste repositório, bem como a definição das tabelas do banco de dadose alguns outros scripts.