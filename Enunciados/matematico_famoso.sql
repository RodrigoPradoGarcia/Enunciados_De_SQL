drop procedure if exists script;
delimiter $
create procedure script() deterministic
begin
	declare descc varchar(100);
    declare cont int default 1;
    declare resposta varchar(100) default "";
    set descc = (select descricao from dica where id_dica = 1707);
	while(cont <= length(descc)) do
		set resposta = concat(resposta, (select left(perfil.apelido,1) from perfil inner join partida on perfil.id_perfil = partida.id_perfil where partida.id_partida = ascii(right(left(descc,cont),1)) ));
		set cont = cont + 1;
    end while;
    select resposta;
end $
delimiter ;

call script();

/*

Desenvolvedores adoram esconder segredos em seus games.
Dessa vez, resolveu-se fazer algo diferente, escondendo o nome de um matemático famoso no banco de dados.
O segredo pode ser obtido através da descrição de uma dica cujo id é igual a 1707.
O valor ASCII de cada caractere dessa dica corresponde a um id de partida da tabela de partidas.
Obtenha a primeira letra do apelido dos perfis de jogadores que jogaram esssas partidas e concatene-as ao resultado
e em seguida exiba o resultado.
Você conseguiu descobrir o nome do matemático?

*/