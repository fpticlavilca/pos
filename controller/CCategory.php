<?php
require_once "../model/MCategory.php";
$mcategory = new MCategory();

$request = $_GET['request'];

if($request == "stpCCategory"){
    $name_param = $_GET['name_param'];
    echo $mcategory->stpCCategory($name_param);

    die();

}
if($request == "stpRCategory"){
    $array_response = array('status' => false, 'data' => '');
    $array = $mcategory->stpRCategory();
    if(!empty($array)){
        $array_response['status'] = true;
        $array_response['data'] = $array;
    }
    echo json_encode($array_response);
    die();
}
if($request == "stpUCategory"){
    $idCategory_param = $_GET["idCategory_param"];
    $name_param = $_GET["name_param"];
    echo $mcategory->stpUCategory($idCategory_param,$name_param);
    die();
}
if($request == "stpDCategory"){
    $idCatalogStatus_param = $_GET["idCatalogStatus_param"];
    $idCategory_param = $_GET["idCategory_param"];

    echo $mcategory->stpDCategory($idCatalogStatus_param,$idCategory_param);
}
?>