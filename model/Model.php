<?php
require_once("../lib/Connection.php");
class Model{
    public $pdo;
    public $connection;
    function __construct(){
        $this->connection = new Connection();
        $this->pdo = $this->connection->getPDO();
    }
    public function console($statement_param,$action): string
    {
        if($action == 'stpC'){
            return "Create row: " .  $statement_param->rowCount();
        }
        if($action == 'stpU'){
            return "Update row: " .  $statement_param->rowCount();
        }
        if($action == 'stpD'){
            return "Delete row: " .  $statement_param->rowCount();
        }
    }
}

?>