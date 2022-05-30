select
	perfil.id_perfil,
    perfil.apelido,
    perfil.cor_camisa,
    perfil.cor_olhos,
    perfil.cor_cabelo,
    perfil.cor_pele
from
	usuario inner join perfil
		on usuario.login_usuario = perfil.login_usuario
where
	usuario.login_usuario = 'João da Silva'
;
