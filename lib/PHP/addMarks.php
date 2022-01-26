<?php 
	include "config.php";

	    $username =  $_POST['username'];
        $fileUrl =  $_POST['fileUrl'];
        $fileName =  $_POST['fileName'];
        $mark =  $_POST['mark'];
	   

	    

	    $sql = "SELECT username, fileName FROM edugment_projects_marks WHERE username = '".$username."' AND fileName = '".$fileName."'";
	    $result = mysqli_query($connect, $sql);
	    $count = mysqli_num_rows($result);
    	
	    if ($count == 1) {
	    	echo json_encode("fileExist");
	    }
	    
	    else{
	     $insert = "INSERT INTO edugment_projects_marks (fileName, fileUrl, username, mark)
	     select  '".$fileName."',fileUrl, '".$username."','".$mark."' from edugment_projects_main where edugment_projects_main.username = '".$username."' AND edugment_projects_main.fileName = '".$fileName."'";
	     $query = mysqli_query($connect,$insert);
	     if ($query) {
	     	echo json_encode("Success");
	     }
	     
	    }

 ?>