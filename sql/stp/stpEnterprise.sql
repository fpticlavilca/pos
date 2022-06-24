/*CREATE CRUD ENTERPRISE*/

drop procedure if exists stpEnterpriseC;
delimiter //
	create procedure stpEnterpriseC(
		in namePerson_param varchar(35), 
		in lastNamePerson_param varchar(35), 
		in emailPerson_param varchar(35),
		in directionPerson_param varchar(35),
		in phonePerson_param varchar(9),
        
        in nameEnterprise_param varchar(35),
        in directionEnterprise_param varchar(35)
    ) 
    begin
		DECLARE keyPerson int default 0;
        DECLARE keyEnterprise int default 0;
		insert into person(name,lastName,email,direction,phone)values(namePerson_param,lastNamePerson_param,emailPerson_param,directionPerson_param,phonePerson_param);
        set keyPerson = last_insert_id();
        insert into Enterprise(name,direction)values(nameEnterprise_param,directionEnterprise_param);
        set keyEnterprise = last_insert_id();
        insert into personEnterprise(idPerson,idEnterprise)values(keyPerson,keyEnterprise);
    end
// 

drop procedure if exists stpEnterpriseR;
delimiter //
	create procedure stpEnterpriseR()
    begin
		select 	enterprise.ruc, enterprise.direction, enterprise.telephone, enterprise.name as enterprise,
		person.name as namePerson from enterprise
		
        inner join personEnterprise on enterprise.idEnterprise = personEnterprise.idEnterprise
		inner join person on person.idPerson = personEnterprise.idPerson;
    end
//

drop procedure if exists stpEnterpriseU;
delimiter //
	create procedure stpEnterpriseU(
		idPersonEnterprise_param int,
    
        idCatalogGenre int,
		namePerson varchar(35), 
		lastNamePerson varchar(35), 
		emailPerson varchar(35),
		directionPerson varchar(35),
		phonePerson varchar(35),
        
        nameEnterprise varchar(35),
        directionEnterprise varchar(35)
    )
    begin
		set @idPerson_var = (select idPerson from personentEnterprise where idPersoEnterprise = idPersonEnterprise_param);
        set @idEnterprise_var = (select idEnterprise from personEnterprise where idPersonEnterprise = idPersonEnterprise_param);
        
		update person 
			set 
            idCatalogGenre = idCatalogGenre,
            name = namePerson, 
            lastName = lastNamePerson,
            email = emailPerson,
            direction = directionPerson,
            phone = phonePerson
        where idPerson = @idPerson_var;
        
        update enterprise set name = nameEnterprise, direction = directionEnterprise where idEnterprise = @idEnterprise_var;
    end
//

drop procedure if exists stpEnterpriseD;
delimiter //
	create procedure stpEnterpriseD(
		in idCatalogStatus_param int,
		in idPersonEnterprise_param int
	)
  
    begin
		set @idPerson_var = (select idPerson from personEnterprise where idPersonEnterprise = idPersonEnterprise_param);
		set @idEnterprise_var = (select idEnterprise from personEnterprise where idPersonEnterprise = idPersonEnterprise_param);
        
        
        update personEnterprise set idCatalogStatus = idCatalogStatus_param  where idPersonEnterprise = idPersonEnterprise_param;
		update person set idCatalogStatus = idCatalogStatus_param where idPerson = @idPerson_var;
		update enterprise set idCatalogStatus = idCatalogStatus_param where idEnterprise = @idEnterprise_var;
        
    end
//

call cjestilos.stpEnterpriseC('Jencer', 'Ninguno', 'jercer@email.com', 'Gamarra', '936503888', 'Jencer', 'Gamarra');
call cjestilos.stpEnterpriseC('Aron', 'Ninguno', 'aaron@email.com', 'Gamarra', '992131086', 'Aron', 'Gamarra');
call cjestilos.stpEnterpriseC('Brava', 'Ninguno', 'brava@email.com', 'Gamarra', '932396061', 'Brava', 'Gamarra');
call cjestilos.stpEnterpriseC('América Store', 'Ninguno', 'americastore@email.com', 'Gamarra', '937269156', 'América Store', 'Gamarra');
call cjestilos.stpEnterpriseC('Grupo Fey', 'Ninguno', 'grupofey@email.com', 'Centro Civico', '992499914', 'Grupo Fey', 'Centro Civico');
call cjestilos.stpEnterpriseC('Priscila', 'Ninguno', 'prisnik@email.com', 'Gamarra', '992499914', 'Creaciones Prisnik', 'Gamarra');
call cjestilos.stpEnterpriseC('Elizabeth', 'Ninguno', 'elizabeth@email.com', 'Centro Civico', '923326727', 'Casacas Termicas', 'Centro Civico');
call cjestilos.stpEnterpriseC('Copo de Nieve Xhh Import Export SAC', 'Ninguno', 'coponieve@email.com', 'Centro Civico', '991802921', 'Copo de Nieve Xhh Import Export SAC', 'Centro Civico');
call cjestilos.stpEnterpriseC('Polos Economicos de niños','poloseconomicos@email.com', 'Gamarra', '928890530', 'Polos Economicos de niños', 'Gamarra');