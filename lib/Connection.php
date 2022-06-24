<?php
  require_once "../config/Database.php";
  class Connection{
      public static function getMysqli(){
          return mysqli_connect(server,user,password,database);
      }
  }
?>