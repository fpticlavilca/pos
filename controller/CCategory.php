<?php
require_once "../model/MCategory.php";
$mcategory = new MCategory();
$request = $_GET['request'];

if($request == "stpC"){
    if(empty($_GET['name_param'])){
        $array_response = array('status'=>false,'msg' => 'Error: no data');
    }
    else {
        $name_param = $_GET['name_param'];

        echo $mcategory->stpC($name_param);
    }
    die();
}
if($request == "stpR"){
    $array_response = array('status' => false, 'data' => '');
    $array = $mcategory->stpR();
    if(!empty($array)){
        $array_response['status'] = true;
        $array_response['data'] = $array;
    }
    echo json_encode($array_response);
    die();
}
if($request == "stpU"){
    $idCategory_param = $_GET["idCategory_param"];
    $name_param = $_GET["name_param"];

    echo $mcategory->stpU($idCategory_param,$name_param);
    die();
}
if($request == "stpD"){
    $idCatalogStatus_param = $_GET["idCatalogStatus_param"];
    $idCategory_param = $_GET["idCategory_param"];

    echo $mcategory->stpD($idCatalogStatus_param,$idCategory_param);
}
if($request == "stpS"){
    $name_param = $_GET["name_param"];

    $array_response = array('status' => false, ' data'=> '');
    $array = $mcategory->stpS($name_param);
    if(!empty($array)){
        $array_response['status'] = true;
        $array_response['data'] = $array;
    }

    echo json_encode($array_response);
    die();
}
?>