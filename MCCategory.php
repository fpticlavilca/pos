<?php
require_once "config/Database.php";
$dsn = "mysql:host=localhost;dbname=pos;charset=UTF8";

try{
    $pdo = new PDO($dsn,"root","");
    if($pdo){

        $name = "Tanquinis";
        $sql = "call stpCategoryC(:name)";

        $statement = $pdo->prepare($sql);
        $statement->bindParam(':name',$name,PDO::PARAM_STR);
        $statement->execute();

        echo "Connect to the database";
    }
}
catch (PDOException $e){
    echo $e->getMessage();
}



?>