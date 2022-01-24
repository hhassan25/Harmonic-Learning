<?php
	include "config.php";

	$username = $_GET['username'];
	$langCode = $_GET['langCode'];


    $sql = "select * from edugment_courses INNER JOIN edugment_classes ON edugment_courses.classID = edugment_classes.ID
	INNER JOIN edugment_users ON edugment_users.classID = edugment_classes.ID where edugment_users.username = '".$username."' AND edugment_courses.langCode = '".$langCode."'";
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