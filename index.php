
<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

<table>
	<tr>
		<td><a href="tambahdata.php">Tambah</a> </td>
	</tr>
</table>
<table border="3">
	<tr>
		<td>ID Pinjam</td>
		<td>ID Buku</td>
		<td>Tanggal</td>
		<td>Jumlah</td>
		<td colspan="2" align="center">Aksi</td>
	</tr>

<?php 
	include "konfig.php";
	$perintah = "SELECT * FROM peminjaman";
	$tampil = mysqli_query($terhubung, $perintah);
	while($hasil = mysqli_fetch_array($tampil)) {
?>
<tr>
	<td> <?php echo $hasil[0]; ?> </td>
	<td> <?php echo $hasil[1]; ?> </td>
	<td> <?php echo $hasil[2]; ?> </td>
	<td> <?php echo $hasil[3]; ?> </td>
	<td>Ubah </td><td>Hapus </td> 
</tr>
<?php
}
?>
</table>


</body>
</html>
