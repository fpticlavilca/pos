<?php
$mysqli = mysqli_connect("localhost","root","","pos");
if($mysqli){
    $query = $mysqli->query("call stpCategoryR()");
    $array = array();
    while($object = $query->fetch_object()){
        array_push($array,$object);
    }
    echo json_encode($array);
}
else{
    echo "Error";
}
?>