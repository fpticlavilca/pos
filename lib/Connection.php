<?php
  require_once "../config/Database.php";
  class Connection{
      public function getPDO(){
          try{

              $dsn = "mysql:host=".server.";dbname=".database;
              $pdo =  new PDO($dsn,username,password);
              $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
              return $pdo;

          }
          catch(PDOException $e){
              echo $e->getMessage();
          }

      }
  }
?>