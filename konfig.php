<?php 
	$host="localhost";
	$user="root";
	$pass="";
	$db="pustaka";
	$terhubung = mysqli_connect($host,$user,$pass,$db);

if(!$terhubung)
	echo "Database tidak terhubung";
// else 
// 	echo "Database terhubung";

?>