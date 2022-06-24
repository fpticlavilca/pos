/*PROCEDURE CRUD CATEGORY*/

delimiter //
create procedure stpCategoryC(
		in name_param varchar(35)
    )
	begin 
		insert into category(name,idCatalogStatus) values (name_param,1);
    end
//

delimiter //
create procedure stpCategoryR()
	begin 
		select idCategory, name from category where idCatalogStatus = 1;
	end
//

delimiter //
create procedure stpCategoryU(
		in idCategory_param int, 
		in name_param varchar(35)
    )
	begin
		update category set name = name_param where idCategory = idCategory_param;
	end
//

delimiter //
create procedure stpCategoryD(
		in idCatalogStatus_param int,
		in idCategory_param int
    )
	begin
		update category set idCatalogStatus = idCatalogStatus_param where idCategory = idCategory_param;
	end 
//

call stpCategoryC('Polos');
call stpCategoryC('Poleras');
call stpCategoryC('Jeans');
call stpCategoryC('Blusas');
call stpCategoryC('Vestidos');
call stpCategoryC('Enterizos');
call stpCategoryC('Chompas');
call stpCategoryC('Shorts');
call stpCategoryC('Joggers');
call stpCategoryC('Toreros');
call stpCategoryC('Baggi');

call stpCategoryC('Faldas');
call stpCategoryC('Bustieres');
call stpCategoryC('Pantalones');
call stpCategoryC('Tutus');
call stpCategoryC('Capas');