update perfil set email =  concat( left(email, length(email) - length('email.com')) , 'gmail.com' ) where email like '%@email.com%';