/*PROCEDURE CRUD TAG PRODUCT*/

drop procedure if exists tagProductC;
delimiter //
	create procedure tagProductC(
		in idProduct_param int
	)
    begin
		insert into tagProduct(idProduct,idCatalogTag)values(idProduct_param,1);
    end
//

drop procedure if exists tagProductR;
delimiter //
	create procedure tagProductR(
		in idTagProduct_param int
	)
    begin
		select name from tagProduct where idProduct = idProduct_param and idCatalogStatus = 1;
    end
//

drop procedure if exists tagProductU;
delimiter //
	create procedure tagProductU(
		in idTagProduct_param int,
		in name_param varchar(35) 
    )
    begin
		update tagProduct set name = name_param where idTagProduct = idTagProduct_param;
    end
//

drop procedure if exists tagProductD;
delimiter //
	create procedure tagProductD(
		in idCatalogStatus_param int,
		in idTagProduct_param int
    )
    begin
		update tagProduct set idCatalogStatus = idCatalogStatus_param where idTagProduct = idTagProduct_param;
    end
//