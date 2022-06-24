
/*CREATE CRUD PERSONUSER*/
drop procedure if exists stpPersonUserC;
delimiter //
	create procedure stpPersonUserC(
		idCatalogGenre_param int,
		name_param varchar(35), 
		lastName_param varchar(35), 
		email_param varchar(35),
		direction_param varchar(35),
		phone_param varchar(35),
        
        idUser_param int,
        userName_param varchar(35),
        userPassword_param varchar(35)
    ) 
    begin
		DECLARE keyPerson int default 0;
		insert into person(idCatalogGenre,name,lastName,email,direction,phone,idCatalogStatus)values(idCatalogGenre_param,name_param,lastName_param,email_param,direction_param,phone_param,1);
        set keyPerson = last_insert_id();
        insert into personUser(idUser,idPerson,name,password,idCatalogStatus)values(idUser_param,keyPerson,userName_param,userPassword_param,1);
    end
// 

drop procedure if exists stpPersonUserR;
delimiter //
create procedure stpPersonUserR()
	begin
		select user.name as typeUser, person.name as name, personUser.name as userName, personUser.password as password  from personUser
			inner join user on user.idUser = personUser.idUser
			inner join person on person.idPerson = personUser.idPerson
			where personUser.idCatalogStatus = 1;
	end
//

drop procedure if exists stpPersonUserU;
delimiter //
	create procedure stpPersonUserU(
		idPersonUser_param int,
		idUser_param int,
		idPerson_param int,
		username_param varchar(35),
		password_param varchar(35),
		
		idCatalogGenre_param int,
		name_param varchar(35),
		lastName_param varchar(35),
		email_param varchar(35),
		direction_param varchar(35),
		phone_param varchar(9)		
    )
    begin
		update personUser 
        set idUser = idUser_param,
			username = username_param,
            password = password_param
        where idPersonUser = idPersonUser_param;
        
        update person 
        set idCatalogGenre = idCatalogGenre_param,
			name = name_param,
            lastName = lastName_param,
            email = email_param,
            direction = userRdirection_param,
            phone = phone_param
        where idPerson = idPerson_param;
    end
//

drop procedure if exists stpPersonUserD;
delimiter //
	create procedure stpPersonUserD(
		in idCatalogStatus_param int,
		in idPersonUser_param int
	)
    begin
		set @idKeyPerson_var = (select idPerson from personUser where idPersonUser = idPersonUser_param);
        update person set idCatalogStatus = idCatalogStatus_param where idPerson = @idKeyPerson_var;
		update personuser set  idCatalogStatus = idCatalogStatus_param where idPersonUser = idPersonUser_param;
    end
//

drop procedure if exists stpPersonUserCH;
delimiter //
	create procedure stpPersonUserCH(
		in idPersonUser_param int,
		in password_param varchar(35),
        in oldpassword_param varchar(35)
	)
    begin
		set @keyPersonUser = (select idPersonUser from personUser where idPersonUser = idPersonUser_param);
		set @oldPassword = (select password from personUser where idPersonUser = idPersonUser_param);
        if @oldPassword = oldpassword_param then
			update personuser set password = password_param where idPersonUser = idPersonUser_param;
		end if;
    end 
//
