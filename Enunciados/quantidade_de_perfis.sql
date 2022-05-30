select
	usuario.login_usuario as log,
	count(perfil.id_perfil) as numero
from
	usuario inner join perfil
		on usuario.login_usuario = perfil.login_usuario
group by
	log;
    
/*

Faça uma consulta no banco de dados que exiba, 
na primeira coluna, o login do usuário e, 
na segunda coluna, a quantidade de perfis de jogadores que aquele login de usuário possui.

*/
