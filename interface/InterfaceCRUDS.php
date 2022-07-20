<?php
interface InterfaceCRUDS{
    public function stpC($name_param):array;
    public function stpR():array;
    public function stpU($id_param,$name_param):array;
    public function stpD($idCatalogStatus_param,$id_param):array;
    public function stpS($name_param);

}
?>