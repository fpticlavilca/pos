drop procedure if exists stpExpenseC;
delimiter //
create procedure stpExpenseC(
		in title_param varchar(35),
		in description_param tinytext,
		in idUser_param int
	)
    begin
		insert into expense(title,description,date,idUser)values(title_param,description_param,now(),idUser_param);
    end
///

drop procedure if exists stpExpenseR;
delimiter //
	create procedure stpExpenseR()
    begin
		select expense.title, expense.description, expense.date, personUser.name as userName, person.name from expense
		inner join personUser on expense.idPersonUser = expense.idPersonUser
		inner join person on personUser.idPerson = person.idPerson;
    end
//

drop procedure if exists stpExpenseU;
delimiter //
	create procedure stpExpenseU(
		in title_param varchar(35),
        in description_param tinytext,
        in idUser_param int
    )
    begin
		update expense set title = title_param, description = description_param where  idPersonUser = idPersonUser_param;
    end
//

drop procedure if exists stpExpenseD;
delimiter //
	create procedure stpExpenseD(
		in idExpense_param int,
        in idCatalogStatus_param int
    )
    begin
		update expense set idCatalogStatus = idCatalogStatus_param;
    end 
//


