<?php

require("includes/common.php");


$value = $_SESSION['value'];




//Retrieve the values

$officerid = $_POST['officerid'];
$name = $_POST['name'];
$designation = $_POST['designation'];
$a=1;

//Queries

if($a==2) {
	$officer_query = "CALL insertOfficer('".$officerid."','".$name."','".$designation."')";
}
else {
$officer_query = "INSERT INTO OFFICER (OFFICER_ID, NAME, DESIGNATION) VALUES('$officerid','$name','$designation')";
}
	

$officer_submit = mysqli_query($con, $officer_query) or die(mysqli_error($con));


if (!$officer_submit) {
  header('location: works.php');
} else {  
  header('location: departments.php');
}

?>