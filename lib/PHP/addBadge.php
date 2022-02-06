<?php 
	include "config.php";

	    $username =  $_POST['username'];
        $fileName =  $_POST['fileName'];
        $badges =  $_POST['badges'];
	   

	    

	    $sql = "SELECT username, fileName mark FROM edugment_badges WHERE username = '".$username."' AND fileName = '".$fileName."' AND badges = '".$badges."'";
	    $result = mysqli_query($connect, $sql);
	    $count = mysqli_num_rows($result);
    	
	    if ($count == 1) {
	    	echo json_encode("fileExist");
	    }
	    
	    else{
	     $insert = "INSERT INTO edugment_badges (username, fileName, badges) Values ('".$username."', '".$fileName."', '".$badges."')";
	     $query = mysqli_query($connect,$insert);
	     if ($query) {
	     	echo json_encode("Success");
	     }
	     
	    }

 ?>