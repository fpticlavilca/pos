drop procedure if exists stpLoginC;
delimiter //
create procedure stpLoginC(
		idPersonUser_param int
	)
    begin
		insert into login(idPersonUser,dateLogin,idCatalogStatus)values(idPersonUser_param,now(),1);
    end
//

drop procedure if exists stpLoginR;
delimiter //
create procedure stpLoginR(
	)
	begin
		select person.name, person.lastName, personUser.name, login.dateLogin from login
		inner join personUser on personUser.idPersonUser = login.idPersonUser
		inner join person on person.idPerson = personUser.idPerson
        where idCatalogStatus = 1;
    end
//

drop procedure if exists stpLoginU;
delimiter //
create procedure stpLoginU(
	)
    begin 
    end
//

drop procedure if exists stpLoginD;
delimiter //
	create procedure stpLoginD(
		in idCatalogStatus_param int,
		in idLogin int
    )
    begin 
		update login set idCatalogStatus = idCatalogStatus_param where idLogin = idLogin_param; 
    end
//