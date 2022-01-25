<?php 
	include "config.php";

	    $username =  $_POST['username'];
        $fileUrl =  $_POST['fileUrl'];
        $fileName =  $_POST['fileName'];
	   

	    

	    $sql = "SELECT username, fileName FROM edugment_projects_main WHERE username = '".$username."' AND fileName = '".$fileName."'";
	    $result = mysqli_query($connect, $sql);
	    $count = mysqli_num_rows($result);
    	
	    if ($count == 1) {
	    	echo json_encode("fileExist");
	    }
	    
	    else{
	     $insert = "INSERT INTO edugment_projects_main (fileName, fileUrl, username)
	     select  '".$fileName."', fileUrl, '".$username."' from edugment_projects where id = (select Max(id) from edugment_projects)";
	     $query = mysqli_query($connect,$insert);
	     if ($query) {
	     	echo json_encode("Success");
	     }
	     
	    }

 ?>