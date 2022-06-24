/*CREATE CRUD SALE */

drop procedure if exists saleC; 
delimiter //
	create procedure saleC(
		in discount_param double,
		in subtotal_param double,
		in total_param double,
		in idPayment_param int,
		in idEnterprise_param int
    )
    begin
		insert into sale(discount,subtotal,total,idPayment,idEnterprise,idCatalogStatus)values(discount_param,subtotal_param,total_param,idPayment_param,idEnterprise_param,1);
    end
//

drop procedure if exists saleR;
delimiter //
	create procedure saleR()
    begin
		select sale.discount, sale.subtotal, sale.total, payment.name as paymentName, enterprise.name as enterprise, enterprise.direction as direction, enterprise.telephone as phone from sale 
		inner join payment on payment.idPayment = sale.idPayment
		inner join enterprise on enterprise.idEnterprise = sale.idEnterprise
		where sale.idCatalogStatus = 1;
	end
//

drop procedure if exists saleU;
delimiter //
	create procedure saleU(
		in idSale_param int,
    
		in discount_param double,
		in subtotal_param double,
		in total_param double,
		in idPayment_param int,
		in idEnterprise_param int
    )
    begin 
		update sale set
		discount = discount_param,
		subtotal = subtotal_param,
		total = total_param,
		idPayment = idPayment_param,
		idEnterprise = idEnterprise_param
        where idSale = idSale_param;
    end
//

drop procedure if exists saleD;
delimiter //
	create procedure saleD(
		in idCatalogStatus_param int,
		in idSale_param int
    )
    begin
		update sale set idCatalogStatus = idCatalogStatus_param where idSale = idSale_param;
    end
//
    