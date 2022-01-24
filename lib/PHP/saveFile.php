<?php
	include "config.php";

    
        $myVideo = $_FILES['my_video']['name'];
        $myVideoTmpName = $_FILES['my_video']['tmp_name'];
        $username = $_GET['username'];
        
       
    
        $newFileName = substr($myVideo,0,(strrpos($myVideo,".")));
    
        var_dump($newFileName);
        
        $uploadFolder = $myVideo;
    
        move_uploaded_file($myVideoTmpName, $uploadFolder);
    
        $uplaod = $connect->query("insert into edugment_projects(fileName,fileUrl) VALUES 
        ('$myVideo','$newFileName')");
        if($upload){
            echo json_encode("upload successful");
        }
        else{
            echo json_encode("upload failed".mysqli_error($connect));
        }
    
?>