<?php
    require_once "../lib/Connection.php";
    class MCategory{
        private $mysqli;
        function __construct(){
            $this->mysqli = new Connection();
            $this->mysqli = $this->mysqli->getMysqli();
        }
        public function stpCategoryR(){
            $row = array();
            $query = $this->mysqli->query("call stpCategoryR()");

            while($object = $query->fetch_object()){
                array_push($row,$object);
            }
            return $row;
        }
    }
?>