<?php
	include "config.php";

	$username = $_POST['username'];
	$password = $_POST['password'];

	$sql = "SELECT username, password, accountType FROM edugment_users WHERE username = '".$username."' AND password = '".$password."'";


	$result = mysqli_query($connect,$sql);
	$count = mysqli_num_rows($result);
	$value = mysqli_fetch_row($result);


	if ($count == 1 && $value[2] =="user"){
		echo json_encode("loginToStudent");
	}

	else if($count == 1 && $value[2] == "admin"){
		echo json_encode("loginToAdmin");
	}

	else if($username == "" || $password == ""){
		echo json_encode("filldata");
	}

	else{
		echo json_encode("error");
	}


 ?>