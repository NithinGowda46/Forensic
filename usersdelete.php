<?php
	require("includes/common.php");
	if (!isset($_SESSION['email'])) {
    header('location: index.php');
}

if(!empty($_POST['deluser'])) {
$deluser = $_POST['deluser'];
$sel_query = "SELECT * FROM USERS WHERE EMAIL='" . $deluser . "' ";
$run_query = mysqli_query($con, $sel_query);
$query_r = mysqli_num_rows($run_query);
if($query_r != 0) {
	$del_query = "DELETE FROM USERS WHERE EMAIL='" . $deluser . "' ";
	$run_del = mysqli_query($con, $del_query);
	echo "<script>if(confirm('Deletion Successful!')){document.location.href='users.php'};</script>";
}
else {
	echo "<script>if(confirm('User Doesnt Exist!')){document.location.href='users.php'};</script>";		
}
}

if(!empty($_POST['delofficer'])) {
$delofficer = $_POST['delofficer'];
$sel_query = "SELECT * FROM OFFICER WHERE OFFICER_ID='" . $delofficer . "' ";
$run_query = mysqli_query($con, $sel_query);
$query_r = mysqli_num_rows($run_query);
if($query_r != 0) {
$del_query = "DELETE FROM OFFICER WHERE OFFICER_ID='" . $delofficer . "' ";
$run_del = mysqli_query($con, $del_query);


	echo "<script>if(confirm('Deletion Successful!')){document.location.href='users.php'};</script>";
		
}
else {
	echo "<script>if(confirm('Officer Doesnt Exist!')){document.location.href='users.php'};</script>";
}
}



if(!empty($_POST['dellab'])) {
$dellabid = $_POST['dellab'];
$sel_query = "SELECT * FROM lab WHERE LAB_ID='" . $dellab . "' ";
$run_query = mysqli_query($con, $sel_query);
$query_r = mysqli_num_rows($run_query);
if($query_r != 0) {
	$del_query = "DELETE FROM lab WHERE LAB_ID='" . $dellab . "' ";
	$run_del = mysqli_query($con, $del_query);
	echo "<script>if(confirm('Deletion Successful!')){document.location.href='users.php'};</script>";
		
}
else {
	echo "<script>if(confirm('Officer Doesnt Exist!')){document.location.href='users.php'};</script>";
}
}







if(!empty($_POST['dellabtech'])) {
$dellabtech = $_POST['dellabtech'];
$sel_query = "SELECT * FROM lab_techs WHERE TECH_ID='" . $dellabtech . "' ";
$run_query = mysqli_query($con, $sel_query);
$query_r = mysqli_num_rows($run_query);
if($query_r != 0) {
	$del_query = "DELETE FROM lab_techs WHERE TECH_ID='" . $dellabtech . "' ";
$run_del = mysqli_query($con, $del_query);


	echo "<script>if(confirm('Deletion Successful!')){document.location.href='users.php'};</script>";
		
}
else {
	echo "<script>if(confirm('Officer Doesnt Exist!')){document.location.href='users.php'};</script>";
}
}
