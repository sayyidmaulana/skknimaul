<?php 
	require "konfig.php";
	$id = $_POST['idp'];
	$buku = $_POST['idb'];
	$jumlah = $_POST['jmlh'];
	$tanggal = date("Y-m-d",strtotime($_POST['tgl']);
	$perintah = "INSERT INTO peminjaman VALUES($id, $buku, $tanggal, $jumlah)";
	$tambah = mysqli_query($terhubung, $perintah);
	if(!$tambah)
		echo "Maaf, tambah data gagal";
	else
		header("location:index.php");

?>