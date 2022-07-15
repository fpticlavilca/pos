<?php
require_once("../lib/Connection.php");
class Model{
    public $pdo;
    public $connection;
    function __construct(){
        $this->connection = new Connection();
        $this->pdo = $this->connection->getPDO();
    }
}

?>