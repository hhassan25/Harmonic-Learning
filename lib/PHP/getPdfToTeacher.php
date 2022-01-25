<?php
	include "config.php";

	
	$langCode = $_GET['langCode'];


    $sql = "select * from edugment_courses where langCode = '".$langCode."'";
	$result = $connect->query($sql);
	$response = array();
	if($result->num_rows > 0){
		while ($row = $result->fetch_assoc()) {
			array_push($response, $row);
		}
	}
	$connect->close();
	header('Content_Type: application/json');
	echo json_encode($response);


 ?>