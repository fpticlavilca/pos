drop procedure if exists stpCustomerC;
delimiter //
	create procedure stpCustomerC(
		in idCatalogGenre_param int,
        in name_param varchar(35),
        in lastName varchar(35),
        in email varchar(35),
        in direction varchar(35),
        in phone varchar(9)
    )
//

