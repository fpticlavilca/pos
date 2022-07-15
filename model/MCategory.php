<?php
    require_once "../lib/Connection.php";
    require_once "../interface/InterfaceCRUDS.php";
    require_once "Model.php";

    class MCategory extends Model implements InterfaceCRUDS {
        function __construct(){
            parent::__construct();
        }

        public function stpCCategory($name_param){
            $statement = $this->pdo->prepare("call stpCCategory(?)");
            $statement->bindParam(1,$name_param);
            $statement->execute();
            return $this->console($statement);
        }

        public function stpRCategory(){
            $array = array();
            $statement = $this->pdo->prepare("call stpRCategory()");
            $statement->setFetchMode(PDO::FETCH_ASSOC);
            $statement->execute();

            while($obj =  $statement->fetch()){
                array_push($array,$obj);
            }
            return $array;
        }

        public function stpUCategory($idCategory_param,$name_param){
            $statement = $this->pdo->prepare("call stpUCategory(?,?)");
            $statement->bindParam(1,$idCategory_param);
            $statement->bindParam(2,$name_param);
            $statement->execute();
            return $this->console($statement);
        }

        public function stpDCategory($idCatalogStatus_param,$idCategory_param){
            $statement = $this->pdo->prepare("call stpDCategory(?,?)");
            $statement->bindParam(1,$idCatalogStatus_param);
            $statement->bindParam(2,$idCategory_param);
            $statement->execute();
            return $this->console($statement);
        }

        public function stpSCategory($name_param){

        }
        public function console($statement_param): string
        {
            return "Affect row: " .  $statement_param->rowCount();
        }


        public function stpC($name_param): string
        {
            // TODO: Implement stpC() method.
        }

        public function stpR()
        {
            // TODO: Implement stpR() method.
        }

        public function stpU($id_param, $name_param): string
        {
            // TODO: Implement stpU() method.
        }

        public function stpD($idCatalogStatus_param, $id_param): string
        {
            // TODO: Implement stpD() method.
        }

        public function stpS($id_param): string
        {
            // TODO: Implement stpS() method.
        }
    }
?>