/*CREATE CRUD SALE DETAIL*/

drop procedure if exists saleDetailC;
delimiter //
	create procedure saleDetailtC(
		in quantity_param int,
		in idDetailProduct_param int,
        in idSale_param int
    )
    begin
		insert into saleDetailt(quantity,idDetailtProduct,idSale,idCatalogStatus)values(quantity_param,idDetailtProduct_param,idSale_param,1);
    end
//

drop procedure if exists saleDetailR;
delimiter //
	create procedure saledetailR(
		in idDetailSale_param int
    )
    begin
		select saleDetail.quantity, product.name as productName, catalogSize.name as productSize from saleDetail
		inner join detailproduct on detailProduct.idDetailProduct = saleDetail.idDetailProduct
		inner join sale on sale.idSale = saleDetail.idSale
    
		inner join product on detailproduct.idProduct = product.idProduct
		inner join catalogSize on catalogSize.idCatalogSize = detailproduct.idCatalogSize
		where sale.idCatalogStatus = 1;
    end
//

drop procedure if exists saleDetailU;
delimiter //
	create procedure saledetailU(
		in idSaleDetail_param int,
    
		in quantity_param int,
		in idDetailProduct_param int,
        in idSale_param int
    )
    begin
		update saleDetail set
        quantity = quantity_param,
        idDetailProduct = idDetailProduct_param,
        idSale = idSale_param
        where idDetail;
    end
//

drop procedure if exists saleDetailD;
delimiter //
	create procedure saleDetailD(
		in idCatalogStatus_param int,
		in idSaleDetail_param int
    )
    begin
		update saleDetail set idCatalogStatus = idCatalogStatus_param where idSaleDetail = idSaleDetail_param;
    end
//
