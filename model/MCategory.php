<?php
    require_once "../lib/Connection.php";
    class MCategory{
        private $connection;
        private $pdo;
        function __construct(){
            $this->connection = new Connection();
            $this->pdo = $this->connection->getPDO();
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
        public function console($statement_param){
            return "Affect row: " .  $statement_param->rowCount();
        }



    }
?>