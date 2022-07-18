<?php
    require_once "../lib/Connection.php";
    require_once "../interface/InterfaceCRUDS.php";
    require_once "Model.php";

    class MCategory extends Model implements InterfaceCRUDS {
        function __construct(){
            parent::__construct();
        }

        public function stpC($name_param): string
        {
            $statement = $this->pdo->prepare("call stpCCategory(?)");
            $statement->bindParam(1,$name_param);
            $statement->execute();
            return $this->console($statement, __FUNCTION__);
        }

        public function stpR()
        {
            $array = array();
            $statement = $this->pdo->prepare("call stpRCategory()");
            $statement->setFetchMode(PDO::FETCH_ASSOC);
            $statement->execute();
            while($obj =  $statement->fetch()){
                array_push($array,$obj);
            }
            return $array;
        }

        public function stpU($idCategory_param, $name_param): string
        {
            $statement = $this->pdo->prepare("call stpUCategory(?,?)");
            $statement->bindParam(1,$idCategory_param);
            $statement->bindParam(2,$name_param);
            $statement->execute();
            return $this->console($statement,__FUNCTION__);
        }

        public function stpD($idCatalogStatus_param, $id_param): string
        {
            $statement = $this->pdo->prepare("call stpDCategory(?,?)");
            $statement->bindParam(1,$idCatalogStatus_param);
            $statement->bindParam(2,$idCategory_param);
            $statement->execute();
            return $this->console($statement,__FUNCTION__);
        }

        public function stpS($name_param)
        {
            $array = array();
            $statement = $this->pdo->prepare("call stpSCategory(?)");
            $statement->bindParam(1,$name_param);
            $statement->setFetchMode(PDO::FETCH_ASSOC);
            $statement->execute();
            while($obj = $statement->fetch()){
                array_push($array,$obj);
            }
            return $array;
        }


    }
?>