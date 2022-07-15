<?php
interface InterfaceCRUDS{
    public function stpC($name_param):String;
    public function stpR();
    public function stpU($id_param,$name_param):String;
    public function stpD($idCatalogStatus_param,$id_param):String;
    public function stpS($id_param):String;
    public function console($statement_param):String;
}
?>